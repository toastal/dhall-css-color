-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://drafts.csswg.org/css-color/#color-type
-}
let Alpha =
        ./Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ./Unit/alpha-value.dhall

let Angle =
        ./Unit/angle.dhall sha256:b46f2f31c6a1131e80db30fe2bf1a661309d256e4c3547251298b153c52a020b
      ? ./Unit/angle.dhall

let CMYKComponent =
        ./Unit/cmyk-component.dhall sha256:832c70099e4253db67d42166a110e2cd41057df2071c248f6ae621b698e8c9c1
      ? ./Unit/cmyk-component.dhall

let Hue =
        ./Unit/hue.dhall sha256:1ab4e52f18240db750d9c007dac232bbe5ec500fd8b2661c9d831f052b9846e2
      ? ./Unit/hue.dhall

let Percentage =
        ./Unit/percentage.dhall sha256:8ea5e1742af03a480c62dc10f6cfc8a81b69dace467857ab0865c869f070f7ef
      ? ./Unit/percentage.dhall

let Hex =
        ./Representation/Hex.dhall sha256:fea01f0cb3640460dca01aef30c02a5d6946664b98682161ba8582d61d63b5b8
      ? ./Representation/Hex.dhall

let Named =
        ./Representation/Named.dhall sha256:9cc313e6eab29fc442877509bac7f1f5c2fe55ed5b3db9785e298a1f56518abe
      ? ./Representation/Named.dhall

let System =
        ./Representation/System.dhall sha256:8e416f4e5e308a53933bd46477402c8eceefaf0b1f5eec941ee55b8416972de9
      ? ./Representation/System.dhall

let CurrentColor =
        ./Representation/currentColor.dhall sha256:74f391589727423d28fe4e0dbeeef1824e44a0a0561ef65b8d5545eec6f61249
      ? ./Representation/currentColor.dhall

let Transparent =
        ./Representation/transparent.dhall sha256:7cac16138449e6d9373a02c2293ea2769bc636454f06df99af650596a230d22f
      ? ./Representation/transparent.dhall

let RGB =
        ./Representation/RGB.dhall sha256:6f0a6cb4c0e074da58525aa13cd983ce2471f3557fcce1372d5c331655309433
      ? ./Representation/RGB.dhall

let HSL =
        ./Representation/HSL.dhall sha256:2df0a944aeaa87fbed5974d9f76070dc29ed9448964a15eb94187d0a68da8077
      ? ./Representation/HSL.dhall

let HWB =
        ./Representation/HWB.dhall sha256:a823ec2b3bb2b0194445cffdd6807d6c8ed7e4da286351a5b2bf1d192e049924
      ? ./Representation/HWB.dhall

let Lab =
        ./Representation/Lab.dhall sha256:6a2111e43aeaeebf7c50d02103e0af9b2b213138543195e5cfb4d8a689efad5b
      ? ./Representation/Lab.dhall

let LCH =
        ./Representation/LCH.dhall sha256:f0d59b841df0086dc458d22a990e3682a66df4c817a326be2210e2e86822dc36
      ? ./Representation/LCH.dhall

let Gray =
        ./Representation/Gray.dhall sha256:b676b4bb49c1715d5a3f298ce1b93bb91aa6582dba5b5c08b1fe96fa494cdbf9
      ? ./Representation/Gray.dhall

let DeviceCMYK =
        ./Representation/DeviceCMYK.dhall sha256:459f578ffb4fddf86c1c4fe8eda40cee1fcbd6ed2a980cc932390da313f77e91
      ? ./Representation/DeviceCMYK.dhall

let Color3
    : Type
    = < Hex : Hex.Type
      | Named : Named.Type
      | currentColor : CurrentColor.Type
      | transparent : Transparent.Type
      | RGB : RGB.RGB3
      | HSL : HSL.Type
      >

let Color4
    : Type
    = < Hex : Hex.Type
      | Named : Named.Type
      | System : System.SystemColor4
      | currentColor : CurrentColor.Type
      | transparent : Transparent.Type
      | RGB : RGB.Type
      | HSL : HSL.Type
      | HWB : HWB.Type
      | Lab : Lab.Type
      | LCH : LCH.Type
      | Gray : Gray.Type
      | DeviceCMYK : DeviceCMYK.Type
      >

let Color
    : Type
    = Color4

let default
    : Color
    = Color.Named Named.Type.black

let show3
    : Color3 → Text
    = λ(color : Color3) →
        merge
          { Hex = Hex.show3
          , Named = Named.show
          , currentColor = CurrentColor.show3
          , transparent = Transparent.show3
          , RGB = RGB.show3
          , HSL = HSL.show3
          }
          color

let show4
    : Color4 → Text
    = λ(color : Color4) →
        merge
          { Hex = Hex.show4
          , Named = Named.show
          , System = System.show4
          , currentColor = CurrentColor.show4
          , transparent = Transparent.show4
          , RGB = RGB.show4
          , HSL = HSL.show4
          , HWB = HWB.show4
          , Lab = Lab.show4
          , LCH = LCH.show4
          , Gray = Gray.show4
          , DeviceCMYK = DeviceCMYK.show4
          }
          color

let show
    : Color → Text
    = show4

let hex
    : Natural → Natural → Natural → Color
    = λ(red : Natural) →
      λ(green : Natural) →
      λ(blue : Natural) →
        Color.Hex (Hex.hex red green blue)

let hexa
    : Natural → Natural → Natural → Natural → Color
    = λ(red : Natural) →
      λ(green : Natural) →
      λ(blue : Natural) →
      λ(alpha : Natural) →
        Color.Hex (Hex.hexa red green blue alpha)

