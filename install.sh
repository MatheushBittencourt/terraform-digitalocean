#!/bin/bash
set -e

# Atualiza o sistema
sudo apt-get update

# Instala Python e pip (requisitos para Ansible)
sudo apt-get install -y python3 python3-pip

# Instala pacotes de rede
sudo apt-get install -y net-tools curl wget

# Instala pacotes de utilitários
sudo apt-get install -y software-properties-common unzip git

# Instala ferramentas de monitoramento e firewall
sudo apt-get install -y htop ufw

# Instala compiladores e ferramentas de desenvolvimento
sudo apt-get install -y build-essential

# Exibe uma mensagem de sucesso
echo "Provisionamento básico completo!"
