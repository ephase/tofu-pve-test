terraform {
    required_version = "> 1.6.0"
    required_providers {
        proxmox = {
            source  = "bpg/proxmox"
            version = "0.64.0"
        }
    }
}

provider "proxmox" {
    insecure    = var.insecure
    endpoint    = var.endpoint
    password    = var.password
    username    = var.username
}
