terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_pages_project" "demo" {
  account_id   = var.bf39140c296ecc5d52e86f37b4c5de1f
  name         = "cf-pages-test"
  production_branch = "main"

  build_config {
    build_command   = ""
    destination_dir = "/"
  }

  source {
    type = "github"
    config {
      owner     = "<hinula>"   
      repo_name = "cf-pages-test"
      production_branch = "main"
    }
  }
}
