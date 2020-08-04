-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
let Transparent
    : Type
    = {}

let show3
    : Transparent → Text
    = λ(t : Transparent) → "transparent"

let show4
    : Transparent → Text
    = show3

let show
    : Transparent → Text
    = show4

let example0 = assert : show {=} ≡ "transparent"

in  { Type = Transparent, show, show3, show4 }
