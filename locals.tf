variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

locals {
  tags = var.tags
}
