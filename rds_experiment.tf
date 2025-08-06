resource "aws_fis_experiment_template" "rds_failover" {
  description = "RDS DB cluster failover experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name = "rds-cluster"
    resource_type = "aws:rds:cluster"
    selection_mode = "ALL"
  }

  action {
    name = "failover-db-cluster"
    action_id = "aws:rds:failover-db-cluster"
  }
}

resource "aws_fis_experiment_template" "rds_reboot_instance" {
  description = "RDS instance reboot experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name = "rds-instance"
    resource_type = "aws:rds:db"
    selection_mode = "COUNT(1)"
  }

  action {
    name = "reboot-db-instances"
    action_id = "aws:rds:reboot-db-instances"
  }
}

resource "aws_fis_experiment_template" "rds_cpu_stress" {
  description = "RDS instance CPU stress experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name = "rds-instance"
    resource_type = "aws:rds:db"
    selection_mode = "PERCENT(25)"
  }

  action {
    name = "db-instance-cpu-stress"
    action_id = "aws:rds:db-instance-cpu-stress"
  }
}
