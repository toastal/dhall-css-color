-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#lab-colors
-}
let Alpha = ../Unit/alpha-value.dhall

let Hue = ../Unit/hue.dhall

let Percentage = ../Unit/percentage.dhall

let Alphatize = ../Utils/Alphatize.dhall

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
