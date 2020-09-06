-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#lab-colors
-}
let Alpha =
        ../Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ../Unit/alpha-value.dhall

let Hue =
        ../Unit/hue.dhall sha256:1ab4e52f18240db750d9c007dac232bbe5ec500fd8b2661c9d831f052b9846e2
      ? ../Unit/hue.dhall

let Percentage =
        ../Unit/percentage.dhall sha256:8ea5e1742af03a480c62dc10f6cfc8a81b69dace467857ab0865c869f070f7ef
      ? ../Unit/percentage.dhall

let Alphatize =
        ../Utils/Alphatize.dhall sha256:0bad82995850661aa0d3c0f21cba23bcce78728f6326345bccf5afe8150951b2
      ? ../Utils/Alphatize.dhall

let LCH
    : Type
    =   Alphatize.Type
      ⩓ { lightness : Percentage.Type, chroma : Double, hue : Hue.Type }

let default = Alphatize::{=}

let show4
    : LCH → Text
    = λ(lch_ : LCH) →
        "lch(${Alphatize.concatSep
                 " "
                 [ Percentage.show lch_.lightness
                 , Double/show lch_.chroma
                 , Hue.show lch_.hue
                 ]
                 lch_.alpha})"

let show
    : LCH → Text
    = show4

let lch
    : Percentage.Type → Double → Hue.Type → LCH
    = λ(lightness : Percentage.Type) →
      λ(chroma : Double) →
      λ(hue : Hue.Type) →
        default ⫽ { lightness, chroma, hue }

let lcha
    : Percentage.Type → Double → Hue.Type → Alpha.Type → LCH
    = λ(lightness : Percentage.Type) →
      λ(chroma : Double) →
      λ(hue : Hue.Type) →
      λ(alpha : Alpha.Type) →
        default ⫽ { lightness, chroma, hue, alpha = Some alpha }

let example0 =
        assert
      : show4 (lch 70.0 20.0 (Hue.Type.Number 100.0)) ≡ "lch(70.0% 20.0 100.0)"

let example1 =
        assert
      :   show4 (lcha 1.0 5.0 (Hue.Type.Number 359.0) (Alpha.Number 0.5))
        ≡ "lch(1.0% 5.0 359.0 0.5)"

in  { Type = LCH, Alpha, Hue, Percentage, default, show, show4, lch, lcha }
