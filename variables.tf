variable "looker_instances" {
  description = <<EOT
Map of looker_instances, attributes below
Required:
    - name
    - oauth_config (block):
        - client_id (required)
        - client_secret (required)
Optional:
    - consumer_network
    - controlled_egress_enabled
    - deletion_policy
    - fips_enabled
    - gemini_enabled
    - platform_edition
    - private_ip_enabled
    - project
    - psc_enabled
    - public_ip_enabled
    - region
    - reserved_range
    - admin_settings (block):
        - allowed_email_domains (optional)
    - controlled_egress_config (block):
        - egress_fqdns (optional)
        - marketplace_enabled (optional)
    - custom_domain (block):
        - domain (optional)
    - deny_maintenance_period (block):
        - end_date (required, block):
            - day (optional)
            - month (optional)
            - year (optional)
        - start_date (required, block):
            - day (optional)
            - month (optional)
            - year (optional)
        - time (required, block):
            - hours (optional)
            - minutes (optional)
            - nanos (optional)
            - seconds (optional)
    - encryption_config (block):
        - kms_key_name (optional)
    - maintenance_window (block):
        - day_of_week (required)
        - start_time (required, block):
            - hours (optional)
            - minutes (optional)
            - nanos (optional)
            - seconds (optional)
    - periodic_export_config (block):
        - gcs_uri (required)
        - kms_key (required)
        - start_time (required, block):
            - hours (optional)
            - minutes (optional)
            - nanos (optional)
            - seconds (optional)
    - psc_config (block):
        - allowed_vpcs (optional)
        - service_attachments (optional, block):
            - local_fqdn (optional)
            - target_service_attachment_uri (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - user_metadata (block):
        - additional_developer_user_count (optional)
        - additional_standard_user_count (optional)
        - additional_viewer_user_count (optional)
EOT

  type = map(object({
    name                      = string
    consumer_network          = optional(string)
    controlled_egress_enabled = optional(bool)
    deletion_policy           = optional(string)
    fips_enabled              = optional(bool)
    gemini_enabled            = optional(bool)
    platform_edition          = optional(string)
    private_ip_enabled        = optional(bool)
    project                   = optional(string)
    psc_enabled               = optional(bool)
    public_ip_enabled         = optional(bool)
    region                    = optional(string)
    reserved_range            = optional(string)
    oauth_config = object({
      client_id     = string
      client_secret = string
    })
    admin_settings = optional(object({
      allowed_email_domains = optional(list(string))
    }))
    controlled_egress_config = optional(object({
      egress_fqdns        = optional(list(string))
      marketplace_enabled = optional(bool)
    }))
    custom_domain = optional(object({
      domain = optional(string)
    }))
    deny_maintenance_period = optional(object({
      end_date = object({
        day   = optional(number)
        month = optional(number)
        year  = optional(number)
      })
      start_date = object({
        day   = optional(number)
        month = optional(number)
        year  = optional(number)
      })
      time = object({
        hours   = optional(number)
        minutes = optional(number)
        nanos   = optional(number)
        seconds = optional(number)
      })
    }))
    encryption_config = optional(object({
      kms_key_name = optional(string)
    }))
    maintenance_window = optional(object({
      day_of_week = string
      start_time = object({
        hours   = optional(number)
        minutes = optional(number)
        nanos   = optional(number)
        seconds = optional(number)
      })
    }))
    periodic_export_config = optional(object({
      gcs_uri = string
      kms_key = string
      start_time = object({
        hours   = optional(number)
        minutes = optional(number)
        nanos   = optional(number)
        seconds = optional(number)
      })
    }))
    psc_config = optional(object({
      allowed_vpcs = optional(list(string))
      service_attachments = optional(list(object({
        local_fqdn                    = optional(string)
        target_service_attachment_uri = optional(string)
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    user_metadata = optional(object({
      additional_developer_user_count = optional(number)
      additional_standard_user_count  = optional(number)
      additional_viewer_user_count    = optional(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.end_date.day == null || (v.deny_maintenance_period.end_date.day >= 0 && v.deny_maintenance_period.end_date.day <= 32))
      )
    ])
    error_message = "must be between 0 and 32"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.end_date.month == null || (v.deny_maintenance_period.end_date.month >= 0 && v.deny_maintenance_period.end_date.month <= 13))
      )
    ])
    error_message = "must be between 0 and 13"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.end_date.year == null || (v.deny_maintenance_period.end_date.year >= 0 && v.deny_maintenance_period.end_date.year <= 10000))
      )
    ])
    error_message = "must be between 0 and 10000"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.start_date.day == null || (v.deny_maintenance_period.start_date.day >= 0 && v.deny_maintenance_period.start_date.day <= 32))
      )
    ])
    error_message = "must be between 0 and 32"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.start_date.month == null || (v.deny_maintenance_period.start_date.month >= 0 && v.deny_maintenance_period.start_date.month <= 13))
      )
    ])
    error_message = "must be between 0 and 13"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.start_date.year == null || (v.deny_maintenance_period.start_date.year >= 0 && v.deny_maintenance_period.start_date.year <= 10000))
      )
    ])
    error_message = "must be between 0 and 10000"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.time.hours == null || (v.deny_maintenance_period.time.hours >= 0 && v.deny_maintenance_period.time.hours <= 23))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.time.minutes == null || (v.deny_maintenance_period.time.minutes >= 0 && v.deny_maintenance_period.time.minutes <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.time.nanos == null || (v.deny_maintenance_period.time.nanos >= 0 && v.deny_maintenance_period.time.nanos <= 999999999))
      )
    ])
    error_message = "must be between 0 and 999999999"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.deny_maintenance_period == null || (v.deny_maintenance_period.time.seconds == null || (v.deny_maintenance_period.time.seconds >= 0 && v.deny_maintenance_period.time.seconds <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.maintenance_window == null || (v.maintenance_window.start_time.hours == null || (v.maintenance_window.start_time.hours >= 0 && v.maintenance_window.start_time.hours <= 23))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.maintenance_window == null || (v.maintenance_window.start_time.minutes == null || (v.maintenance_window.start_time.minutes >= 0 && v.maintenance_window.start_time.minutes <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.maintenance_window == null || (v.maintenance_window.start_time.nanos == null || (v.maintenance_window.start_time.nanos >= 0 && v.maintenance_window.start_time.nanos <= 999999999))
      )
    ])
    error_message = "must be between 0 and 999999999"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.maintenance_window == null || (v.maintenance_window.start_time.seconds == null || (v.maintenance_window.start_time.seconds >= 0 && v.maintenance_window.start_time.seconds <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.periodic_export_config == null || (v.periodic_export_config.start_time.hours == null || (v.periodic_export_config.start_time.hours >= 0 && v.periodic_export_config.start_time.hours <= 23))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.periodic_export_config == null || (v.periodic_export_config.start_time.minutes == null || (v.periodic_export_config.start_time.minutes >= 0 && v.periodic_export_config.start_time.minutes <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.periodic_export_config == null || (v.periodic_export_config.start_time.nanos == null || (v.periodic_export_config.start_time.nanos >= 0 && v.periodic_export_config.start_time.nanos <= 999999999))
      )
    ])
    error_message = "must be between 0 and 999999999"
  }
  validation {
    condition = alltrue([
      for k, v in var.looker_instances : (
        v.periodic_export_config == null || (v.periodic_export_config.start_time.seconds == null || (v.periodic_export_config.start_time.seconds >= 0 && v.periodic_export_config.start_time.seconds <= 60))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

