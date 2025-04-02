## Golang Development Using Android
This project provides a set of scripts for setting up a **Golang** development environment on your Android device, using **Ubuntu** in **Termux**. It automates the installation and setup of necessary tools like **XFCE** (desktop environment), **Proot Distro** (for running Ubuntu), and **code-server** (for browser-based development).

## Prerequisites
Before running the scripts, make sure you have:
- **Termux** installed (available from [F-droid](https://f-droid.org/en/packages/com.termux/)).
- **Storage permission** granted to Termux for full functionality (using command **termux-setup-storage**).
- (Optional, if you want to use GUI for termux) Termux-X11 installed (available from [github](https://github.com/termux/termux-x11)).

## Setup and Installation
### 1. Clone the Repository
Clone this repository using:
```bash
git clone https://github.com/dabeeduu/termux-golang-dev/tree/main
cd termux-golang-dev
```
### 2. Run the Setup Script
Run the `setup_script.sh` to automate the installation and configuration of the environment:
```bash
bash setup_script.sh
```
Follow the on-screen prompts:
1. Username and Password Setup: You will be asked to create a new user with password.
2. Installation: The script will
	- Update and upgrade Termux packages
	- Install X11-repo, XFCE, Proot Distro, and necessary dependencies
	- Install Ubuntu via Proot Distro
	- Set up a new Ubuntu user and grant it sudo privileges
	- Install code-server for browser-based development
	- Install PostgreSQL (optional, if you need it for your development)
### 3. Running the XFCE Desktop Environment
Once the setup is complete, you can start the XFCE desktop environment by running the `start_script.sh`:
```bash
bash start_script.sh
```
This will log you into your Ubuntu environment and start the XFCE session using Termux-X11.
### 4. Running the code-server and PostgreSQL
Once you are in termux environment (not ubuntu), follow these steps to run PostgreSQL and code-server:
1. Start PostgreSQL: Run the following command to start the Postgres server: 
```
pgstart
```
2. Enter the Ubuntu Environment: Log into Ubuntu using the following command:
```bash
ubuntu
```
3. Run code-server: Inside Ubuntu environment, run code-server with this command:
```bash
code-server
```
4. Change the Password for code-server:
	- Go to the config.yaml file located in `~/.config/code-server/config.yaml`
	- Modify the `password` field to set your desired password for code-server
5. Access code-server in Your Browser:
	- Open your browser and go to `http://localhost:8080`
	- Enter the password you set in step 4
### Troubleshooting
#### Common Problems on Huawei Devices
1. Termux Not Full Screen on Huawei Tablet  
	Fix: Turn off App Multiplier on Huawei Setting for Termux
2. Termux-X11 Freezes Every 5 Seconds  
	Fix: Go to Termux App on Setting -> Power usage details -> Launch settings -> Turn off Manage automatically  
3. Termux Gets Killed Every So Often  
	Fix: Disable `MONITOR_PHANTOM_PROCS` using either ADB or Developer Mode on your Huawei device.
	```bash
	# For Android 12L & Android 13+
	./adb shell "settings put global settings_enable_monitor_phantom_procs false"
	# For Android 12
	./adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent; /system/bin/device_config put activity_manager max_phantom_processes 2147483647"
	```
