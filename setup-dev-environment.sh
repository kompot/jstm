#!/bin/sh
vagrant up
vagrant ssh uluwatu.jstm.local -c "sudo salt-run state.over saltenv=taskmanager_dev" > over.txt
