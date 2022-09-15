#!/bin/bash

echo '
[Unit]
Description=Monitor Agents Docker Compose
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/etc/git/monitor-agents
ExecStart=docker-compose up -d
ExecStop=docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target' >> /etc/systemd/system/monitor-agents.service

systemctl enable monitor-agents