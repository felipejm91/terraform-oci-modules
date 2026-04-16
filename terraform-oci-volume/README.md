# Módulo Criação Volume OCI

Este módulo cria um volume na OCI e o anexa a uma instância Compute.

## Documentação

- [core_volume](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_volume)
- [core_volume_attachment](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_volume_attachment)
- [core_volume_backup_policy_assignment](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_volume_backup_policy_assignment)

## Exemplo de utilização
```
module "volume" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-volume"
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
  volume_backup_policy_id      = var.volume_backup_policy_id
}
```

## Variáveis

- **compartimento_ocid**: OCID do compartimento onde será criado o volume.
- **instance_availability_domain**: Domínio de disponibilidade para o volume.
- **volume_display_name**: Nome de exibição do volume.
- **size_in_gbs_volume**: Tamanho do volume em GB. Padrão: `50`.
- **vpus_per_gbs_volume**: VPUs por GB para o volume. Padrão: `10`.
- **instance_ocid**: OCID da instância que receberá o volume.
- **tags_freeform**: Tags de formato livre. Exemplo:
```
  tags_freeform = {
    "ambiente" = "desenvolvimento"
    "cliente"  = "Client-Name"
    "projeto"  = "Project-Name"
  }
```
- **volume_backup_policy_id**: OCID de uma política de backup para o volume. Opcional.

## Outputs

- **volume_id**: OCID do volume criado.
