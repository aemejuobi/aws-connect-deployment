terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.33.0"
    }
  }
}

resource "aws_connect_instance" "practice_instance" {
  identity_management_type = "CONNECT_MANAGED"
  inbound_calls_enabled    = true
  instance_alias           = "chocolate-connect"
  outbound_calls_enabled   = true
  contact_lens_enabled = true
  contact_flow_logs_enabled = true
}