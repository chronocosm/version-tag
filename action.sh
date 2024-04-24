#!/bin/sh
set -eu

# Support private repositories.

if [[ ! -z "${GITHUB_AUTHENTICATION_TOKEN}" ]]; then
    git config --global --add url."https://x-access-token:${GITHUB_AUTHENTICATION_TOKEN}@github.com/".insteadOf "https://github.com/"
fi

# Apply hotfix for 'fatal: unsafe repository' error.

git config --global --add safe.directory "${GITHUB_WORKSPACE}"

# Required git configuration.

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

# Make the tag.

cd "${GITHUB_WORKSPACE}" || exit
git tag -a "v${GITHUB_REF_NAME}" -m "vM.m.P tag; Version: ${GITHUB_REF_NAME}; Actor: ${GITHUB_ACTOR}; SHA: ${GITHUB_WORKFLOW_SHA}"
git push origin "v${GITHUB_REF_NAME}"
