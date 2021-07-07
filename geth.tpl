[Unit]
Description=Go Ethereum

[Service]
Type=simple
ExecStart=/usr/bin/geth --syncmode "fast" --http --ws --http.addr 0.0.0.0 --ws.addr 0.0.0.0 --http.corsdomain '*' --ws.origins '*' --http.api eth,net,web3,personal --ws.api eth,net,web3,personal

User=${vm_user}
Group=${vm_user}

[Install]
WantedBy=default.target