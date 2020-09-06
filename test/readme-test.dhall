let List/map =
      https://prelude.dhall-lang.org/v18.0.0/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Color = ../CSSColor/Color.dhall

let colors
    : List Color.Type
    = [ Color.hex 0xff 0x00 0x00
      , Color.hexa 0x00 0xcc 0xff 0x23
      , Color.named Color.Named.Type.firebrick
      , Color.currentColor
      , Color.transparent
      , Color.rgba 255.0 255.0 170.0 (Color.Alpha.Number 0.5)
      , Color.hsl (Color.Hue.Angle (Color.Angle.turn 0.25)) 70.0 35.5
      , Color.lcha 62.5 20.0 (Color.Hue.Number 170.2) (Color.Alpha.Percentage 66.67)
      , Color.gray 50.0
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
          , "currentColor"
          , "transparent"
          , "rgb(255.0 255.0 170.0 0.5)"
          , "hsl(0.25turn 70.0% 35.5%)"
          , "lch(62.5% 20.0 170.2 66.67%)"
          , "gray(50.0)"
          ]

in  colorsAsText : List Text
