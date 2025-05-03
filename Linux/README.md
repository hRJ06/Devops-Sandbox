# Linux Command Reference Guide

<p align="center">
  <img src="https://github.com/user-attachments/assets/a9fdb210-5e24-4d51-a53e-5e1f4eedc27c" alt="Linux Architecture"/>
</p>

---

## 📁 Basic File & Directory Commands

| Command | Description |
|---------|-------------|
| `echo` | Display text on the shell |
| `pwd` | Show the present working directory |
| `mkdir` | Create a new directory |
| `ls` | List files and folders |
| `ls -a` | Show hidden files |
| `touch file.txt` | Create a new file |
| `cd directory/` | Change to a specified directory |
| `cd ..` | Move one directory up |
| `cd` or `cd ~` | Go to the home directory |
| `mv file.txt folder/` | Move `file.txt` into `folder/` |
| `cp file.txt folder/` | Copy `file.txt` to `folder/` |
| `rm file.txt` | Delete a file |
| `rmdir folder/` | Delete an empty directory |
| `rm -r folder/` | Recursively delete a folder and its contents |
| `find . -name filename` | Search for a file in the current directory |

---

## 📝 Text File Editing

| Command | Description |
|---------|-------------|
| `vim file.txt` | Open file in Vim editor |
| *(Inside Vim)* | |
| `i` | Enter insert mode |
| `Esc + :wq` | Save and quit |

---

## 📦 Package Management (APT)

| Command | Description |
|---------|-------------|
| `sudo apt-get update` | Update package list |
| `sudo apt-get upgrade` | Upgrade installed packages |
| `sudo apt-get install <package>` | Install a package |

---

## ⚙️ System & Services

| Command | Description |
|---------|-------------|
| `sudo systemctl start nginx` | Start nginx |
| `systemctl status nginx` | Show nginx status |
| `sudo systemctl enable nginx` | Enable nginx on boot |

---

## 👤 User and Group Management

| Command | Description |
|---------|-------------|
| `sudo useradd -m <username> -s /bin/bash` | Add user with home and shell |
| `sudo passwd <username>` | Set user password |
| `sudo userdel <username>` | Delete a user |
| `sudo groupadd <groupname>` | Create a group |
| `sudo gpasswd -M user1,user2 groupname` | Add users to a group |
| `sudo usermod -aG groupname username` | Append user to group |
| `su username` | Switch user |
| `whoami` | Show current logged-in user |

---

## 🔐 File Permissions and Ownership

| Command | Description |
|---------|-------------|
| `sudo chown username filename` | Change file owner |
| `sudo chgrp groupname filename` | Change file group |

---

## 🔍 Searching and Filtering

| Command | Description |
|---------|-------------|
| `grep -i "keyword" filename` | Case-insensitive search in file |
| `| head` / `| head -n 5` | Get first 10 / 5 records |
| `| tail` / `| tail -n 5` | Get last 10 / 5 records |
| `awk '/filter/ { if($1=="cond1" && $2=="cond2") print $1, $2, $12, $13, $14, $15 }' filename` | Filter & print selected columns |
| `sed "s/old/new/g" filename | uniq` | Replace & show unique results |

---

## 🌐 Networking Commands

| Command | Description |
|---------|-------------|
| `nslookup domain.com` | Get IP address of domain |
| `traceroute domain.com` | Trace route to domain |
| `ping domain.com` | Ping a server |
| `wget file-url` | Download a file |

---

## 💾 Disk and Volume Management

| Command | Description |
|---------|-------------|
| `lsblk` | List attached volumes |
| `df -h` | Show mounted disk usage |
| `pvcreate /dev/xvdf /dev/xvdg` | Create physical volumes |
| `pvs` | Show physical volumes |
| `lvs` | Show logical volumes |
| `vgcreate vg-name /dev/xvdf /dev/xvdg` | Create volume group |
| `vgs` | Show volume groups |
| `lvcreate -L 10G -n lv-name vg-name` | Create logical volume |
| `mkfs.ext4 /dev/vg-name/lv-name` | Format logical volume |
| `mount /dev/vg-name/lv-name /mnt/dir` | Mount volume |
| `umount /mnt/dir` | Unmount volume |
| `lvextend -L +5G /dev/vg-name/lv-name` | Extend logical volume size |

---

## 🧳 Compression & Archiving

| Command | Description |
|---------|-------------|
| `zip -r /location/filename.zip folder/` | Zip a folder |
| `unzip filename.zip` | Unzip archive |

---

## 🕒 Scheduling & Monitoring

| Command | Description |
|---------|-------------|
| `crontab -e` | Edit cron jobs |
| `watch ls` | Watch live changes to directory content |

---

## ✅ Conditionals & Variables

| Command | Description |
|---------|-------------|
| `if [ -f filename.txt ]` | Check if file exists |
| `${#var}` | Get length of a variable |

---

## 📅 Date Formatting

| Command | Description |
|---------|-------------|
| `date +'%Y-%m-%d'` | Display date in format YYYY-MM-DD |

---

Feel free to clone and customize this guide to suit your development environment or team knowledge base.
