Role Name
=========

Ansible playbook to create a KVM guest from a qcow2 image, register to RHN, install minimal packages and register to an IDM server.

Requirements
------------

This role is tested on Ansible 2.16.4

Dependencies
------------
N/A

Example Playbook
----------------
sat_register.yml

.Create file `vault_sat_vars.yaml` with redhat account user
```
cat < EOF > vault_sat_vars.yaml
---
satellite_hostname: satellite614.server.lab
satellite_insecure: true
satellite_update: false
satellite_ak: test
satellite_force: true
satellite_organization: org
satellite_location: lab
auth_bearer: Bearer TOKEN_GENERATED_FROM_GLOBAL_REGISTRATION_FORM
...
EOF
```
Encrypted with vault

```
ansible-vault create vault_sat_vars.yaml
ansible-vault encrypt vault_sat_vars.yaml
ansible-vault edit vault_sat_vars.yaml
```

rhn_register.yml

.Create file `vault_rhn_vars.yaml` with redhat account user
```
cat < EOF > vault_rhn_vars.yaml
vault_rhn_user: redhat-support-active-account
vault_rhn_pwd: p4$$W0rD
vault_rhn_pool_id: 01123581321245589144233377610987
EOF
```
Encrypted with vault

```
ansible-vault create vault_rhn_vars.yaml
ansible-vault encrypt vault_rhn_vars.yaml
ansible-vault edit vault_rhn_vars.yaml
```

Execute playbook

```
ansible-playbook sat_register.yml -e@aap.yaml -e@vault_sat_vars.yaml --ask-vault-pass
ansible-playbook rhn_register.yml -e@aap.yaml -e@vault_rhn_vars.yaml --ask-vault-pass

ansible-navigator run get_ip_location.yml -i inventory -m stdout --eei localhost/ee-satreg --pp never

```


License
-------

GPLv3

Author Information
------------------
silvinux - silvinux7@gmail.com
