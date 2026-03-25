# Módulo Criação VCN OCI

Este módulo é utilizado para criação de uma VCN na OCI.


## Documentação

[Internet Gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_internet_gateway)

[NAT Gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_nat_gateway)

[Service Gateway](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_service_gateway)

[Route Table](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_route_table)

[VCN](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_vcn)

[Subnet](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet)


## Exemplo de utilização
```
module "vcn" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-vcn"
  # O provider OCI deve ser configurado no arquivo main do seu projeto principal.
  # Considere utilizar o módulo `terraform-oci-provider` para gerenciar a configuração do provider de forma centralizada.
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

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação da VCN:


### Obrigatório atribuir valor

- **compartimento_ocid**: OCID do compartimento onde será criada a VCN.
- **vcn_display_name**: Nome de exibição da VCN.
- **vcn_dns_label**: Nome de DNS da VCN. Não pode conter caracteres especiais. Ex: `dnsteste`
- **vcn_public_subnet_display_name**: Nome de exibição da subrede pública. Recomendado seguir padrão `public-subnet-vcn-NOMEVCN`.
- **vcn_private_subnet_display_name**: Nome de exibição da subrede privada. Recomendado seguir padrão `private-subnet-vcn-NOMEVCN`.
- **route_table_for_private_subnet_display_name**: Nome de exibição da tabela de roteamento da subrede privada. Recomendado seguir padrão `private-subnet-route-table-vcn-NOMEVCN`.
- **default_route_table_vcn_display_name**: Nome de exibição da tabela de roteamento _default_. Recomendado seguir padrão `default-route-table-vcn-NOMEVCN`.
- **internet_gateway_display_name**: Nome de exibição do gateway de internet. Recomendado seguir padrão `internet-gateway-vcn-NOMEVCN`.
- **nat_gateway_display_name**: Nome de exibição do gateway NAT. Recomendado seguir padrão `nat-gateway-vcn-NOMEVCN`.
- **service_gateway_display_name**: Nome de exibição do gateway de serviços. Recomendado seguir padrão `service-gateway-vcn-NOMEVCN`.
- **service_gateway_service_id**: OCID do serviço para o Service Gateway (por exemplo, `all-gru-services-in-oracle-services-network`).
- **tags_freeform**: Tags de formato livre para identificação dos recursos. As chaves `ambiente`, `cliente` e `projeto` são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```

### Opcional atribuir valor

- **cidr_blocks_vcn**: Bloco CIDR de IP que será utilizado pela VCN. Caso não seja atribuído valor, será utilizado o bloco `172.16.0.0/16`.
- **cidr_blocks_public_subnet**: Bloco CIDR de IP que será utilizado pela subrede pública da VCN. Caso não seja atribuído valor, será utilizado o bloco `172.16.0.0/24`.
- **cidr_blocks_private_subnet**: Bloco CIDR de IP que será utilizado pela subrede privada da VCN. Caso não seja atribuído valor, será utilizado o bloco `172.16.1.0/24`.
- **enabled**: Habilita o Gateway assim que criado.


## Outputs

Os seguintes outputs podem ser utilizados:

- **vcn_id**: OCID da VCN criada.
- **public_subnet_id**: OCID da subnet pública.
- **private_subnet_id**: OCID da subnet privada.
