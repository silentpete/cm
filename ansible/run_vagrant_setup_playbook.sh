#!/bin/bash

ANSIBLE_ROLES_PATH=/code/github.com/silentpete/cm/ansible/roles /code/github.com/silentpete/cm/ansible/playbooks/vagrant_setup.playbook.yml -i /code/github.com/silentpete/cm/ansible/inventory -D -v
