# tf_aws_module-ecs_service

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

This terraform module sets up an ECS service that utilizes a Load Balancer.

## Usage

```golang
module "service" {
  source = "../../modules/ecs/service"

  name                               = var.name
  task_definition_arn                = module.task.task_arn
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 200
  desired_count                      = 0
  ecs_cluster                        = module.cluster.arn
  launch_type                        = "FARGATE"
  assign_public_ip                   = var.assign_public_ip
  security_groups                    = var.security_groups
  subnets                            = var.subnets
  tags                               = var.tags
}
```

## Inputs

| Name                               | Description                                                                            |     Type     |  Default  | Required |
| ---------------------------------- | -------------------------------------------------------------------------------------- | :----------: | :-------: | :------: |
| name                               | Application Name                                                                       |    string    |    n/a    |   yes    |
| launch_type                        | Enter FARGATE or EC2 for launch type                                                   |    string    | `FARGATE` |   yes    |
| task_definition_arn                | Task Definition ARN for Service                                                        |    string    |    n/a    |   yes    |
| deployment_minimum_healthy_percent | Set minimum percentage allowed of health tasks                                         |    string    |    `0`    |    no    |
| deployment_maximum_percent         | Set maximum percentage allowed of health tasks                                         |    string    |    `0`    |    no    |
| desired_count                      | Enter desired running task count                                                       |    string    |    `0`    |    no    |
| security_groups                    | Provide list of security groups to assign to task(s)                                   | list(string) |   `[]`    |   yes    |
| subnets                            | Provide list of subnets to run task(s) in                                              | list(string) |   `[]`    |   yes    |
| assign_public_ip                   | Assign a public IP to the Task                                                         |     bool     |  `false`  |    no    |
| ecs_cluster                        | ARN of the ECS Cluster to use                                                          |    string    |    n/a    |   yes    |
| lb_group_arn                       | ARN of the load balancer to use                                                        |    string    |    n/a    |   yes    |
| container_port                     | Container port to setup for LB                                                         |    string    |    n/a    |   yes    |
| autoscaling_enabled                | Set to true to enabling service autoscaling                                            |     bool     |  `false`  |    no    |
| wait_for_steady_state              | Wait for ECS Service to show stable (wait for deployment to be successful)             |     bool     |  `false`  |    no    |
| scale_level_1_lower                | Set Lower Range for level 1 Task Scaling                                               |    string    |    n/a    |    no    |
| scale_level_1_upper                | Set Upper Range for level 1 Task Scaling                                               |    string    |    n/a    |    no    |
| scale_level_1_adjustment           | Set Task Count Adjustment for Level 1 Task Scaling                                     |    string    |    n/a    |    no    |
| scale_level_2_upper                | Set Upper Range for level 2 Task Scaling                                               |    string    |    n/a    |    no    |
| scale_level_2_adjustment           | Set Task Count Adjustment for Level 2 Task Scaling                                     |    string    |    n/a    |    no    |
| scale_level_3_upper                | Set Upper Range for level 3 Task Scaling                                               |    string    |    n/a    |    no    |
| scale_level_3_adjustment           | Set Task Count Adjustment for Level 3 Task Scaling                                     |    string    |    n/a    |    no    |
| scale_level_4_adjustment           | Set Task Count Adjustment for Level 4 Task Scaling (Max Scaling Limit for this module) |    string    |    n/a    |    no    |
| tags                               | Tags to be applied to all resources created                                            |     map      |  `<map>`  |    no    |

## Outputs

| Name | Description  |
| ---- | ------------ |
| id   | Service ID   |
| name | Service Name |
