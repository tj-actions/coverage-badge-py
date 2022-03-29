[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e23e61d322ae45139844167ae395e30f)](https://app.codacy.com/gh/tj-actions/coverage-badge-py?utm_source=github.com\&utm_medium=referral\&utm_content=tj-actions/coverage-badge-py\&utm_campaign=Badge_Grade_Settings)
[![CI](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml)
[![Update release version.](https://github.com/tj-actions/coverage-badge-py/actions/workflows/sync-release-version.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/sync-release-version.yml)
[![Public workflows that use this action.](https://img.shields.io/endpoint?url=https%3A%2F%2Fused-by.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3Dtj-actions%2Fcoverage-badge-py%26badge%3Dtrue)](https://github.com/search?o=desc\&q=tj-actions+coverage-badge-py+path%3A.github%2Fworkflows+language%3AYAML\&s=\&type=Code)

[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Mac OS](https://img.shields.io/badge/mac%20os-000000?logo=macos\&logoColor=F0F0F0)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)

## coverage-badge-py

Generate coverage.py badge like this ![coverage badge](./coverage.svg) without uploading results to a 3rd party site.

## Usage:

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v1.8
```

> NOTE: :warning:
>
> *   It's important that you run this action from the directory where the .coverage data file is located.

If you feel generous and want to show some extra appreciation:

Support this project with a :star:

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[buymeacoffee]: https://www.buymeacoffee.com/jackton1

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->

|   INPUT   |  TYPE  | REQUIRED |     DEFAULT      |                 DESCRIPTION                 |
|-----------|--------|----------|------------------|---------------------------------------------|
| output    | string | true     | `"coverage.svg"` | Output path to write the<br>coverage badge. |
| overwrite | string | true     | `"true"`         | Overwrite an existing coverage badge.<br>   |

<!-- AUTO-DOC-INPUT:END -->

### Example

```yml
...
    steps:
      - uses: actions/checkout@v2
        with: 
          fetch-depth: 0

      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v1.8

      - name: Verify Changed files
        uses: tj-actions/verify-changed-files@v6
        id: changed_files
        with:
          files: coverage.svg

      - name: Commit files
        if: steps.changed_files.outputs.files_changed == 'true'
        run: |
          git config --local user.email "github-actions[bot]@users.noreply.github.com"
          git config --local user.name "github-actions[bot]"
          git add coverage.svg
          git commit -m "Updated coverage.svg"

      - name: Push changes
        if: steps.changed_files.outputs.files_changed == 'true'
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.github_token }}
          branch: ${{ github.ref }}
```

*   Free software: [MIT license](LICENSE)

# TODO

*   \[ ] Add support for running action on [![Windows](https://img.shields.io/badge/Windows-0078D6?logo=windows\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)

## Credits

This package was created with [Cookiecutter](https://github.com/cookiecutter/cookiecutter).

## Report Bugs

Report bugs at https://github.com/tj-actions/coverage-badge-py/issues.

If you are reporting a bug, please include:

*   Your operating system name and version.
*   Any details about your workflow that might be helpful in troubleshooting.
*   Detailed steps to reproduce the bug.
