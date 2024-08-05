resource "digitalocean_droplet" "web-1" {
  # Note: The list of available versions can be found at https://cloud.digitalocean.com/droplets/new
  # or https://slugs.do-api.dev/
  image = "ubuntu-23-10-x64"
  name = "web-1"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = var.do_ssh_pvt_key
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}
