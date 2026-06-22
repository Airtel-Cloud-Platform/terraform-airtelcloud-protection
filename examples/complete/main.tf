module "protection" {
  source = "../../"

  protection_plan_name = "production-backup-plan"

  name = "production-web-server-backup"

  compute_id = "b603ccb5-fe35-4ddb-9a7c-2e966a9425c2"

  retention      = 30
  retention_unit = "DAYS"

  recurrence = 86400

  selector_key   = "AZ"
  selector_value = "S1"

  subnet_id = "35df162d-5211-4d58-84ed-6a499626949c"

  plan_description = "Daily backup with 30-day retention"

  description = "Backup policy for production web server"

  enable_scheduler = true

  start_date = "2026-04-01"
  start_time = "02:00"
}
