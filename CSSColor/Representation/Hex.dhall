-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#typedef-hex-color

  There’s a lot of variations here in the 3, 4, 6, 8 hex value options.

  I can’t think of a good data structure for this that doesn’t have serious
  flaws. One obious answer is to use the built-in hexadecimal support
  (0xff ≡ 256 ≡ "FF"), for either the channels, or the whole number
  (0x00000 ≡ 0 ≡ "000000"), but we will run into in issue getting the values
  out as there doesn’t exist a `Natural/showAsHex` or similar. So I’m just
  going to leave it as `Text` for now. Alternatively, I could generate if
  declarations for 16777215 values, and then again for 4294967295 for alpha
  version lol. Without bitmasking it’s difficult to get out each channel as
  well.

  So for now, I’m just doing a record of channels of naturals for each. Only
  `0x00-0xff` (256 values) is supported.

  copy(Array.from(Array(0xff), (_, i) => [ `if Natural/equal h ${i}.toString(16)`, `then "${i.toString(16).padStart(2, "0")}"`].join("\n")).join("\nelse ") + `\n else "ff"`)

-}


let Natural/equal =
      https://prelude.dhall-lang.org/v18.0.0/Natural/equal.dhall sha256:7f108edfa35ddc7cebafb24dc073478e93a802e13b5bc3fd22f4768c9b066e60

let List/map =
      https://prelude.dhall-lang.org/v18.0.0/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let List/unpackOptionals =
      https://prelude.dhall-lang.org/v18.0.0/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Text/concat =
      https://prelude.dhall-lang.org/v18.0.0/Text/concat.dhall sha256:731265b0288e8a905ecff95c97333ee2db614c39d69f1514cb8eed9259745fc0

let Text/concatMap =
      https://prelude.dhall-lang.org/v18.0.0/Text/concatMap.dhall sha256:7a0b0b99643de69d6f94ba49441cd0fa0507cbdfa8ace0295f16097af37e226f

let Hex
    : Type
    = { red : Natural
      , blue : Natural
      , green : Natural
      , alpha : Optional Natural
      }

let default = { alpha = None Natural }

