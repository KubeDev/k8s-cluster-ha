resource "digitalocean_droplet" "haproxy" {
  image = "ubuntu-18-04-x64"
  name = "haproxy-01"
  region = "nyc3"
  size = "s-1vcpu-1gb"
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
#  provisioner "remote-exec" {
#    inline = [
      #"export PATH=$PATH:/usr/bin",
      # install haproxy
#      "sudo apt-get update",
#      "sudo apt-get -y install haproxy"
#    ]
#  }
}