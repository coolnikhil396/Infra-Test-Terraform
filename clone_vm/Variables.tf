##########################

#Default VCenter variable



variable "user" {
  #type = string
  
}

variable "password" {
  #type = string
}

variable "vsphere_server" {
  #type = string
}

variable "datastore" {
  #type = string
}

variable "iso_datastore" {
  #type = string
}

variable "host" {
  #type = string
}

variable "network" {
  #type = string
}

variable "pool" {
  #type = string
}

variable "template" {
  #type = string
}

# VM Variable

variable "vm" {
  #type = string   #name of the VM
}

variable "num_cpus" { #Interger value not required for declaring
}

variable "memory" {
}

variable "diskname" {
  #type = string
}

variable "computer_name" {
  #type = string
}

variable "workgroup" {
  #type = string
}

variable "admin_password" {
  #type = string
}

variable "join_domain" {
  #type = string
}

variable "domain_admin_user" {
  #type = string
}

variable "domain_admin_password" {
  #type = string
}

variable "ipv4_address" {
  #type = string
}

variable "ipv4_netmask" {
  #type = string
}

variable "vmdns" {
  #type = string
}

variable "ipv4_gateway" {
  #type = string
}

