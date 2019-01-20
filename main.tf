module "provider" {
  source                       = "./provider/hcloud"
  hetzner_token                = "${var.hetzner_token}"
  hetzner_user_name            = "${var.hetzner_user_name}"
  hetzner_group_name           = "${var.hetzner_group_name}"
  hetzner_ip_access            = "${var.hetzner_ip_access}"
  hetzner_email                = "${var.hetzner_email}"
  hetzner_ssh_key_name         = "${var.hetzner_ssh_key_name}"
  hetzner_domain               = "${var.hetzner_domain}"
  hetzner_server_count         = "${var.hetzner_server_count}"
  hetzner_server_type          = "${var.hetzner_server_type}"
  hetzner_datacenter           = "${var.hetzner_datacenter}"
  hetzner_hostname_format      = "${var.hetzner_hostname_format}"
  hetzner_image                = "${var.hetzner_image}"
  hetzner_keep_disk            = "${var.hetzner_keep_disk}"
  hetzner_iso_image            = "${var.hetzner_iso_image}"
  hetzner_rescue               = "${var.hetzner_rescue}"
  hetzner_apt_install_packages = "${var.hetzner_apt_install_packages}"
  zeit_token                   = "${var.zeit_token}"
}

module "rancher" {
   source                       = "services/rancher"
   connections                  = "${module.provider.public_ips}"
   count                        = "${var.hetzner_server_count}"
   ssh_key_name                 = "${var.hetzner_ssh_key_name}"
   user                         = "${var.hetzner_user_name}"
   hostname_format              = "${var.hetzner_hostname_format}"
   domain                       = "${var.hetzner_domain}"
   letsencrypt_mode             = "${var.letsencrypt_mode}"
   email                        = "${var.hetzner_email}"
   rancher_password             = "${var.rancher_password}"
   rancher_cluster              = "${var.rancher_cluster}"
   apt_install_master           = "${var.hetzner_apt_install_master}"
}

module "firewall" {
  source                        = "./services/firewall"
  connections                   = "${module.provider.public_ips}"
  count                         = "${var.hetzner_server_count}"
  ssh_key_name                  = "${var.hetzner_ssh_key_name}"
  user                          = "${var.hetzner_user_name}"
  ip_access                     = "${var.hetzner_ip_access}"
}
