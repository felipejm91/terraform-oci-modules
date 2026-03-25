variable "compartimento_ocid" {
  type        = string
  description = "OCID do compartimento onde será criado o volume."
  validation {
    condition     = var.compartimento_ocid != ""
    error_message = "O OCID do compartimento é obrigatório."
  }
}

variable "instance_availability_domain" {
  default     = "KOws:SA-SAOPAULO-1-AD-1"
  type        = string
  description = "Domínio de disponibilidade do volume. Por exemplo: 'KOws:SA-SAOPAULO-1-AD-1'."
  validation {
    condition     = var.instance_availability_domain != ""
    error_message = "O domínio de disponibilidade é obrigatório."
  }
}

variable "volume_display_name" {
  type        = string
  description = "Nome de exibição do volume."
  validation {
    condition     = var.volume_display_name != ""
    error_message = "O nome de exibição do volume é obrigatório."
  }
}

variable "size_in_gbs_volume" {
  default     = 50
  type        = number
  description = "Tamanho do volume em GB. Mínimo de 50GB."
  validation {
    condition     = var.size_in_gbs_volume >= 50
    error_message = "O tamanho do volume deve ser um número maior ou igual a 50 GB."
  }
}

variable "vpus_per_gbs_volume" {
  default     = 10
  type        = number
  description = "Tipo de performance que será aplicada ao volume. 0 = Baixo custo; 10 = Balanceado; 20 = Alta performance; 30-120 = Ultra Alta performance. O valor padrão é 10 (Balanceado)."
  validation {
    condition     = var.vpus_per_gbs_volume >= 0 && var.vpus_per_gbs_volume <= 120
    error_message = "A quantidade de VPUs por GB deve estar entre 0 e 120."
  }
}

variable "instance_ocid" {
  type        = string
  description = "OCID da instância onde será anexado o volume."
  validation {
    condition     = var.instance_ocid != ""
    error_message = "O OCID da instância é obrigatório para anexação do volume."
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

variable "volume_backup_policy_id" {
  type        = string
  default     = null
  description = "OCID da política de backup do volume. Opcional. Se não fornecido, nenhuma política será atribuída."
  nullable = true # Allow null value for default
}
