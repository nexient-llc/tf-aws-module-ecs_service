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

variable "name" {
  description = "Application Name"
  type        = string
}

variable "container_name" {
  description = "Name of the task running in the service"
  type        = string
}

variable "naming_prefix" {
  description = "Prefix to other resources"
}

variable "launch_type" {
  description = "Enter FARGATE or EC2 for launch type"
  type        = string
  default     = "FARGATE"
}

variable "task_definition_arn" {
  description = "Task Definition ARN for Service"
  type        = string
}

variable "deployment_minimum_healthy_percent" {
  description = "Set minimum percentage allowed of health tasks"
  type        = string
  default     = "0"
}

variable "deployment_maximum_percent" {
  description = "Set maximum percentage allowed of health tasks"
  type        = string
  default     = "0"
}

variable "desired_count" {
  description = "Enter desired running task count"
  type        = string
  default     = "0"
}

variable "security_groups" {
  description = "Provide list of security groups to assign to task(s)"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Provide list of subnets to run task(s) in"
  type        = list(string)
  default     = []
}

variable "assign_public_ip" {
  description = "Assign a public IP to the Task"
  type        = bool
  default     = false
}

variable "ecs_cluster" {
  description = "Arn of the ecs cluster to use"
}

variable "lb_group_arn" {
  description = "ARN of the load balancer to use"
  type        = string
}

variable "container_port" {
  description = "Container port to setup for LB"
  type        = string
}

variable "autoscaling_enabled" {
  description = "Set to true to enabling service autoscaling"
  default     = false
}

variable "wait_for_steady_state" {
  description = "Wait for ECS Service to show stable (wait for deployment to be successful)"
  default     = false
}

variable "step_adjustments_objects" {
  default = [
    {
      lower      = 200,
      upper      = 300,
      adjustment = 3,
    },
    {
      lower      = 300,
      upper      = 400,
      adjustment = 4,
    },
  ]
}

variable "tags" {
  description = "Tags to be applied to all resources created"
  type        = map(string)
  default     = {}
}

variable "lb_name" {
  description = "The name of the load balancer."
}

variable "lb_type" {
  description = "Load Balancer type"
  default     = "application"
}

variable "task_cpu" {
  type        = number
  description = "The task definition CPU."
  default     = "256"
}

variable "task_name" {
  type        = string
  description = "The task name"
}

variable "log_group_name" {
  type        = string
  description = "The log group name"
}

variable "container_definitions" {
  type        = string
  description = "The container definition for the load balancer."
}
