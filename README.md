# wercker-step-go-build-version

> Exports the version in the version.go file to an environment variable.

## Usage
Ensure there is a file called `version.go` in the root directory of the golang project that looks something like:

```
package <your package>

const Name = "<your app name>"
const Version string = "1.0.0"

```


Add the following step in the deploy stage of your wercker.yml:

```
- randomeizer/go-build-version
```

You can also specify the name of the environment variable. The following example will export the
version in the `APP_VERSION` environment variable.

```
- randomeizer/go-build-version:
    envvar: APP_VERSION
```

You might want to use it with [ghr](http://deeeet.com/ghr/) to release to GitHub automatically. If so, you might have a deploy section like so:
```
deploy:
  steps:
    - randomeizer/go-build-version
    - tcnksm/ghr:
        token: $GITHUB_TOKEN
        input: dist
        version: ${BUILD_VERSION}-prerelease
        pre_release: true
        replace: true
  release:
    - randomeizer/go-build-version
    - tcnksm/ghr:
        token: $GITHUB_TOKEN
        input: dist
        version: ${BUILD_VERSION}
        replace: true
```

## Why

This way it is possible to tag a build that is being deployed with the version specified in the `version.go` file.

## Author

- David Peterson [<david@randombits.org>]

Based on [SamVerchueren/wercker-step-package-version](https://github.com/SamVerschueren/wercker-step-package-version)

## License

[MIT](LICENSE)