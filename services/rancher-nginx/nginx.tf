resource "null_resource" "nginx" {

  connection {
    type = "ssh"
    host  = "${element(var.connections, 0)}"
    user = "${var.user}"
    private_key = "${file("~/.ssh/${var.ssh_key_name}")}"
  }

  provisioner "file" {
    source      = "common/install.sh"
    destination = "/tmp/install.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 700 /tmp/install.sh"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "while fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do sleep 1; done",
      # "sudo apt-get install -y docker.io ${join(" ", var.apt_install_master)}",
      "/tmp/install.sh 'docker.io ${join(" ", var.hetzner_apt_install_packages)}'",
      "while fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do sleep 1; done",
      "[ -d /var/www/html ] || sudo mkdir -p /var/www/html",
    ]
  }
}