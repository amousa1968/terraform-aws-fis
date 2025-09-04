module "ecs_chaos_experiments" {
  source = "../"

  # Required arguments
  name = "example-fis-experiment"
  description = "Example AWS FIS experiment template"
  role_arn = "arn:aws:iam::123456789012:role/AWSFISRole"
  stop_condition_alarm_arn = "arn:aws:cloudwatch:us-east-1:123456789012:alarm:example-alarm"
  target_name = "target1"
  target_resource_type = "aws:ec2:instance"
  target_selection_mode = "ALL"
  target_resource_tags = {}
  action_name = "action1"
  action_id = "aws:ec2:terminate-instances"
  action_description = "Terminate EC2 instances"
  action_parameters = {}
  instance_termination = true
  instance_termination_parameters = {
    number_of_instances = 1
    target_tag = {
      key   = "chaos"
      value = "ready"
    }
  }
  rds_failover_enabled = false
  rds_reboot_enabled = false
  rds_cpu_stress_enabled = false
  dynamodb_throttle_enabled = false
  dynamodb_latency_enabled = false
  dynamodb_error_injection_enabled = false
  dynamodb_backup_failure_enabled = false
  dynamodb_table_name = "example-table"
  dynamodb_gsi_name = "example-gsi"
  iam_role_name_fis = "FISRole"
  iam_role_name_experiment_runner = "ExperimentRunnerRole"
  instance_termination_default_tag_key = "chaos"
  instance_termination_default_tag_value = "ready"
  instance_termination_experiment_name = "instance-termination-experiment"
  rds_failover_selection_mode = "ALL"
  rds_reboot_selection_mode = "COUNT(1)"
  rds_cpu_stress_selection_mode = "PERCENT(25)"
  dynamodb_throttle_selection_mode = "ALL"
  dynamodb_latency_selection_mode = "PERCENT(50)"
  dynamodb_error_injection_selection_mode = "COUNT(1)"
  dynamodb_backup_failure_selection_mode = "ALL"
  ecs_task_termination_selection_mode = "COUNT(1)"
  ecs_cpu_stress_selection_mode = "PERCENT(50)"
  ecs_network_latency_selection_mode = "PERCENT(25)"
}
