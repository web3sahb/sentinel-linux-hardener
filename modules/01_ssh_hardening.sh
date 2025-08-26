#!/bin/bash

# Module 01: SSH Server Hardening (CIS Benchmark)

hardening_ssh() {
    echo "[*] Applying SSH hardening configurations..."
    
    SSH_CONFIG="/etc/ssh/sshd_config"
    BACKUP_FILE="${SSH_CONFIG}.backup-$(date +%Y%m%d)"
    
    # Create backup
    if [ ! -f "$BACKUP_FILE" ]; then
        cp "$SSH_CONFIG" "$BACKUP_FILE"
        echo "[+] Created backup: $BACKUP_FILE"
    fi
    
    # Apply CIS-compliant settings
    sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' "$SSH_CONFIG"
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' "$SSH_CONFIG"
    sed -i 's/#Protocol 2/Protocol 2/g' "$SSH_CONFIG"
    
    # Restart SSH service
    systemctl restart sshd
    
    echo "[+] SSH hardening completed."
}