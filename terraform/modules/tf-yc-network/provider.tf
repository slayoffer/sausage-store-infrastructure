provider "yandex" {
  #token = var.token
  service_account_key_file = "/root/authorized_key.json"
  cloud_id  = var.network_cloud_id
  folder_id = var.network_folder_id
  zone      = var.network_zone
}
