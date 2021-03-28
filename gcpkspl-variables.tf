variable "projectName" {
  type    = string
  default = "gcpkspl"
}

variable "projectNumber" {
  type    = string
  default = "988754575871"
}

 variable "org-id" {
   type    = string
   default = ""
 }

variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-a"
}

variable "network_name" {
  default = "gcpkspl-k8s-network"
}

variable "cluster_name" {
  default = "gcpkspl-cluster"
}

variable "database-instance-name" {
    default = "gcpkspl-db"
}

variable "db-version" {
    default = "MYSQL_5_6"
}