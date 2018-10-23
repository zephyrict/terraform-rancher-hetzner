provider "hcloud" {
  version = "1.3.0"
  token = "${var.hetzner_token}"
}