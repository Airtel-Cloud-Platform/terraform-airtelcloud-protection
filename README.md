# Airtel Cloud Protection Terraform Module

Creates an `airtelcloud_protection_plan` and an `airtelcloud_protection` policy. Those are **separate provider resources**. The plan is the schedule/retention; the policy attaches that plan to an existing VM.

## Breaking changes

The provider no longer accepts the old plan/policy fields this module used.

| Removed | Replacement |
| --- | --- |
| `compute_id` | `vm_name` (UUID is looked up) |
| policy `name` | computed; always the VM name |
| `retention_unit`, `selector_key`, `selector_value`, `subnet_id` | set by the provider from `vm_name` |
| `recurrence` in seconds | `recurrence` 1–30 plus `recurrence_period` (`daily` / `weekly`) |
| `protection_plan` = plan **name** | module passes plan **`id`** |

## Usage

### Daily plan with start date

```hcl
module "protection" {
  source = "Airtel-Cloud-Platform/protection/airtelcloud"

  protection_plan_name = "app-backup"
  plan_description     = "Daily backup, 30-day retention"
  vm_name              = "your-existing-vm"

  recurrence        = 1
  recurrence_period = "daily"
  retention         = 30

  start_date = "2026-07-20"
  start_time = "02:00"
}
```

### Weekly plan with weekday

```hcl
module "protection" {
  source = "Airtel-Cloud-Platform/protection/airtelcloud"

  protection_plan_name = "app-backup"
  plan_description     = "Weekly backup, 30-day retention"
  vm_name              = "your-existing-vm"

  recurrence        = 1
  recurrence_period = "weekly"
  retention         = 30

  weekday    = "monday"
  start_time = "02:00"
}
```

`start_date` and `weekday` are mutually exclusive. Specify exactly one. `start_time` is 24-hour `HH:MM` (IST).

## Inputs

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| protection_plan_name | Plan name | string | Yes |
| plan_description | Plan description | string | Yes |
| vm_name | Existing VM instance_name | string | Yes |
| recurrence | Period count, 1–30 | number | Yes |
| recurrence_period | `daily` or `weekly` | string | Yes |
| retention | Days to keep backups, 1–365 | number | Yes |
| start_time | `HH:MM` IST | string | Yes |
| start_date | `YYYY-MM-DD`; XOR weekday | string | No |
| weekday | `monday`..`sunday`; XOR start_date | string | No |
| description | Policy description | string | No |
| policy_type_id | Optional policy type ID | string | No |
| enable_scheduler | `"true"` / `"false"` | string | No (`"true"`) |
| end_date | Optional `YYYY-MM-DD` | string | No |

## Outputs

| Name | Description |
| --- | --- |
| protection_plan_id | Plan UUID |
| protection_plan_name | Plan name |
| selector_value | AZ from the VM |
| protection_id | Policy ID |
| protection_name | Policy name (VM name) |
| compute_id | VM UUID |
| protection_status | Policy status |

## Notes

- Destroying a plan only drops it from Terraform state. The backup API does not delete plans.
- Pass `protection_plan_id` if you attach extra `airtelcloud_protection` resources yourself.

## Requirements

| Name | Version |
| --- | --- |
| Terraform | >= 1.5 |
| airtelcloud provider | >= 1.3.0 |
