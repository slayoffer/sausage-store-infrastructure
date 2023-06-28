# yandex_compute_network module

## Purpose

This module for Yandex Cloud network.

## Description

This module connect to Yandex Cloud and get list of subnets
You can output them in root module, or use as array of subnets in other modules

## Dependencies

yandex provider version = ">= 0.84.0"
terraform_version = ">= 1.1.4"

## Usage Instructions

Copy and paste into your Terraform configuration /modules/tf-yc-network insert or update the
variables, and run `terraform init`:

## Inputs

variables must be set in root module
Example:
```
module "yandex_compute_network" {
  source = "./modules/tf-yc-network"
  token = var.token
  network_cloud_id = var.cloud_id
  network_folder_id = var.folder_id
  network_zone = var.zone
}
```

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| network_zones | List of network zones in Ya Cloud | set(string) | (["ru-central1-a", "ru-central1-b", "ru-central1-c"]) | yes |
| network_zone | Default Ya Cloud network zone to connect provider | string | "ru-central1-a" | yes |
| network_cloud_id | Ya Cloud id to connect provider | string | - | yes |
| network_folder_id | Ya Cloud folder id to connect provider | string | - | yes |
| token | Ya Cloud IAM token | string | - | yes |


## Outputs

| Name | Description |
| ---- | ----------- |
| yandex_vpc_subnets | List of Ya Cloud subnets for other modules |

## Versions

| Version | Major changes |
| ------- | ------------- |
| 1     | Created module |
