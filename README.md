coverage-badge-py
-----------------

Generate coverage.py badge like this ![coverage badge](./coverage.svg)

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
| output        |  `string`   |   `true`     |  `coverage.svg`       |  The output path for the generated coverage badge. |
| overwrite     |  `string`   |   `true`     |   `'true'`            |  Boolean string to overwrite an existing badge.  |



* Free software: [MIT license](LICENSE)

Features
--------

* TODO


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
