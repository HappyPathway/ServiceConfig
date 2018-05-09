provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://consul.ops.happypathway.com:8200"
}

data "vault_generic_secret" "credentials" {
  path = "secret/credentials"
}