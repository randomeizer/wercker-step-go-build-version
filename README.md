# wercker-step-go-version

> Exports the version in the version.go file to an environment variable.

## Usage

The following step will put the version in the `GO_VERSION` environment variable.

```
- randomeizer/go-version
```

You can also specify the name of the environment variable. The following example will export the
version in the `APP_VERSION` environment variable.

```
- randomeizer/go-version:
    envvar: APP_VERSION
```

## Why

This way it is possible to tag a build that is being deployed with the version specified in the
`version.go` file.

## Author

- David Peterson [<david@randombits.org>]

Based on [SamVerchueren/wercker-step-package-version](https://github.com/SamVerschueren/wercker-step-package-version)

## License

[MIT](LICENSE)