resource "google_project" "gcpkspl" {
  name       = var.projectName
  project_id = var.projectNumber

}

resource "google_compute_network" "network_name" {
  name = "network_name"
}
resource "google_compute_subnetwork" "gcpkspl-public-subnetwork" {
  name          = "gcpkspl-subnetwork"
  ip_cidr_range = "10.2.0.0/24"
  region        = "region"
  network       = google_compute_network.network_name.name
}

resource "google_sql_database" "database" {
  name     = "gcpkspl-database"
  instance = google_sql_database_instance.db-instance.name
}

resource "google_sql_database_instance" "db-instance" {
  name   = "database-instance-name"
  region = "region"
  database_version = "db-version"
  settings {
    tier = "db-e2-micro"
  }
  deletion_protection = "true"
}

resource "google_sql_user" "db-user" {
  count    = var.db-count
  name     = var.db-user-name
  project  = var.projectName
  instance = google_sql_database_instance.db-instance.name
  host     = var.database-instance-name
  password = var.db-user-password
}


resource "google_container_cluster" "gcpkspl-cluster" {
  name               = var.cluster_name
  
  initial_node_count = 1
  network            = google_compute_network.network_name.name
  subnetwork         = google_compute_subnetwork.gcpkspl-public-subnetwork.name

  // Use legacy ABAC until these issues are resolved: 
  //   https://github.com/mcuadros/terraform-provider-helm/issues/56
  //   https://github.com/terraform-providers/terraform-provider-kubernetes/pull/73
  enable_legacy_abac = true

  // Wait for the GCE LB controller to cleanup the resources.
  provisioner "local-exec" {
  //  when    = "destroy"
    command = "sleep 90"
  }
}

module "gce-container" {
  source = "github.com/terraform-google-modules/terraform-google-container-vm"
  # version = "0.1.0"

  container = {
    # image="gcr.io/google-samples/hello-app:1.0"
    image="gcr.io/gcpkspl/pett-app:latest"
    # env = [
    #   {
    #     name = "TEST_VAR"
    #     value = "Hello World!"
    #   }
    # ],

    # Declare volumes to be mounted.
    # This is similar to how docker volumes are declared.
    volumeMounts = [
      {
        mountPath = "/cache"
        name      = "tempfs-0"
        readOnly  = false
      },
      {
        mountPath = "/persistent-data"
        name      = "data-disk-0"
        readOnly  = false
      },
    ]
  }

#### 2nd container for Jenkins #########

container = {
    # image="gcr.io/google-samples/hello-app:1.0"
    image="gcr.io/gcpkspl/pett-app:latest"
    # env = [
    #   {
    #     name = "TEST_VAR"
    #     value = "Hello World!"
    #   }
    # ],

    # Declare volumes to be mounted.
    # This is similar to how docker volumes are declared.
    volumeMounts = [
      {
        mountPath = "/cache"
        name      = "tempfs-0"
        readOnly  = false
      },
      {
        mountPath = "/persistent-data"
        name      = "data-disk-0"
        readOnly  = false
      },
    ]
  }


#### end 2nd container for Jenkins #####

  # Declare the Volumes which will be used for mounting.
  volumes = [
    {
      name = "tempfs-0"

      emptyDir = {
        medium = "Memory"
      }
    },
    {
      name = "data-disk-0"

      gcePersistentDisk = {
        pdName = "data-disk-0"
        fsType = "ext4"
      }
    },
  ]

  restart_policy = "Always"
}


