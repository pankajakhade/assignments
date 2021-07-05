provider "google" {
  credentials = file("account.json") # Please have a account.json file with you
  project = var.projectId
}

provider "google-beta" {
  credentials = file("account.json") # Please have a account.json file with you
  project = var.projectId
}