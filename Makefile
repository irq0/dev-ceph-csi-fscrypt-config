tumbleweed-fscrypt-image: Dockerfile
	podman build -t cephfscrypt:5000/fscrypt-tumbleweed:latest .

update-k3s-image:
	podman push --tls-verify=false cephfscrypt:5000/fscrypt-tumbleweed:latest
	kcli ssh cephfscrypt 'k3s ctr images pull cephfscrypt:5000/cephcsi:latest --plain-http'
