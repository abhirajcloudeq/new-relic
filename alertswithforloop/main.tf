resource "newrelic_alert_policy" "my_policy" {
  name = "my_policy"
}

resource "newrelic_nrql_alert_condition" "foo" {
  for_each = var.condition

  account_id                     = each.value.account_id
  policy_id                      = newrelic_alert_policy.my_policy.id
  type                           = each.value.type
  name                           = each.value.name
  description                    = each.value.description
  runbook_url                    = each.value.runbook_url
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by


  nrql {
    query = each.value.nrql
  }

  critical {
    operator              = each.value.critical.operator
    threshold             = each.value.critical.threshold
    threshold_duration    = each.value.critical.threshold_duration
    threshold_occurrences = each.value.critical.threshold_occurrences
  }

  warning {
    operator              = each.value.warning.operator
    threshold             = each.value.warning.threshold
    threshold_duration    = each.value.warning.threshold_duration
    threshold_occurrences = each.value.warning.threshold_occurrences
  }
}