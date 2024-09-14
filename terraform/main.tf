resource "argocd_application" "helm" {
  metadata {
    name      = "helm-app-using-terraform-atul"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    project = "default" # Add this line

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "test" # Use the correct namespace as in the YAML
    }

    source {
      repo_url        = "https://github.com/atulghodmare777/argocd-applications.git"
      path            = "helm/nginx"
      target_revision = "HEAD"
      helm {
        value_files = ["values.yaml"] # Make sure the value file matches your YAML
      }
    }

    sync_policy {
      automated {
        prune     = true
        self_heal = true # Add self-heal as in your YAML
      }
    }
  }
}

