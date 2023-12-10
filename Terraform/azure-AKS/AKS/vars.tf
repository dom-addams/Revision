## Cluster Variables
variable "aks_name" {}
variable "rg" {}
variable "location" {}
variable "dns_name" {}
variable "is_private_cluster" {}
variable "sku" {}

## Node Pool Variables
variable "node_name" {}
variable "node_count_number" {}
variable "node_image_size" {}
variable "node_os" {}
variable "subnet_id" {}

## Idetity Account
variable "user_account" {}
