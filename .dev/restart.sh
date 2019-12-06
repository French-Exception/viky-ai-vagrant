#!/usr/bin/env bash
set -x

vagrant snapshot delete default installed > /dev/null 2>&1
vagrant snapshot restore default up.initial --no-provision > /dev/null 2>&1
vagrant up default > /dev/null 2>&1
vagrant snapshot save default installed > /dev/null 2>&1
