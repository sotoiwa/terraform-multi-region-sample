module "network" {
  source   = "./modules/network"
  app_name = var.app_name
}

module "network_use1" {
  source = "./modules/network"
  providers = {
    aws = aws.use1
  }
  app_name = var.app_name
}

module "ecs" {
  source                      = "./modules/ecs"
  app_name                    = var.app_name
  ecs_task_execution_role_arn = aws_iam_role.ecs_task_execution.arn
  image                       = "675135164434.dkr.ecr.ap-northeast-1.amazonaws.com/flask-sample:latest"
  vpc_id                      = module.network.vpc_id
  public_subnet_a_id          = module.network.public_subnet_a_id
  public_subnet_c_id          = module.network.public_subnet_c_id
  private_subnet_a_id         = module.network.private_subnet_a_id
  private_subnet_c_id         = module.network.private_subnet_c_id
}

module "ecs_use1" {
  source = "./modules/ecs"
  providers = {
    aws = aws.use1
  }
  app_name                    = var.app_name
  ecs_task_execution_role_arn = aws_iam_role.ecs_task_execution.arn
  image                       = "675135164434.dkr.ecr.ap-northeast-1.amazonaws.com/flask-sample:latest"
  vpc_id                      = module.network_use1.vpc_id
  public_subnet_a_id          = module.network_use1.public_subnet_a_id
  public_subnet_c_id          = module.network_use1.public_subnet_c_id
  private_subnet_a_id         = module.network_use1.private_subnet_a_id
  private_subnet_c_id         = module.network_use1.private_subnet_c_id
}
