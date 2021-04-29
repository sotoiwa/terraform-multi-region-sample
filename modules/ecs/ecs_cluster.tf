resource "aws_ecs_cluster" "this" {
  name               = "${var.app_name}-cluster"
  capacity_providers = []
  tags = {
    "Name" = "${var.app_name}-cluster"
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