let toHexText
    : Natural → Text
    = λ(h : Natural) →
        if    Natural/equal h 0x0
        then  "00"
        else  if Natural/equal h 0x1
        then  "01"
        else  if Natural/equal h 0x2
        then  "02"
        else  if Natural/equal h 0x3
        then  "03"
        else  if Natural/equal h 0x4
        then  "04"
        else  if Natural/equal h 0x5
        then  "05"
        else  if Natural/equal h 0x6
        then  "06"
        else  if Natural/equal h 0x7
        then  "07"
        else  if Natural/equal h 0x8
        then  "08"
        else  if Natural/equal h 0x9
        then  "09"
        else  if Natural/equal h 0xa
        then  "0a"
        else  if Natural/equal h 0xb
        then  "0b"
        else  if Natural/equal h 0xc
        then  "0c"
        else  if Natural/equal h 0xd
        then  "0d"
        else  if Natural/equal h 0xe
        then  "0e"
        else  if Natural/equal h 0xf
        then  "0f"
        else  if Natural/equal h 0x10
        then  "10"
        else  if Natural/equal h 0x11
        then  "11"
        else  if Natural/equal h 0x12
        then  "12"
        else  if Natural/equal h 0x13
        then  "13"
        else  if Natural/equal h 0x14
        then  "14"
        else  if Natural/equal h 0x15
        then  "15"
        else  if Natural/equal h 0x16
        then  "16"
        else  if Natural/equal h 0x17
        then  "17"
        else  if Natural/equal h 0x18
        then  "18"
        else  if Natural/equal h 0x19
        then  "19"
        else  if Natural/equal h 0x1a
        then  "1a"
        else  if Natural/equal h 0x1b
        then  "1b"
        else  if Natural/equal h 0x1c
        then  "1c"
        else  if Natural/equal h 0x1d
        then  "1d"
        else  if Natural/equal h 0x1e
        then  "1e"
        else  if Natural/equal h 0x1f
        then  "1f"
        else  if Natural/equal h 0x20
        then  "20"
        else  if Natural/equal h 0x21
        then  "21"
        else  if Natural/equal h 0x22
        then  "22"
        else  if Natural/equal h 0x23
        then  "23"
        else  if Natural/equal h 0x24
        then  "24"
        else  if Natural/equal h 0x25
        then  "25"
        else  if Natural/equal h 0x26
        then  "26"
        else  if Natural/equal h 0x27
        then  "27"
        else  if Natural/equal h 0x28
        then  "28"
        else  if Natural/equal h 0x29
        then  "29"
        else  if Natural/equal h 0x2a
        then  "2a"
        else  if Natural/equal h 0x2b
        then  "2b"
        else  if Natural/equal h 0x2c
        then  "2c"
        else  if Natural/equal h 0x2d
        then  "2d"
        else  if Natural/equal h 0x2e
        then  "2e"
        else  if Natural/equal h 0x2f
        then  "2f"
        else  if Natural/equal h 0x30
        then  "30"
        else  if Natural/equal h 0x31
        then  "31"
        else  if Natural/equal h 0x32
        then  "32"
        else  if Natural/equal h 0x33
        then  "33"
        else  if Natural/equal h 0x34
        then  "34"
        else  if Natural/equal h 0x35
        then  "35"
        else  if Natural/equal h 0x36
        then  "36"
        else  if Natural/equal h 0x37
        then  "37"
        else  if Natural/equal h 0x38
        then  "38"
        else  if Natural/equal h 0x39
        then  "39"
        else  if Natural/equal h 0x3a
        then  "3a"
        else  if Natural/equal h 0x3b
        then  "3b"
        else  if Natural/equal h 0x3c
        then  "3c"
        else  if Natural/equal h 0x3d
        then  "3d"
        else  if Natural/equal h 0x3e
        then  "3e"
        else  if Natural/equal h 0x3f
        then  "3f"
        else  if Natural/equal h 0x40
        then  "40"
        else  if Natural/equal h 0x41
        then  "41"
        else  if Natural/equal h 0x42
        then  "42"
        else  if Natural/equal h 0x43
        then  "43"
        else  if Natural/equal h 0x44
        then  "44"
        else  if Natural/equal h 0x45
        then  "45"
        else  if Natural/equal h 0x46
        then  "46"
        else  if Natural/equal h 0x47
        then  "47"
        else  if Natural/equal h 0x48
        then  "48"
        else  if Natural/equal h 0x49
        then  "49"
        else  if Natural/equal h 0x4a
        then  "4a"
        else  if Natural/equal h 0x4b
        then  "4b"
        else  if Natural/equal h 0x4c
        then  "4c"
        else  if Natural/equal h 0x4d
        then  "4d"
        else  if Natural/equal h 0x4e
        then  "4e"
        else  if Natural/equal h 0x4f
        then  "4f"
        else  if Natural/equal h 0x50
        then  "50"
        else  if Natural/equal h 0x51
        then  "51"
        else  if Natural/equal h 0x52
        then  "52"
        else  if Natural/equal h 0x53
        then  "53"
        else  if Natural/equal h 0x54
        then  "54"
        else  if Natural/equal h 0x55
        then  "55"
        else  if Natural/equal h 0x56
        then  "56"
        else  if Natural/equal h 0x57
        then  "57"
        else  if Natural/equal h 0x58
        then  "58"
        else  if Natural/equal h 0x59
        then  "59"
        else  if Natural/equal h 0x5a
        then  "5a"
        else  if Natural/equal h 0x5b
        then  "5b"
        else  if Natural/equal h 0x5c
        then  "5c"
        else  if Natural/equal h 0x5d
        then  "5d"
        else  if Natural/equal h 0x5e
        then  "5e"
        else  if Natural/equal h 0x5f
        then  "5f"
        else  if Natural/equal h 0x60
        then  "60"
        else  if Natural/equal h 0x61
        then  "61"
        else  if Natural/equal h 0x62
        then  "62"
        else  if Natural/equal h 0x63
        then  "63"
        else  if Natural/equal h 0x64
        then  "64"
        else  if Natural/equal h 0x65
        then  "65"
        else  if Natural/equal h 0x66
        then  "66"
        else  if Natural/equal h 0x67
        then  "67"
        else  if Natural/equal h 0x68
        then  "68"
        else  if Natural/equal h 0x69
        then  "69"
        else  if Natural/equal h 0x6a
        then  "6a"
        else  if Natural/equal h 0x6b
        then  "6b"
        else  if Natural/equal h 0x6c
        then  "6c"
        else  if Natural/equal h 0x6d
        then  "6d"
        else  if Natural/equal h 0x6e
        then  "6e"
        else  if Natural/equal h 0x6f
        then  "6f"
        else  if Natural/equal h 0x70
        then  "70"
        else  if Natural/equal h 0x71
        then  "71"
        else  if Natural/equal h 0x72
        then  "72"
        else  if Natural/equal h 0x73
        then  "73"
        else  if Natural/equal h 0x74
        then  "74"
        else  if Natural/equal h 0x75
        then  "75"
        else  if Natural/equal h 0x76
        then  "76"
        else  if Natural/equal h 0x77
        then  "77"
        else  if Natural/equal h 0x78
        then  "78"
        else  if Natural/equal h 0x79
        then  "79"
        else  if Natural/equal h 0x7a
        then  "7a"
        else  if Natural/equal h 0x7b
        then  "7b"
        else  if Natural/equal h 0x7c
        then  "7c"
        else  if Natural/equal h 0x7d
        then  "7d"
        else  if Natural/equal h 0x7e
        then  "7e"
        else  if Natural/equal h 0x7f
        then  "7f"
        else  if Natural/equal h 0x80
        then  "80"
        else  if Natural/equal h 0x81
        then  "81"
        else  if Natural/equal h 0x82
        then  "82"
        else  if Natural/equal h 0x83
        then  "83"
        else  if Natural/equal h 0x84
        then  "84"
        else  if Natural/equal h 0x85
        then  "85"
        else  if Natural/equal h 0x86
        then  "86"
        else  if Natural/equal h 0x87
        then  "87"
        else  if Natural/equal h 0x88
        then  "88"
        else  if Natural/equal h 0x89
        then  "89"
        else  if Natural/equal h 0x8a
        then  "8a"
        else  if Natural/equal h 0x8b
        then  "8b"
        else  if Natural/equal h 0x8c
        then  "8c"
        else  if Natural/equal h 0x8d
        then  "8d"
        else  if Natural/equal h 0x8e
        then  "8e"
        else  if Natural/equal h 0x8f
        then  "8f"
        else  if Natural/equal h 0x90
        then  "90"
        else  if Natural/equal h 0x91
        then  "91"
        else  if Natural/equal h 0x92
        then  "92"
        else  if Natural/equal h 0x93
        then  "93"
        else  if Natural/equal h 0x94
        then  "94"
        else  if Natural/equal h 0x95
        then  "95"
        else  if Natural/equal h 0x96
        then  "96"
        else  if Natural/equal h 0x97
        then  "97"
        else  if Natural/equal h 0x98
        then  "98"
        else  if Natural/equal h 0x99
        then  "99"
        else  if Natural/equal h 0x9a
        then  "9a"
        else  if Natural/equal h 0x9b
        then  "9b"
        else  if Natural/equal h 0x9c
        then  "9c"
        else  if Natural/equal h 0x9d
        then  "9d"
        else  if Natural/equal h 0x9e
        then  "9e"
        else  if Natural/equal h 0x9f
        then  "9f"
        else  if Natural/equal h 0xa0
        then  "a0"
        else  if Natural/equal h 0xa1
        then  "a1"
        else  if Natural/equal h 0xa2
        then  "a2"
        else  if Natural/equal h 0xa3
        then  "a3"
        else  if Natural/equal h 0xa4
        then  "a4"
        else  if Natural/equal h 0xa5
        then  "a5"
        else  if Natural/equal h 0xa6
        then  "a6"
        else  if Natural/equal h 0xa7
        then  "a7"
        else  if Natural/equal h 0xa8
        then  "a8"
        else  if Natural/equal h 0xa9
        then  "a9"
        else  if Natural/equal h 0xaa
        then  "aa"
        else  if Natural/equal h 0xab
        then  "ab"
        else  if Natural/equal h 0xac
        then  "ac"
        else  if Natural/equal h 0xad
        then  "ad"
        else  if Natural/equal h 0xae
        then  "ae"
        else  if Natural/equal h 0xaf
        then  "af"
        else  if Natural/equal h 0xb0
        then  "b0"
        else  if Natural/equal h 0xb1
        then  "b1"
        else  if Natural/equal h 0xb2
        then  "b2"
        else  if Natural/equal h 0xb3
        then  "b3"
        else  if Natural/equal h 0xb4
        then  "b4"
        else  if Natural/equal h 0xb5
        then  "b5"
        else  if Natural/equal h 0xb6
        then  "b6"
        else  if Natural/equal h 0xb7
        then  "b7"
        else  if Natural/equal h 0xb8
        then  "b8"
        else  if Natural/equal h 0xb9
        then  "b9"
        else  if Natural/equal h 0xba
        then  "ba"
        else  if Natural/equal h 0xbb
        then  "bb"
        else  if Natural/equal h 0xbc
        then  "bc"
        else  if Natural/equal h 0xbd
        then  "bd"
        else  if Natural/equal h 0xbe
        then  "be"
        else  if Natural/equal h 0xbf
        then  "bf"
        else  if Natural/equal h 0xc0
        then  "c0"
        else  if Natural/equal h 0xc1
        then  "c1"
        else  if Natural/equal h 0xc2
        then  "c2"
        else  if Natural/equal h 0xc3
        then  "c3"
        else  if Natural/equal h 0xc4
        then  "c4"
        else  if Natural/equal h 0xc5
        then  "c5"
        else  if Natural/equal h 0xc6
        then  "c6"
        else  if Natural/equal h 0xc7
        then  "c7"
        else  if Natural/equal h 0xc8
        then  "c8"
        else  if Natural/equal h 0xc9
        then  "c9"
        else  if Natural/equal h 0xca
        then  "ca"
        else  if Natural/equal h 0xcb
        then  "cb"
        else  if Natural/equal h 0xcc
        then  "cc"
        else  if Natural/equal h 0xcd
        then  "cd"
        else  if Natural/equal h 0xce
        then  "ce"
        else  if Natural/equal h 0xcf
        then  "cf"
        else  if Natural/equal h 0xd0
        then  "d0"
        else  if Natural/equal h 0xd1
        then  "d1"
        else  if Natural/equal h 0xd2
        then  "d2"
        else  if Natural/equal h 0xd3
        then  "d3"
        else  if Natural/equal h 0xd4
        then  "d4"
        else  if Natural/equal h 0xd5
        then  "d5"
        else  if Natural/equal h 0xd6
        then  "d6"
        else  if Natural/equal h 0xd7
        then  "d7"
        else  if Natural/equal h 0xd8
        then  "d8"
        else  if Natural/equal h 0xd9
        then  "d9"
        else  if Natural/equal h 0xda
        then  "da"
        else  if Natural/equal h 0xdb
        then  "db"
        else  if Natural/equal h 0xdc
        then  "dc"
        else  if Natural/equal h 0xdd
        then  "dd"
        else  if Natural/equal h 0xde
        then  "de"
        else  if Natural/equal h 0xdf
        then  "df"
        else  if Natural/equal h 0xe0
        then  "e0"
        else  if Natural/equal h 0xe1
        then  "e1"
        else  if Natural/equal h 0xe2
        then  "e2"
        else  if Natural/equal h 0xe3
        then  "e3"
        else  if Natural/equal h 0xe4
        then  "e4"
        else  if Natural/equal h 0xe5
        then  "e5"
        else  if Natural/equal h 0xe6
        then  "e6"
        else  if Natural/equal h 0xe7
        then  "e7"
        else  if Natural/equal h 0xe8
        then  "e8"
        else  if Natural/equal h 0xe9
        then  "e9"
        else  if Natural/equal h 0xea
        then  "ea"
        else  if Natural/equal h 0xeb
        then  "eb"
        else  if Natural/equal h 0xec
        then  "ec"
        else  if Natural/equal h 0xed
        then  "ed"
        else  if Natural/equal h 0xee
        then  "ee"
        else  if Natural/equal h 0xef
        then  "ef"
        else  if Natural/equal h 0xf0
        then  "f0"
        else  if Natural/equal h 0xf1
        then  "f1"
        else  if Natural/equal h 0xf2
        then  "f2"
        else  if Natural/equal h 0xf3
        then  "f3"
        else  if Natural/equal h 0xf4
        then  "f4"
        else  if Natural/equal h 0xf5
        then  "f5"
        else  if Natural/equal h 0xf6
        then  "f6"
        else  if Natural/equal h 0xf7
        then  "f7"
        else  if Natural/equal h 0xf8
        then  "f8"
        else  if Natural/equal h 0xf9
        then  "f9"
        else  if Natural/equal h 0xfa
        then  "fa"
        else  if Natural/equal h 0xfb
        then  "fb"
        else  if Natural/equal h 0xfc
        then  "fc"
        else  if Natural/equal h 0xfd
        then  "fd"
        else  if Natural/equal h 0xfe
        then  "fe"
        else  "ff"

