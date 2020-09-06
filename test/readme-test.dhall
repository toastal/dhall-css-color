let List/map =
      https://prelude.dhall-lang.org/v18.0.0/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Color = ../CSSColor/Color.dhall

let colors
    : List Color.Type
    = [ Color.hex 0xff 0x00 0x00
      , Color.hexa 0x00 0xcc 0xff 0x23
      , Color.named Color.Named.Type.firebrick
      , Color.system Color.System.Type.CanvasText
      , Color.currentColor
      , Color.transparent
      , Color.rgba 255.0 255.0 170.0 (Color.Alpha.Number 0.5)
      , Color.hsl (Color.Hue.Angle (Color.Angle.turn 0.25)) 70.0 35.5
      , Color.hwba
          (Color.Hue.Angle (Color.Angle.rad 1.0))
          30.0
          88.8
          (Color.Alpha.Number 0.7)
      , Color.lab 41.0 5.0 90.0
      , Color.lcha
          62.5
          20.0
          (Color.Hue.Number 170.2)
          (Color.Alpha.Percentage 66.67)
      , Color.gray 50.0
      , Color.device-cmyk
          (Color.CMYKComponent.Type.Number 0.1)
          (Color.CMYKComponent.Type.Number 0.2)
          (Color.CMYKComponent.Type.Number 0.4)
          (Color.CMYKComponent.Type.Number 0.8)
      ]

let colorsAsText
    : List Text
    = List/map Color.Type Text Color.show colors

let assert0 =
        assert
      :   colorsAsText
        ≡ [ "#f00"
          , "#00ccff23"
          , "firebrick"
          , "CanvasText"
          , "currentColor"
          , "transparent"
          , "rgb(255.0 255.0 170.0 0.5)"
          , "hsl(0.25turn 70.0% 35.5%)"
          , "hwb(1.0rad 30.0% 88.8% 0.7)"
          , "lab(41.0% 5.0 90.0)"
          , "lch(62.5% 20.0 170.2 66.67%)"
          , "gray(50.0)"
          , "device-cmyk(0.1 0.2 0.4 0.8)"
          ]

in  colorsAsText : List Text
