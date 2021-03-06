module "pd_oncall" {
  source = "git@github.com:HappyPathway/PagerDutyOncall.git"
  nightshift_users = ["${var.nightshift_users}"]
  dayshift_users = ["${var.dayshift_users}"]
  service = "${var.repo}"
  pagerduty_token = "${data.vault_generic_secret.credentials.data.pagerduty_token}"
}
