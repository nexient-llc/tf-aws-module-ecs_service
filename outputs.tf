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

output "id" {
  description = "Service ID"
  value       = aws_ecs_service.main.id
}

output "name" {
  description = "Service Name"
  value       = aws_ecs_service.main.name
}

# sample outputs for ALB


output "alb_name" {
  description = "The ARN suffix of the ALB"
  value       = module.alb.alb_name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb.alb_arn
}

output "alb_arn_suffix" {
  description = "The ARN suffix of the ALB"
  value       = module.alb.alb_arn_suffix
}

output "alb_dns_name" {
  description = "DNS name of ALB"
  value       = module.alb.alb_dns_name
}

output "alb_zone_id" {
  description = "The ID of the zone which ALB is provisioned"
  value       = module.alb.alb_zone_id
}

output "security_group_id" {
  description = "The security group ID of the ALB"
  value       = module.alb.security_group_id
}

output "default_target_group_arn" {
  description = "The default target group ARN"
  value       = module.alb.default_target_group_arn
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = module.alb.http_listener_arn
}

output "listener_arns" {
  description = "A list of all the listener ARNs"
  value       = module.alb.listener_arns
}