variable "name" {
  description = "Name of the FIS experiment template"
  type        = string
}

variable "description" {
  description = "Description of the FIS experiment template"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for AWS FIS to assume"
  type        = string
}

variable "stop_condition_alarm_arn" {
  description = "ARN of the CloudWatch alarm to stop the experiment"
  type        = string
}

variable "target_name" {
  description = "Name of the target in the experiment template"
  type        = string
}

variable "target_resource_type" {
  description = "Resource type for the target (e.g., aws:ec2:instance)"
  type        = string
}

variable "target_selection_mode" {
  description = "Selection mode for the target (e.g., ALL, COUNT, PERCENTAGE)"
  type        = string
}

variable "target_resource_tags" {
  description = "Map of resource tags to identify target resources"
  type        = map(string)
}

variable "action_name" {
  description = "Name of the action in the experiment template"
  type        = string
}

variable "action_id" {
  description = "Action ID for the fault injection (e.g., aws:ec2:terminate-instances)"
  type        = string
}

variable "action_description" {
  description = "Description of the action"
  type        = string
}

variable "action_parameters" {
  description = "Parameters for the action"
  type        = map(string)
}

variable "instance_termination" {
  description = "Enable the instance termination experiment."
  type        = bool
}

variable "instance_termination_parameters" {
  description = "Configuration of the instance termination experiment."
  type = object({
    number_of_instances = optional(number, 1)
    target_tag = optional(object({
      key   = string
      value = string
    }))
  })

  validation {
    condition     = var.instance_termination_parameters.number_of_instances > 0
    error_message = "Number of instances to terminate must be greater than 0"
  }
}

variable "rds_failover_enabled" {
  description = "Enable the RDS failover experiment."
  type        = bool
}

variable "rds_reboot_enabled" {
  description = "Enable the RDS reboot experiment."
  type        = bool
}

variable "rds_cpu_stress_enabled" {
  description = "Enable the RDS CPU stress experiment."
  type        = bool
}

variable "dynamodb_throttle_enabled" {
  description = "Enable the DynamoDB table throttle experiment."
  type        = bool
}

variable "dynamodb_latency_enabled" {
  description = "Enable the DynamoDB add latency experiment."
  type        = bool
}

variable "dynamodb_error_injection_enabled" {
  description = "Enable the DynamoDB error injection experiment."
  type        = bool
}

variable "dynamodb_backup_failure_enabled" {
  description = "Enable the DynamoDB backup failure experiment."
  type        = bool
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for experiments"
  type        = string
}

variable "dynamodb_gsi_name" {
  description = "Name of the DynamoDB Global Secondary Index for experiments"
  type        = string
}
