# GitVersion (gitversion)

Installs the GitVersion CLI as a .NET global tool and configures an alias for easy access.

https://gitversion.net/

## Example Usage

```json
"features": {
    "ghcr.io/devbost/devcontainer-features/gitversion:1": {
        "version": "latest"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of GitVersion.Tool to install [(Available versions)](https://www.nuget.org/packages/GitVersion.Tool/#versions-body-tab) | string | latest |

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/devcontainers/feature-starter/blob/main/src/gitversion/devcontainer-feature.json). Add additional notes to a `NOTES.md`._
