-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#typedef-cmyk-component
-}
let Percentage =
        ./percentage.dhall sha256:8ea5e1742af03a480c62dc10f6cfc8a81b69dace467857ab0865c869f070f7ef
      ? ./percentage.dhall

let CMYKComponent = < Number : Double | Percentage : Percentage.Type >

let show
    : CMYKComponent → Text
    = λ(cmykComponent : CMYKComponent) →
        merge
          { Number = λ(n : Double) → Double/show n
          , Percentage = λ(p : Percentage.Type) → Percentage.show p
          }
          cmykComponent

let example0 = assert : show (CMYKComponent.Number 0.3) ≡ "0.3"

let example1 = assert : show (CMYKComponent.Percentage 99.0) ≡ "99.0%"

in  { Type = CMYKComponent, Percentage, show }
