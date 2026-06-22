module "protection" {
  source = "../../"

  protection_plan_name = "daily-backup"

  name = "web-server-backup"

  compute_id = "compute-id"

  retention      = 30
  retention_unit = "DAYS"

  recurrence = 86400

  selector_key   = "AZ"
  selector_value = "S1"
}
