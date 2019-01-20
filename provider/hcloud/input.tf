variable "hetzner_token" {
  description = "Hetzner Cloud Token"
  type = "string"
}

variable "hetzner_user_name" {
  description = "Hetzner user name on server"
  type = "string"
}

variable "hetzner_group_name" {
  description = "Hetzner user group name on server"
  type = "string"
}

variable "hetzner_ip_access" {
  description = "Hetzner IP address which is allowed to access server with ssh"
  type = "string"
}

variable "hetzner_email" {
  description = "Hetzner eMail of user to inform about server setup"
  type = "string"
}

variable "hetzner_ssh_key_name" {
  description = "Hetzner SSH Key Name for Server Logins ~/.ssh/<HETZNER_SSH_KEY_NAME>.pub without path without file type ending"
  type = "string"
}

variable "hetzner_domain" {
  description = "Hetzner domain name for servers"
  type = "string"
}

variable "hetzner_server_count" {
  description = "Hetzner number of server to provision"
  type = "string"
}

variable "hetzner_server_type" {
  description = "Hetzner type of server 'cx11', 'cx21',..."
  type = "string"
}

variable "hetzner_datacenter" {
  description = "Hetzner datacenter name 'fsn1-dc8'=Falkenstein, 'nbg1-dc3'=Nuremberg, 'hel1-dc2'=Helsinki"
  type = "string"
}

variable "hetzner_hostname_format" {
  description = "Hetzner server name format"
  type = "string"
}

variable "hetzner_image" {
  description = "Hetzner operating system image 'ubuntu-16.04', ..."
  type    = "string"
}

variable "hetzner_keep_disk" {
  description = "Hetzner keep disk size, to enable up- and downgrades 'true', 'false'"
  type    = "string"
}

variable "hetzner_iso_image" {
  description = "Hetzner iso image name to mount"
  type    = "string"
}

variable "hetzner_rescue" {
  description = "Hetzner Enable and boot in to the specified rescue system 'linux64'"
  type = "string"
}

variable "hetzner_apt_install_packages" {
  description = "Hetzner applications to provision with apt-get install"
  type    = "list"
}

variable "zeit_token" {
  description = "Zeit.co Token for administration of dns services"
  type = "string"
}
