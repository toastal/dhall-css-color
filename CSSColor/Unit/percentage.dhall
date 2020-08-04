-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
let Percentage
    : Type
    = Double

let show
    : Percentage → Text
    = λ(percentage : Percentage) → Double/show percentage ++ "%"

let example0 = assert : show 100.0 ≡ "100.0%"

in  { Type = Percentage, show }
