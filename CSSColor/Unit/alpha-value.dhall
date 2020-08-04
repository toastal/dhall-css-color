-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#typedef-alpha-value

  Numbers should be limited from 0 to 1.

  alphavalue in 3 doesn’t support the Percentage type. Even though it’s merely
  (* 0.01) or (/ 100) away, arithmetic cannot be performed on Doubles at this time
  https://www.w3.org/TR/css-color-3/#alphavaluedt
-}
let Percentage = ./percentage.dhall

let AlphaValue3
    : Type
    = Double

let AlphaValue4
    : Type
    = < Number : Double | Percentage : Percentage.Type >

let AlphaValue
    : Type
    = AlphaValue4

let downgradeTo3
    : AlphaValue → Optional AlphaValue3
    = λ(alphaValue : AlphaValue) →
        merge
          { Number = λ(n : Double) → Some n
          , Percentage = λ(p : Percentage.Type) → None AlphaValue3
          }
          alphaValue

let show3
    : AlphaValue3 → Text
    = Double/show

let show4
    : AlphaValue4 → Text
    = λ(alphaValue : AlphaValue4) →
        merge
          { Number = λ(n : Double) → Double/show n
          , Percentage = λ(p : Percentage.Type) → Percentage.show p
          }
          alphaValue

let show
    : AlphaValue → Text
    = show4

let example0 = assert : downgradeTo3 (AlphaValue.Number 0.24) ≡ Some 0.24

let example1 =
      assert : downgradeTo3 (AlphaValue.Percentage 55.5) ≡ None AlphaValue3

let example2 = assert : show3 0.1 ≡ "0.1"

let example3 = assert : show4 (AlphaValue.Number 0.23) ≡ "0.23"

let example4 = assert : show4 (AlphaValue.Percentage 78.9) ≡ "78.9%"

in  { Type = AlphaValue
    , AlphaValue3
    , AlphaValue4
    , Percentage = AlphaValue.Percentage : Percentage.Type → AlphaValue
    , Number = AlphaValue.Number : Double → AlphaValue
    , show
    , show3
    , show4
    , downgradeTo3
    }
