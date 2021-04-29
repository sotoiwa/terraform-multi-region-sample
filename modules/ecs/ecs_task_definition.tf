resource "aws_ecs_task_definition" "this" {
  container_definitions = <<EOF
[
  {
    "command"               : [],
    "cpu"                   : 256,
    "dnsSearchDomains"      : [],
    "dnsServers"            : [],
    "dockerSecurityOptions" : [],
    "entryPoint"            : [],
    "environment"           : [],
    "essential"             : true,
    "image"                 : "${var.image}",
    "links"                 : [],
    "logConfiguration"      : {
      "logDriver" : "awslogs",
      "options"   : {
        "awslogs-group"         : "${var.app_name}",
        "awslogs-region"        : "${data.aws_region.this.name}",
        "awslogs-stream-prefix" : "logs"
      }
    },
    "memory"                : 512,
    "mountPoints"           : [],
    "name"                  : "${var.app_name}",
    "portMappings"          : [
      {
        "containerPort" : 5000,
        "hostPort"      : 5000,
        "protocol"      : "tcp"
      }
    ],
    "systemControls"        : [],
    "volumesFrom"           : []
  }
]
EOF

  cpu                      = "256"
  execution_role_arn       = var.ecs_task_execution_role_arn
  family                   = var.app_name
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  tags                     = {}
}
