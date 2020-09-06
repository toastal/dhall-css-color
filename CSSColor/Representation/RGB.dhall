-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#funcdef-rgb
  Using the legacy comma syntax in the `show` for better compatibility
  TODO: percentages on red, green, blue
-}
let Alpha =
        ../Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ../Unit/alpha-value.dhall

let Alphatize =
        ../Utils/Alphatize.dhall sha256:0bad82995850661aa0d3c0f21cba23bcce78728f6326345bccf5afe8150951b2
      ? ../Utils/Alphatize.dhall

let RGB
    : Type
    = Alphatize.Type ⩓ { red : Double, green : Double, blue : Double }

let default = Alphatize::{=}

let show3
    : RGB → Text
    = λ(rgb_ : RGB) →
        let alpha3
            : Optional Alpha.AlphaValue3
            = Alphatize.downgradeTo3 rgb_.alpha

        in      (if Alphatize.null3 alpha3 then "rgb(" else "rgba(")
            ++  Alphatize.concatSep3
                  ", "
                  [ Double/show rgb_.red
                  , Double/show rgb_.green
                  , Double/show rgb_.blue
                  ]
                  alpha3
            ++  ")"

let show4
    : RGB → Text
    = λ(rgb_ : RGB) →
            "rgb("
        ++  Alphatize.concatSep
              " "
              [ Double/show rgb_.red
              , Double/show rgb_.green
              , Double/show rgb_.blue
              ]
              rgb_.alpha
        ++  ")"

let show
    : RGB → Text
    = show4

let rgb
    : Double → Double → Double → RGB
    = λ(red : Double) →
      λ(green : Double) →
      λ(blue : Double) →
        default ⫽ { red, green, blue }

let rgba
    : Double → Double → Double → Alpha.Type → RGB
    = λ(red : Double) →
      λ(green : Double) →
      λ(blue : Double) →
      λ(alpha : Alpha.Type) →
        default ⫽ { red, green, blue, alpha = Some alpha }

let example0 = assert : show3 (rgb 10.0 20.0 255.0) ≡ "rgb(10.0, 20.0, 255.0)"

let example1 =
        assert
      :   show3 (rgba 1.0 255.0 30.0 (Alpha.Number 0.5))
        ≡ "rgba(1.0, 255.0, 30.0, 0.5)"

let example2 =
        assert
      :   show3 (rgba 1.0 255.0 30.0 (Alpha.Percentage 0.5))
        ≡ "rgb(1.0, 255.0, 30.0)"

let example3 = assert : show4 (rgb 10.0 20.0 255.0) ≡ "rgb(10.0 20.0 255.0)"

let example4 =
        assert
      :   show4 (rgba 1.0 255.0 30.0 (Alpha.Number 0.5))
        ≡ "rgb(1.0 255.0 30.0 0.5)"

let example5 =
        assert
      :   show4 (rgba 1.0 255.0 30.0 (Alpha.Percentage 56.7))
        ≡ "rgb(1.0 255.0 30.0 56.7%)"

in  { Type = RGB, default, Alpha, show, show3, show4, rgb, rgba }
