output "looker_instances_id" {
  description = "Map of id values across all looker_instances, keyed the same as var.looker_instances except keys with no id are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.id if v.id != null && length(v.id) > 0 }
}
output "looker_instances_admin_settings" {
  description = "Map of admin_settings values across all looker_instances, keyed the same as var.looker_instances except keys with no admin_settings are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.admin_settings) if v.admin_settings != null && length(v.admin_settings) > 0 }
}
output "looker_instances_consumer_network" {
  description = "Map of consumer_network values across all looker_instances, keyed the same as var.looker_instances except keys with no consumer_network are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.consumer_network if v.consumer_network != null && length(v.consumer_network) > 0 }
}
output "looker_instances_controlled_egress_config" {
  description = "Map of controlled_egress_config values across all looker_instances, keyed the same as var.looker_instances except keys with no controlled_egress_config are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.controlled_egress_config) if v.controlled_egress_config != null && length(v.controlled_egress_config) > 0 }
}
output "looker_instances_controlled_egress_enabled" {
  description = "Map of controlled_egress_enabled values across all looker_instances, keyed the same as var.looker_instances except keys with no controlled_egress_enabled are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.controlled_egress_enabled if v.controlled_egress_enabled != null }
}
output "looker_instances_create_time" {
  description = "Map of create_time values across all looker_instances, keyed the same as var.looker_instances except keys with no create_time are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "looker_instances_custom_domain" {
  description = "Map of custom_domain values across all looker_instances, keyed the same as var.looker_instances except keys with no custom_domain are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.custom_domain) if v.custom_domain != null && length(v.custom_domain) > 0 }
}
output "looker_instances_deletion_policy" {
  description = "Map of deletion_policy values across all looker_instances, keyed the same as var.looker_instances except keys with no deletion_policy are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "looker_instances_deny_maintenance_period" {
  description = "Map of deny_maintenance_period values across all looker_instances, keyed the same as var.looker_instances except keys with no deny_maintenance_period are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.deny_maintenance_period) if v.deny_maintenance_period != null && length(v.deny_maintenance_period) > 0 }
}
output "looker_instances_egress_public_ip" {
  description = "Map of egress_public_ip values across all looker_instances, keyed the same as var.looker_instances except keys with no egress_public_ip are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.egress_public_ip if v.egress_public_ip != null && length(v.egress_public_ip) > 0 }
}
output "looker_instances_encryption_config" {
  description = "Map of encryption_config values across all looker_instances, keyed the same as var.looker_instances except keys with no encryption_config are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.encryption_config) if v.encryption_config != null && length(v.encryption_config) > 0 }
}
output "looker_instances_fips_enabled" {
  description = "Map of fips_enabled values across all looker_instances, keyed the same as var.looker_instances except keys with no fips_enabled are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.fips_enabled if v.fips_enabled != null }
}
output "looker_instances_gemini_enabled" {
  description = "Map of gemini_enabled values across all looker_instances, keyed the same as var.looker_instances except keys with no gemini_enabled are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.gemini_enabled if v.gemini_enabled != null }
}
output "looker_instances_ingress_private_ip" {
  description = "Map of ingress_private_ip values across all looker_instances, keyed the same as var.looker_instances except keys with no ingress_private_ip are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.ingress_private_ip if v.ingress_private_ip != null && length(v.ingress_private_ip) > 0 }
}
output "looker_instances_ingress_public_ip" {
  description = "Map of ingress_public_ip values across all looker_instances, keyed the same as var.looker_instances except keys with no ingress_public_ip are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.ingress_public_ip if v.ingress_public_ip != null && length(v.ingress_public_ip) > 0 }
}
output "looker_instances_looker_uri" {
  description = "Map of looker_uri values across all looker_instances, keyed the same as var.looker_instances except keys with no looker_uri are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.looker_uri if v.looker_uri != null && length(v.looker_uri) > 0 }
}
output "looker_instances_looker_version" {
  description = "Map of looker_version values across all looker_instances, keyed the same as var.looker_instances except keys with no looker_version are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.looker_version if v.looker_version != null && length(v.looker_version) > 0 }
}
output "looker_instances_maintenance_window" {
  description = "Map of maintenance_window values across all looker_instances, keyed the same as var.looker_instances except keys with no maintenance_window are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.maintenance_window) if v.maintenance_window != null && length(v.maintenance_window) > 0 }
}
output "looker_instances_name" {
  description = "Map of name values across all looker_instances, keyed the same as var.looker_instances except keys with no name are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.name if v.name != null && length(v.name) > 0 }
}
output "looker_instances_oauth_config" {
  description = "Map of oauth_config values across all looker_instances, keyed the same as var.looker_instances except keys with no oauth_config are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.oauth_config) if v.oauth_config != null && length(v.oauth_config) > 0 }
}
output "looker_instances_periodic_export_config" {
  description = "Map of periodic_export_config values across all looker_instances, keyed the same as var.looker_instances except keys with no periodic_export_config are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.periodic_export_config) if v.periodic_export_config != null && length(v.periodic_export_config) > 0 }
}
output "looker_instances_platform_edition" {
  description = "Map of platform_edition values across all looker_instances, keyed the same as var.looker_instances except keys with no platform_edition are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.platform_edition if v.platform_edition != null && length(v.platform_edition) > 0 }
}
output "looker_instances_private_ip_enabled" {
  description = "Map of private_ip_enabled values across all looker_instances, keyed the same as var.looker_instances except keys with no private_ip_enabled are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.private_ip_enabled if v.private_ip_enabled != null }
}
output "looker_instances_project" {
  description = "Map of project values across all looker_instances, keyed the same as var.looker_instances except keys with no project are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.project if v.project != null && length(v.project) > 0 }
}
output "looker_instances_psc_config" {
  description = "Map of psc_config values across all looker_instances, keyed the same as var.looker_instances except keys with no psc_config are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.psc_config) if v.psc_config != null && length(v.psc_config) > 0 }
}
output "looker_instances_psc_enabled" {
  description = "Map of psc_enabled values across all looker_instances, keyed the same as var.looker_instances except keys with no psc_enabled are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.psc_enabled if v.psc_enabled != null }
}
output "looker_instances_public_ip_enabled" {
  description = "Map of public_ip_enabled values across all looker_instances, keyed the same as var.looker_instances except keys with no public_ip_enabled are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.public_ip_enabled if v.public_ip_enabled != null }
}
output "looker_instances_region" {
  description = "Map of region values across all looker_instances, keyed the same as var.looker_instances except keys with no region are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.region if v.region != null && length(v.region) > 0 }
}
output "looker_instances_reserved_range" {
  description = "Map of reserved_range values across all looker_instances, keyed the same as var.looker_instances except keys with no reserved_range are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.reserved_range if v.reserved_range != null && length(v.reserved_range) > 0 }
}
output "looker_instances_update_time" {
  description = "Map of update_time values across all looker_instances, keyed the same as var.looker_instances except keys with no update_time are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "looker_instances_user_metadata" {
  description = "Map of user_metadata values across all looker_instances, keyed the same as var.looker_instances except keys with no user_metadata are omitted"
  value       = { for k, v in google_looker_instance.looker_instances : k => one(v.user_metadata) if v.user_metadata != null && length(v.user_metadata) > 0 }
}

