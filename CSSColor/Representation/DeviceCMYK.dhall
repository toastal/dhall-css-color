-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#cmyk-colors
-}
let Alpha =
        ../Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ../Unit/alpha-value.dhall

let CMYKComponent =
        ../Unit/cmyk-component.dhall sha256:832c70099e4253db67d42166a110e2cd41057df2071c248f6ae621b698e8c9c1
      ? ../Unit/cmyk-component.dhall

let Alphatize =
        ../Utils/Alphatize.dhall sha256:0bad82995850661aa0d3c0f21cba23bcce78728f6326345bccf5afe8150951b2
      ? ../Utils/Alphatize.dhall

let DeviceCMYK
    : Type
    =   Alphatize.Type
      ⩓ { cyan : CMYKComponent.Type
        , magenta : CMYKComponent.Type
        , yellow : CMYKComponent.Type
        , black : CMYKComponent.Type
        }

let default = Alphatize::{=}

let show4
    : DeviceCMYK → Text
    = λ(cmyk_ : DeviceCMYK) →
        "device-cmyk(${Alphatize.concatSep
                         " "
                         [ CMYKComponent.show cmyk_.cyan
                         , CMYKComponent.show cmyk_.magenta
                         , CMYKComponent.show cmyk_.yellow
                         , CMYKComponent.show cmyk_.black
                         ]
                         cmyk_.alpha})"

let show
    : DeviceCMYK → Text
    = show4

let device-cmyk
    : CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
        DeviceCMYK
    = λ(cyan : CMYKComponent.Type) →
      λ(magenta : CMYKComponent.Type) →
      λ(yellow : CMYKComponent.Type) →
      λ(black : CMYKComponent.Type) →
        default ⫽ { cyan, magenta, yellow, black }

let device-cmyka
    : CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
      CMYKComponent.Type →
      Alpha.Type →
        DeviceCMYK
    = λ(cyan : CMYKComponent.Type) →
      λ(magenta : CMYKComponent.Type) →
      λ(yellow : CMYKComponent.Type) →
      λ(black : CMYKComponent.Type) →
      λ(alpha : Alpha.Type) →
        default ⫽ { cyan, magenta, yellow, black, alpha = Some alpha }

let example0 =
        assert
      :   show4
            ( device-cmyk
                (CMYKComponent.Type.Number 0.1)
                (CMYKComponent.Type.Number 0.2)
                (CMYKComponent.Type.Number 0.4)
                (CMYKComponent.Type.Number 0.8)
            )
        ≡ "device-cmyk(0.1 0.2 0.4 0.8)"

let example1 =
        assert
      :   show4
            ( device-cmyka
                (CMYKComponent.Type.Number 0.1)
                (CMYKComponent.Type.Number 0.2)
                (CMYKComponent.Type.Number 0.4)
                (CMYKComponent.Type.Number 0.8)
                (Alpha.Number 1.0)
            )
        ≡ "device-cmyk(0.1 0.2 0.4 0.8 1.0)"

in  { Type = DeviceCMYK
    , Alpha
    , CMYKComponent
    , show
    , show4
    , device-cmyk
    , device-cmyka
    }
