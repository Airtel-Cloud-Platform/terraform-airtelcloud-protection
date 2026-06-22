# Airtel Cloud Protection Terraform Module

Terraform module for provisioning Airtel Cloud Backup Protection Policies and Protection Plans.

## Features

- Creates Protection Plans
- Creates Protection Policies
- Supports Backup Scheduling
- Supports Retention Configuration
- Supports Automated Backup Policies
- Exposes Protection Outputs for Downstream Automation

## Usage

### Basic Example

```hcl
module "protection" {
  source = "Airtel-Cloud-Platform/protection/airtelcloud"

  protection_plan_name = "daily-backup"

  protection_name = "web-server-backup"

  compute_id = "compute-id"

  retention      = 30
  retention_unit = "DAYS"

  recurrence = 86400

  selector_key   = "AZ"
  selector_value = "S1"
}
```

### Complete Example

```hcl
module "protection" {
  source = "Airtel-Cloud-Platform/protection/airtelcloud"

  protection_plan_name = "production-backup-plan"

  protection_name = "production-web-server-backup"

  compute_id = "compute-id"

  retention      = 30
  retention_unit = "DAYS"

  recurrence = 86400

  selector_key   = "AZ"
  selector_value = "S1"

  subnet_id = "subnet-id"

  plan_description = "Daily backup with 30-day retention"

  description = "Backup policy for production web server"

  enable_scheduler = "true"

  start_date = "2026-04-01"
  start_time = "02:00"
}
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| protection_name | Protection Policy Name | string | Yes |
| protection_plan_name | Protection Plan Name | string | Yes |
| compute_id | Compute Instance ID | string | Yes |
| retention | Retention Value | number | Yes |
| retention_unit | DAYS, WEEKS or MONTHS | string | Yes |
| recurrence | Backup Recurrence In Seconds | number | Yes |
| selector_key | Selector Key | string | Yes |
| selector_value | Selector Value | string | Yes |
| subnet_id | Subnet ID | string | No |
| description | Protection Description | string | No |
| plan_description | Protection Plan Description | string | No |
| enable_scheduler | Enable Scheduler | string | No |
| start_date | Schedule Start Date | string | No |
| start_time | Schedule Start Time | string | No |
| end_date | Schedule End Date | string | No |

## Outputs

| Name | Description |
|------|-------------|
| protection_plan_id | Protection Plan ID |
| protection_plan_name | Protection Plan Name |
| protection_id | Protection Policy ID |
| protection_status | Protection Status |
| protection | Complete Protection Object |

## Notes

The module creates:

- One Protection Plan
- One Protection Policy

The Protection Policy is automatically associated with the Protection Plan.

Common recurrence values:

| Frequency | Seconds |
|------------|---------|
| Daily | 86400 |
| Weekly | 604800 |
| Monthly | 2592000 |

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.5 |
| airtelcloud Provider | >= 1.0.4 |
