# yandex_main module

## Purpose

This is main module, very very main.

## Description

This module connect to Yandex Cloud, get subnet from network module, and create VM
with instance module

## Dependencies

yandex provider version = ">= 0.84.0"
terraform_version = ">= 1.1.4"

## Usage Instructions

Copy and paste into your Terraform configuration insert or update the
variables, and run `terraform init`:

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | -------- |
| token | Yandex Cloud IAM token aka YC_TOKEN | string | - | yes |
| cloud_id | Yandex cloud id to connect provider | string | "b1g3jddf4nv5e9okle7p" | yes |
| folder_id | Ya Cloud folder id to connect provider | string | "b1g6kb8sqccdk2sg5drr" | yes |
| zone | Ya Cloud zone to connect provider | string | "ru-central1-a" | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| instance_ip_address | VM local IP address |
| instance_external_ip | VM external IP address |

## Versions

| Version | Major changes |
| ------- | ------------- |
| 1     | Created module |
