#!/usr/bin/env bash
set -x

cd ~
git clone --recurse-submodules https://github.com/viky-ai/viky-ai.git
cd viky-ai/webapp
./bin/setup
