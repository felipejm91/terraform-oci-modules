# Módulo Criação IP Público OCI

Este módulo é utilizado para criação de um IP público na OCI.


## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_public_ip)


## Exemplo de utilização
```
module "publicip" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-publicip"
  # O provider OCI deve ser configurado no arquivo main do seu projeto principal.
  # Considere utilizar o módulo `terraform-oci-provider` para gerenciar a configuração do provider de forma centralizada.
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

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação de um IP público:


### Obrigatório atribuir valor

- **compartimento_ocid**: OCID do compartimento onde será criado o IP público.
- **public_ip_lifetime**: Tipo de IP público que será criado. Pode utilizar os valores `RESERVED`, que reserva um IP, ou `EPHEMERAL`, que cria um IP que muda com o tempo.
- **public_ip_display_name**: Nome de exibição do IP público.
- **private_ip_ocid**: OCID do IP privado que será atribuído o IP público. Obrigatório para IP público efemero e opcional para IP público reservado.
- **tags_freeform**: Tags de formato livre para identificação dos recursos. As chaves `ambiente`, `cliente` e `projeto` são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```


## Outputs

- **ip_address**: IP público criado.
