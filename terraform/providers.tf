terraform {
  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "6.1.1"
    }
  }
}
provider "argocd" {
  server_addr = "http://13.233.13.210:3000"
  username    = var.username
  password    = var.password
  insecure    = true
}
