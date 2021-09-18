# hcltm-action

This action wraps https://github.com/xntrik/hcltm, the threat modelling with HCL tool, and allows practitioners to easily generate Dashboards, or validate `hcltm` threat model files with [GitHub Actions](https://github.com/features/actions).

## Usage Examples

### Automatically validate `hcltm` spec HCL files

This example workflow will kick off for any `push` or `pull requests`, and will validate all `.hcl` files in the `hcl-files` folder.

```yaml
name: hcltm validate

on: [push, pull_request]

jobs:
  hcltm-validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: hcltm validate
        uses: xntrik/hcltm-action@v0.0.2
        with:
          command: 'validate'
          files: './hcl-files/*'
```

You can see a working example of this workflow at [hcltm-actions-example](https://github.com/xntrik/hcltm-action-example/actions).

### Generate a Dashboard and re-commit it to the repo

This example workflow will kick off any pushes to the `main` branch, and will also run the validation first. It will then commit back to the repo.

```yaml
name: hcltm dashboard

on:
  push:
    branches:
      - main

jobs:
  hcltm-dashboard:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: HCLTM Validate
        uses: xntrik/hcltm-action@v0.0.2
        with:
          command: 'validate'
          files: './hcl-files/*'
      - name: HCLTM Dashboard
        uses: xntrik/hcltm-action@v0.0.2
        with:
          command: 'dashboard'
          files: './hcl-files/*'
          outdir: './dashboard'
      - name: Commit dashboard
        run: |
          git config --global user.name "HCLTM Git Action"
          git config --global user.email "yourname@users.noreply.github.com"
          git add ./dashboard
          git commit -m "Automated updated dashboard"
          git push
```

You can see a working example of this workflow at [hcltm-actions-example](https://github.com/xntrik/hcltm-action-example/actions).

## Supported Parameters

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `command` \* | This is the `hcltm` command to execute. Needs to be `validate`, `dashboard`, or `dfd` | `validate` |
| `files` \* | This is the location of files in the repo to parse with `hcltm` | `*` |
| `outdir` | For the `dashboard` or `dfd` mode, this is required, and is where the generated output will be written | |

### Notes

- Parameters with the `*` are required.

## Event Triggers

The GitHub Actions framework allows you to trigger this (and other) actions on _many combinations_ of events. Read through [Workflow syntax for GitHub Actions](https://help.github.com/en/articles/workflow-syntax-for-github-actions) for ideas and advanced examples.

## License

The source code for this project is released under the [MIT License](LICENSE). This project is not associated with GitHub.