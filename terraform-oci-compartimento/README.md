# Módulo Criação Compartimento OCI

Este módulo cria um compartimento na OCI e permite configurar se ele pode ser excluído.

## Documentação

[Clique aqui para ver a documentação do recurso identity_compartment](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_compartment)

## Exemplo de utilização
```
module "compartimento" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-compartimento"
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

- **parent_compartment_id**: OCID do compartimento pai.
- **compartment_description**: Descrição do compartimento.
- **compartment_name**: Nome do compartimento.
- **enable_delete**: Se `true`, o compartimento poderá ser excluído quando estiver vazio. Padrão: `false`.
- **tags_freeform**: Tags de formato livre. Exemplo:
```
  tags_freeform = {
    "ambiente" = "desenvolvimento"
    "cliente"  = "Client-Name"
    "projeto"  = "Project-Name"
  }
```

## Outputs

- **ocid_compartimento**: OCID do compartimento criado.
