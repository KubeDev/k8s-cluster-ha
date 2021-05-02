resource "digitalocean_droplet" "node" {
  count = 2
  image = "ubuntu-18-04-x64"
  name = "node-${count.index}"
  region = "nyc3"
  size = "s-4vcpu-8gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.labs001-publickey.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}