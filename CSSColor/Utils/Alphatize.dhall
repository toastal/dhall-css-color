-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
let compose =
      https://prelude.dhall-lang.org/v19.0.0/Function/compose.dhall sha256:65ad8bbea530b3d8968785a7cf4a9a7976b67059aa15e3b61fcba600a40ae013

let Optional/concat =
      https://prelude.dhall-lang.org/v19.0.0/Optional/concat.dhall sha256:b7736bd3ebeab14c3912dfb534d0c970a025b001d06c2d5461d4b0e289e3cb7a

let Optional/map =
      https://prelude.dhall-lang.org/v19.0.0/Optional/map.dhall sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let Optional/null =
      https://prelude.dhall-lang.org/v19.0.0/Optional/null.dhall sha256:3871180b87ecaba8b53fffb2a8b52d3fce98098fab09a6f759358b9e8042eedc

let Optional/toList =
      https://prelude.dhall-lang.org/v19.0.0/Optional/toList.dhall sha256:d78f160c619119ef12389e48a629ce293d69f7624c8d016b7a4767ab400344c4

let Text/concatSep =
      https://prelude.dhall-lang.org/v19.0.0/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let Alpha =
        ../Unit/alpha-value.dhall sha256:bf08e9d80ceeee18606810ae82abff7266d1bb935d91cc9ea615f2490f3f60e5
      ? ../Unit/alpha-value.dhall

let Alphatize
    : Type
    = { alpha : Optional Alpha.Type }

let default
    : Alphatize
    = { alpha = None Alpha.Type }

let downgradeTo3
    : Optional Alpha.Type → Optional Alpha.AlphaValue3
    = compose
        (Optional Alpha.Type)
        (Optional (Optional Alpha.AlphaValue3))
        (Optional Alpha.AlphaValue3)
        ( Optional/map
            Alpha.Type
            (Optional Alpha.AlphaValue3)
            Alpha.downgradeTo3
        )
        (Optional/concat Alpha.AlphaValue3)

let toText3
    : Optional Alpha.AlphaValue3 → Optional Text
    = Optional/map Alpha.AlphaValue3 Text Alpha.show3

let toText4
    : Optional Alpha.AlphaValue4 → Optional Text
    = Optional/map Alpha.AlphaValue4 Text Alpha.show4

let toText
    : Optional Alpha.Type → Optional Text
    = Optional/map Alpha.AlphaValue4 Text Alpha.show

let concatSep3
    : Text → List Text → Optional Alpha.AlphaValue3 → Text
    = λ(sep : Text) →
      λ(texts : List Text) →
      λ(oalpha : Optional Alpha.AlphaValue3) →
        Text/concatSep sep (texts # Optional/toList Text (toText3 oalpha))

let concatSep4
    : Text → List Text → Optional Alpha.AlphaValue4 → Text
    = λ(sep : Text) →
      λ(texts : List Text) →
      λ(oalpha : Optional Alpha.AlphaValue4) →
        Text/concatSep sep (texts # Optional/toList Text (toText4 oalpha))

let concatSep
    : Text → List Text → Optional Alpha.Type → Text
    = λ(sep : Text) →
      λ(texts : List Text) →
      λ(oalpha : Optional Alpha.Type) →
        Text/concatSep sep (texts # Optional/toList Text (toText oalpha))

let example0 = assert : downgradeTo3 (Some (Alpha.Number 0.3)) ≡ Some 0.3

let example1 =
        assert
      : downgradeTo3 (Some (Alpha.Percentage 1.1)) ≡ None Alpha.AlphaValue3

let example2 = assert : downgradeTo3 (None Alpha.Type) ≡ None Alpha.AlphaValue3

let example3 =
        assert
      : concatSep3 ", " [ "10", "2", "255" ] (Some 0.3) ≡ "10, 2, 255, 0.3"

let example4 =
        assert
      :   concatSep3 ", " [ "10", "2", "255" ] (None Alpha.AlphaValue3)
        ≡ "10, 2, 255"

let example5 =
        assert
      :   concatSep " " [ "10", "2", "255" ] (Some (Alpha.Number 0.3))
        ≡ "10 2 255 0.3"

let example6 =
        assert
      :   concatSep " " [ "10", "2", "255" ] (Some (Alpha.Percentage 33.3))
        ≡ "10 2 255 33.3%"

let example7 =
      assert : concatSep " " [ "10", "2", "255" ] (None Alpha.Type) ≡ "10 2 255"

in  { Type = Alphatize
    , default
    , downgradeTo3
    , concatSep
    , concatSep3
    , concatSep4
    , toText
    , toText3
    , toText4
    , null = Optional/null Alpha.Type
    , null3 = Optional/null Alpha.AlphaValue3
    , null4 = Optional/null Alpha.AlphaValue4
    }
