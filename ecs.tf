resource "aws_fis_experiment_template" "ecs_fargate_task_termination" {
  count       = var.ecs_fargate_task_termination_enabled ? 1 : 0
  description = "ECS Fargate task termination experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "ecs-fargate-tasks"
    resource_type  = "aws:ecs:task"
    selection_mode = var.ecs_task_termination_selection_mode
  }

  action {
    name      = "terminate-ecs-tasks"
    action_id = "aws:ecs:terminate-tasks"
  }
}

resource "aws_fis_experiment_template" "ecs_fargate_cpu_stress" {
  count       = var.ecs_fargate_cpu_stress_enabled ? 1 : 0
  description = "ECS Fargate CPU stress experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "ecs-fargate-tasks"
    resource_type  = "aws:ecs:task"
    selection_mode = var.ecs_cpu_stress_selection_mode
  }

  action {
    name      = "cpu-stress"
    action_id = "aws:ecs:task-cpu-stress"
  }
}

resource "aws_fis_experiment_template" "ecs_fargate_network_latency" {
  count       = var.ecs_fargate_network_latency_enabled ? 1 : 0
  description = "ECS Fargate network latency experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name           = "ecs-fargate-tasks"
    resource_type  = "aws:ecs:task"
    selection_mode = var.ecs_network_latency_selection_mode
  }

  action {
    name      = "network-latency"
    action_id = "aws:ecs:task-network-latency"
  }
}
