echo "Stopping docker and containerd, please wait... "

# systemctl stop docker.service
systemctl stop docker.socket
systemctl stop containerd.service

echo "Removing xtables.lock"

rm /run/xtables.lock

echo "Done"
