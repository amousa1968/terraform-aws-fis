# ECS Task Chaos Engineering Examples
module "ecs_chaos_experiments" {
  source = "../"

  # Common configuration
  name                    = "ecs-chaos-experiments"
  description             = "ECS Fargate chaos engineering experiments"
  role_arn                = "arn:aws:iam::123456789012:role/AWSFISRole"
  stop_condition_alarm_arn = "arn:aws:cloudwatch:us-east-1:123456789012:alarm:ecs-alarm"

  # ECS Task Termination Experiment
  ecs_fargate_task_termination_enabled = true
  ecs_fargate_task_termination_parameters = {
    number_of_instances = 1
    target_tag = {
      key   = "Environment"
      value = "production"
    }
  }

  # ECS Task CPU Stress Experiment
  ecs_fargate_cpu_stress_enabled = true
  ecs_fargate_cpu_stress_parameters = {
    percentage = 50
  }

  # ECS Task Network Latency Experiment
  ecs_fargate_network_latency_enabled = true
  ecs_fargate_network_latency_parameters = {
    percentage = 25
  }
}
