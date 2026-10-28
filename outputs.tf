output "protection_plan_id" {
  description = "Protection plan UUID. Pass this to airtelcloud_protection.protection_plan."
  value       = airtelcloud_protection_plan.this.id
}

output "protection_plan_name" {
  description = "Protection plan name as stored in Terraform (without API suffix)."
  value       = airtelcloud_protection_plan.this.name
}

output "selector_value" {
  description = "Availability zone taken from vm_name."
  value       = airtelcloud_protection_plan.this.selector_value
}

output "protection_id" {
  description = "Protection policy ID."
  value       = airtelcloud_protection.this.id
}

output "protection_name" {
  description = "Protection policy name (the VM instance_name)."
  value       = airtelcloud_protection.this.name
}

output "compute_id" {
  description = "VM UUID looked up from vm_name."
  value       = airtelcloud_protection.this.compute_id
}

output "protection_status" {
  description = "Protection policy status."
  value       = airtelcloud_protection.this.status
}
