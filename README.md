# tf_aws_module-ecs_service

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

This terraform module sets up an ECS service that utilizes a Load Balancer.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.57.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | <AWS LB module on the registry> | n/a |
| <a name="module_task"></a> [task](#module\_task) | <whatever from GH for our module> | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.scale_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.scale_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign a public IP to the Task | `bool` | `false` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Set to true to enabling service autoscaling | `bool` | `false` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Name of the task running in the service | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Container port to setup for LB | `string` | n/a | yes |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | Set maximum percentage allowed of health tasks | `string` | `"0"` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | Set minimum percentage allowed of health tasks | `string` | `"0"` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Enter desired running task count | `string` | `"0"` | no |
| <a name="input_ecs_cluster"></a> [ecs\_cluster](#input\_ecs\_cluster) | Arn of the ecs cluster to use | `any` | n/a | yes |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | Enter FARGATE or EC2 for launch type | `string` | `"FARGATE"` | no |
| <a name="input_lb_group_arn"></a> [lb\_group\_arn](#input\_lb\_group\_arn) | ARN of the load balancer to use | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application Name | `string` | n/a | yes |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix to other resources | `any` | n/a | yes |
| <a name="input_scale_level_1_adjustment"></a> [scale\_level\_1\_adjustment](#input\_scale\_level\_1\_adjustment) | n/a | `string` | `"1"` | no |
| <a name="input_scale_level_1_lower"></a> [scale\_level\_1\_lower](#input\_scale\_level\_1\_lower) | n/a | `string` | `"0"` | no |
| <a name="input_scale_level_1_upper"></a> [scale\_level\_1\_upper](#input\_scale\_level\_1\_upper) | n/a | `string` | `"100"` | no |
| <a name="input_scale_level_2_adjustment"></a> [scale\_level\_2\_adjustment](#input\_scale\_level\_2\_adjustment) | n/a | `string` | `"2"` | no |
| <a name="input_scale_level_2_upper"></a> [scale\_level\_2\_upper](#input\_scale\_level\_2\_upper) | n/a | `string` | `"200"` | no |
| <a name="input_scale_level_3_adjustment"></a> [scale\_level\_3\_adjustment](#input\_scale\_level\_3\_adjustment) | n/a | `string` | `"3"` | no |
| <a name="input_scale_level_3_upper"></a> [scale\_level\_3\_upper](#input\_scale\_level\_3\_upper) | n/a | `string` | `"300"` | no |
| <a name="input_scale_level_4_adjustment"></a> [scale\_level\_4\_adjustment](#input\_scale\_level\_4\_adjustment) | n/a | `string` | `"4"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Provide list of security groups to assign to task(s) | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Provide list of subnets to run task(s) in | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources created | `map(string)` | `{}` | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | n/a | `any` | n/a | yes |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | Task Definition ARN for Service | `string` | n/a | yes |
| <a name="input_wait_for_steady_state"></a> [wait\_for\_steady\_state](#input\_wait\_for\_steady\_state) | Wait for ECS Service to show stable (wait for deployment to be successful) | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Service ID |
| <a name="output_name"></a> [name](#output\_name) | Service Name |
<!-- END_TF_DOCS -->
