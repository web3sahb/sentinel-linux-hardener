# Sentinel - Linux Server Hardening Suite

**Enterprise-grade, idempotent automation for CIS compliance and security hardening.**

## 🛡️ What It Does

- **SSH Hardening:** Disables root login, password authentication, and enforces protocol 2.
- **Firewall Orchestration:** Configures UFW with secure defaults and essential rules.
- **Kernel Hardening:** Applies `sysctl` security parameters from CIS benchmarks.
- **Auditd Integration:** Sets up auditing for critical files and directories.
- **Compliance Reporting:** Generates a detailed HTML report post-hardening.

## 🚀 Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/web3sahb/sentinel-linux-hardener.git
cd sentinel-linux-hardener

# 2. Make the script executable
chmod +x sentinel.sh

# 3. Run Sentinel (requires root)
sudo ./sentinel.sh

PROJECT STRUCTURE:
sentinel-linux-hardener/
├── sentinel.sh                 # Main orchestration script
├── modules/                    # Modular hardening scripts
│   ├── 01_ssh_hardening.sh
│   ├── 02_firewall_setup.sh
│   ├── 03_kernel_hardening.sh
│   └── 04_auditd_setup.sh
├── config/                     # Configuration templates
│   ├── sysctl.conf.sentinel
│   └── audit.rules.sentinel
├── templates/                  # Report templates
│   └── compliance-report.html
├── tests/                      # Integration tests
│   └── test_ssh_config.sh
└── logs/                       # Execution logs