let named
    : Named.Type → Color
    = λ(name : Named.Type) → Color.Named name

let system
    : System.Type → Color
    = λ(sys : System.Type) → Color.System sys

let currentColor
    : Color
    = Color.currentColor {=}

let transparent
    : Color
    = Color.transparent {=}

let rgb
    : Double → Double → Double → Color
    = λ(red : Double) →
      λ(green : Double) →
      λ(blue : Double) →
        Color.RGB (RGB.rgb red green blue)

let rgba
    : Double → Double → Double → Alpha.Type → Color
    = λ(red : Double) →
      λ(green : Double) →
      λ(blue : Double) →
      λ(alpha : Alpha.Type) →
        Color.RGB (RGB.rgba red green blue alpha)

let rgbp
    : Percentage.Type → Percentage.Type → Percentage.Type → Color
    = λ(red : Percentage.Type) →
      λ(green : Percentage.Type) →
      λ(blue : Percentage.Type) →
        Color.RGB (RGB.rgbp red green blue)

let rgbpa
    : Percentage.Type → Percentage.Type → Percentage.Type → Alpha.Type → Color
    = λ(red : Percentage.Type) →
      λ(green : Percentage.Type) →
      λ(blue : Percentage.Type) →
      λ(alpha : Alpha.Type) →
        Color.RGB (RGB.rgbpa red green blue alpha)

let hsl
    : Hue.Type → Percentage.Type → Percentage.Type → Color
    = λ(hue : Hue.Type) →
      λ(saturation : Percentage.Type) →
      λ(lightness : Percentage.Type) →
        Color.HSL (HSL.hsl hue saturation lightness)

let hsla
    : Hue.Type → Percentage.Type → Percentage.Type → Alpha.Type → Color
    = λ(hue : Hue.Type) →
      λ(saturation : Percentage.Type) →
      λ(lightness : Percentage.Type) →
      λ(alpha : Alpha.Type) →
        Color.HSL (HSL.hsla hue saturation lightness alpha)

let hwb
    : Hue.Type → Percentage.Type → Percentage.Type → Color
    = λ(hue : Hue.Type) →
      λ(whiteness : Percentage.Type) →
      λ(blackness : Percentage.Type) →
        Color.HWB (HWB.hwb hue whiteness blackness)

let hwba
    : Hue.Type → Percentage.Type → Percentage.Type → Alpha.Type → Color
    = λ(hue : Hue.Type) →
      λ(whiteness : Percentage.Type) →
      λ(blackness : Percentage.Type) →
      λ(alpha : Alpha.Type) →
        Color.HWB (HWB.hwba hue whiteness blackness alpha)

let lab
    : Percentage.Type → Double → Double → Color
    = λ(lightness : Percentage.Type) →
      λ(a : Double) →
      λ(b : Double) →
        Color.Lab (Lab.lab lightness a b)

let laba
    : Percentage.Type → Double → Double → Alpha.Type → Color
    = λ(lightness : Percentage.Type) →
      λ(a : Double) →
      λ(b : Double) →
      λ(alpha : Alpha.Type) →
        Color.Lab (Lab.laba lightness a b alpha)

let lch
    : Percentage.Type → Double → Hue.Type → Color
    = λ(lightness : Percentage.Type) →
      λ(chroma : Double) →
      λ(hue : Hue.Type) →
        Color.LCH (LCH.lch lightness chroma hue)

let lcha
    : Percentage.Type → Double → Hue.Type → Alpha.Type → Color
    = λ(lightness : Percentage.Type) →
      λ(chroma : Double) →
      λ(hue : Hue.Type) →
      λ(alpha : Alpha.Type) →
        Color.LCH (LCH.lcha lightness chroma hue alpha)

let gray
    : Double → Color
    = λ(lightness : Double) → Color.Gray (Gray.gray lightness)

let graya
    : Double → Alpha.Type → Color
    = λ(lightness : Double) →
      λ(alpha : Alpha.Type) →
        Color.Gray (Gray.graya lightness alpha)

let device-cmyk
    : CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
        Color
    = λ(cyan : CMYKComponent.Type) →
      λ(magenta : CMYKComponent.Type) →
      λ(yellow : CMYKComponent.Type) →
      λ(black : CMYKComponent.Type) →
        Color.DeviceCMYK (DeviceCMYK.device-cmyk cyan magenta yellow black)

let device-cmyka
    : CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
      Alpha.Type →
        Color
    = λ(cyan : CMYKComponent.Type) →
      λ(magenta : CMYKComponent.Type) →
      λ(yellow : CMYKComponent.Type) →
      λ(black : CMYKComponent.Type) →
      λ(alpha : Alpha.Type) →
        Color.DeviceCMYK
          (DeviceCMYK.device-cmyka cyan magenta yellow black alpha)

in  { Type = Color
    , default
    , Alpha
    , Angle
    , CMYKComponent
    , Hue
    , Percentage
    , show
    , show3
    , show4
    , Hex
    , hex
    , hexa
    , Named
    , named
    , System
    , system
    , currentColor
    , transparent
    , RGB
    , rgb
    , rgba
    , rgbp
    , rgbpa
    , HSL
    , hsl
    , hsla
    , HWB
    , hwb
    , hwba
    , Lab
    , lab
    , laba
    , LCH
    , lch
    , lcha
    , Gray
    , gray
    , graya
    , DeviceCMYK
    , device-cmyk
    , device-cmyka
    }
