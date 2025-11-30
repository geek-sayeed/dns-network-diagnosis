#  DNS & Network Diagnostics Toolkit
 A dual-function repository showcasing critical systems administration skills: integrating automated data backups with periodic security and compliance auditing.
 # **1. Data Integrity:** backup_manager.sh
This script handles secure, versioned backups of critical configuration files and user data. It ensures rapid recovery and minimizes data loss risk.

# Implementation Details

**Automated Archiving:** Creates timestamped compressed archives (.tar.gz) of specified directories.

**Integrity Check:** Includes basic validation checks (e.g., confirming the archive size) after creation to ensure the backup is not corrupt.

**Storage Optimization:** Implements a retention policy to delete backups older than a configurable number of days, managing storage costs and space.

# Security & Compliance: security_audit.sh

A lightweight auditing script designed to enforce and verify basic Linux security best practices on an ongoing basis.

**Audited Checks**

**User Privileges:** Identifies users with UID 0 (root-level access) to flag potential security risks.

**Sudoers File Audit:** Checks permissions and integrity of the /etc/sudoers file.

**Insecure Permissions:** Locates files and directories with world-writable or overly permissive settings.

**Package Check:** Lists installed security-relevant packages (e.g., firewall tools, auditing utilities) to confirm compliance baseline.
