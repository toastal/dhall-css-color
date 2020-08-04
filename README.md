# dhall-css-colors

TODO


- - -


### Installation / Setup / Tooling

Locally, [`asdf`](https://asdf-vm.com/) and the `dhall` plugin are used. Versions are specified in `.tool-versions`.

In GitLab’s CI, uses [Docker](https://www.docker.com/) images. A custom Docker image is pushed to the GitLab’s [container registry](https://gitlab.com/toastal/dhall-webmanifest/container_registry) built on [Alpine Linux](https://www.alpinelinux.org/) and copying `dhall`-related binaries from [`dhallhaskell`](https://hub.docker.com/r/dhallhaskell/dhall/tags) on Docker Hub.

Shell scripts are built using `dash` and `fish` shells for speed or features respectively.

In the future, I’d prefer to use [Nix](https://nixos.org/) to skip the finicky bits with Docker and with `asdf`.


- - -


## License

This project is licensed under the BSD 3-Clause “New” or “Revised” License - see the [LICENSE](./LICENSE) file for details.


## Funding

If you want to make a small contribution to the maintanence of this project

- [Liberapay](https://liberapay.com/toastal/)
