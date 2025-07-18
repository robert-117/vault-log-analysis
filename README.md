Useful Commands to setup conatiners:

# start up
`docker compose -p telemetry-stack --env-file .env up --build -d`

# clean shutdown
`docker compose -p telemetry-stack --env-file .env down --volumes --remove-orphans`

# hard remove loki data
`rm -rf ./loki/{wal,index,cache,chunks,compactor}`

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
