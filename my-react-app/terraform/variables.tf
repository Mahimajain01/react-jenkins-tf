variable "subscription_id" {
  description = "Subscription id of the account"
  type = string
  default = "260b36c5-32dc-439e-85aa-8a8100419239"
}

variable "location" {
    description = "location of service"
    type = string
    default = "eastus"
}

variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = "rg-jenkins"
}

variable "linux_web_app_name" {
  description = "name of the app service"
  type = string
  default = "reactjenkins98872"
}

variable "linux_web_app_slot_name" {
  description = "name of windows web app slot"
  type = string
  default = "winappslotmahima"
}

variable "service_plan_name" {
  description = "Name of the service plan"
  type = string
  default = "appserviceplanmahima"
}

variable "os" {
  description = "Operating system"
  type = string
  default = "Windows"
}

variable "pricing_plan" {
  description = "Pricing plan of the azure service plan"
  type = string
  default = "S1"
}
