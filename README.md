[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge\&logo=ubuntu\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge\&logo=macos\&logoColor=F0F0F0)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge\&logo=windows\&logoColor=white)](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idruns-on)
[![Public workflows that use this action.](https://img.shields.io/endpoint?style=for-the-badge\&url=https%3A%2F%2Fused-by.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3Dtj-actions%2Fcoverage-badge-py%26badge%3Dtrue)](https://github.com/search?o=desc\&q=tj-actions+coverage-badge-py+path%3A.github%2Fworkflows+language%3AYAML\&s=\&type=Code)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/86bb91ca02aa430e9a84233fc2f4333a)](https://app.codacy.com/gh/tj-actions/coverage-badge-py/dashboard?utm_source=gh\&utm_medium=referral\&utm_content=\&utm_campaign=Badge_grade)
[![CI](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml)
[![Update release version.](https://github.com/tj-actions/coverage-badge-py/actions/workflows/sync-release-version.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/sync-release-version.yml)

## coverage-badge-py

Generate coverage.py badge like this ![coverage badge](./coverage.svg) without uploading results to a 3rd party site.

## Usage:

```yaml
...
    steps:
      - uses: actions/checkout@v4
      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v2
```

> \[!Warning]
>
> *   It's important that you run this action from the directory where the .coverage data file is located.

If you feel generous and want to show some extra appreciation:

Support this project with a :star:

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[buymeacoffee]: https://www.buymeacoffee.com/jackton1

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png

## Inputs

<!-- AUTO-DOC-INPUT:START - Do not remove or modify this section -->

```yaml
- uses: tj-actions/coverage-badge-py@v2
  id: coverage-badge-py
  with:
    # Output path to write the 
    # coverage badge. 
    # Type: string
    # Default: "coverage.svg"
    output: ''

    # Overwrite an existing coverage badge.
    # Type: boolean
    # Default: "true"
    overwrite: ''

    # Current working directory
    # Type: string
    # Default: "."
    working-directory: ''

```

<!-- AUTO-DOC-INPUT:END -->

### Example

```yml
...
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-python@v4
        with:
          python-version: 3.11

      - name: Install dependencies
        ...

      - name: Run coverage
        run: |
          coverage run ...
          coverage report -m

      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v2

      - name: Verify Changed files
        uses: tj-actions/verify-changed-files@v16
        id: verify-changed-files
        with:
          files: coverage.svg

      - name: Commit files
        if: steps.verify-changed-files.outputs.files_changed == 'true'
        run: |
          git config --local user.email "github-actions[bot]@users.noreply.github.com"
          git config --local user.name "github-actions[bot]"
          git add coverage.svg
          git commit -m "Updated coverage.svg"

      - name: Push changes
        if: steps.verify-changed-files.outputs.files_changed == 'true'
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.github_token }}
          branch: ${{ github.ref }}
```

*   Free software: [MIT license](LICENSE)

## Credits

This package was created with [Cookiecutter](https://github.com/cookiecutter/cookiecutter).

*   [coverage-badge](https://github.com/dbrgn/coverage-badge)

## Report Bugs

Report bugs at https://github.com/tj-actions/coverage-badge-py/issues.

If you are reporting a bug, please include:

*   Your operating system name and version.
*   Any details about your workflow that might be helpful in troubleshooting.
*   Detailed steps to reproduce the bug.
