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

variable "subnetwork_name" {
  type = string
  default = "gcpkspl-subnetwork"
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

variable "db-count" {
    type = string
    default = "1"
}   
variable "db-user-name"   {   
      type = string
      default = "admin"
}

  variable "db-user-password" {

      type = string
      default = "43rgrhotfssfk"
  }
  