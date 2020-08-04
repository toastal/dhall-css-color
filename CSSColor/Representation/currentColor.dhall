-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
let CurrentColor
    : Type
    = {}

let show3
    : CurrentColor → Text
    = λ(c : CurrentColor) → "currentColor"

let show4
    : CurrentColor → Text
    = show3

let show
    : CurrentColor → Text
    = show4

let example0 = assert : show {=} ≡ "currentColor"

in  { Type = CurrentColor, show, show3, show4 }