let toHexTextCondensed
    : Natural → Optional Text
    = λ(h : Natural) →
        if    Natural/equal h 0x00
        then  Some "0"
        else  if Natural/equal h 0x11
        then  Some "1"
        else  if Natural/equal h 0x22
        then  Some "2"
        else  if Natural/equal h 0x33
        then  Some "3"
        else  if Natural/equal h 0x44
        then  Some "4"
        else  if Natural/equal h 0x55
        then  Some "5"
        else  if Natural/equal h 0x66
        then  Some "6"
        else  if Natural/equal h 0x77
        then  Some "7"
        else  if Natural/equal h 0x88
        then  Some "8"
        else  if Natural/equal h 0x99
        then  Some "9"
        else  if Natural/equal h 0xaa
        then  Some "a"
        else  if Natural/equal h 0xbb
        then  Some "b"
        else  if Natural/equal h 0xcc
        then  Some "c"
        else  if Natural/equal h 0xdd
        then  Some "d"
        else  if Natural/equal h 0xee
        then  Some "e"
        else  if Natural/equal h 0xff
        then  Some "f"
        else  None Text

let show4
    : Hex → Text
    = λ(hex_ : Hex) →
        let rgb
            : List Natural
            = [ hex_.red, hex_.green, hex_.blue ]

        let rgbCondensed
            : List Text
            = List/unpackOptionals
                Text
                (List/map Natural (Optional Text) toHexTextCondensed rgb)

        let isRGBCondensable
            : Bool
            =
              -- This could be better all in one traverse, but I’m too lazy to write it
              Natural/equal 3 (List/length Text rgbCondensed)

        in  merge
              { Some =
                  λ(alpha : Natural) →
                    if    isRGBCondensable
                    then  merge
                            { Some =
                                λ(a : Text) → "#${Text/concat rgbCondensed}${a}"
                            , None =
                                "#${Text/concatMap
                                      Natural
                                      toHexText
                                      (rgb # [ alpha ])}"
                            }
                            (toHexTextCondensed alpha)
                    else  "#${Text/concatMap
                                Natural
                                toHexText
                                (rgb # [ alpha ])}"
              , None =
                  if    isRGBCondensable
                  then  "#${Text/concat rgbCondensed}"
                  else  "#${Text/concatMap Natural toHexText rgb}"
              }
              hex_.alpha

let show3
    : Hex → Text
    = λ(hex_ : Hex) → show4 (hex_ ⫽ { alpha = None Natural })

let show
    : Hex → Text
    = show4

let hex
    : Natural → Natural → Natural → Hex
    = λ(red : Natural) →
      λ(green : Natural) →
      λ(blue : Natural) →
        default ⫽ { red, green, blue }

let hexa
    : Natural → Natural → Natural → Natural → Hex
    = λ(red : Natural) →
      λ(green : Natural) →
      λ(blue : Natural) →
      λ(alpha : Natural) →
        default ⫽ { red, green, blue, alpha = Some alpha }

let example0 = assert : show3 (hex 0x12 0x43 0xaf) ≡ "#1243af"

let example1 = assert : show3 (hexa 0x14 0xf7 0x8f 0x4c) ≡ "#14f78f"

let example2 = assert : show3 (hex 0x11 0x44 0xff) ≡ "#14f"

let example3 = assert : show4 (hex 0x11 0x44 0xff) ≡ "#14f"

let example4 = assert : show4 (hexa 0x14 0xf7 0x8f 0x4c) ≡ "#14f78f4c"

let example5 = assert : show4 (hexa 0x11 0x44 0xff 0xdd) ≡ "#14fd"

in  { Type = Hex, hex, hexa, toHexTextCondensed, show, show3, show4 }
