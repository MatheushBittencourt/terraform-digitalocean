terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"  # Escolha uma versão apropriada
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}
