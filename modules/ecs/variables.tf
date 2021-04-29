variable "app_name" {}
variable "ecs_task_execution_role_arn" {}
variable "image" {}
variable "vpc_id" {}
variable "public_subnet_a_id" {}
variable "public_subnet_c_id" {}
variable "private_subnet_a_id" {}
variable "private_subnet_c_id" {}

data "aws_region" "this" {}
