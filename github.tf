module "admin_team" {
  source = "git@github.com:HappyPathway/GitHubTeam.git"
  team = "${var.repo}Admin"
  description = "${var.repo} Administrators"
  privacy = "secret"
}

module "admin_repo_team" {
  source = "git@github.com:HappyPathway/GitHubTeamRepo.git"
  team_id = "${module.admin_team.id}"
  repository = "${var.repo}"
  permission = "admin"
}

module "dev_team" {
  source = "git@github.com:HappyPathway/GitHubTeam.git"
  team = "${var.repo}Dev"
  description = "${var.repo} Developers"
  privacy = "secret"
}

module "dev_repo_team" {
  source = "git@github.com:HappyPathway/GitHubTeamRepo.git"
  team_id = "${module.dev_team.id}"
  repository = "${var.repo}"
  permission = "push"
}

resource "github_team_membership" "dev_team_membership" {
  source = "git@github.com:HappyPathway/GitHubTeamMembership.git"
  count = "${length(var.admins)}"
  team_id  = "${module.dev_team.id}"
  username = "${elements(var.devs, count.index)}"
  role     = "member"
}

resource "github_team_membership" "admin_team_membership" {
  source = "git@github.com:HappyPathway/GitHubTeamMembership.git"
  count = "${length(var.admins)}"
  team_id  = "${module.admin_team.id}"
  username = "${elements(var.admins, count.index)}"
  role     = "member"
}

