# Configure the GitHub Provider
provider "github" {
  token        = "${data.vault_generic_secret.credentials.data.github_token}"
  organization = "${data.vault_generic_secret.credentials.data.github_organization}"
}

# Configure the PagerDuty provider
provider "pagerduty" {
  token = "${data.vault_generic_secret.rundeck_auth.data.pagerduty_token}"
}