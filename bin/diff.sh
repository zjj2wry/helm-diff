#!/bin/bash
set -euo pipefail

usage() {
cat << EOF
Diff release manifest or values.

Available Commands:
  manifest        Show the output of release manifest different
  values          Show the output of release values different
EOF
}

manifest() {
diff <(helm get manifest ${RELEASE} --revision ${firstRevision}) <(helm get manifest ${RELEASE} --revision ${secondRevison}) -c
}

values() {
diff <(helm get values ${RELEASE} --revision ${firstRevision}) <(helm get values ${RELEASE} --revision ${secondRevison}) -c 
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
