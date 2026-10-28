resource "airtelcloud_protection_plan" "this" {
  name              = var.protection_plan_name
  description       = var.plan_description
  vm_name           = var.vm_name
  recurrence        = var.recurrence
  recurrence_period = var.recurrence_period
  retention         = var.retention
}

resource "airtelcloud_protection" "this" {
  vm_name          = var.vm_name
  protection_plan  = airtelcloud_protection_plan.this.id
  description      = var.description
  policy_type_id   = var.policy_type_id
  enable_scheduler = var.enable_scheduler
  start_date       = var.start_date
  weekday          = var.weekday
  start_time       = var.start_time
  end_date         = var.end_date
}
