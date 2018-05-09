# Configure the GitHub Provider
provider "github" {
  token        = "${data.vault_generic_secret.credentials.data.github_token}"
  organization = "${data.vault_generic_secret.credentials.data.github_organization}"
}