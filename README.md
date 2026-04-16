# terraform-oci-modules
Coleção de módulos Terraform para Oracle Cloud Infrastructure (OCI).

## Módulos incluídos
- `terraform-oci-provider` — configuração do provider OCI.
- `terraform-oci-compartimento` — criação de compartimentos.
- `terraform-oci-vcn` — criação de VCN, sub-redes e gateways (Internet, NAT, Service Gateway).
- `terraform-oci-nsg` — criação de Network Security Group e regras de segurança.
- `terraform-oci-publicip` — criação de IP público reservado ou efêmero.
- `terraform-oci-instance` — criação de instância Compute com VNIC e boot volume.
- `terraform-oci-volume` — criação de volume e anexação a instâncias.

## Como usar
Cada módulo deve ser consumido a partir do root module do seu projeto Terraform. Configure o provider OCI no root ou utilize o módulo `terraform-oci-provider` como auxílio de centralização.

> Recomenda-se manter a configuração do provider em um único local para facilitar reutilização e evitar conflito de provedores.

## Contribuição
Sinta-se livre para abrir melhorias e adicionar exemplos de uso mais avançados, incluindo tags definidas e integração com Identity and Access Management (IAM).
