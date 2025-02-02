# Módulo Criação Volume OCI

Este módulo é utilizado para criação de um Volume na OCI e sua anexação à uma instância.



## Exemplo de utilização
```
module "vcn" {
  source = "github.com/felipejm91/terraform-oci-modules/terraform-oci-volume.git"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
  providers = {
    oci = oci
  }
  compartimento_ocid           = var.compartimento_ocid
  instance_availability_domain = var.instance_availability_domain
  volume_display_name          = var.volume_display_name
  size_in_gbs_volume           = var.size_in_gbs_volume
  vpus_per_gbs_volume          = var.vpus_per_gbs_volume
  instance_ocid                = var.instance_ocid
  tags_freeform                = var.tags_freeform
}
```



## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação do volume:


### Obrigatório atribuir valor



- **compartimento_ocid**: OCID do compartimento onde será criada a VCN.


- **volume_display_name**: Nome de exibição do volume. Também é usado para compor o nome da anexação do volume à instância.


- **instance_ocid**: OCID da instância onde será anexado o volume.


- **tags_freeform**: Tags que serão atribuídas ao Volume. Deve conter "ambiente", "cliente" e "projeto". Caso deseje, pode-se atribuir novas tags. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```
 

### Opcional atribuir valor



- **instance_availability_domain**: Domínio de disponibilidade para o Volume.


- **size_in_gbs_volume**: Tamanho em GB do volume. O valor padrão é ***"50"***


- **vpus_per_gbs_volume**: "Tipo de performance que será aplicada ao volume. 0 = Baixo custo; 10 = Balanceado; 20 = Alta performance; 30-120 = Ultra Alta performance". O valor padrão é ***"10"***.



## Outputs

Os seguintes outputs podem ser utilizados.

- **volume_id**: OCID do volume criado.
