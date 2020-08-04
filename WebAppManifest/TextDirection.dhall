-- https://w3c.github.io/manifest/#dom-textdirectiontype
let TextDirection
    : Type
    = < ltr | rtl | auto >

in  { Type = TextDirection, default = TextDirection.auto }
