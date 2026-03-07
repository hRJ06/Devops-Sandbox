terraform {
  required_providers {
    digitalocean = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "<GITHUB_PAT>"
}

resource "github_repository" "Test-Repository" {
  name        = "Test-Repository"
  description = ""
  visibility  = "public"
}
