-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://drafts.csswg.org/css-color/#color-type

  | Color

-- how to compose these inner color helpers?
let compose = https://prelude.dhall-lang.org/v17.1.0/Function/compose.dhall
-}
let Alpha = ./Unit/alpha-value.dhall

let Angle = ./Unit/angle.dhall

let CMYKComponent = ./Unit/cmyk-component.dhall

let Hue = ./Unit/hue.dhall

let Percentage = ./Unit/percentage.dhall

let Hex = ./Representation/Hex.dhall

let Named = ./Representation/Named.dhall

let System = ./Representation/System.dhall

let CurrentColor = ./Representation/currentColor.dhall

let Transparent = ./Representation/transparent.dhall

let RGB = ./Representation/RGB.dhall

let HSL = ./Representation/HSL.dhall

let HWB = ./Representation/HWB.dhall

let Lab = ./Representation/Lab.dhall

let LCH = ./Representation/LCH.dhall

let Gray = ./Representation/Gray.dhall

let DeviceCMYK = ./Representation/DeviceCMYK.dhall

let Color3
    : Type
    = < Hex : Hex.Type
      | Named : Named.Type
      | currentColor : CurrentColor.Type
      | transparent : Transparent.Type
      | RGB : RGB.Type
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
    , System
    , currentColor
    , transparent
    , RGB
    , rgb
    , rgba
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
