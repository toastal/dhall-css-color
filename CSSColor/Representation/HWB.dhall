-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#the-hwb-notation
-}
let Alpha = ../Unit/alpha-value.dhall

let Hue = ../Unit/hue.dhall

let Percentage = ../Unit/percentage.dhall

let Alphatize = ../Utils/Alphatize.dhall

let HWB
    : Type
    =   Alphatize.Type
      ⩓ { hue : Hue.Type
        , whiteness : Percentage.Type
        , blackness : Percentage.Type
        }

let default = Alphatize::{=}

let show4
    : HWB → Text
    = λ(hwb_ : HWB) →
        "hwb(${Alphatize.concatSep
                 " "
                 [ Hue.show hwb_.hue
                 , Percentage.show hwb_.whiteness
                 , Percentage.show hwb_.blackness
                 ]
                 hwb_.alpha})"

let show
    : HWB → Text
    = show4

let hwb
    : Hue.Type → Percentage.Type → Double → HWB
    = λ(hue : Hue.Type) →
      λ(whiteness : Percentage.Type) →
      λ(blackness : Percentage.Type) →
        default ⫽ { hue, whiteness, blackness }

let hwba
    : Hue.Type → Percentage.Type → Percentage.Type → Alpha.Type → HWB
    = λ(hue : Hue.Type) →
      λ(whiteness : Percentage.Type) →
      λ(blackness : Percentage.Type) →
      λ(alpha : Alpha.Type) →
        default ⫽ { hue, whiteness, blackness, alpha = Some alpha }

let example0 =
        assert
      : show4 (hwb (Hue.Number 270.0) 20.0 100.0) ≡ "hwb(270.0 20.0% 100.0%)"

let example1 =
        assert
      :   show4 (hwba (Hue.Number 1.0) 5.0 10.0 (Alpha.Number 0.5))
        ≡ "hwb(1.0 5.0% 10.0% 0.5)"

in  { Type = HWB, default, Alpha, Hue, Percentage, show, show4, hwb, hwba }
