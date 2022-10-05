// Copyright 2022 Nexient LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "task" {
  source = "github.com/nexient-llc/tf-aws-module-ecs_task.git"
  name   = var.task_name
  # below are already both outputs in the
  # Log Outputs of ecs_task
  log_group_name = var.log_group_name
  # log_group_arn  = var.log_group_arn
  # this will be exposed in ecs_task
  container_definitions = var.container_definitions
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.1.0"

  name               = var.lb_name
  load_balancer_type = var.lb_type
}

resource "aws_ecs_service" "main" {
  name                               = var.name
  launch_type                        = var.launch_type
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  cluster                            = var.ecs_cluster
  task_definition                    = var.task_definition_arn
  desired_count                      = var.desired_count
  wait_for_steady_state              = var.wait_for_steady_state
  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )

  load_balancer {
    target_group_arn = var.lb_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  lifecycle {
    ignore_changes = [desired_count]
  }
}

resource "aws_appautoscaling_target" "task" {
  count      = var.autoscaling_enabled ? 1 : 0
  depends_on = [aws_ecs_service.main]

  max_capacity       = var.scale_level_4_adjustment
  min_capacity       = var.desired_count
  resource_id        = aws_ecs_service.main.name
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "scale_down" {
  count = var.autoscaling_enabled ? 1 : 0
  depends_on = [
    aws_ecs_service.main,
    aws_appautoscaling_target.task,
  ]

  name               = "${var.naming_prefix}-scale-down-000"
  policy_type        = "StepScaling"
  resource_id        = aws_ecs_service.main.name
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = "-${var.scale_level_4_adjustment}"
    }
  }
}

resource "aws_appautoscaling_policy" "scale_up" {
  count = var.autoscaling_enabled ? 1 : 0
  depends_on = [
    aws_ecs_service.main,
    aws_appautoscaling_target.task,
  ]

  name               = "${var.naming_prefix}-scale-up-000"
  policy_type        = "StepScaling"
  resource_id        = aws_ecs_service.main.name
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  # TODO: convert step adjustment to dynamic block
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Minimum"

    dynamic "step_adjustment" {
      for_each = var.step_adjustments_objects

      content {
        metric_interval_lower_bound = step_adjustment.value["lower"]
        metric_interval_upper_bound = step_adjustment.value["upper"]
        scaling_adjustment          = step_adjustment.value["adjustment"]
      }
    }
  }
}
