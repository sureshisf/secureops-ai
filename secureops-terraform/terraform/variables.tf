variable "subscription_id" {
  type        = string
  description = "Azure subscription ID (pass using TF_VAR_subscription_id)."
}
variable "location" {
  type    = string
  default = "eastus2"
}
variable "resource_group_name" {
  type    = string
  default = "rg-secureops-dev"
}
variable "app_name" {
  type    = string
  default = "secureops-ai-dev"
}
