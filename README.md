# Terraform DigitalOcean Template 🌐

Este repositório contém um modelo de configuração **Terraform** para provisionar recursos no **DigitalOcean**. Com este template, você pode rapidamente criar e gerenciar droplets e outros recursos na DigitalOcean de maneira eficiente.

## 📝 Sumário

- [Pré-requisitos](#pré-requisitos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Passos para Uso](#passos-para-uso)
- [Configuração do DigitalOcean](#configuração-do-digitalocean)
- [Comandos Terraform](#comandos-terraform)
- [Outputs](#outputs)
- [Contribuições](#contribuições)

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de que você tem os seguintes itens instalados:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0 ou superior)
- Um [Token de API do DigitalOcean](https://cloud.digitalocean.com/account/api/tokens).

## 📁 Estrutura do Projeto

A estrutura do projeto é organizada da seguinte maneira:

```
terraform-digitalocean-template/
│
├── main.tf              # Definição dos recursos Terraform
├── variables.tf         # Definição de todas as variáveis utilizadas
├── terraform.tfvars     # Definição de valores padrão para as variáveis
├── outputs.tf           # Definição do outputs do projeto (ex: endereço IP)
└── README.md            # Documentação do projeto
```

## 🚀 Passos para Uso

Siga os passos abaixo para configurar e provisionar recursos no DigitalOcean.

### 1. Clone este repositório

Primeiro, clone o repositório para sua máquina local:

```bash
git clone https://github.com/seu-usuario/terraform-digitalocean-template.git
cd terraform-digitalocean-template
```

### 2. Defina as variáveis no arquivo `terraform.tfvars`

No arquivo `terraform.tfvars`, você precisará configurar seu token de API e personalizar outras variáveis como o nome, a região e o tamanho do droplet.

#### Exemplo de configuração para **DigitalOcean**:

```hcl
do_token     = "seu_token_digitalocean"
droplet_name = "meu-droplet"
region       = "nyc3"
size         = "s-1vcpu-2gb"
do_image     = "ubuntu-22-04-x64"
tags         = ["meu-droplet", "producao"]
```

### 3. Inicialize o Terraform

Com as variáveis configuradas, inicialize o Terraform para preparar o diretório de trabalho e baixar os plugins necessários:

```bash
terraform init
```

### 4. Faça o *plan* da infraestrutura

Gere e visualize o plano de execução para verificar os recursos que serão criados:

```bash
terraform plan
```

### 5. Aplique o plano

Se o plano estiver correto, aplique-o para provisionar os recursos:

```bash
terraform apply
```

## 🔧 Configuração do DigitalOcean

Este template suporta o seguinte recurso no DigitalOcean:

- **Droplet**: Cria um Droplet baseado em um sistema operacional especificado.

### Variáveis Importantes:

- **do_token**: O token de API do DigitalOcean para autenticação.
- **droplet_name**: O nome do droplet que será criado.
- **region**: A região onde o droplet será provisionado (ex: `nyc3`, `sfo3`).
- **size**: O tipo de instância (ex: `s-1vcpu-1gb`, `s-2vcpu-4gb`).
- **do_image**: A imagem do sistema operacional que será usada (ex: `ubuntu-22-04-x64`).
- **tags**: Tags para organizar os recursos (opcional).

## 🛠️ Comandos Terraform

Aqui estão alguns comandos úteis do Terraform para gerenciar a sua infraestrutura:

- **Inicializar o Terraform**: `terraform init`
- **Gerar um plano de execução**: `terraform plan`
- **Aplicar o plano e provisionar recursos**: `terraform apply`
- **Destruir a infraestrutura criada**: `terraform destroy`

---

## 📤 Outputs

Após a execução bem-sucedida, o Terraform fornecerá várias informações úteis sobre o droplet criado. Essas informações são configuradas no arquivo `outputs.tf` e incluem:

- **droplet_ip**: O endereço IP público do droplet.
- **droplet_id**: O ID único do droplet no DigitalOcean.
- **droplet_name**: O nome atribuído ao droplet.
- **droplet_region**: A região onde o droplet foi provisionado.
- **droplet_size**: O tamanho (tipo de instância) do droplet.
- **droplet_image**: A imagem do sistema operacional utilizada no droplet.

Exemplo de saída:

```bash
Outputs:

droplet_ip     = "192.168.1.100"
droplet_id     = "123456789"
droplet_name   = "web-1"
droplet_region = "nyc2"
droplet_size   = "s-1vcpu-2gb"
droplet_image  = "ubuntu-22-04-x64"
```

---

## 🤝 Contribuições

Sinta-se à vontade para abrir **issues** ou enviar **pull requests** se quiser contribuir para o projeto. Qualquer tipo de feedback ou sugestão é bem-vindo! 😊

## 📜 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**Happy Terraforming!** 🚀