variable "protection_plan_name" {
  description = "Protection plan name in Terraform. The API stores {name}-daily or {name}-weekly. Forces replacement."
  type        = string

  validation {
    condition     = length(trim(var.protection_plan_name, " ")) > 0
    error_message = "protection_plan_name cannot be empty."
  }
}

variable "plan_description" {
  description = "Protection plan description. Required by the provider. Forces replacement."
  type        = string

  validation {
    condition     = length(trim(var.plan_description, " ")) > 0
    error_message = "plan_description cannot be empty."
  }
}

variable "vm_name" {
  description = "Existing VM instance_name. Used by both the plan (AZ/subnet lookup) and the protection policy. Forces replacement."
  type        = string

  validation {
    condition     = length(trim(var.vm_name, " ")) > 0
    error_message = "vm_name cannot be empty."
  }
}

variable "recurrence" {
  description = "How many recurrence_period units between runs (1-30), not seconds."
  type        = number

  validation {
    condition     = var.recurrence >= 1 && var.recurrence <= 30
    error_message = "recurrence must be between 1 and 30."
  }
}

variable "recurrence_period" {
  description = "daily or weekly."
  type        = string

  validation {
    condition     = contains(["daily", "weekly"], lower(var.recurrence_period))
    error_message = "recurrence_period must be daily or weekly."
  }
}

variable "retention" {
  description = "Retention in days (1-365). Provider always sends retention_unit DAYS."
  type        = number

  validation {
    condition     = var.retention >= 1 && var.retention <= 365
    error_message = "retention must be between 1 and 365 days."
  }
}

variable "description" {
  description = "Protection policy description."
  type        = string
  default     = null
}

variable "policy_type_id" {
  description = "Optional protection policy type ID."
  type        = string
  default     = null
}

variable "enable_scheduler" {
  description = "Whether to enable the backup scheduler. Provider type is string; default true."
  type        = string
  default     = "true"
}

variable "start_date" {
  description = "Policy start date YYYY-MM-DD. Mutually exclusive with weekday."
  type        = string
  default     = null
}

variable "weekday" {
  description = "Policy start weekday (monday..sunday or mon..sun). Mutually exclusive with start_date."
  type        = string
  default     = null

  validation {
    condition = var.weekday == null || contains([
      "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday",
      "mon", "tue", "wed", "thu", "fri", "sat", "sun",
    ], lower(var.weekday))
    error_message = "weekday must be monday..sunday or mon..sun."
  }

  validation {
    condition     = !(var.start_date != null && var.weekday != null)
    error_message = "Specify either start_date or weekday, not both."
  }

  validation {
    condition     = var.start_date != null || var.weekday != null
    error_message = "Specify start_date or weekday."
  }
}

variable "start_time" {
  description = "Policy start time in 24-hour HH:MM (IST). Required."
  type        = string

  validation {
    condition     = length(trim(var.start_time, " ")) > 0
    error_message = "start_time cannot be empty."
  }
}

variable "end_date" {
  description = "Optional policy end date YYYY-MM-DD."
  type        = string
  default     = null
}
