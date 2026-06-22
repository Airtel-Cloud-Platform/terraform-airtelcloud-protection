output "protection_plan_id" {
  description = "Protection Plan ID"
  value       = airtelcloud_protection_plan.this.id
}

output "protection_plan_name" {
  description = "Protection Plan Name"
  value       = airtelcloud_protection_plan.this.name
}

output "protection_id" {
  description = "Protection ID"
  value       = airtelcloud_protection.this.id
}

output "protection_status" {
  description = "Protection Status"
  value       = airtelcloud_protection.this.status
}

output "protection" {
  value = {
    protection_plan_id = airtelcloud_protection_plan.this.id
    protection_id      = airtelcloud_protection.this.id
    status             = airtelcloud_protection.this.status
  }
}
