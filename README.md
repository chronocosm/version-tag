# version-tag

A GitHub Action to create a Git tag in the format `vM.m.P` from the
[Semantically Versioned](https://semver.org/)
GitHub release tag.

## Overview

Using the SHA of a GitHub release,
create another Git tag with "v" prefixed to the
[Semantic Version](https://semver.org/).

**Note:**
[Is “v1.2.3” a semantic version?](https://semver.org/#is-v123-a-semantic-version)

## Use

1. To use, create a `.github/workflows/version-tag.yaml` file with the following contents:

    ```yaml
    name: version-tag.yaml

    on:
      push:
        tags:
          - "[0-9]+.[0-9]+.[0-9]+"

    jobs:
      build:
        name: Make a vM.m.P tag
        runs-on: ubuntu-latest
        steps:
          - name: Checkout repository
            uses: actions/checkout@v4
          - name: Make go version tag
            uses: chronocosm/version-tag@v1
    ```
