data "digitalocean_image" "prometheus" {
  name = "prometheus"
}


# create salt master
module "prometheus" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.prometheus.image}"
  name               = "prometheus"
  region             = "lon1"
  size               = "512mb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"
}
