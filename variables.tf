variable "insecure" {
    type        = bool
    description = "Enable insecure connexion"
    default     = true
}

variable "endpoint" {
    type        = string
    description = "API endpoint URL"
}

variable "password" {
    type        = string
    description = "Password"
}

variable "username" {
    type        = string
    description = "Username"
}

variable "pve_node" {
    type        = string
    description = "Node where install element"
    default     = "pve01"
}
variable "debian_image_url" {
    type        = string
    description = "The URL for the latest Debian 12 Bookworm qcow2 image"
    default     = "https://cloud.debian.org/images/cloud/bookworm/20241004-1890/debian-12-genericcloud-amd64-20241004-1890.qcow2"
}
variable "debian_image_checksum_algorithm" {
    type        = string
    description = "Checksum algo used by image"
    default      = "sha512"
}

variable "debian_image_checksum" {
    type        = string
    description = "SHA Digest of the image"
    default     = "da84d609d7ec5645dae1df503ea72037b2a831401d1b42ce2e7ec2a840b699f07ca8aea630853a3d5430839268c2bd337be45d89498264c36a9b5e12872c59ee"
}
