-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#typedef-hue
-}
let Angle =
        ./angle.dhall sha256:b46f2f31c6a1131e80db30fe2bf1a661309d256e4c3547251298b153c52a020b
      ? ./angle.dhall

let Hue = < Number : Double | Angle : Angle.Type >

let show
    : Hue → Text
    = λ(hue_ : Hue) →
        merge
          { Number = λ(n : Double) → Double/show n
          , Angle = λ(a : Angle.Type) → Angle.show a
          }
          hue_

let example0 = assert : show (Hue.Number 31.0) ≡ "31.0"

let example1 = assert : show (Hue.Angle (Angle.Type.rad 69.0)) ≡ "69.0rad"

in  { Type = Hue
    , Number = Hue.Number : Double → Hue
    , Angle = Hue.Angle : Angle.Type → Hue
    , show
    }
