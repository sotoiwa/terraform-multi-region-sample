terraform {
  # backend "s3" {
  #   bucket = "${var.app_name}-terraform-state"
  #   region = "ap-northeast-1"
  #   key = "terraform.tfstate"
  #   encrypt = true
  # }
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.app_name}-terraform-state"
  versioning {
    enabled = true
  }
}
