-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#css-system-colors

  SystemColor 2 was deprecated in 3
  https://www.w3.org/TR/css-color-3/#css-system

  SystemColor 4
  copy("< " + $$("#system-color-values dfn").map(x => x.textContent).join("\n| ") + "\n>")
  copy("merge { " + $$("#system-color-values dfn").map(x => { const y = x.textContent; return `${y} = "${y}"` }).join("\n, ") + "\n}")
-}
let SystemColor4
    : Type
    = < Canvas
      | CanvasText
      | LinkText
      | VisitedText
      | ActiveText
      | ButtonFace
      | ButtonText
      | Field
      | FieldText
      | Highlight
      | HighlightText
      | GrayText
      >

let SystemColor
    : Type
    = SystemColor4

let show4
    : SystemColor4 → Text
    = λ(systemColor : SystemColor) →
        merge
          { Canvas = "Canvas"
          , CanvasText = "CanvasText"
          , LinkText = "LinkText"
          , VisitedText = "VisitedText"
          , ActiveText = "ActiveText"
          , ButtonFace = "ButtonFace"
          , ButtonText = "ButtonText"
          , Field = "Field"
          , FieldText = "FieldText"
          , Highlight = "Highlight"
          , HighlightText = "HighlightText"
          , GrayText = "GrayText"
          }
          systemColor

let show
    : SystemColor → Text
    = show4

let example0 = assert : show4 (SystemColor4.Canvas) ≡ "Canvas"

in  { Type = SystemColor, SystemColor4, show, show4 }
