#!/bin/sh
time vagrant up
time vagrant ssh uluwatu.jstm.local -c "sudo salt '*' state.highstate saltenv=jstm_dev" > setup-dev-environment.log
