-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#grays
-}
let Alpha = ../Unit/alpha-value.dhall

let Alphatize = ../Utils/Alphatize.dhall

let Gray
    : Type
    = Alphatize.Type ⩓ { lightness : Double }

let default = Alphatize::{=}

let show4
    : Gray → Text
    = λ(gray_ : Gray) →
        "gray(${Alphatize.concatSep
                  " "
                  [ Double/show gray_.lightness ]
                  gray_.alpha})"

let show
    : Gray → Text
    = show4

let gray
    : Double → Gray
    = λ(lightness : Double) → default ⫽ { lightness }

let graya
    : Double → Alpha.Type → Gray
    = λ(lightness : Double) →
      λ(alpha : Alpha.Type) →
        default ⫽ { lightness, alpha = Some alpha }

let example0 = assert : show4 (gray 34.0) ≡ "gray(34.0)"

let example1 =
      assert : show4 (graya 94.0 (Alpha.Percentage 44.5)) ≡ "gray(94.0 44.5%)"

in  { Type = Gray, default, Alpha, show, show4, gray, graya }
