#!/bin/bash

ansible-playbook ./playbooks/vagrant_setup.playbook.yml -i ./inventory.yml -l localhost
