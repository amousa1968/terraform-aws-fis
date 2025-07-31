# terraform-aws-fis

Terraform module to create AWS Fault Injection Service (FIS) experiment templates.

## Overview

This module allows you to define AWS FIS experiment templates to perform chaos engineering experiments on your AWS infrastructure. You can configure experiment templates with targets, actions, and stop conditions.

## Usage

```hcl
module "fis_experiment" {
  source = "./terraform-aws-fis"

  name                    = "example-fis-experiment"
  description             = "Example AWS FIS experiment template"
  role_arn                = "arn:aws:iam::123456789012:role/AWSFISRole"
  stop_condition_alarm_arn = "arn:aws:cloudwatch:alarm:region:account-id:alarm:example-alarm"

  target_name             = "target1"
  target_resource_type    = "aws:ec2:instance"
  target_selection_mode   = "ALL"

  action_name             = "action1"
  action_id               = "aws:ec2:terminate-instances"
}
```

## Inputs

| Name                    | Description                                  | Type          | Default           | Required |
|-------------------------|----------------------------------------------|---------------|-------------------|----------|
| name                    | Name of the FIS experiment template          | string        | "example-fis-experiment" | no       |
| description             | Description of the FIS experiment template   | string        | "Example AWS FIS experiment template" | no       |
| role_arn                | IAM role ARN for AWS FIS to assume            | string        | n/a               | yes      |
| stop_condition_alarm_arn | ARN of the CloudWatch alarm to stop the experiment | string        | n/a               | yes      |
| target_name             | Name of the target in the experiment template | string        | "target1"         | no       |
| target_resource_type    | Resource type for the target (e.g., aws:ec2:instance) | string        | n/a               | yes      |
| target_selection_mode   | Selection mode for the target (e.g., ALL, COUNT, PERCENTAGE) | string        | "ALL"             | no       |
| action_name             | Name of the action in the experiment template | string        | "action1"         | no       |
| action_id               | Action ID for the fault injection (e.g., aws:ec2:terminate-instances) | string        | n/a               | yes      |

## Outputs

| Name                   | Description                              |
|------------------------|------------------------------------------|
| experiment_template_id  | The ID of the AWS FIS experiment template |
| experiment_template_arn | The ARN of the AWS FIS experiment template |

## Notes

- Ensure the IAM role specified in `role_arn` has the necessary permissions for AWS FIS.
- Customize the module inputs to define different experiment templates and actions as needed.
