-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#the-hwb-notation
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
