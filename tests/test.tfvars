name                = "testECS"
container_name      = "test_container"
ecs_cluster         = "arn:aws:ecs:us-west-2:070446495595:cluster/testECS"
lb_group_arn        = "arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/app/my-load-balancer/1234567890123456"
container_port      = 443
naming_prefix       = ""
task_definition_arn = "arn:aws:ecs:us-west-2:070446495595:task-definition/TaskDefinitionFamily:1"
