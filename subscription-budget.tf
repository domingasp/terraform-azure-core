data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "global_budget" {
  name            = "global_subscription_budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.global_budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = "2024-09-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = 60.0
    operator  = "EqualTo"

    contact_emails = [
      "hello@domingasp.com"
    ]
  }
}
