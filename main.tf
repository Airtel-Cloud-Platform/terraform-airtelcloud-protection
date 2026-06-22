resource "airtelcloud_protection_plan" "this" {
  name = var.protection_plan_name

  description = var.plan_description

  retention      = var.retention
  retention_unit = var.retention_unit

  recurrence = var.recurrence

  selector_key   = var.selector_key
  selector_value = var.selector_value

  subnet_id = var.subnet_id
}

resource "airtelcloud_protection" "this" {
  name = var.name

  description = var.description

  compute_id = var.compute_id

  protection_plan = airtelcloud_protection_plan.this.name

  enable_scheduler = var.enable_scheduler

  start_date = var.start_date
  start_time = var.start_time

  end_date = var.end_date
}
