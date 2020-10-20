-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#funcdef-rgb
  Using the legacy comma syntax in the `show` for better compatibility
-}
let compose =
      https://prelude.dhall-lang.org/v19.0.0/Function/compose.dhall sha256:65ad8bbea530b3d8968785a7cf4a9a7976b67059aa15e3b61fcba600a40ae013

let Optional/map =
      https://prelude.dhall-lang.org/v19.0.0/Optional/map.dhall sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let Alpha =
        ../Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ../Unit/alpha-value.dhall

let Percentage =
        ../Unit/percentage.dhall sha256:8ea5e1742af03a480c62dc10f6cfc8a81b69dace467857ab0865c869f070f7ef
      ? ../Unit/percentage.dhall

let Alphatize =
        ../Utils/Alphatize.dhall sha256:0bad82995850661aa0d3c0f21cba23bcce78728f6326345bccf5afe8150951b2
      ? ../Utils/Alphatize.dhall

let RGBNumbers
    : Type
    = Alphatize.Type ⩓ { red : Double, green : Double, blue : Double }

let RGBPercents
    : Type
    =   Alphatize.Type
      ⩓ { red : Percentage.Type
        , green : Percentage.Type
        , blue : Percentage.Type
        }

let RGB3
    : Type
    = RGBNumbers

let RGB4
    : Type
    = < Number : RGBNumbers | Percent : RGBPercents >

let RGB
    : Type
    = RGB4

let downgradeTo3
    : RGB → Optional RGB3
    = λ(rgb_ : RGB) →
        merge
          { Number = λ(rgbn : RGBNumbers) → Some rgbn
          , Percent = λ(rgbp_ : RGBPercents) → None RGB3
          }
          rgb_

let show3
    : RGB3 → Text
    = λ(rgbn : RGBNumbers) →
        let alpha3
            : Optional Alpha.AlphaValue3
            = Alphatize.downgradeTo3 rgbn.alpha

        in  "${if    Alphatize.null3 alpha3
               then  "rgb("
               else  "rgba("}${Alphatize.concatSep3
                                 ", "
                                 [ Double/show rgbn.red
                                 , Double/show rgbn.green
                                 , Double/show rgbn.blue
                                 ]
                                 alpha3})"

let show4
    : RGB4 → Text
    = λ(rgb_ : RGB) →
        let toRGBText
            : List Text → Optional Alpha.Type → Text
            = λ(rgbs : List Text) →
              λ(alpha : Optional Alpha.Type) →
                "rgb(${Alphatize.concatSep " " rgbs alpha})"

        in  merge
              { Number =
                  λ(rgbn_ : RGBNumbers) →
                    toRGBText
                      [ Double/show rgbn_.red
                      , Double/show rgbn_.green
                      , Double/show rgbn_.blue
                      ]
                      rgbn_.alpha
              , Percent =
                  λ(rgbp_ : RGBPercents) →
                    toRGBText
                      [ Percentage.show rgbp_.red
                      , Percentage.show rgbp_.green
                      , Percentage.show rgbp_.blue
                      ]
                      rgbp_.alpha
              }
              rgb_

let show
    : RGB → Text
    = show4

let rgb
    : Double → Double → Double → RGB
    = λ(red : Double) →
      λ(green : Double) →
      λ(blue : Double) →
        RGB.Number { red, green, blue, alpha = None Alpha.Type }

let rgba
    : Double → Double → Double → Alpha.Type → RGB
    = λ(red : Double) →
      λ(green : Double) →
      λ(blue : Double) →
      λ(alpha : Alpha.Type) →
        RGB.Number { red, green, blue, alpha = Some alpha }

let rgbp
    : Percentage.Type → Percentage.Type → Percentage.Type → RGB
    = λ(red : Percentage.Type) →
      λ(green : Percentage.Type) →
      λ(blue : Percentage.Type) →
        RGB.Percent { red, green, blue, alpha = None Alpha.Type }

let rgbpa
    : Percentage.Type → Percentage.Type → Percentage.Type → Alpha.Type → RGB
    = λ(red : Percentage.Type) →
      λ(green : Percentage.Type) →
      λ(blue : Percentage.Type) →
      λ(alpha : Alpha.Type) →
        RGB.Percent { red, green, blue, alpha = Some alpha }

let downgradeShow3
    : RGB → Optional Text
    = compose
        RGB
        (Optional RGB3)
        (Optional Text)
        downgradeTo3
        (Optional/map RGB3 Text show3)

let example0 =
        assert
      : downgradeShow3 (rgb 10.0 20.0 255.0) ≡ Some "rgb(10.0, 20.0, 255.0)"

let example1 =
        assert
      :   downgradeShow3 (rgba 1.0 255.0 30.0 (Alpha.Number 0.5))
        ≡ Some "rgba(1.0, 255.0, 30.0, 0.5)"

let example2 =
        assert
      :   downgradeShow3 (rgba 1.0 255.0 30.0 (Alpha.Percentage 0.5))
        ≡ Some "rgb(1.0, 255.0, 30.0)"

let example3 =
        assert
      :   downgradeShow3 (rgba 1.0 255.0 30.0 (Alpha.Percentage 0.5))
        ≡ Some "rgb(1.0, 255.0, 30.0)"

let example4 = assert : downgradeShow3 (rgbp 13.0 23.0 100.0) ≡ None Text

let example5 =
        assert
      :   show4 (rgba 1.0 255.0 30.0 (Alpha.Number 0.5))
        ≡ "rgb(1.0 255.0 30.0 0.5)"

let example6 =
        assert
      :   show4 (rgba 1.0 255.0 30.0 (Alpha.Percentage 56.7))
        ≡ "rgb(1.0 255.0 30.0 56.7%)"

let example7 = assert : show4 (rgbp 13.0 23.0 100.0) ≡ "rgb(13.0% 23.0% 100.0%)"

let example8 =
        assert
      :   show4 (rgbpa 0.0 100.0 50.0 (Alpha.Percentage 25.75))
        ≡ "rgb(0.0% 100.0% 50.0% 25.75%)"

in  { Type = RGB
    , RGB3
    , RGB4
    , Number = λ(rgbn_ : RGBNumbers) → RGB.Number rgbn_
    , Percent = λ(rgbp_ : RGBPercents) → RGB.Percent rgbp_
    , Alpha
    , Percentage
    , show
    , show3
    , show4
    , rgb
    , rgba
    , rgbp
    , rgbpa
    }
