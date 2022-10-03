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

# I think a lot of these variables will be unnecessary. 


# output "lb_name" {
#   description = "The ARN suffix of the ALB"
#   value       = module.alb.lb_name
# }

# output "lb_arn" {
#   description = "The ARN of the ALB"
#   value       = module.alb.lb_type
# }
