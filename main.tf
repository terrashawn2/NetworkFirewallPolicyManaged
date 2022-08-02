resource "aws_networkfirewall_firewall_policy" "managed_rules_policy" {

  name = var.fw_name
  tags = {
    "Environment" = var.fw_env
  }


  firewall_policy {
    stateful_default_actions = []
    stateless_default_actions = [
      "aws:forward_to_sfe",
    ]
    stateless_fragment_default_actions = [
      "aws:forward_to_sfe",
    ]

    stateful_engine_options {
      rule_order = "DEFAULT_ACTION_ORDER"
    }

    stateful_rule_group_reference {
      priority     = 1
      resource_arn = "arn:aws:network-firewall:us-east-1:aws-managed:stateful-rulegroup/AbusedLegitMalwareDomainsActionOrder"
    }
    stateful_rule_group_reference {
      priority     = 2
      resource_arn = "arn:aws:network-firewall:us-east-1:aws-managed:stateful-rulegroup/MalwareDomainsActionOrder"
    }
  }
}
