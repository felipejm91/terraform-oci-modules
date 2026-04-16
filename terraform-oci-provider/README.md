# Terraform OCI Provider Modelo

Este módulo fornece uma configuração de provider OCI reutilizável para ser utilizada em um projeto Terraform.

## Quando usar
- Centralizar a configuração do provider em um root module.
- Reutilizar as mesmas credenciais e região em múltiplos módulos.
- Evitar duplicação de configuração de provider em cada módulo de recurso.

## Documentação

[Clique aqui para ver a documentação do provider OCI](https://registry.terraform.io/providers/oracle/oci/latest/docs)

## Exemplo de utilização
```
module "oci_provider" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-provider"

  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}
```

## Variáveis

- **tenancy_ocid**: OCID da tenancy da OCI.
- **user_ocid**: OCID do usuário.
- **fingerprint**: Fingerprint da chave API.
- **private_key_path**: Caminho para a chave privada API.
- **region**: Região OCI usada pelo provider.

> Observação: este módulo configura o provider, mas o ideal é que o provider seja definido no root module do seu projeto Terraform.
