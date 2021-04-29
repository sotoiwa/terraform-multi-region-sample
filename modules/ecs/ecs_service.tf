resource "aws_ecs_service" "this" {
  name                               = "${var.app_name}-service"
  cluster                            = aws_ecs_cluster.this.id
  task_definition                    = var.app_name
  desired_count                      = 2
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  enable_ecs_managed_tags            = false
  health_check_grace_period_seconds  = 0
  launch_type                        = "FARGATE"
  platform_version                   = "1.4.0"
  scheduling_strategy                = "REPLICA"
  tags                               = {}

  load_balancer {
    container_name   = var.app_name
    container_port   = 5000
    target_group_arn = aws_lb_target_group.this.arn
  }

  network_configuration {
    assign_public_ip = false
    security_groups = [
      aws_security_group.task.id
    ]
    subnets = [
      var.private_subnet_a_id,
      var.private_subnet_c_id
    ]
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      load_balancer,
    ]
  }

  depends_on = [
    aws_lb_target_group.this
  ]
}
