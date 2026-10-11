data "oci_log_analytics_namespace_rules" "log_analytics_namespace_rules_lookup" {
  for_each = var.log_analytics_namespace_rules_lookup

  compartment_id = each.value.compartment_id
  namespace      = each.value.namespace
  display_name   = each.value.display_name
  kind           = each.value.kind
  state          = each.value.state
  target_service = each.value.target_service

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

