# dhall-css-colors

[CSS colors](https://www.w3.org/TR/css-color-4/) in the [Dhall](https://dhall-lang.org/) configuration language. The purpose is to give a Typed CSS-like DSL for colors which you can `show` in other configuration files. Currently this supports the CSS level 4 spec. `Color.show3` can turn some repesentations into into CSS3-compatible ones (requires a CSS3-compatible representation, as conversions aren’t really possible without `Double` math in Dhall).

This project is available on [GitLab](https://gitlab.com/toastal/dhall-css-color)

## Usage

```dhall
-- Pick a tag/commit hash! Freeze it too!
let Color =
      https://gitlab.com/toastal/dhall-css-color/raw/trunk/CSSColor/Color.dhall ? sha256:…

let colors
    : List Color.Type
    = [ Color.hex 0xff 0x00 0x00
      , Color.hexa 0x00 0xcc 0xff 0x23
      , Color.named Color.Named.Type.firebrick
      , Color.system Color.System.Type.CanvasText
      , Color.currentColor
      , Color.transparent
      , Color.rgba 255.0 255.0 170.0 (Color.Alpha.Number 0.5)
      , Color.hsl (Color.Hue.Angle (Color.Angle.turn 0.25)) 70.0 35.5
      , Color.hwba
          (Color.Hue.Angle (Color.Angle.rad 1.0))
          30.0
          88.8
          (Color.Alpha.Number 0.7)
      , Color.lab 41.0 5.0 90.0
      , Color.lcha
          62.5
          20.0
          (Color.Hue.Number 170.2)
          (Color.Alpha.Percentage 66.67)
      , Color.gray 50.0
      , Color.device-cmyk
          (Color.CMYKComponent.Type.Number 0.1)
          (Color.CMYKComponent.Type.Number 0.2)
          (Color.CMYKComponent.Type.Number 0.4)
          (Color.CMYKComponent.Type.Number 0.8)
      ]

let colorsAsText
    : List Text
    = List/map Color.Type Text Color.show colors

let assert0 =
        assert
      :   colorsAsText
        ≡ [ "#f00"
          , "#00ccff23"
          , "firebrick"
          , "CanvasText"
          , "currentColor"
          , "transparent"
          , "rgb(255.0 255.0 170.0 0.5)"
          , "hsl(0.25turn 70.0% 35.5%)"
          , "hwb(1.0rad 30.0% 88.8% 0.7)"
          , "lab(41.0% 5.0 90.0)"
          , "lch(62.5% 20.0 170.2 66.67%)"
          , "gray(50.0)"
          , "device-cmyk(0.1 0.2 0.4 0.8)"
          ]

in  colorsAsText : List Text
```
(sorry, no syntax highlighting; [`rouge` issue #1054](https://github.com/rouge-ruby/rouge/issues/1054))


## TODO

- [Profiled, device-dependent color that can be defined in arbitrary color spaces](https://www.w3.org/TR/css-color-4/#icc-colors)
- Wait for a solution for the `Hex` mess
- Conversions between representations (currently, I think only `Hex` to `RGB` will be possible due to `Double` not being mathable)

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
