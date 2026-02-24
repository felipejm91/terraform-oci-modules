
variable "instance_availability_domain" {
  default     = "KOws:SA-SAOPAULO-1-AD-1"
  type        = string
  description = "O dominio de disponibilidade da instância."
}

# https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm
variable "instance_shape" {
  default     = "VM.Standard.E4.Flex"
  type        = string
  description = "Tipo de shape que será utilizado pela instância de arquivos."
}

variable "compartimento" {
  default     = ""
  type        = string
  description = "Compartimento onde será criado a instância"
}

variable "vnic_name" {
  default     = ""
  type        = string
  description = "Nome da VNIC"
}

variable "srv_name" {
  default     = ""
  type        = string
  description = "Nome de exibição do servidor"
}

variable "memory_size" {
  default     = "1"
  type        = string
  description = "Tamanho em GB da memória RAM"
}

variable "ocpu_size" {
  default     = "1"
  type        = string
  description = "Quantidade de OCPUs do servidor"
}

variable "tags_freeform" {
  type = map(string)
  default = {
    "ambiente" = ""
    "cliente"  = ""
    "projeto"  = ""
  }
  description = "Tags para identificação dos recursos"
}

variable "public_subnet_ocid" {
  default     = ""
  type        = string
  description = "OCID da subrede pública"
}

variable "ssh_path" {
  type        = string
  default     = ""
  description = "Caminho para a chave SSH que será utilizada para conexão com a instância"
}

# https://docs.oracle.com/en-us/iaas/images/
#Canonical-Ubuntu-24.04-2024.06.26-0
variable "source_ocid_image" {
  default     = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaazboc2uirwn62sojzz4mmdmzpyjv2xgcdm6izmwxfon6pnw6z3iwa"
  type        = string
  description = "OCID da imagem de origem da instância."
}

variable "boot_volume_size" {
  default     = "50"
  type        = string
  description = "Tamanho do volume de boot"
}

variable "boot_volume_vpus" {
  default     = "10"
  type        = string
  description = "Quantidade de VPUs do volume de boot"
}

variable "nsg_ids_public" {
  default     = [""]
  type        = list(string)
  description = "OCID dos NSG que serão atribuídos à vnic pública"
}
