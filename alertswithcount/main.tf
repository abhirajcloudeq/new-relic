resource "newrelic_alert_policy" "my_policy" {
  name = "count_loop"
}

resource "newrelic_nrql_alert_condition" "my_alert_cond" {
  count = length(var.condition_count)

  policy_id                      = newrelic_alert_policy.my_policy.id
  account_id                     = var.condition_count[count.index].account_id
  type                           = var.condition_count[count.index].type
  name                           = var.condition_count[count.index].name
  description                    = var.condition_count[count.index].description
  runbook_url                    = var.condition_count[count.index].runbook_url
  enabled                        = var.condition_count[count.index].enabled
  violation_time_limit_seconds   = var.condition_count[count.index].violation_time_limit_seconds
  fill_option                    = var.condition_count[count.index].fill_option
  fill_value                     = var.condition_count[count.index].fill_value
  aggregation_window             = var.condition_count[count.index].aggregation_window
  aggregation_method             = var.condition_count[count.index].aggregation_method
  aggregation_delay              = var.condition_count[count.index].aggregation_delay
  expiration_duration            = var.condition_count[count.index].expiration_duration
  open_violation_on_expiration   = var.condition_count[count.index].open_violation_on_expiration
  close_violations_on_expiration = var.condition_count[count.index].close_violations_on_expiration
  slide_by                       = var.condition_count[count.index].slide_by


  nrql {
    query = var.condition_count[count.index].nrql
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
  }
