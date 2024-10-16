resource "digitalocean_droplet" "default" {
  image    = var.do_image
  name     = var.droplet_name
  region   = var.region
  size     = var.size
  ssh_keys = [data.digitalocean_ssh_key.example.id]
  tags     = var.tags
}

# Define a conexão SSH para o provisionamento
connection {
  host        = digitalocean_droplet.default.ipv4_address
  user        = "root"
  type        = "ssh"
  private_key = file("~/.ssh/id_ed25519")
  timeout     = "2m"
}

# Provisionamento remoto usando o script install.sh (apenas python)
provisioner "remote-exec" {
  script = "${path.module}/install.sh"
}

# Regras de firewall associadas ao droplet
resource "digitalocean_firewall" "firewall_modelo" {
  name = "firewall-modelo"
  droplet_ids = [digitalocean_droplet.default.id]

  dynamic "inbound_rule" {
    for_each = var.inbound_rules
    content {
      protocol         = inbound_rule.value.protocol
      port_range       = inbound_rule.value.port_range
      source_addresses = inbound_rule.value.source_addresses
    }
  }

  dynamic "outbound_rule" {
    for_each = var.outbound_rules
    content {
      protocol              = outbound_rule.value.protocol
      port_range            = outbound_rule.value.port_range
      destination_addresses = outbound_rule.value.destination_addresses
    }
  }
}
