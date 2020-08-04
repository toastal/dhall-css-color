-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css3-values/#angle-value
-}
let Angle = < deg : Double | grad : Double | rad : Double | turn : Double >


let show
    : Angle → Text
    = λ(angle_ : Angle) →
        merge
          { deg = λ(d : Double) → Double/show d ++ "deg"
          , grad = λ(g : Double) → Double/show g ++ "grad"
          , rad = λ(r : Double) → Double/show r ++ "rad"
          , turn = λ(t : Double) → Double/show t ++ "turn"
          }
          angle_

in  { Type = Angle, show }
