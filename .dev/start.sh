#!/usr/bin/env bash
set -x

vagrant up default --no-provision
vagrant snapshot save default up.initial
vagrant halt
vagrant up default
vagrant snapshot save default installed
