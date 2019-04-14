workflow "Build and Deploy" {
  on = "push"
  resolves = ["Run Frontend Tests", "Deploy to gh-pages Branch"]
}

action "Install Dependencies" {
  uses = "actions/npm@master"
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

action "Filter master Branch" {
  uses = "actions/bin/filter@master"
  needs = ["Run Frontend Tests"]
  args = "branch master"
}

action "Generate Site Using Nuxt" {
  uses = "actions/npm@master"
  needs = ["Filter master Branch"]
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
