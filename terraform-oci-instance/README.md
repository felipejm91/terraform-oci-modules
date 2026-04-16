# Módulo Criação Instância OCI

Este módulo cria uma instância Compute na OCI com VNIC primária, boot volume e configuração de agente.

## Observação
Antes de usar este módulo, crie o Compartimento e a VCN. Se usar um IP público reservado, crie-o previamente e passe o OCID para `reserved_public_ip_ocid`.

## Documentação

[Clique aqui para ver a documentação do recurso core_instance](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance)

## Exemplo de utilização
```
module "instancia" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-instance"
  providers = {
    oci = oci
  }

  instance_availability_domain = var.instance_availability_domain
  instance_shape               = var.instance_shape
  compartimento                = var.compartimento
  vnic_name                    = var.vnic_name
  srv_name                     = var.srv_name
  memory_size                  = var.memory_size
  ocpu_size                    = var.ocpu_size
  tags_freeform                = var.tags_freeform
  public_subnet_ocid           = var.public_subnet_ocid
  ssh_path                     = var.ssh_path
  source_ocid_image            = var.source_ocid_image
  boot_volume_size             = var.boot_volume_size
  boot_volume_vpus             = var.boot_volume_vpus
  vnic_nsg_ids                 = var.vnic_nsg_ids
  reserved_public_ip_ocid      = module.publicip.public_ip_id
  assign_new_public_ip         = false
  boot_volume_type             = var.boot_volume_type
  agent_plugins_desired_state  = var.agent_plugins_desired_state
}
```

## Variáveis

### Obrigatórias

- **compartimento**: OCID do compartimento onde a instância será criada.
- **vnic_name**: Nome de exibição e hostname da VNIC primária.
- **public_subnet_ocid**: OCID da subrede pública que a instância irá utilizar.
- **srv_name**: Nome de exibição da instância.
- **ssh_path**: Caminho do arquivo da chave SSH pública usada para login na instância.

### Opcionais

- **instance_shape**: Shape da instância. Padrão: `VM.Standard.E4.Flex`.
- **instance_availability_domain**: Domínio de disponibilidade. Padrão: `KOws:SA-SAOPAULO-1-AD-1`.
- **tags_freeform**: Tags de formato livre para identificação do recurso. Exemplo:
```
  tags_freeform = {
    "ambiente" = "desenvolvimento"
    "cliente"  = "Client-Name"
    "projeto"  = "Project-Name"
  }
```
- **memory_size**: Memória RAM em GB. Padrão: `1`.
- **ocpu_size**: OCPUs. Padrão: `1`.
- **source_ocid_image**: OCID da imagem de boot. Padrão: `Canonical-Ubuntu-24.04-2024.06.26-0`.
- **boot_volume_size**: Tamanho do volume de boot em GB. Padrão: `50`.
- **boot_volume_vpus**: VPUs por GB do volume de boot. Padrão: `10`.
- **vnic_nsg_ids**: Lista de OCIDs de NSGs a serem atribuídos à VNIC primária.
- **reserved_public_ip_ocid**: OCID de um IP público reservado existente para atribuir à VNIC primária.
- **assign_new_public_ip**: Se `true`, a VNIC primária receberá um IP público efêmero. Use `false` se estiver passando `reserved_public_ip_ocid`.
- **boot_volume_type**: Tipo de boot volume. Valores: `PARAVIRTUALIZED` ou `ISCSI`.
- **agent_plugins_desired_state**: Estado dos plugins do Oracle Cloud Agent. Valores: `ENABLED` ou `DISABLED`.

## Outputs

- **instancia_id**: OCID da instância criada.
- **instancia_private_ip**: IP privado atribuído à instância.
- **instancia_public_ip**: IP público atribuído à instância (quando configurado).
- **instancia_state**: Estado atual da instância.
- **instancia_time_created**: Timestamp de criação da instância.
- **ocid_private_ip**: OCID do IP privado da VNIC primária.
