variable "project" {
    default = "expense"
} 

variable "environment" {

}

variable "instances" {
    default = ["mysql","backend","frontend"]
  
}

variable "zone_id" {
    default = "Z097381030KQU6PGHMMTG"
  
}

variable "domain_name" {
    default = "ganeshdevops.online"
  
}
 variable "comman_tags" {
    type = map
     default = {
        Project = "expense"
        Terraform = "true"

    }
  
 }
