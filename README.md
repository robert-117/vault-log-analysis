

``` $ tree
vault-log-analysis
├── alloy
│   ├── bootstrap.sh
│   ├── config.alloy
├── docker-compose.yml
├── grafana
│   ├── dashboards
│   └── provisioning
│       └── datasources
│           ├── loki.yml
│           └── prometheus.yml
├── loki
│   ├── cache
│   ├── chunks
│   ├── compactor
│   ├── config.yml
│   ├── index
│   │   └── uploader
│   │       └── name
│   ├── static-logs
│   │   ├── audit_logs
│   │   │   └── README.md
│   │   └── ops_logs
│   │       └── README.md
│   └── wal
├── prometheus
│   └── prometheus.yml
├── shared
├── shared-data
└── vault
    ├── bootstrap.sh
    ├── config
    │   └── vault.hcl
    └── logs
```
