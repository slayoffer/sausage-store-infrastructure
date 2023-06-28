module "yandex_compute_instance" {
  source               = "./modules/tf-yc-instance"
  token                = var.token
  instance_cloud_id    = var.cloud_id
  instance_folder_id   = var.folder_id
  instance_zone        = var.zone
  instance_count       = 1
  instance_name        = "chapter5-lesson3-std-012-42"
  instance_platform_id = "standard-v3"
  instance_image_id    = "fd89n8278rhueakslujo"
  instance_disk_type   = "network-ssd"
  instance_disk_size   = "50"
  instance_nat         = "true"
  instance_subnet_id = [
    for x in module.yandex_compute_network.yandex_vpc_subnets :
    x if x.zone == var.zone
  ][0].subnet_id
}

module "yandex_compute_network" {
  source            = "./modules/tf-yc-network"
  token             = var.token
  network_cloud_id  = var.cloud_id
  network_folder_id = var.folder_id
  network_zone      = var.zone
}

