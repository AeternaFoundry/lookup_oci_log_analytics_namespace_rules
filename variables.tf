variable "log_analytics_namespace_rules_lookup" {
  description = <<EOT
Map of log_analytics_namespace_rules_lookup, attributes below
Required:
    - compartment_id
    - namespace
Optional:
    - display_name
    - kind
    - state
    - target_service
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id = string
    namespace      = string
    display_name   = optional(string)
    kind           = optional(string)
    state          = optional(string)
    target_service = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

