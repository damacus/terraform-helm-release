resource "random_uuid" "volume_name" {
  count = length(var.create_volumes) == 0 ? 0 : 1
}

resource "kubernetes_persistent_volume_claim" "this" {
  for_each = var.create_volumes

  metadata {
    name      = "${each.key}-pvc"
    namespace = local.namespace
  }

  spec {
    access_modes = ["ReadWriteMany", "ReadWriteOnce"]
    volume_name  = kubernetes_persistent_volume.this[each.key].metadata[0].name
    resources {
      requests = {
        storage = each.value
      }
    }
  }
}

resource "kubernetes_persistent_volume" "this" {
  for_each = var.create_volumes

  metadata {
    name = "${each.key}-${random_uuid.volume_name[0].result}"
  }

  spec {
    storage_class_name = "nfs-client"
    access_modes       = ["ReadWriteMany", "ReadWriteOnce"]
    capacity = {
      "storage" = each.value
    }

    persistent_volume_source {
      nfs {
        server    = var.nfs_server
        path      = "${var.base_nfs_path}/${each.key}"
        read_only = false
      }
    }
  }
}
