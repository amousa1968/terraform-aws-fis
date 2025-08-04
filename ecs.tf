resource "aws_fis_experiment_template" "ecs_fargate_task_termination" {
  description = "ECS Fargate task termination experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name = "ecs-fargate-tasks"
    resource_type = "aws:ecs:task"
    selection_mode = "COUNT(1)"
  }

  action {
    name = "terminate-ecs-tasks"
    action_id = "aws:ecs:terminate-tasks"
  }
}

resource "aws_fis_experiment_template" "ecs_fargate_cpu_stress" {
  description = "ECS Fargate CPU stress experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name = "ecs-fargate-tasks"
    resource_type = "aws:ecs:task"
    selection_mode = "PERCENT(50)"
  }

  action {
    name = "cpu-stress"
    action_id = "aws:ecs:task-cpu-stress"
  }
}

resource "aws_fis_experiment_template" "ecs_fargate_network_latency" {
  description = "ECS Fargate network latency experiment"
  role_arn    = aws_iam_role.fis_role.arn

  stop_condition {
    source = "aws:cloudwatch:alarm"
    value  = var.stop_condition_alarm_arn
  }

  target {
    name = "ecs-fargate-tasks"
    resource_type = "aws:ecs:task"
    selection_mode = "PERCENT(25)"
  }

  action {
    name = "network-latency"
    action_id = "aws:ecs:task-network-latency"
  }
}
