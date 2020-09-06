-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#lab-colors
-}
let Alpha =
        ../Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ../Unit/alpha-value.dhall

let Percentage =
        ../Unit/percentage.dhall sha256:8ea5e1742af03a480c62dc10f6cfc8a81b69dace467857ab0865c869f070f7ef
      ? ../Unit/percentage.dhall

let Alphatize =
        ../Utils/Alphatize.dhall sha256:0bad82995850661aa0d3c0f21cba23bcce78728f6326345bccf5afe8150951b2
      ? ../Utils/Alphatize.dhall

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
