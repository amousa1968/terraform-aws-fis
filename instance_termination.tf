# TODO: Enable logging
#----------------------
resource "aws_fis_experiment_template" "instance_termination" {
  count       = var.instance_termination ? 1 : 0
  description = "Terminate one of the EC2 instances matching a tag."
  role_arn    = aws_iam_role.experiment_runner.arn

  stop_condition {
    source = "none"
  }

  action {
    # it might fail if one or more of the specified instances are enabled for termination protection
    name      = "terminate-instances"
    action_id = "aws:ec2:stop-instances"

    target {
      key   = "Instances"
      value = "EC2"
    }
  }

  target {
    name           = "EC2"
    resource_type  = "aws:ec2:instance"
    selection_mode = "COUNT(${var.instance_termination_parameters.number_of_instances})"

    resource_tag {
      key   = (var.instance_termination_parameters.target_tag != null) ? var.instance_termination_parameters.target_tag.key : "chaos"
      value = (var.instance_termination_parameters.target_tag != null) ? var.instance_termination_parameters.target_tag.value : "ready"
    }
  }

  tags = {
    "Name" = "ec2-instance-termination"
  }
}

