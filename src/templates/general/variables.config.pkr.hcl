variable "config" {
  type        = object({
    hypervisor  = object({
      host        = string
      user        = string
      password    = string
      datastore   = string
    })
    vm          = object({
      db          = object({
        user               = string
        password           = string
        password-encrypted = string
        ip                 = string
        ip-group           = string
        gateway            = string
        nameserver         = string
      })
      server      = object({
        user               = string
        password           = string
        password-encrypted = string
        ip                 = string
        ip-group           = string
        gateway            = string
        nameserver         = string
      })
    })
    secret      = object({
      db          = object({
        user        = string
        password    = string
      })
      minio       = object({
        root        = object({
          user        = string
          password    = string
        })
        core        = object({
          user        = string
          password    = string
        })
        captain     = object({
          user        = string
          password    = string
        })
      })
      credential    = object({
        image         = object({
          user          = string
          password      = string
        })
        keygen        = object({
          api-token     = string
          account-id    = string
        })
        cert-private-key = string
      })
      jwt-secret    = string
    })
  })
  default     = {
    hypervisor  = {
      host        = env("HYPERVISOR_HOST")
      user        = env("HYPERVISOR_USER")
      password    = env("HYPERVISOR_PASSWORD")
      datastore   = env("HYPERVISOR_DATASTORE")
    }
    vm          = {
      db          = {
        user               = env("VM_DB_USER")
        password           = env("VM_DB_PASSWORD")
        password-encrypted = env("VM_DB_PASSWORD_ENCRYPTED")
        ip                 = env("VM_DB_IP")
        ip-group           = env("VM_DB_IP_GROUP")
        gateway            = env("VM_DB_GATEWAY")
        nameserver         = env("VM_DB_NS")
      }
      server      = {
        user               = env("VM_SERVER_USER")
        password           = env("VM_SERVER_PASSWORD")
        password-encrypted = env("VM_SERVER_PASSWORD_ENCRYPTED")
        ip                 = env("VM_SERVER_IP")
        ip-group           = env("VM_SERVER_IP_GROUP")
        gateway            = env("VM_SERVER_GATEWAY")
        nameserver         = env("VM_SERVER_NS")
      }
    }
    secret      = {
      db          = {
        user        = env("SECRET_DB_USER")
        password    = env("SECRET_DB_PASSWORD")
      }
      minio       = {
        root        = {
          user        = env("SECRET_MINIO_ROOT_USER")
          password    = env("SECRET_MINIO_ROOT_PASSWORD")
        }
        core        = {
          user        = env("SECRET_MINIO_CORE_USER")
          password    = env("SECRET_MINIO_CORE_PASSWORD")
        }
        captain     = {
          user        = env("SECRET_MINIO_CAPT_USER")
          password    = env("SECRET_MINIO_CAPT_PASSWORD")
        }
      }
      credential    = {
        image         = {
          user          = env("SECRET_IMAGE_USER")
          password      = env("SECRET_IMAGE_PASSWORD")
        }
        keygen        = {
          api-token     = env("SECRET_KEYGEN_API_TOKEN")
          account-id    = env("SECRET_KEYGEN_ACCOUNT_ID")
        }
        cert-private-key = env("CERT_PRIVATE_KEY")
      }
      jwt-secret     = env("SECRET_JWT_SECRET")
    }
  }
}
