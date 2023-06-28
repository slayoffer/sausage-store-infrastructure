variable "token" {
  description = "Yandex Cloud IAM token aka YC_TOKEN"
  type        = string
}

variable "cloud_id" {
  description = "Yandex cloud_id"
  type        = string
  default     = "b1g3jddf4nv5e9okle7p"
}

variable "folder_id" {
  description = "Yandex folder_id"
  type        = string
  default     = "b1g6kb8sqccdk2sg5drr"
}

variable "zone" {
  description = "Yandex zone"
  type        = string
  default     = "ru-central1-a"
}
