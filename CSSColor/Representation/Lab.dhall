-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#lab-colors
-}
let Alpha = ../Unit/alpha-value.dhall

let Percentage = ../Unit/percentage.dhall

let Alphatize = ../Utils/Alphatize.dhall

let Lab
    : Type
    = Alphatize.Type ⩓ { lightness : Percentage.Type, a : Double, b : Double }

let default = Alphatize::{=}

let show4
    : Lab → Text
    = λ(lab_ : Lab) →
        "lab(${Alphatize.concatSep
                 " "
                 [ Percentage.show lab_.lightness
                 , Double/show lab_.a
                 , Double/show lab_.b
                 ]
                 lab_.alpha})"

let show
    : Lab → Text
    = show4

let lab
    : Percentage.Type → Double → Double → Lab
    = λ(lightness : Percentage.Type) →
      λ(a : Double) →
      λ(b : Double) →
        default ⫽ { lightness, a, b }

let laba
    : Percentage.Type → Double → Double → Alpha.Type → Lab
    = λ(lightness : Percentage.Type) →
      λ(a : Double) →
      λ(b : Double) →
      λ(alpha : Alpha.Type) →
        default ⫽ { lightness, a, b, alpha = Some alpha }

let example0 = assert : show4 (lab 90.0 20.0 100.0) ≡ "lab(90.0% 20.0 100.0)"

let example1 =
        assert
      :   show4 (laba 41.0 5.0 10.0 (Alpha.Number 0.5))
        ≡ "lab(41.0% 5.0 10.0 0.5)"

in  { Type = Lab, Alpha, Percentage, default, show, show4, lab, laba }
