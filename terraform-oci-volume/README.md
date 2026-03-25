# Módulo Criação Volume OCI

Este módulo é utilizado para criação de um Volume na OCI e sua anexação à uma instância.


## Documentação

[Volume](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_volume)

[Anexação Volume](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_volume_attachment)

[Atribuição de Política de Backup de Volume](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_volume_backup_policy_assignment)


## Exemplo de utilização
```
module "volume" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-volume"
  # O provider OCI deve ser configurado no arquivo main do seu projeto principal.
  # Considere utilizar o módulo `terraform-oci-provider` para gerenciar a configuração do provider de forma centralizada.
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
  volume_backup_policy_id      = var.volume_backup_policy_id # Opcional
}
```


## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação do volume:


### Obrigatório atribuir valor

- **compartimento_ocid**: OCID do compartimento onde será criado o volume.
- **instance_availability_domain**: Domínio de disponibilidade para o Volume.
- **volume_display_name**: Nome de exibição do volume. Também é usado para compor o nome da anexação do volume à instância.
- **instance_ocid**: OCID da instância onde será anexado o volume.
- **tags_freeform**: Tags de formato livre para identificação dos recursos. As chaves `ambiente`, `cliente` e `projeto` são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```

### Opcional atribuir valor

- **size_in_gbs_volume**: Tamanho em GB do volume. O valor padrão é `50`.
- **vpus_per_gbs_volume**: Tipo de performance que será aplicada ao volume. `0` = Baixo custo; `10` = Balanceado; `20` = Alta performance; `30-120` = Ultra Alta performance. O valor padrão é `10`.
- **volume_backup_policy_id**: OCID da política de backup do volume. Se não fornecido, nenhuma política será atribuída.


## Outputs

Os seguintes outputs podem ser utilizados.

- **volume_id**: OCID do volume criado.
