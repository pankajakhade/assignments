
variable "projectId" {
  type = string
}

variable "region" {
  type = string
}

variable "networkTagsApp" {
  type = list(string)
}

variable "networkTagsWeb" {
  type = list(string)
}

variable "machineType" {
  type = string
  default = "n2-standard-2"
}

variable "vpcName" {
  type = string
}

variable "subnetName" {
  type = string
}

variable "email" {
  type = string
}

variable "bucket" {
  type = string
}


variable "dbname" {
  type = string
}

variable "dbversion" {
  type = string
  default = "MYSQL_5_7"
}

variable "tier" {
  type = string
  default = "db-n1-standard-1"
}