-- https://w3c.github.io/manifest/#dom-manifestimageresource
let DisplayMode
    : Type
    = < fullscreen | standalone | minimal-ui | browser >

in  { Type = DisplayMode, default = DisplayMode.browser }
