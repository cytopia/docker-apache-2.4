#!/bin/sh -eu


###
### Globals
###
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/.."
IMAGE="${1}"

###
### Retrieve information afterwards and Update README.md
###
INFO="$( docker run --rm --entrypoint=httpd "${IMAGE}" -V 2>&1 | tr -d '\r' )"

echo "${INFO}"
sed -i'' '/##[[:space:]]Version/q' "${CWD}/README.md"
echo "" >> "${CWD}/README.md"
echo '```' >> "${CWD}/README.md"
echo "${INFO}" >> "${CWD}/README.md"
echo '```' >> "${CWD}/README.md"
