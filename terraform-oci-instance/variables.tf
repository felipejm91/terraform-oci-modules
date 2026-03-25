variable "instance_availability_domain" {
  default     = "KOws:SA-SAOPAULO-1-AD-1"
  type        = string
  description = "O domínio de disponibilidade da instância. Por exemplo: 'KOws:SA-SAOPAULO-1-AD-1'."
  validation {
    condition     = var.instance_availability_domain != ""
    error_message = "O domínio de disponibilidade é obrigatório."
  }
}

variable "instance_shape" {
  default     = "VM.Standard.E4.Flex"
  type        = string
  description = "Tipo de shape que será utilizado pela instância. Consulte a documentação da OCI para shapes disponíveis: https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm"
  validation {
    condition     = var.instance_shape != ""
    error_message = "O shape da instância é obrigatório."
  }
}

variable "compartimento" {
  type        = string
  description = "OCID do compartimento onde será criada a instância."
  validation {
    condition     = var.compartimento != ""
    error_message = "O OCID do compartimento é obrigatório."
  }
}

variable "vnic_name" {
  type        = string
  description = "Nome de exibição e o hostname da VNIC primária que será atribuída à instância."
  validation {
    condition     = var.vnic_name != ""
    error_message = "O nome da VNIC é obrigatório."
  }
}

variable "srv_name" {
  type        = string
  description = "Nome de exibição do servidor."
  validation {
    condition     = var.srv_name != ""
    error_message = "O nome de exibição do servidor é obrigatório."
  }
}

variable "memory_size" {
  default     = 1
  type        = number
  description = "Tamanho em GB da memória RAM. Mínimo de 1 GB."
  validation {
    condition     = var.memory_size >= 1
    error_message = "O tamanho da memória deve ser um número maior ou igual a 1."
  }
}

variable "ocpu_size" {
  default     = 1
  type        = number
  description = "Quantidade de OCPUs do servidor. Mínimo de 1 OCPU."
  validation {
    condition     = var.ocpu_size >= 1
    error_message = "A quantidade de OCPUs deve ser um número maior ou igual a 1."
  }
}

variable "tags_freeform" {
  type = map(string)
  default = {
    "ambiente" = ""
    "cliente"  = ""
    "projeto"  = ""
  }
  description = "Tags de formato livre para identificação dos recursos. As chaves 'ambiente', 'cliente' e 'projeto' são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário."
  validation {
    condition     = try(var.tags_freeform["ambiente"] != "" && var.tags_freeform["cliente"] != "" && var.tags_freeform["projeto"] != "", false)
    error_message = "Os valores para as tags 'ambiente', 'cliente' e 'projeto' são obrigatórios."
  }
}

variable "public_subnet_ocid" {
  type        = string
  description = "OCID da subrede pública que a instância irá utilizar."
  validation {
    condition     = var.public_subnet_ocid != ""
    error_message = "O OCID da subrede pública é obrigatório."
  }
}

variable "ssh_path" {
  type        = string
  description = "Caminho para a chave SSH pública que será utilizada para conexão com a instância. O conteúdo do arquivo será lido."
  validation {
    condition     = var.ssh_path != ""
    error_message = "O caminho para a chave SSH é obrigatório."
  }
}

variable "source_ocid_image" {
  default     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaazboc2uirwn62sojzz4mmdmzpyjv2xgcdm6izmwxfon6pnw6z3iwa"
  type        = string
  description = "OCID da imagem de origem da instância. Consulte https://docs.oracle.com/en-us/iaas/images/ para outras imagens."
  validation {
    condition     = var.source_ocid_image != ""
    error_message = "O OCID da imagem de origem é obrigatório."
  }
}

variable "boot_volume_size" {
  default     = 50
  type        = number
  description = "Tamanho em GB do volume de boot. Mínimo de 50GB."
  validation {
    condition     = var.boot_volume_size >= 50
    error_message = "O tamanho do volume de boot deve ser um número maior ou igual a 50."
  }
}

variable "boot_volume_vpus" {
  default     = 10
  type        = number
  description = "Quantidade de VPUs que será atribuída ao volume de boot."
  validation {
    condition     = var.boot_volume_vpus >= 0
    error_message = "A quantidade de VPUs do volume de boot deve ser um número maior ou igual a 0."
  }
}

variable "vnic_nsg_ids" {
  default     = []
  type        = list(string)
  description = "Lista de OCIDs dos Network Security Groups (NSGs) que serão atribuídos à VNIC primária da instância. Opcional."
}

variable "boot_volume_type" {
  type        = string
  default     = "PARAVIRTUALIZED" # Or "ISCSI"
  description = "Tipo de volume de boot. Valores válidos: 'PARAVIRTUALIZED' ou 'ISCSI'."
  validation {
    condition     = contains(["PARAVIRTUALIZED", "ISCSI"], var.boot_volume_type)
    error_message = "O tipo de volume de boot deve ser 'PARAVIRTUALIZED' ou 'ISCSI'."
  }
}

variable "agent_plugins_desired_state" {
  type = map(string)
  default = {
    "Vulnerability Scanning"             = "DISABLED"
    "Management Agent"                   = "DISABLED"
    "Custom Logs Monitoring"             = "ENABLED"
    "Compute RDMA GPU Monitoring"        = "DISABLED"
    "Compute Instance Monitoring"        = "ENABLED"
    "Compute HPC RDMA Auto-Configuration" = "DISABLED"
    "Compute HPC RDMA Authentication"    = "DISABLED"
    "Block Volume Management"            = "DISABLED"
    "Bastion"                            = "DISABLED"
  }
  description = "Estado desejado para os plugins do Oracle Cloud Agent. As chaves são os nomes dos plugins e os valores são 'ENABLED' ou 'DISABLED'."
  validation {
    condition = alltrue([
      for state in values(var.agent_plugins_desired_state) : contains(["ENABLED", "DISABLED"], state)
    ])
    error_message = "Os estados dos plugins devem ser 'ENABLED' ou 'DISABLED'."
  }
}
