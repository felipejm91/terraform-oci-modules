variable "compartimento_ocid" {
  default     = ""
  type        = string
  description = "OCID do compartimento onde será criado o volume"
}

variable "instance_availability_domain" {
  default     = "KOws:SA-SAOPAULO-1-AD-1"
  type        = string
  description = "Domínio de disponibilidade do volume."
}

variable "volume_display_name" {
  default     = ""
  type        = string
  description = "Nome de exibição do volume."
}

variable "size_in_gbs_volume" {
  default     = "50"
  type        = string
  description = "Tamanho do volume em GB."
}

variable "vpus_per_gbs_volume" {
  default     = "10"
  type        = string
  description = "Tipo de performance que será aplicada ao volume. 0 = Baixo custo; 10 = Balanceado; 20 = Alta performance; 30-120 = Ultra Alta performance"
}

variable "instance_ocid" {
  default     = ""
  type        = string
  description = "OCID da instância onde será anexado o volume."
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
