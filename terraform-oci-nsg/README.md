# Módulo Criação Network Security Group

Este módulo é utilizado para criação de um Network Security Group (NSG) e sua vinculação à uma VCN.


## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_network_security_group)


## Exemplo de utilização
```
module "nsg" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-nsg"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
  providers = {
    oci = oci
  }
  compartimento_ocid = var.compartimento_ocid
  vcn_ocid           = var.vcn_ocid
  name_display       = var.name_display
  tags_freeform      = var.tags_freeform
}
```



## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação do NSG:


### Obrigatório atribuir valor



- **compartimento_ocid**: OCID do compartimento onde será criada o NSG.


- **vcn_ocid**: OCID da VCN que será vinculado o NSG.


- **name_display**: Nome de exibição do NSG.


- **tags_freeform**: Tags que serão atribuídas ao NSG. Deve conter "ambiente", "cliente" e "projeto". Caso deseje, pode-se atribuir novas tags. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```
 

## Outputs

Os seguintes outputs podem ser utilizados.

- **nsg_id**: OCID do NSG criado.

- **nsg_na**: Nome de exibição do NSG criado.
