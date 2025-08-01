variable "name" {
  description = "Name of the FIS experiment template"
  type        = string
  default     = "example-fis-experiment"
}

variable "description" {
  description = "Description of the FIS experiment template"
  type        = string
  default     = "Example AWS FIS experiment template"
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
  default     = "target1"
}

variable "target_resource_type" {
  description = "Resource type for the target (e.g., aws:ec2:instance)"
  type        = string
}

variable "target_selection_mode" {
  description = "Selection mode for the target (e.g., ALL, COUNT, PERCENTAGE)"
  type        = string
  default     = "ALL"
}

variable "target_resource_tags" {
  description = "Map of resource tags to identify target resources"
  type        = map(string)
  default     = {}
}

variable "action_name" {
  description = "Name of the action in the experiment template"
  type        = string
  default     = "action1"
}

variable "action_id" {
  description = "Action ID for the fault injection (e.g., aws:ec2:terminate-instances)"
  type        = string
}

variable "action_description" {
  description = "Description of the action"
  type        = string
  default     = "Example action"
}

variable "action_parameters" {
  description = "Parameters for the action"
  type        = map(string)
  default     = {}
}

variable "instance_termination" {
  description = "Enable the instance termination experiment."
  type        = bool
  default     = false
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
