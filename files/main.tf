terraform {
  required_providers {

    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-b"
}



#__________________СОЗДАНИЕ_2Х_VM_С_ПОМОЩЬЮ_"COUNT"____________________

resource "yandex_compute_instance" "vm-1" {
  count = 2
  name = "terraform-${count.index +1}"

  resources {
    core_fraction = 20
    cores  = 2
    memory = 1
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd87q4jvf0vdho41nnvr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
  

  metadata = {
    user-data = "${file("./meta.yaml")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}



#____________________СОЗДАНИЕ_ЦЕЛЕВОЙ_ГРУППЫ____________________

resource "yandex_lb_target_group" "foo" {
  name      = "target-group-balance"
  region_id = "ru-central1"

  target {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    address   = "${yandex_compute_instance.vm-1[0].network_interface.0.ip_address}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    address   = "${yandex_compute_instance.vm-1[1].network_interface.0.ip_address}"
  }
}




#_________________________________СОЗДАНИЕ_БАЛАНСИРОВЩИКА___________________________


resource "yandex_lb_network_load_balancer" "foo" {
  name = "balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.foo.id}"

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
