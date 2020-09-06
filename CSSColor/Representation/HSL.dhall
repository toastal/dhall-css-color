-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#the-hsl-notation
  Using the legacy comma syntax in the `show` for better compatibility
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

let HSL
    : Type
    =   Alphatize.Type
      ⩓ { hue : Hue.Type
        , saturation : Percentage.Type
        , lightness : Percentage.Type
        }

let default = Alphatize::{=}

let show3
    : HSL → Text
    = λ(hsl_ : HSL) →
        let alpha3
            : Optional Alpha.AlphaValue3
            = Alphatize.downgradeTo3 hsl_.alpha

        in  "${if    Alphatize.null3 alpha3
               then  "hsl("
               else  "hsla("}${Alphatize.concatSep3
                                 ", "
                                 [ Hue.show hsl_.hue
                                 , Percentage.show hsl_.saturation
                                 , Percentage.show hsl_.lightness
                                 ]
                                 alpha3})"

let show4
    : HSL → Text
    = λ(hsl_ : HSL) →
        "hsl(${Alphatize.concatSep
                 " "
                 [ Hue.show hsl_.hue
                 , Percentage.show hsl_.saturation
                 , Percentage.show hsl_.lightness
                 ]
                 hsl_.alpha})"

let show
    : HSL → Text
    = show4

let hsl
    : Hue.Type → Percentage.Type → Percentage.Type → HSL
    = λ(hue : Hue.Type) →
      λ(saturation : Percentage.Type) →
      λ(lightness : Percentage.Type) →
        default ⫽ { hue, saturation, lightness }

let hsla
    : Hue.Type → Percentage.Type → Percentage.Type → Alpha.Type → HSL
    = λ(hue : Hue.Type) →
      λ(saturation : Percentage.Type) →
      λ(lightness : Percentage.Type) →
      λ(alpha : Alpha.Type) →
        default ⫽ { hue, saturation, lightness, alpha = Some alpha }

let example0 =
        assert
      : show3 (hsl (Hue.Number 270.0) 20.0 100.0) ≡ "hsl(270.0, 20.0%, 100.0%)"

let example1 =
        assert
      :   show3 (hsla (Hue.Number 1.0) 5.0 10.0 (Alpha.Number 0.5))
        ≡ "hsla(1.0, 5.0%, 10.0%, 0.5)"

let example2 =
        assert
      : show4 (hsl (Hue.Number 270.0) 20.0 100.0) ≡ "hsl(270.0 20.0% 100.0%)"

let example3 =
        assert
      :   show4 (hsla (Hue.Number 1.0) 5.0 10.0 (Alpha.Percentage 53.2))
        ≡ "hsl(1.0 5.0% 10.0% 53.2%)"

in  { Type = HSL
    , default
    , Alpha
    , Hue
    , Percentage
    , show
    , show3
    , show4
    , hsl
    , hsla
    }
