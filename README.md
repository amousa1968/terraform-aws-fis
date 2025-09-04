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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_fis_experiment_template.dynamodb_add_latency](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.dynamodb_backup_failure](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.dynamodb_error_injection](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.dynamodb_table_throttle](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.ecs_fargate_cpu_stress](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.ecs_fargate_network_latency](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.ecs_fargate_task_termination](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.example](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.instance_termination](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.rds_cpu_stress](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.rds_failover](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_fis_experiment_template.rds_reboot_instance](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/fis_experiment_template) | resource |
| [aws_iam_role.experiment_runner](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/iam_role) | resource |
| [aws_iam_role.fis_role](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.experiment_runner_policy](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.fis_role_policy](https://registry.terraform.io/providers/hashicorp/aws/6.7.0/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_description"></a> [action\_description](#input\_action\_description) | Description of the action | `string` | n/a | yes |
| <a name="input_action_id"></a> [action\_id](#input\_action\_id) | Action ID for the fault injection (e.g., aws:ec2:terminate-instances) | `string` | n/a | yes |
| <a name="input_action_name"></a> [action\_name](#input\_action\_name) | Name of the action in the experiment template | `string` | n/a | yes |
| <a name="input_action_parameters"></a> [action\_parameters](#input\_action\_parameters) | Parameters for the action | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the FIS experiment template | `string` | n/a | yes |
| <a name="input_dynamodb_backup_failure_enabled"></a> [dynamodb\_backup\_failure\_enabled](#input\_dynamodb\_backup\_failure\_enabled) | Enable the DynamoDB backup failure experiment. | `bool` | n/a | yes |
| <a name="input_dynamodb_backup_failure_selection_mode"></a> [dynamodb\_backup\_failure\_selection\_mode](#input\_dynamodb\_backup\_failure\_selection\_mode) | Selection mode for DynamoDB backup failure experiment | `string` | n/a | yes |
| <a name="input_dynamodb_error_injection_enabled"></a> [dynamodb\_error\_injection\_enabled](#input\_dynamodb\_error\_injection\_enabled) | Enable the DynamoDB error injection experiment. | `bool` | n/a | yes |
| <a name="input_dynamodb_error_injection_selection_mode"></a> [dynamodb\_error\_injection\_selection\_mode](#input\_dynamodb\_error\_injection\_selection\_mode) | Selection mode for DynamoDB error injection experiment | `string` | n/a | yes |
| <a name="input_dynamodb_gsi_name"></a> [dynamodb\_gsi\_name](#input\_dynamodb\_gsi\_name) | Name of the DynamoDB Global Secondary Index for experiments | `string` | n/a | yes |
| <a name="input_dynamodb_latency_enabled"></a> [dynamodb\_latency\_enabled](#input\_dynamodb\_latency\_enabled) | Enable the DynamoDB add latency experiment. | `bool` | n/a | yes |
| <a name="input_dynamodb_latency_selection_mode"></a> [dynamodb\_latency\_selection\_mode](#input\_dynamodb\_latency\_selection\_mode) | Selection mode for DynamoDB latency experiment | `string` | n/a | yes |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | Name of the DynamoDB table for experiments | `string` | n/a | yes |
| <a name="input_dynamodb_throttle_enabled"></a> [dynamodb\_throttle\_enabled](#input\_dynamodb\_throttle\_enabled) | Enable the DynamoDB table throttle experiment. | `bool` | n/a | yes |
| <a name="input_dynamodb_throttle_selection_mode"></a> [dynamodb\_throttle\_selection\_mode](#input\_dynamodb\_throttle\_selection\_mode) | Selection mode for DynamoDB throttle experiment | `string` | n/a | yes |
| <a name="input_ecs_cpu_stress_selection_mode"></a> [ecs\_cpu\_stress\_selection\_mode](#input\_ecs\_cpu\_stress\_selection\_mode) | Selection mode for ECS CPU stress experiment | `string` | n/a | yes |
| <a name="input_ecs_fargate_cpu_stress_enabled"></a> [ecs\_fargate\_cpu\_stress\_enabled](#input\_ecs\_fargate\_cpu\_stress\_enabled) | Enable the ECS Fargate CPU stress experiment. | `bool` | `false` | no |
| <a name="input_ecs_fargate_cpu_stress_parameters"></a> [ecs\_fargate\_cpu\_stress\_parameters](#input\_ecs\_fargate\_cpu\_stress\_parameters) | Parameters for the ECS Fargate CPU stress experiment. | `map(string)` | `{}` | no |
| <a name="input_ecs_fargate_network_latency_enabled"></a> [ecs\_fargate\_network\_latency\_enabled](#input\_ecs\_fargate\_network\_latency\_enabled) | Enable the ECS Fargate network latency experiment. | `bool` | `false` | no |
| <a name="input_ecs_fargate_network_latency_parameters"></a> [ecs\_fargate\_network\_latency\_parameters](#input\_ecs\_fargate\_network\_latency\_parameters) | Parameters for the ECS Fargate network latency experiment. | `map(string)` | `{}` | no |
| <a name="input_ecs_fargate_task_termination_enabled"></a> [ecs\_fargate\_task\_termination\_enabled](#input\_ecs\_fargate\_task\_termination\_enabled) | Enable the ECS Fargate task termination experiment. | `bool` | `false` | no |
| <a name="input_ecs_fargate_task_termination_parameters"></a> [ecs\_fargate\_task\_termination\_parameters](#input\_ecs\_fargate\_task\_termination\_parameters) | Parameters for the ECS Fargate task termination experiment. | `map(string)` | `{}` | no |
| <a name="input_ecs_network_latency_selection_mode"></a> [ecs\_network\_latency\_selection\_mode](#input\_ecs\_network\_latency\_selection\_mode) | Selection mode for ECS network latency experiment | `string` | n/a | yes |
| <a name="input_ecs_task_termination_selection_mode"></a> [ecs\_task\_termination\_selection\_mode](#input\_ecs\_task\_termination\_selection\_mode) | Selection mode for ECS task termination experiment | `string` | n/a | yes |
| <a name="input_iam_role_name_experiment_runner"></a> [iam\_role\_name\_experiment\_runner](#input\_iam\_role\_name\_experiment\_runner) | Name of the IAM role for experiment runner | `string` | n/a | yes |
| <a name="input_iam_role_name_fis"></a> [iam\_role\_name\_fis](#input\_iam\_role\_name\_fis) | Name of the IAM role for AWS FIS | `string` | n/a | yes |
| <a name="input_instance_termination"></a> [instance\_termination](#input\_instance\_termination) | Enable the instance termination experiment. | `bool` | n/a | yes |
| <a name="input_instance_termination_default_tag_key"></a> [instance\_termination\_default\_tag\_key](#input\_instance\_termination\_default\_tag\_key) | Default tag key for instance termination experiment | `string` | n/a | yes |
| <a name="input_instance_termination_default_tag_value"></a> [instance\_termination\_default\_tag\_value](#input\_instance\_termination\_default\_tag\_value) | Default tag value for instance termination experiment | `string` | n/a | yes |
| <a name="input_instance_termination_experiment_name"></a> [instance\_termination\_experiment\_name](#input\_instance\_termination\_experiment\_name) | Name for the instance termination experiment | `string` | n/a | yes |
| <a name="input_instance_termination_parameters"></a> [instance\_termination\_parameters](#input\_instance\_termination\_parameters) | Configuration of the instance termination experiment. | <pre>object({<br>    number_of_instances = optional(number, 1)<br>    target_tag = optional(object({<br>      key   = string<br>      value = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the FIS experiment template | `string` | n/a | yes |
| <a name="input_rds_cpu_stress_enabled"></a> [rds\_cpu\_stress\_enabled](#input\_rds\_cpu\_stress\_enabled) | Enable the RDS CPU stress experiment. | `bool` | n/a | yes |
| <a name="input_rds_cpu_stress_selection_mode"></a> [rds\_cpu\_stress\_selection\_mode](#input\_rds\_cpu\_stress\_selection\_mode) | Selection mode for RDS CPU stress experiment | `string` | n/a | yes |
| <a name="input_rds_failover_enabled"></a> [rds\_failover\_enabled](#input\_rds\_failover\_enabled) | Enable the RDS failover experiment. | `bool` | n/a | yes |
| <a name="input_rds_failover_selection_mode"></a> [rds\_failover\_selection\_mode](#input\_rds\_failover\_selection\_mode) | Selection mode for RDS failover experiment | `string` | n/a | yes |
| <a name="input_rds_reboot_enabled"></a> [rds\_reboot\_enabled](#input\_rds\_reboot\_enabled) | Enable the RDS reboot experiment. | `bool` | n/a | yes |
| <a name="input_rds_reboot_selection_mode"></a> [rds\_reboot\_selection\_mode](#input\_rds\_reboot\_selection\_mode) | Selection mode for RDS reboot experiment | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | IAM role ARN for AWS FIS to assume | `string` | n/a | yes |
| <a name="input_stop_condition_alarm_arn"></a> [stop\_condition\_alarm\_arn](#input\_stop\_condition\_alarm\_arn) | ARN of the CloudWatch alarm to stop the experiment | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to resources. | `map(string)` | `{}` | no |
| <a name="input_target_name"></a> [target\_name](#input\_target\_name) | Name of the target in the experiment template | `string` | n/a | yes |
| <a name="input_target_resource_tags"></a> [target\_resource\_tags](#input\_target\_resource\_tags) | Map of resource tags to identify target resources | `map(string)` | `{}` | no |
| <a name="input_target_resource_type"></a> [target\_resource\_type](#input\_target\_resource\_type) | Resource type for the target (e.g., aws:ec2:instance) | `string` | n/a | yes |
| <a name="input_target_selection_mode"></a> [target\_selection\_mode](#input\_target\_selection\_mode) | Selection mode for the target (e.g., ALL, COUNT, PERCENTAGE) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_experiment_template_id"></a> [experiment\_template\_id](#output\_experiment\_template\_id) | The ID of the AWS FIS experiment template |
<!-- END_TF_DOCS -->