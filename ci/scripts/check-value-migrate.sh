#!/bin/bash

set -eu
source "$(dirname "$0")/helpers/expose-jumpbox.sh"
expose_jumpbox "${PWD}" "${JUMPBOX_SSH_KEY}" "${JUMPBOX_URL}"
bosh ssh etcd/0 -c "ETCDCTL_API=3 /var/vcap/jobs/etcd/bin/etcdctl get test-key | grep test-value"
bosh ssh etcd/0 -c "ETCDCTL_API=3 /var/vcap/jobs/etcd/bin/etcdctl member list | grep etcd.default.${BOSH_DEPLOYMENT}.bosh"