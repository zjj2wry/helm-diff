#!/bin/bash
set -euo pipefail

usage() {
cat << EOF
Diff release manifest or values.

Available Commands:
  manifest        Show the output of release manifest diffevent
  values          Show the output of release values diffevent
EOF
}

manifest() {
helm get manifest ${RELEASE} --revision ${firstRevision} > first.log
helm get manifest ${RELEASE} --revision ${secondRevison} > second.log
diff first.log second.log -c
}

values() {
helm get values ${RELEASE} --revision ${firstRevision} > first.log
helm get values ${RELEASE} --revision ${secondRevison} > second.log
diff first.log second.log -c
}

cmd="${1:-}"
firstRevision="${3:-}"
secondRevison="${4:-}"

case "${cmd}" in
  manifest)
    RELEASE="${2:-}"
    manifest
    ;;
  values)
    RELEASE="${2:-}"
    values
    ;;
  help|--help|-h)
    usage
    ;;
  *)
    usage
    exit 1
    ;;
esac
