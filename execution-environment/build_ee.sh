AAH=quay.io/automationiberia/aap

ansible-builder build --tag ${AAH}/${1}
podman login ${AAH} --username admin --password redhat00 --tls-verify=false
podman push ${AAH}/${1} --tls-verify=false
