# Módulo Criação Network Security Group

Este módulo é utilizado para criação de um Network Security Group (NSG), sua vinculação à uma VCN e a configuração de suas regras de segurança (entrada e saída).


## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_network_security_group)


## Exemplo de utilização
```
module "nsg" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-nsg"
  # O provider OCI deve ser configurado no arquivo main do seu projeto principal.
  # Considere utilizar o módulo `terraform-oci-provider` para gerenciar a configuração do provider de forma centralizada.
  providers = {
    oci = oci
  }
  compartimento_ocid = var.compartimento_ocid
  vcn_ocid           = var.vcn_ocid
  name_display       = var.name_display
  tags_freeform      = var.tags_freeform

  ingress_rules = [
    {
      protocol               = "6" # TCP
      source_type            = "CIDR_BLOCK"
      source                 = "0.0.0.0/0"
      destination_port_range = "22" # SSH
      stateless              = false
    },
    {
      protocol               = "6" # TCP
      source_type            = "CIDR_BLOCK"
      source                 = "10.0.0.0/16" # Example internal network
      destination_port_range = "80-81" # HTTP
      stateless              = false
    }
  ]

  egress_rules = [
    {
      protocol               = "all"
      destination_type       = "CIDR_BLOCK"
      destination            = "0.0.0.0/0"
      stateless              = false
    }
  ]
}
```


## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação do NSG:


### Obrigatório atribuir valor

- **compartimento_ocid**: OCID do compartimento onde será criado o NSG.
- **vcn_ocid**: OCID da VCN que será vinculado o NSG.
- **name_display**: Nome de exibição do NSG.
- **tags_freeform**: Tags de formato livre para identificação dos recursos. As chaves `ambiente`, `cliente` e `projeto` são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```

### Opcional atribuir valor

- **ingress_rules**: Lista de regras de segurança de entrada para o NSG. Cada regra é um objeto com os seguintes atributos:
    - `protocol` (`string`, obrigatório): O protocolo da regra (e.g., "tcp", "udp", "all", "6" para TCP, "17" para UDP).
    - `source_type` (`string`, obrigatório): O tipo de origem (e.g., "CIDR_BLOCK", "NETWORK_SECURITY_GROUP").
    - `source` (`string`, obrigatório): O CIDR de origem ou o OCID de outro NSG.
    - `source_port_range` (`string`, opcional): O(s) porto(s) de origem (e.g., "22", "80-81", "all").
    - `destination_port_range` (`string`, opcional): O(s) porto(s) de destino (e.g., "22", "80-81", "all").
    - `icmp_type` (`number`, opcional): O tipo ICMP (para protocolo "1").
    - `icmp_code` (`number`, opcional): O código ICMP (para protocolo "1").
    - `stateless` (`bool`, opcional, padrão `false`): Indica se a regra é sem estado.

- **egress_rules**: Lista de regras de segurança de saída para o NSG. Cada regra é um objeto com os seguintes atributos:
    - `protocol` (`string`, obrigatório): O protocolo da regra (e.g., "tcp", "udp", "all", "6" para TCP, "17" para UDP).
    - `destination_type` (`string`, obrigatório): O tipo de destino (e.g., "CIDR_BLOCK", "NETWORK_SECURITY_GROUP").
    - `destination` (`string`, obrigatório): O CIDR de destino ou o OCID de outro NSG.
    - `source_port_range` (`string`, opcional): O(s) porto(s) de origem (e.g., "22", "80-81", "all").
    - `destination_port_range` (`string`, opcional): O(s) porto(s) de destino (e.g., "22", "80-81", "all").
    - `icmp_type` (`number`, opcional): O tipo ICMP (para protocolo "1").
    - `icmp_code` (`number`, opcional): O código ICMP (para protocolo "1").
    - `stateless` (`bool`, opcional, padrão `false`): Indica se a regra é sem estado.


## Outputs

Os seguintes outputs podem ser utilizados.

- **nsg_id**: OCID do NSG criado.
- **nsg_name**: Nome de exibição do NSG criado.
