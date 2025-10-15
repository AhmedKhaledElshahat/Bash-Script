
# Bash User & Group Management Tool

A lightweight, modular Bash tool to automate common Linux system administration tasks for user and group management.

**Features**
- Add, modify and delete users (create home dir, set shell, add secondary groups).
- Lock (disable) and unlock (enable) user accounts.
- Change user passwords interactively.
- Create, rename, change GID, and delete groups.
- List system users (UID >= 1000) and list all groups.
- Simple “About” screen with project metadata.
- Menu-driven interface built with `select` for a clean text UI.
- Modular design: each menu action implemented as a separate script in `modules/` (or as functions), so it's easy to extend.
- Root-check (script refuses to run unless executed as root).
- Optional simulation/dry-run mode (recommended for testing) and optional logging to `/var/log/user_mgmt.log`.

**How it works**
The main script (`Project.sh`) presents a `select` menu and calls the corresponding scripts located in `modules/`, e.g. `modules/01_add_user.sh`. Each module executes the necessary system commands (`useradd`, `usermod`, `groupadd`, `groupdel`, `passwd`, `getent`, `awk`) with basic validation and friendly messages.

**Why use it**
- Automates repetitive admin tasks with predictable behavior.
- Modular and easy to customize for specific environments.
- Good for learning shell scripting best practices and safe system automation.

**Usage**
```bash
sudo ./Project.sh
