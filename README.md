[![CI](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml)

coverage-badge-py
-----------------

Generate coverage.py badge like this ![coverage badge](./coverage.svg) without uploading results to a 3rd party.

## Usage:

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v1
```

> NOTE: :warning:
> * It's important that you run this action from the directory where the .coverage data file is located.

## Inputs

|   Input       |    type    |  required     |  default                      |  description  |
|:-------------:|:-----------:|:-------------:|:----------------------------:|:-------------:|
| token         |  `string`   |    `true`    | `${{ github.token }}` | [GITHUB_TOKEN](https://docs.github.com/en/free-pro-team@latest/actions/reference/authentication-in-a-workflow#using-the-github_token-in-a-workflow) <br /> or a repo scoped <br /> [Personal Access Token](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token)              |
| output        |  `string`   |   `true`     |  `coverage.svg`       |  The output path for <br /> the generated coverage badge. |
| overwrite     |  `string`   |   `true`     |   `'true'`            |  Boolean string used to  <br /> determine wheter to overwrite <br /> an existing badge.  |



### Example

```yml
...
    steps:
      - uses: actions/checkout@v2
      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v1
      - name: Verify Changed files
        uses: tj-actions/verify-changed-files@v5.1
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
          branch: ${{ github.head_ref }}
```


* Free software: [MIT license](LICENSE)


Credits
-------

This package was created with [Cookiecutter](https://github.com/cookiecutter/cookiecutter).



Report Bugs
-----------

Report bugs at https://github.com/tj-actions/coverage-badge-py/issues.

If you are reporting a bug, please include:

* Your operating system name and version.
* Any details about your workflow that might be helpful in troubleshooting.
* Detailed steps to reproduce the bug.
