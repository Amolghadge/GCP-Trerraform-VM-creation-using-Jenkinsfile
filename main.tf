resource "google_compute_instance" "vm_instance" {
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["web"]

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Include this section to assign a public IP
    }
  }

  metadata = {
    startup-script = "#!/bin/bash\napt-get update -y"
  }
}