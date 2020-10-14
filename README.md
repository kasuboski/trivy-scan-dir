# trivy-scan-dir
This image will download the latest version of [trivy](https://github.com/aquasecurity/trivy), search a directory for `yaml` files and match `image: <blank>`, and then scan those images using trivy.

The image expects the `yaml` files to be mounted at `/gitops`. If you want to exclude images from being scanned you can pass an `EXCLUDED` environment variable i.e. `EXCLUDED='no/scan also/noscan'`.

## Usage
docker:
`docker run -it --rm -v /path/to/yaml:/gitops -e EXCLUDED='no/scan also/noscan' kasuboski/trivy-scan-dir`

github actions:
```
jobs:
  scan-images:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Scan Images
      uses: docker://kasuboski/trivy-scan-dir:latest
      env:
        EXCLUDED: 'no/scan also/noscan'
```
