module "admin_team" {
  source = "git@github.com:HappyPathway/GitHubTeam.git"
  team = "${var.repo}Admin"
  description = "${var.repo} Administrators"
  privacy = "secret"
  setup = "${var.setup}"
}

module "admin_repo_team" {
  source = "git@github.com:HappyPathway/GitHubTeamRepo.git"
  team_id = "${module.admin_team.team_id}"
  repo = "${var.repo}"
  permission = "admin"
}

module "dev_team" {
  source = "git@github.com:HappyPathway/GitHubTeam.git"
  team = "${var.repo}Dev"
  description = "${var.repo} Developers"
  privacy = "secret"
  setup = "${var.setup}"
}

module "dev_repo_team" {
  source = "git@github.com:HappyPathway/GitHubTeamRepo.git"
  team_id = "${module.dev_team.team_id}"
  repo = "${var.repo}"
  permission = "push"
}

resource "github_team_membership" "dev_team_membership" {
  count = "${length(var.admins)}"
  team_id  = "${module.dev_team.team_id}"
  username = "${element(var.devs, count.index)}"
  role     = "member"
}

resource "github_team_membership" "admin_team_membership" {
  count = "${length(var.admins)}"
  team_id  = "${module.admin_team.team_id}"
  username = "${element(var.admins, count.index)}"
  role     = "member"
}

