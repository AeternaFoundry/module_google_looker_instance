resource "google_looker_instance" "looker_instances" {
  for_each = var.looker_instances

  name                      = each.value.name
  consumer_network          = each.value.consumer_network
  controlled_egress_enabled = each.value.controlled_egress_enabled
  deletion_policy           = each.value.deletion_policy
  fips_enabled              = each.value.fips_enabled
  gemini_enabled            = each.value.gemini_enabled
  platform_edition          = each.value.platform_edition
  private_ip_enabled        = each.value.private_ip_enabled
  project                   = each.value.project
  psc_enabled               = each.value.psc_enabled
  public_ip_enabled         = each.value.public_ip_enabled
  region                    = each.value.region
  reserved_range            = each.value.reserved_range

  oauth_config {
    client_id     = each.value.oauth_config.client_id
    client_secret = each.value.oauth_config.client_secret
  }

  dynamic "admin_settings" {
    for_each = each.value.admin_settings != null ? [each.value.admin_settings] : []
    content {
      allowed_email_domains = admin_settings.value.allowed_email_domains
    }
  }

  dynamic "controlled_egress_config" {
    for_each = each.value.controlled_egress_config != null ? [each.value.controlled_egress_config] : []
    content {
      egress_fqdns        = controlled_egress_config.value.egress_fqdns
      marketplace_enabled = controlled_egress_config.value.marketplace_enabled
    }
  }

  dynamic "custom_domain" {
    for_each = each.value.custom_domain != null ? [each.value.custom_domain] : []
    content {
      domain = custom_domain.value.domain
    }
  }

  dynamic "deny_maintenance_period" {
    for_each = each.value.deny_maintenance_period != null ? [each.value.deny_maintenance_period] : []
    content {
      end_date {
        day   = deny_maintenance_period.value.end_date.day
        month = deny_maintenance_period.value.end_date.month
        year  = deny_maintenance_period.value.end_date.year
      }
      start_date {
        day   = deny_maintenance_period.value.start_date.day
        month = deny_maintenance_period.value.start_date.month
        year  = deny_maintenance_period.value.start_date.year
      }
      time {
        hours   = deny_maintenance_period.value.time.hours
        minutes = deny_maintenance_period.value.time.minutes
        nanos   = deny_maintenance_period.value.time.nanos
        seconds = deny_maintenance_period.value.time.seconds
      }
    }
  }

  dynamic "encryption_config" {
    for_each = each.value.encryption_config != null ? [each.value.encryption_config] : []
    content {
      kms_key_name = encryption_config.value.kms_key_name
    }
  }

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? [each.value.maintenance_window] : []
    content {
      day_of_week = maintenance_window.value.day_of_week
      start_time {
        hours   = maintenance_window.value.start_time.hours
        minutes = maintenance_window.value.start_time.minutes
        nanos   = maintenance_window.value.start_time.nanos
        seconds = maintenance_window.value.start_time.seconds
      }
    }
  }

  dynamic "periodic_export_config" {
    for_each = each.value.periodic_export_config != null ? [each.value.periodic_export_config] : []
    content {
      gcs_uri = periodic_export_config.value.gcs_uri
      kms_key = periodic_export_config.value.kms_key
      start_time {
        hours   = periodic_export_config.value.start_time.hours
        minutes = periodic_export_config.value.start_time.minutes
        nanos   = periodic_export_config.value.start_time.nanos
        seconds = periodic_export_config.value.start_time.seconds
      }
    }
  }

  dynamic "psc_config" {
    for_each = each.value.psc_config != null ? [each.value.psc_config] : []
    content {
      allowed_vpcs = psc_config.value.allowed_vpcs
      dynamic "service_attachments" {
        for_each = psc_config.value.service_attachments != null ? psc_config.value.service_attachments : []
        content {
          local_fqdn                    = service_attachments.value.local_fqdn
          target_service_attachment_uri = service_attachments.value.target_service_attachment_uri
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "user_metadata" {
    for_each = each.value.user_metadata != null ? [each.value.user_metadata] : []
    content {
      additional_developer_user_count = user_metadata.value.additional_developer_user_count
      additional_standard_user_count  = user_metadata.value.additional_standard_user_count
      additional_viewer_user_count    = user_metadata.value.additional_viewer_user_count
    }
  }
}

