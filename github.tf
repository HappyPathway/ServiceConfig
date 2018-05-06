module "admin_team" {
  team = "${var.repo}Admin"
  description = "${var.repo} Administrators"
  privacy = "secret"
}

module "admin_repo_team" {
  team_id = "${module.admin_team.id}"
  repository = "${var.repo}"
  permission = "admin"
}

module "dev_team" {
  team = "${var.repo}Dev"
  description = "${var.repo} Developers"
  privacy = "secret"
}

module "dev_repo_team" {
  team_id = "${module.dev_team.id}"
  repository = "${var.repo}"
  permission = "push"
}

resource "github_team_membership" "dev_team_membership" {
  team_id  = "${module.dev_team.id}"
  username = "${elements(var.devs, count.index)}"
  role     = "maintainer"
}

resource "github_team_membership" "admin_team_membership" {
  count = "${length(var.admins)}"
  team_id  = "${module.admin_team.id}"
  username = "${elements(var.admins, count.index)}"
  role     = "maintainer"
}

