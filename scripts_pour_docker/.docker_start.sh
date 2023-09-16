echo "Initialising docker, please wait..."
echo "Creatings file /run/xtables.lock so that docker doesn't panick..."
touch /run/xtables.lock

echo "Starting containerd and docker"
systemctl start containerd.service
systemctl start docker.socket
systemctl start docker.service

echo "Done"
