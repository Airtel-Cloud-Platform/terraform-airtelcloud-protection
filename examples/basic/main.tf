module "protection" {
  source = "../../"

  protection_plan_name = "app-backup"
  plan_description     = "Daily backup, 30-day retention"
  vm_name              = "your-existing-vm"

  recurrence        = 1
  recurrence_period = "daily"
  retention         = 30

  start_date = "2026-07-20"
  start_time = "02:00"
}
