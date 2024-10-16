variable "do_token" {
  description = "Token de API do DigitalOcean."
  type        = string
}

variable "droplet_name" {
  description = "Nome do droplet."
  type        = string
  default     = "web-1"
}

variable "region" {
  description = "Região onde o droplet será criado. Exemplos: nyc3, sfo3."
  type        = string
  default     = "nyc3"
}

variable "size" {
  description = "Tamanho da máquina. Exemplos: s-1vcpu-1gb, s-1vcpu-2gb."
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "do_image" {
  description = "Imagem do sistema operacional. Exemplos: ubuntu-22-04-x64."
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "tags" {
  description = "Tags associadas ao droplet."
  type        = list(string)
  default     = ["web"]
}

variable "inbound_rules" {
  description = "Lista de regras de entrada do firewall"
  type = list(object({
    protocol         = string
    port_range       = string
    source_addresses = list(string)
  }))
  default = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "53"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]
}

variable "outbound_rules" {
  description = "Lista de regras de saída do firewall"
  type = list(object({
    protocol              = string
    port_range            = string
    destination_addresses = list(string)
  }))
  default = [
    {
      protocol              = "tcp"
      port_range            = "22"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "tcp"
      port_range            = "53"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "tcp"
      port_range            = "80"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "tcp"
      port_range            = "443"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]
}

