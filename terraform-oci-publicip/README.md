# Módulo Criação VCN OCI

Este módulo é utilizado para criação de uma VCN na OCI.



## Exemplo de utilização
```
module "vcn" {
  source = "github.com/felipejm91/terraform-oci-modules/terraform-oci-publicip.git"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
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

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação da VCN:


### Obrigatório atribuir valor

- **compartimento_ocid**: OCID do compartimento onde será criado o IP público.
- **public_ip_lifetime**: Tipo de IP público que será criado. Pode utilizar os valores ***RESERVED***, que reserva um IP, ou ***EPHEMERAL***, que cria um IP que muda com o tempo.
- **public_ip_display_name**: Nome de exibição do IP público.
- **private_ip_ocid**: OCID do IP privado à quem será atribuído o IP público que esta sendo criado.
- **tags_freeform**: Tags que serão atribuídas à VCN. Deve conter "ambiente", "cliente" e "projeto". Caso deseje, pode-se atribuir novas tags. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```
 


## Outputs

- **ip_address**: IP público criado.
