resource "aws_fis_experiment_template" "dynamodb_table_throttle" {
  description = "DynamoDB table throttle experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "dynamodb-table"
    resource_type  = "aws:dynamodb:table"
    selection_mode = "ALL"
  }

  action {
    name      = "throttle-dynamodb"
    action_id = "aws:dynamodb:throttle-table"
    
    target {
      key   = "Tables"
      value = "dynamodb-table"
    }
  }

  tags = local.tags
}

resource "aws_fis_experiment_template" "dynamodb_add_latency" {
  description = "DynamoDB add latency experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "dynamodb-latency"
    resource_type  = "aws:dynamodb:table"
    selection_mode = "PERCENT(50)"
  }

  action {
    name      = "add-latency"
    action_id = "aws:dynamodb:add-latency"
    
    target {
      key   = "Tables"
      value = "dynamodb-latency"
    }
  }

  tags = local.tags
}

resource "aws_fis_experiment_template" "dynamodb_error_injection" {
  description = "DynamoDB error injection experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "dynamodb-error"
    resource_type  = "aws:dynamodb:table"
    selection_mode = "COUNT(1)"
  }

  action {
    name      = "inject-error"
    action_id = "aws:dynamodb:inject-error"
    
    target {
      key   = "Tables"
      value = "dynamodb-error"
    }
  }

  tags = local.tags
}

resource "aws_fis_experiment_template" "dynamodb_backup_failure" {
  description = "DynamoDB backup failure experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "dynamodb-backup"
    resource_type  = "aws:dynamodb:table"
    selection_mode = "ALL"
  }

  action {
    name      = "fail-backup"
    action_id = "aws:dynamodb:terminate-instances"
    
    target {
      key   = "Instances"
      value = "EC2"
    }
  }

  tags = local.tags
}
