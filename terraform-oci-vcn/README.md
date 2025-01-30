# Módulo Criação VCN OCI

Este módulo é utilizado para criação de uma VCN na OCI, seguindo o modelo de criação da Eficaz Marketing.



## Exemplo de utilização
```
module "vcn" {
  source = "github.com/felipejm91/terraform-oci-modules/terraform-oci-vcn.git"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
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
  tags_freeform                               = var.tags_freeform
}
```



## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação da VCN:


### Obrigatório atribuir valor



- **compartimento_ocid**: OCID do compartimento onde será criada a VCN.


- **vcn_display_name**: Nome de exibição da VCN.


- **vcn_dns_label**: Nome de DNS da VCN. Não pode conter caractéres especiais. Ex: ***dnsteste***


- **vcn_public_subnet_display_name**: Nome de exibição da subrede pública. Recomendado seguir padrão ***public-subnet-vcn-NOMEVCN***.


- **vcn_private_subnet_display_name**: Nome de exibição da subrede privada.Recomendado seguir padrão ***private-subnet-vcn-NOMEVCN***.


- **route_table_for_private_subnet_display_name**: Nome de exibição da tabela de roteamento da subrede privada. Recomendado seguir padrão ***private-subnet-route-table-vcn-NOMEVCN***.


- **default_route_table_vcn_display_name**: Nome de exibição da tabela de roteamento _default_. Recomendado seguir padrão ***deafult-route-table-vcn-NOMEVCN***.


- **internet_gateway_display_name**: Nome de exibição do gateway de internet. Recomendado seguir padrão ***internet-gateway-vcn-NOMEVCN***.


- **nat_gateway_display_name**: Nome de exibição do gateway NAT. Recomendado seguir padrão ***nat-gateway-vcn-NOMEVCN***.


- **service_gateway_display_name**: Nome de exibição do gateway de serviços. Recomendado seguir padrão ***service-gateway-vcn-NOMEVCN***.


- **tags_freeform**: Tags que serão atribuídas à VCN. Deve conter "ambiente", "cliente" e "projeto". Caso deseje, pode-se atribuir novas tags. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Eficaz"
        "projeto"  = "Eficaz"
    }
```
 

### Opcional atribuir valor



- **cidr_blocks_vcn**: Bloco CIDR de IP que será utilizado pela VCN. Caso não seja atribuído valor, será utilizado o bloco ***172.16.0.0/16***.


- **cidr_blocks_public_subnet**: Bloco CIDR de IP que será utilizado pela subrede pública da VCN. Caso não seja atribuído valor, será utilizado o bloco ***172.16.0.0/24***.


- **cidr_blocks_private_subnet**: Bloco CIDR de IP que será utilizado pela subrede privada da VCN. Caso não seja atribuído valor, será utilizado o bloco ***172.16.1.0/24***.



## Outputs

Os seguintes outputs podem ser utilizados:

- **vcn_id**: OCID da VCN criada.


- **public_subnet_id**: OCID da subnet pública.


- **private_subnet_id**: OCID da subnet privada.
