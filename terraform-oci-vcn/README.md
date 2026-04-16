# Módulo Criação VCN OCI

Este módulo cria uma VCN na OCI com os seguintes recursos:
- VCN
- Sub-rede pública
- Sub-rede privada
- Internet Gateway
- NAT Gateway
- Service Gateway
- Tabela de rotas padrão e tabela de rotas privada

## Documentação

- [core_vcn](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_vcn)
- [core_subnet](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet)
- [core_internet_gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_internet_gateway)
- [core_nat_gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_nat_gateway)
- [core_service_gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_service_gateway)
- [core_route_table](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_route_table)

## Exemplo de utilização
```
module "vcn" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-vcn"
  providers = {
    oci = oci
  }

  compartimento_ocid                          = var.compartimento_ocid
  cidr_blocks_vcn                             = var.cidr_blocks_vcn
  cidr_blocks_public_subnet                   = var.cidr_blocks_public_subnet
  cidr_blocks_private_subnet                  = var.cidr_blocks_private_subnet
  vcn_display_name                            = var.vcn_display_name
  vcn_dns_label                               = var.vcn_dns_label
  vcn_public_subnet_display_name              = var.vcn_public_subnet_display_name
  vcn_private_subnet_display_name             = var.vcn_private_subnet_display_name
  route_table_for_private_subnet_display_name = var.route_table_for_private_subnet_display_name
  default_route_table_vcn_display_name        = var.default_route_table_vcn_display_name
  internet_gateway_display_name               = var.internet_gateway_display_name
  nat_gateway_display_name                    = var.nat_gateway_display_name
  service_gateway_display_name                = var.service_gateway_display_name
  service_gateway_service_id                  = var.service_gateway_service_id
  enabled                                     = var.enabled
  tags_freeform                               = var.tags_freeform
}
```

## Variáveis

- **compartimento_ocid**: OCID do compartimento onde será criada a VCN.
- **cidr_blocks_vcn**: Lista de CIDRs para a VCN. Padrão: `["172.16.0.0/16"]`.
- **cidr_blocks_public_subnet**: CIDR para a subrede pública. Padrão: `172.16.0.0/24`.
- **cidr_blocks_private_subnet**: CIDR para a subrede privada. Padrão: `172.16.1.0/24`.
- **vcn_display_name**: Nome de exibição da VCN.
- **vcn_dns_label**: Rótulo DNS da VCN. Deve ser alfanumérico e sem espaços.
- **vcn_public_subnet_display_name**: Nome de exibição da subrede pública.
- **vcn_private_subnet_display_name**: Nome de exibição da subrede privada.
- **route_table_for_private_subnet_display_name**: Nome de exibição da tabela de rotas privada.
- **default_route_table_vcn_display_name**: Nome de exibição da tabela de rotas padrão.
- **internet_gateway_display_name**: Nome de exibição do Internet Gateway.
- **nat_gateway_display_name**: Nome de exibição do NAT Gateway.
- **service_gateway_display_name**: Nome de exibição do Service Gateway.
- **service_gateway_service_id**: OCID do serviço para o Service Gateway.
- **enabled**: Define se o Internet Gateway será criado habilitado. Padrão: `true`.
- **tags_freeform**: Tags de formato livre. Exemplo:
```
  tags_freeform = {
    "ambiente" = "desenvolvimento"
    "cliente"  = "Client-Name"
    "projeto"  = "Project-Name"
  }
```

## Outputs

- **vcn_id**: OCID da VCN criada.
- **public_subnet_id**: OCID da subrede pública criada.
- **private_subnet_id**: OCID da subrede privada criada.
