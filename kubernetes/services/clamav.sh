#!/bin/bash

StreamMinPort=1024
StreamMaxPort=2048

for port in $(seq $StreamMinPort $StreamMaxPort)
do
cat >>./kubernetes/02-service.yml <<EOL
  - name: {{MICROSVC}}-streamport-$port
    port: $port
    targetPort: $port
    protocol: TCP
EOL
done
