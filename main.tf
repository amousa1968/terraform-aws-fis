terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_fis_experiment_template" "example" {
  description = var.description
  role_arn    = var.role_arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name          = var.target_name
    resource_type = var.target_resource_type
    selection_mode = var.target_selection_mode
  }

  action {
    name      = var.action_name
    action_id = var.action_id
  }
}
