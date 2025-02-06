# Módulo Criação Compartimento OCI

Este módulo é utilizado para criação de um Compartimento na OCI.


## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment)


## Exemplo de utilização
```
module "vcn" {
  source = "github.com/felipejm91/terraform-oci-modules/terraform-oci-compartimento.git"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
  providers = {
    oci = oci
  }
  parent_compartment_id   = var.parent_compartment_id
  compartment_description = var.compartment_description
  compartment_name        = var.compartment_name
  enable_delete           = var.enable_delete
  tags_freeform           = var.tags_freeform
}
```



## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação do Compartimento:


### Obrigatório atribuir valor

- **parent_compartment_id**: OCID do compartimento pai, onde será criado o compartimento.
- **compartment_description**: Descrição do compartimento que está sendo criado.
- **compartment_name**: Nome do compartimento que está sendo criado.
- **tags_freeform**: Tags que serão atribuídas à VCN. Deve conter "ambiente", "cliente" e "projeto". Caso deseje, pode-se atribuir novas tags. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```

### Não é obrigatório atribuir valor

- **enable_delete**: Se atribuido como "false", permite a crição de compartimentos com nomes repetidos. Se definido como "true", será apresentado um erro de colisão de nomes com outro compartimento e  tentará eliminar o compartimento quando da destruição ou remoção da declaração de recursos.


## Outputs

- **ocid_compartimento**: Exibe o OCID do compartimento criado.
