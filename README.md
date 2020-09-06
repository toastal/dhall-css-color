# dhall-css-colors

Typed colors matching the CSS4 spec. `Color.show3` can turn some repesentations into into CSS3-compatible ones.

## How to use

```dhall
let Color =
      https://gitlab.com/toastal/dhall-css-color/trunk/CSSColor/Color.dhall ? sha256:…

let colors
    : List Color.Type
    = [ Color.hex 0xff 0x00 0x00
      , Color.hexa 0x00 0xcc 0xff 0x23
      , Color.named Color.Named.Type.firebrick
      , Color.currentColor
      , Color.transparent
      , Color.rgba 255.0 255.0 170.0 (Color.Alpha.Number 0.5)
      , Color.hsl (Color.Hue.Angle (Color.Angle.turn 0.25)) 70.0 35.5
      , Color.lcha 62.5 20.0 (Color.Hue.Number 170.2) (Color.Alpha.Percentage 66.67)
      , Color.gray 50.0
      ]

let List/map =
      https://prelude.dhall-lang.org/v18.0.0/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let colorsAsText
    : List Text
    = List/map Color.Type Text Color.show colors

let assert0 =
        assert
      :   colorsAsText
        ≡ [ "#f00"
          , "#00ccff23"
          , "firebrick"
          , "currentColor"
          , "transparent"
          , "rgb(255.0 255.0 170.0 0.5)"
          , "hsl(0.25turn 70.0% 35.5%)"
          , "lch(62.5% 20.0 170.2 66.67%)"
          , "gray(50.0)"
          ]

in  colorsAsText : List Text
```
(sorry, no syntax highlighting; [`rouge` issue #1054](https://github.com/rouge-ruby/rouge/issues/1054))


## TODO

- `RGB` can take percentages according to the spec
- [Profiled, device-dependent color that can be defined in arbitrary color spaces](https://www.w3.org/TR/css-color-4/#icc-colors)
- Wait for a solution for the `Hex` mess

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
