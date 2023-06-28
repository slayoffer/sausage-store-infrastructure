provider "yandex" {
  #token = var.token
  service_account_key_file = "/root/authorized_key.json"
  cloud_id  = var.instance_cloud_id
  folder_id = var.instance_folder_id
  zone      = var.instance_zone
}
