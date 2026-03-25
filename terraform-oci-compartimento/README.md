# Módulo Criação Compartimento OCI

Este módulo é utilizado para criação de um Compartimento na OCI.


## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment)


## Exemplo de utilização
```
module "compartimento" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-compartimento"
  # O provider OCI deve ser configurado no arquivo main do seu projeto principal.
  # Considere utilizar o módulo `terraform-oci-provider` para gerenciar a configuração do provider de forma centralizada.
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
- **tags_freeform**: Tags de formato livre para identificação dos recursos. As chaves `ambiente`, `cliente` e `projeto` são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```

### Não é obrigatório atribuir valor

- **enable_delete**: Controla se o compartimento pode ser excluído. Se `true`, o compartimento pode ser excluído quando vazio. Se `false` (padrão), o compartimento não pode ser excluído.


## Outputs

- **ocid_compartimento**: OCID do compartimento criado.
