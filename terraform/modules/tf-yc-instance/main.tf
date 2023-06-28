resource "yandex_compute_instance" "vm-1" {
  
  count = var.instance_count
  name = var.instance_count == 1 ? "${var.instance_name}" : "${var.instance_name}-${count.index}"
  platform_id = var.instance_platform_id
  zone        = var.instance_zone
  
  scheduling_policy {
    preemptible = var.instance_preemptible 
  }

  resources {
    cores  = var.instance_core_count
    memory = var.instance_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.instance_image_id
      size = var.instance_disk_size
      type = var.instance_disk_type
    }
  }

  network_interface {
    subnet_id = var.instance_subnet_id
    nat       = var.instance_nat
  }
  
  metadata = {
       user-data = fileexists("${var.users_file}") ? "${file("${var.users_file}")}" : null
  }

}
