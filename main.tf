terraform {
  required_version = ">= 1.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  image    = var.do_image
  name     = var.droplet_name
  region   = var.region
  size     = var.size
  ssh_keys = [data.digitalocean_ssh_key.example.id]
  tags     = var.tags
}

data "digitalocean_ssh_key" "example" {
  name = "example"
}

# Regras de firewall associadas ao droplet
resource "digitalocean_firewall" "firewall_aula" {
  name = "firewall-aula"

  # Associa o firewall ao droplet criado
  droplet_ids = [digitalocean_droplet.web.id]

  # Regras de entrada
  dynamic "inbound_rule" {
    for_each = var.inbound_rules
    content {
      protocol         = inbound_rule.value.protocol
      port_range       = inbound_rule.value.port_range
      source_addresses = inbound_rule.value.source_addresses
    }
  }

  # Regras de saída
  dynamic "outbound_rule" {
    for_each = var.outbound_rules
    content {
      protocol              = outbound_rule.value.protocol
      port_range            = outbound_rule.value.port_range
      destination_addresses = outbound_rule.value.destination_addresses
    }
  }
}