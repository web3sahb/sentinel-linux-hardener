#!/bin/bash

# Sentinel - Linux Server Hardening Suite
# Author: M Sahban Ansari | Scalable Systems Studio

set -euo pipefail

# Configuration
LOG_DIR="./logs"
LOG_FILE="${LOG_DIR}/sentinel_$(date +%Y%m%d_%H%M%S).log"
MODULE_DIR="./modules"

# Source all modules
for module in "${MODULE_DIR}"/*.sh; do
    if [ -f "$module" ]; then
        source "$module"
    fi
done

# Main execution function
main() {
    echo "[+] Starting Sentinel Linux Hardening Suite"
    mkdir -p "$LOG_DIR"
    
    # Execute hardening modules
    hardening_ssh
    hardening_firewall
    hardening_kernel
    hardening_auditd
    
    echo "[+] Sentinel hardening process completed."
    echo "[+] Log file: ${LOG_FILE}"
}

# Run main function and log output
main "$@" 2>&1 | tee -a "$LOG_FILE"