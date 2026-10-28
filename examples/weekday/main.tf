module "protection" {
  source = "../../"

  protection_plan_name = "app-backup"
  plan_description     = "Weekly backup, 30-day retention"
  vm_name              = "your-existing-vm"

  recurrence        = 1
  recurrence_period = "weekly"
  retention         = 30

  weekday    = "monday"
  start_time = "02:00"
}
