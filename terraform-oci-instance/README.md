# Módulo Criação Instância OCI

Este módulo é utilizado para criação de uma instância na OCI.

## Observação: **Antes de criar a instância, é necessário criar o Compartimento, a VCN e o volume. Caso utilize um IP público reservado, é necessário criar o IP antes da instãncia.**


## Documentação

[Clique aqui para ver a documentação](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance)


## Exemplo de utilização
```
module "instancia" {
  source = "github.com/felipejm91/terraform-oci-modules.git//terraform-oci-instance"
  # Os valores do provider devem ser informados no arquivo main do projeto principal.
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
  nsg_ids_public               = var.nsg_ids_public
}
```



## Variáveis

Este módulo contém as seguintes variáveis que podem ser utilizadas para criação da instância:


### Obrigatório atribuir valor


- **compartimento**: OCID do compartimento onde será criada a instância.

- **vnic_name**: Nome de exibição e o hostname da VNIC pública que será atribuída à instância.

- **public_subnet_ocid**: OCID da subrede pública que a instância irá utilizar.

- **srv_name**: Nome que será atribuído à instância.

- **ssh_path**: Caminho para a chave SSH que será utilizada para acesso à instância.

- **nsg_ids_public**: Lista OCID das Network Security Group que serão atribuídas à VNIC pública.

 

### Opcional atribuir valor


- **instance_shape**: Shape que será utilizado para criação da instância. Se não for passado valor, será utilizado **VM.Standard.E4.Flex**

- **instance_availability_domain**: Domínio de disponibilidade da instância. Se não for passado valor, será utilizado ***KOws:SA-SAOPAULO-1-AD-1***

- **tags_freeform**: Tags que serão atribuídas à instância. Deve conter "ambiente", "cliente" e "projeto". Abaixo um exemplo:
```
    tags_freeform = {
        "ambiente" = "desenvolvimento"
        "cliente"  = "Client-Name"
        "projeto"  = "Project-Name"
    }
```

- **memory_size**: Total de memória RAM em GB que será atribuido à instância. Caso não seja atribuído valor, será utilizado o valor de 1GB.

- **ocpu_size**: Total de OCPU que será atribuido à instância. Caso não seja atribuído valor, será utilizado o valor de 1 OCPU.

- **source_ocid_image**: OCID da imagem que será utilizada para a criação da instância. Caso não seja atribuído valor, será utilizado a imagem **Canonical-Ubuntu-24.04-2024.06.26-0**. Outras imagens podem ser consultadas em [Oracle OCID images] (https://docs.oracle.com/en-us/iaas/images/)

- **boot_volume_size**: Tamanho em GB do volume de boot. Caso não seja atribuído valor, será utilizado o tamanho padrão de 50GB.

- **boot_volume_vpus**: Quantidade de VPUS que será atribuída ao volume de boot. Caso não seja atribuído valor, será utilizado o valor padrão 10.



## Outputs

Os seguintes Outputs são gerados nesse módulo.


- **instancia_id**: OCID da instância que foi criada.


- **instancia_private_ip**: IP privado da instância que foi criada.


- **instancia_public_ip**: IP público da instância, se habilitado.


- **instancia_state**: Estado de execução da instância.


- **instancia_time_created**: Data e hora que instância foi criada.


- **ocid_private_ip**: OCID do IP privado para atribuir IP público
