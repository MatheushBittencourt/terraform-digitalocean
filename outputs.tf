# Exibe o endereço IP público do droplet criado
output "droplet_ip" {
  description = "Endereço IP público do droplet"
  value       = digitalocean_droplet.default.ipv4_address
}

# Exibe o ID do droplet
output "droplet_id" {
  description = "ID do droplet no DigitalOcean"
  value       = digitalocean_droplet.default.id
}

# Exibe o nome do droplet
output "droplet_name" {
  description = "Nome do droplet"
  value       = digitalocean_droplet.default.name
}

# Exibe a região onde o droplet foi provisionado
output "droplet_region" {
  description = "Região do droplet"
  value       = digitalocean_droplet.default.region
}

# Exibe o tamanho (tipo de instância) do droplet
output "droplet_size" {
  description = "Tamanho do droplet"
  value       = digitalocean_droplet.default.size
}

# Exibe o sistema operacional utilizado na criação do droplet
output "droplet_image" {
  description = "Imagem do sistema operacional do droplet"
  value       = digitalocean_droplet.default.image
}