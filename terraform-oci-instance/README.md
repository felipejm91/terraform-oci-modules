# Módulo Criação Instância OCI

Este módulo é utilizado para criação de uma instância na OCI.

## Observação
É necessário criar o Compartimento, a VCN e, opcionalmente, volumes adicionais antes de criar a instância. Caso utilize um IP público reservado, é necessário criá-lo antes da instância.

## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance)


## Exemplo de utilização
```
module "instancia" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-instance"
  # O provider OCI deve ser configurado no arquivo main do seu projeto principal.
  # Considere utilizar o módulo `terraform-oci-provider` para gerenciar a configuração do provider de forma centralizada.
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
  boot_volume_type             = var.boot_volume_type
  agent_plugins_desired_state  = var.agent_plugins_desired_state
}
```


## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação da instância:


### Obrigatório atribuir valor

- **compartimento**: OCID do compartimento onde será criada a instância.
- **vnic_name**: Nome de exibição e o hostname da VNIC primária que será atribuída à instância.
- **public_subnet_ocid**: OCID da subrede pública que a instância irá utilizar.
- **srv_name**: Nome de exibição do servidor.
- **ssh_path**: Caminho para a chave SSH pública que será utilizada para acesso à instância. O conteúdo do arquivo será lido.


### Opcional atribuir valor

- **instance_shape**: Shape que será utilizado para criação da instância. Se não for passado valor, será utilizado `VM.Standard.E4.Flex`. Consulte a documentação da OCI para shapes disponíveis: [Oracle Compute Shapes](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm).
- **instance_availability_domain**: Domínio de disponibilidade da instância. Se não for passado valor, será utilizado `KOws:SA-SAOPAULO-1-AD-1`.
- **tags_freeform**: Tags de formato livre para identificação dos recursos. As chaves `ambiente`, `cliente` e `projeto` são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário. Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```
- **memory_size**: Total de memória RAM em GB que será atribuído à instância. Caso não seja atribuído valor, será utilizado o valor de 1GB.
- **ocpu_size**: Total de OCPU que será atribuído à instância. Caso não seja atribuído valor, será utilizado o valor de 1 OCPU.
- **source_ocid_image**: OCID da imagem que será utilizada para a criação da instância. Caso não seja atribuído valor, será utilizado a imagem `Canonical-Ubuntu-24.04-2024.06.26-0`. Outras imagens podem ser consultadas em [Oracle OCID images](https://docs.oracle.com/en-us/iaas/images/).
- **boot_volume_size**: Tamanho em GB do volume de boot. Caso não seja atribuído valor, será utilizado o tamanho padrão de 50GB.
- **boot_volume_vpus**: Quantidade de VPUs que será atribuída ao volume de boot. Caso não seja atribuído valor, será utilizado o valor padrão 10.
- **vnic_nsg_ids**: Lista de OCIDs dos Network Security Groups (NSGs) que serão atribuídos à VNIC primária da instância.
- **boot_volume_type**: Tipo de volume de boot. Valores válidos: `PARAVIRTUALIZED` ou `ISCSI`. Padrão: `PARAVIRTUALIZED`.
- **agent_plugins_desired_state**: Estado desejado para os plugins do Oracle Cloud Agent. As chaves são os nomes dos plugins e os valores são `ENABLED` ou `DISABLED`.


## Outputs

Os seguintes Outputs são gerados nesse módulo.

- **instancia_id**: OCID da instância que foi criada.
- **instancia_private_ip**: IP privado da instância que foi criada.
- **instancia_public_ip**: IP público da instância, se habilitado.
- **instancia_state**: Estado de execução da instância.
- **instancia_time_created**: Data e hora que a instância foi criada.
- **ocid_private_ip**: OCID do IP privado da VNIC primária da instância.
