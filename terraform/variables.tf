variable "do_pat" {
  type = string
  sensitive = true
}

variable "do_ssh_pvt_key" {
  type = string
  # Note: not sensitive because it's a file path
}

variable "application_name" {
  type = string
  default = "droplet-ssh"
  description = "Will be used for DNS records, use hypens"
}
