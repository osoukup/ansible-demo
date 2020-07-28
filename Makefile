# Ansible test project Makefile
# automates up and destroy steps

no-inventory:
	[[ ! -f inventory ]]

up: Vagrantfile sshpass.txt no-inventory
	echo "[test]" > inventory
	vagrant up | grep "SSH address" | cut -d " " -f8 | cut -d: -f1 >> inventory
	for addr in $$(tail -n 2 inventory); do sshpass -f sshpass.txt ssh-copy-id "vagrant@$$addr" -o StrictHostKeyChecking=no ; done

destroy: inventory
	vagrant destroy -f
	rm inventory
