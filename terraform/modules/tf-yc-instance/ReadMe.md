# yandex_compute_instance module

## Purpose

This module for create Yandex Cloud instance.

## Description

This module connect to Yandex Cloud create VM with parameters fron variables

## Dependencies

yandex provider version = ">= 0.84.0"
terraform_version = ">= 1.1.4"

## Usage Instructions

Copy and paste into your Terraform configuration /modules/tf-yc-instance insert or update the
variables, and run `terraform init`:

To add users in new VM create users.conf file in main module directory with the contents:
also you can change this file name or location with variable "users_file"
```
#cloud-config
users:
  - name: <username>
    primary_group: <Main user group>
    groups: sudo                        #if needed
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']    #if needed
    ssh_authorized_keys:
      - ssh-rsa AAAAB3Nz.....YVeUvyqYa0= user@host
```
## Inputs

variables must be set in root module
Example:
```
module "yandex_compute_instance" {
  source               = "./modules/tf-yc-instance"
  token                = var.token
  instance_cloud_id    = var.cloud_id
  instance_folder_id   = var.folder_id
  instance_zone        = var.zone
  instance_name        = var.vm_name
  instance_platform_id = var.platform_id
  instance_image_id    = var.image_id
  instance_disk_size   = "55"
  instance_nat         = "true"
  instance_subnet_id   = [
    for k, subnet in module.yandex_compute_network.yandex_vpc_subnets :
    subnet if subnet.zone == module.yandex_compute_instance.instance_zone
  ][0].subnet_id
}
```
All required variables must be set in root module, other can be modified


| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| instance_cloud_id | Yandex cloud_id to connect provider | string | - | yes |
| instance_folder_id | Yandex cloud folder_id to connect provider | string | - | yes |
| instance_zone | Ya Cloud zone to connect provider | string | - | yes |
| instance_name | Yandex instance name of VM | string | "std-VM-name-42" | no |
| instance_platform_id | Yandex instance platform id (CPU model) | string | "standard-v1" | no |
| instance_preemptible | Yandex instance preemptible status on/off | bool | "true" | no |
| instance_core_count | Yandex instance CPU core count | string | "2" | no |
| instance_memory | Yandex instance Memory in GB | string | "2" | no |
| instance_image_id | Yandex instance boot image id | string | - | yes |
| instance_disk_size | Yandex instance boot disk size in GB | string | "30" | no |
| instance_subnet_id | Yandex instance subnet id for network interface | string | - | yes |
| instance_nat | Yandex instance Nat on/off | bool | "false" | no |
| users_file | path to file with list of users in new VM | string | "./users.conf" | no |
| token | Yandex Cloud IAM token aka YC_TOKEN | string | - | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| instance_ip_address | Local IP address of created VM |
| instance_external_ip | External IP address of created VM |

## Versions

| Version | Major changes |
| ------- | ------------- |
| 1     | Created module |
