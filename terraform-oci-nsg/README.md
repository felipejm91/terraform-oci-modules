# Módulo Criação Network Security Group

Este módulo cria um Network Security Group (NSG) na OCI e permite adicionar regras de entrada e saída.

## Documentação

[Clique aqui para ver a documentação do recurso core_network_security_group](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_network_security_group)

## Exemplo de utilização
```
module "nsg" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-nsg"
  providers = {
    oci = oci
  }

  compartimento_ocid = var.compartimento_ocid
  vcn_ocid           = var.vcn_ocid
  name_display       = var.name_display
  tags_freeform      = var.tags_freeform

  ingress_rules = [
    {
      protocol               = "6"
      source_type            = "CIDR_BLOCK"
      source                 = "0.0.0.0/0"
      destination_port_range = "22"
      stateless              = false
    }
  ]

  egress_rules = [
    {
      protocol         = "all"
      destination_type = "CIDR_BLOCK"
      destination      = "0.0.0.0/0"
      stateless        = false
    }
  ]
}
```

## Variáveis

- **compartimento_ocid**: OCID do compartimento onde será criado o NSG.
- **vcn_ocid**: OCID da VCN que receberá o NSG.
- **name_display**: Nome de exibição do NSG.
- **tags_freeform**: Tags de formato livre. Exemplo:
```
  tags_freeform = {
    "ambiente" = "desenvolvimento"
    "cliente"  = "Client-Name"
    "projeto"  = "Project-Name"
  }
```
- **ingress_rules**: Lista de regras de entrada. Cada objeto deve conter:
  - `protocol`: protocolo (`6` para TCP, `17` para UDP, `1` para ICMP, `all`).
  - `source_type`: `CIDR_BLOCK` ou `NETWORK_SECURITY_GROUP`.
  - `source`: CIDR ou OCID do NSG de origem. Evite `0.0.0.0/0` em regras de entrada de produção sempre que possível.
  - `source_port_range`: faixa de porta de origem (opcional).
  - `destination_port_range`: faixa de porta de destino (opcional).
  - `icmp_type`: tipo ICMP (para ICMP).
  - `icmp_code`: código ICMP (para ICMP).
  - `stateless`: `true` ou `false`.
- **egress_rules**: Lista de regras de saída. Cada objeto deve conter:
  - `protocol`: protocolo (`6`, `17`, `1`, `all`).
  - `destination_type`: `CIDR_BLOCK` ou `NETWORK_SECURITY_GROUP`.
  - `destination`: CIDR ou OCID do NSG de destino.
  - `source_port_range`: faixa de porta de origem (opcional).
  - `destination_port_range`: faixa de porta de destino (opcional).
  - `icmp_type`: tipo ICMP (para ICMP).
  - `icmp_code`: código ICMP (para ICMP).
  - `stateless`: `true` ou `false`.

## Outputs

- **nsg_id**: OCID do NSG criado.
- **nsg_name**: Nome de exibição do NSG criado.
