# Configure vsphere Provider

provider "vsphere" {
  
 user = "xxx@xxx"
    password = "yyy"
    vsphere_server = "zzzz"
   allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
}

data "vsphere_datastore" "datastore" {
  
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
  name          = "abc"
}

data "vsphere_datastore" "iso_datastore" {
  
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
  name = "abc"
}

data "vsphere_host" "host" {

  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
  name          =   "xxx"
}

data "vsphere_network" "network" {
  
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
  name          = "xcd"

}

data "vsphere_resource_pool" "pool" {
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
  name          = "xbc"
}

data "vsphere_virtual_machine" "template" {
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
  name          = "123"
}


resource "vsphere_virtual_machine" "vm" {
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"

  name     = "abc"
  num_cpus = 1
  memory   = 8192
  

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }


  disk {
   
    size             =  "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    label           = "mnbd"
 
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    customize {
      windows_options {

        computer_name         = "abcgd"
        admin_password        = "qqjlh"
        workgroup      = "WORKGROUP"
        
      }
        network_interface {

        ipv4_address = "xx.xx.xx.xx"
        ipv4_netmask = 24
        
      } 
      ipv4_gateway = "xx.xx.xx.xx"
        
    }
    
  }
}

