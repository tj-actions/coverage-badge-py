[![CI](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/test.yml) [![Update release version.](https://github.com/tj-actions/coverage-badge-py/actions/workflows/sync-release-version.yml/badge.svg)](https://github.com/tj-actions/coverage-badge-py/actions/workflows/sync-release-version.yml) <a href="https://github.com/search?q=tj-actions+coverage-badge-py+path%3A.github%2Fworkflows+language%3AYAML&type=code" target="_blank" title="Public workflows that use this action."><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fapi-tj-actions.vercel.app%2Fapi%2Fgithub-actions%2Fused-by%3Faction%3Dtj-actions%2Fcoverage-badge-py%26badge%3Dtrue" alt="Public workflows that use this action."></a>

coverage-badge-py
-----------------

Generate coverage.py badge like this ![coverage badge](./coverage.svg) without uploading results to a 3rd party site.

## Usage:

```yaml
...
    steps:
      - uses: actions/checkout@v2
      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v1.2
```

> NOTE: :warning:
> * It's important that you run this action from the directory where the .coverage data file is located.

## Inputs

|   Input       |    type    |  required     |  default                      |  description  |
|:-------------:|:-----------:|:-------------:|:----------------------------:|:-------------:|
| output        |  `string`   |   `true`     |  `coverage.svg`       |  The output path for <br /> the generated coverage badge. |
| overwrite     |  `string`   |   `true`     |   `'true'`            |  Boolean string used to  <br /> determine wheter to overwrite <br /> an existing badge.  |



### Example

```yml
...
    steps:
      - uses: actions/checkout@v2
        with: 
          fetch-depth: 0
      - name: Coverage Badge
        uses: tj-actions/coverage-badge-py@v1.2
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


* Free software: [MIT license](LICENSE)

If you feel generous and want to show some extra appreciation:

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[buymeacoffee]: https://www.buymeacoffee.com/jackton1
[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png


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
