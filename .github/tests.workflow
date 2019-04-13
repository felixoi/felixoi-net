workflow "Test on Push" {
  resolves = ["Run Frontend Tests"]
  on = "push"
}

workflow "Test on Pull Request" {
  resolves = ["Run Frontend Tests"]
  on = "pull_request"
}

action "Install Dependencies" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "Run Formatting Tests" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Install Dependencies"]
  args = "run lint"
}

action "Run Frontend Tests" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Run Formatting Tests"]
  args = "run test"
}
