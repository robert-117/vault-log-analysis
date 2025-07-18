ui = true
log_level = "debug"

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

storage "file" {
  path = "/vault/data"
}

telemetry {
  prometheus_retention_time = "60s"
  disable_hostname          = true
}
