# Módulo Criação Compartimento OCI

Este módulo é utilizado para criação de um Compartimento na OCI, seguindo o modelo de criação da Eficaz Marketing.




## Exemplo de utilização
```
module "vcn" {
  source = "github.com/eficazconsultoria/terraform-oci-compartimento.git"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
  providers = {
    oci = oci
  }
  parent_compartment_id   = var.parent_compartment_id
  compartment_description = var.compartment_description
  compartment_name        = var.compartment_name
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
        "cliente"  = "Eficaz"
        "projeto"  = "Eficaz"
    }
```



## Outputs

- **ocid_compartimento**: Exibe o OCID do compartimento criado.