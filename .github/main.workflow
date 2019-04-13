workflow "Main Workflow" {
  on = "push"
  resolves = ["Deploy to gh-pages Branch"]
}

action "Filter master Branch" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Install Dependencies" {
  uses = "actions/npm@master"
  needs = ["Filter master Branch"]
  args = "install"
}

action "Run Formatting Tests" {
  uses = "actions/npm@master"
  needs = ["Install Dependencies"]
  args = "run lint"
}

action "Run Frontend Tests" {
  uses = "actions/npm@master"
  needs = ["Run Formatting Tests"]
  args = "run test"
}

action "Generate Site Using Nuxt" {
  uses = "actions/npm@master"
  needs = ["Run Frontend Tests"]
  args = "run generate"
}

action "Deploy to gh-pages Branch" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = ["Generate Site Using Nuxt"]
  env = {
    BUILD_DIR = "dist/"
  }
  secrets = ["GH_PAT"]
}
