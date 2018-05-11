variable "repo" {}

variable "devs" {
    type = "list"
}

variable "admins" {
    type = "list"
}

variable "nightshift_users" {
    type = "list"
}

variable "dayshift_users" {
    type = "list"
}

variable "setup" {
    default = false
}