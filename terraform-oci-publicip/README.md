# Módulo Criação IP Público OCI

Este módulo cria um IP público reservado ou efêmero na OCI.

## Documentação

[Clique aqui para ver a documentação do recurso core_public_ip](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_public_ip)

## Exemplo de utilização
```
module "publicip" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-publicip"
  providers = {
    oci = oci
  }

  compartimento_ocid     = var.compartimento_ocid
  public_ip_lifetime     = var.public_ip_lifetime
  private_ip_ocid        = var.private_ip_ocid
  public_ip_display_name = var.public_ip_display_name
  tags_freeform          = var.tags_freeform
}
```

## Variáveis

- **compartimento_ocid**: OCID do compartimento onde será criado o IP público.
- **public_ip_lifetime**: Tipo de IP público. Use `RESERVED` para IP público reservado ou `EPHEMERAL` para IP efêmero.
- **public_ip_display_name**: Nome de exibição do IP público.
- **private_ip_ocid**: OCID do IP privado que será atribuído ao IP público. Obrigatório para `EPHEMERAL`; opcional para `RESERVED`.
- **tags_freeform**: Tags para identificação do recurso. Exemplo:
```
  tags_freeform = {
    "ambiente" = "desenvolvimento"
    "cliente"  = "Client-Name"
    "projeto"  = "Project-Name"
  }
```

## Outputs

- **ip_address**: IP público criado.
- **public_ip_id**: OCID do IP público reservado criado.

## Uso com módulo de instância

Se você deseja atribuir um IP público reservado à instância, crie o IP público com `public_ip_lifetime = "RESERVED"` e passe o output `public_ip_id` para a variável `reserved_public_ip_ocid` do módulo `terraform-oci-instance`.

Exemplo:
```
reserved_public_ip_ocid = module.publicip.public_ip_id
```
