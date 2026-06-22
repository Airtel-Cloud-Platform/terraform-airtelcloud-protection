variable "name" {
  description = "Protection policy name"

  type = string

  validation {
    condition     = length(trim(var.name, " ")) > 0
    error_message = "name cannot be empty."
  }
}
variable "description" {
  description = "Protection policy description"
  type        = string
  default     = null
}

variable "compute_id" {
  description = "Compute instance ID"

  type = string

  validation {
    condition     = length(trim(var.compute_id, " ")) > 0
    error_message = "compute_id cannot be empty."
  }
}

variable "protection_plan_name" {
  description = "Protection plan name"

  type = string

  validation {
    condition     = length(trim(var.protection_plan_name, " ")) > 0
    error_message = "protection_plan_name cannot be empty."
  }
}

variable "plan_description" {
  description = "Protection plan description"
  type        = string
  default     = null
}

variable "retention" {
  description = "Retention value"
  type        = number

  validation {
    condition     = var.retention > 0
    error_message = "retention must be greater than 0."
  }
}

variable "retention_unit" {
  description = "Retention unit"
  type        = string

  validation {
    condition = contains(
      ["DAYS", "WEEKS", "MONTHS"],
      upper(var.retention_unit)
    )

    error_message = "retention_unit must be DAYS, WEEKS, or MONTHS."
  }
}

variable "recurrence" {
  description = "Backup recurrence in seconds"

  type = number

  validation {
    condition     = var.recurrence > 0
    error_message = "recurrence must be greater than 0."
  }
}

variable "selector_key" {
  description = "Selector key"
  type        = string
}

variable "selector_value" {
  description = "Selector value"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = null
}

variable "enable_scheduler" {
  description = "Enable scheduler"

  type    = bool
  default = true
}

variable "start_date" {
  description = "Start date"
  type        = string
  default     = null
}

variable "start_time" {
  description = "Start time"
  type        = string
  default     = null
}

variable "end_date" {
  description = "End date"
  type        = string
  default     = null
}
