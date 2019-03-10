Role Name
=========

Ansible playbook to create a KVM guest from a qcow2 image, register to RHN, install minimal packages and register to an IDM server.

Requirements
------------

This role is tested on Ansible 2.7.7 and rhel 7 .

Dependencies
------------
N/A

Example Playbook
----------------
It is composeby 3 playbooks.

kvm.yml --> rhn_register.yml --> resolv_ipa.yml

 Create file vars/vault.yml with redhat account user
```
cat < EOF > vars/vault.yml 
vault_rhn_user: redhat-support-active-account 
vault_rhn_pwd: p4$$W0rD
vault_rhn_pool_id: 01123581321245589144233377610987
EOF
```
Encrypted with vault

```
ansible-vault create vars/vault.yml
ansible-vault encrypt vars/vault.yml
ansible-vault edit vars/vault.yml
```

Execute playbook

```
ansible-playbook -i inventory test.yml -K --ask-vault-pass
```


License
-------

GPLv3

Author Information
------------------
silvinux - silvinux7@gmail.com
