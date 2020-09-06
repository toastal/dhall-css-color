-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://www.w3.org/TR/css-color-4/#named-colors

  Color 3 doesn’t support rebeccapurple, but like, it’s not worth the effort

  copy("< " + $$("table.named-color-table dfn.css").map(x => x.textContent.trim()).join("\n| ") + "\n>")
  copy("{ " + $$("table.named-color-table dfn.css").map(x => { const y = x.textContent.trim(); return `${y} = "${y}"` }).join("\n, ") + "\n}")
-}

let NamedColor
    : Type
    = < aliceblue
      | antiquewhite
      | aqua
      | aquamarine
      | azure
      | beige
      | bisque
      | black
      | blanchedalmond
      | blue
      | blueviolet
      | brown
      | burlywood
      | cadetblue
      | chartreuse
      | chocolate
      | coral
      | cornflowerblue
      | cornsilk
      | crimson
      | cyan
      | darkblue
      | darkcyan
      | darkgoldenrod
      | darkgray
      | darkgreen
      | darkgrey
      | darkkhaki
      | darkmagenta
      | darkolivegreen
      | darkorange
      | darkorchid
      | darkred
      | darksalmon
      | darkseagreen
      | darkslateblue
      | darkslategray
      | darkslategrey
      | darkturquoise
      | darkviolet
      | deeppink
      | deepskyblue
      | dimgray
      | dimgrey
      | dodgerblue
      | firebrick
      | floralwhite
      | forestgreen
      | fuchsia
      | gainsboro
      | ghostwhite
      | gold
      | goldenrod
      | gray
      | green
      | greenyellow
      | grey
      | honeydew
      | hotpink
      | indianred
      | indigo
      | ivory
      | khaki
      | lavender
      | lavenderblush
      | lawngreen
      | lemonchiffon
      | lightblue
      | lightcoral
      | lightcyan
      | lightgoldenrodyellow
      | lightgray
      | lightgreen
      | lightgrey
      | lightpink
      | lightsalmon
      | lightseagreen
      | lightskyblue
      | lightslategray
      | lightslategrey
      | lightsteelblue
      | lightyellow
      | lime
      | limegreen
      | linen
      | magenta
      | maroon
      | mediumaquamarine
      | mediumblue
      | mediumorchid
      | mediumpurple
      | mediumseagreen
      | mediumslateblue
      | mediumspringgreen
      | mediumturquoise
      | mediumvioletred
      | midnightblue
      | mintcream
      | mistyrose
      | moccasin
      | navajowhite
      | navy
      | oldlace
      | olive
      | olivedrab
      | orange
      | orangered
      | orchid
      | palegoldenrod
      | palegreen
      | paleturquoise
      | palevioletred
      | papayawhip
      | peachpuff
      | peru
      | pink
      | plum
      | powderblue
      | purple
      | rebeccapurple
      | red
      | rosybrown
      | royalblue
      | saddlebrown
      | salmon
      | sandybrown
      | seagreen
      | seashell
      | sienna
      | silver
      | skyblue
      | slateblue
      | slategray
      | slategrey
      | snow
      | springgreen
      | steelblue
      | tan
      | teal
      | thistle
      | tomato
      | turquoise
      | violet
      | wheat
      | white
      | whitesmoke
      | yellow
      | yellowgreen
      >

let show4
    : NamedColor → Text
    = λ(name : NamedColor) →
        merge
          { aliceblue = "aliceblue"
          , antiquewhite = "antiquewhite"
          , aqua = "aqua"
          , aquamarine = "aquamarine"
          , azure = "azure"
          , beige = "beige"
          , bisque = "bisque"
          , black = "black"
          , blanchedalmond = "blanchedalmond"
          , blue = "blue"
          , blueviolet = "blueviolet"
          , brown = "brown"
          , burlywood = "burlywood"
          , cadetblue = "cadetblue"
          , chartreuse = "chartreuse"
          , chocolate = "chocolate"
          , coral = "coral"
          , cornflowerblue = "cornflowerblue"
          , cornsilk = "cornsilk"
          , crimson = "crimson"
          , cyan = "cyan"
          , darkblue = "darkblue"
          , darkcyan = "darkcyan"
          , darkgoldenrod = "darkgoldenrod"
          , darkgray = "darkgray"
          , darkgreen = "darkgreen"
          , darkgrey = "darkgrey"
          , darkkhaki = "darkkhaki"
          , darkmagenta = "darkmagenta"
          , darkolivegreen = "darkolivegreen"
          , darkorange = "darkorange"
          , darkorchid = "darkorchid"
          , darkred = "darkred"
          , darksalmon = "darksalmon"
          , darkseagreen = "darkseagreen"
          , darkslateblue = "darkslateblue"
          , darkslategray = "darkslategray"
          , darkslategrey = "darkslategrey"
          , darkturquoise = "darkturquoise"
          , darkviolet = "darkviolet"
          , deeppink = "deeppink"
          , deepskyblue = "deepskyblue"
          , dimgray = "dimgray"
          , dimgrey = "dimgrey"
          , dodgerblue = "dodgerblue"
          , firebrick = "firebrick"
          , floralwhite = "floralwhite"
          , forestgreen = "forestgreen"
          , fuchsia = "fuchsia"
          , gainsboro = "gainsboro"
          , ghostwhite = "ghostwhite"
          , gold = "gold"
          , goldenrod = "goldenrod"
          , gray = "gray"
          , green = "green"
          , greenyellow = "greenyellow"
          , grey = "grey"
          , honeydew = "honeydew"
          , hotpink = "hotpink"
          , indianred = "indianred"
          , indigo = "indigo"
          , ivory = "ivory"
          , khaki = "khaki"
          , lavender = "lavender"
          , lavenderblush = "lavenderblush"
          , lawngreen = "lawngreen"
          , lemonchiffon = "lemonchiffon"
          , lightblue = "lightblue"
          , lightcoral = "lightcoral"
          , lightcyan = "lightcyan"
          , lightgoldenrodyellow = "lightgoldenrodyellow"
          , lightgray = "lightgray"
          , lightgreen = "lightgreen"
          , lightgrey = "lightgrey"
          , lightpink = "lightpink"
          , lightsalmon = "lightsalmon"
          , lightseagreen = "lightseagreen"
          , lightskyblue = "lightskyblue"
          , lightslategray = "lightslategray"
          , lightslategrey = "lightslategrey"
          , lightsteelblue = "lightsteelblue"
          , lightyellow = "lightyellow"
          , lime = "lime"
          , limegreen = "limegreen"
          , linen = "linen"
          , magenta = "magenta"
          , maroon = "maroon"
          , mediumaquamarine = "mediumaquamarine"
          , mediumblue = "mediumblue"
          , mediumorchid = "mediumorchid"
          , mediumpurple = "mediumpurple"
          , mediumseagreen = "mediumseagreen"
          , mediumslateblue = "mediumslateblue"
          , mediumspringgreen = "mediumspringgreen"
          , mediumturquoise = "mediumturquoise"
          , mediumvioletred = "mediumvioletred"
          , midnightblue = "midnightblue"
          , mintcream = "mintcream"
          , mistyrose = "mistyrose"
          , moccasin = "moccasin"
          , navajowhite = "navajowhite"
          , navy = "navy"
          , oldlace = "oldlace"
          , olive = "olive"
          , olivedrab = "olivedrab"
          , orange = "orange"
          , orangered = "orangered"
          , orchid = "orchid"
          , palegoldenrod = "palegoldenrod"
          , palegreen = "palegreen"
          , paleturquoise = "paleturquoise"
          , palevioletred = "palevioletred"
          , papayawhip = "papayawhip"
          , peachpuff = "peachpuff"
          , peru = "peru"
          , pink = "pink"
          , plum = "plum"
          , powderblue = "powderblue"
          , purple = "purple"
          , rebeccapurple = "rebeccapurple"
          , red = "red"
          , rosybrown = "rosybrown"
          , royalblue = "royalblue"
          , saddlebrown = "saddlebrown"
          , salmon = "salmon"
          , sandybrown = "sandybrown"
          , seagreen = "seagreen"
          , seashell = "seashell"
          , sienna = "sienna"
          , silver = "silver"
          , skyblue = "skyblue"
          , slateblue = "slateblue"
          , slategray = "slategray"
          , slategrey = "slategrey"
          , snow = "snow"
          , springgreen = "springgreen"
          , steelblue = "steelblue"
          , tan = "tan"
          , teal = "teal"
          , thistle = "thistle"
          , tomato = "tomato"
          , turquoise = "turquoise"
          , violet = "violet"
          , wheat = "wheat"
          , white = "white"
          , whitesmoke = "whitesmoke"
          , yellow = "yellow"
          , yellowgreen = "yellowgreen"
          }
          name

let show
    : NamedColor → Text
    = show4

let example0 = assert : show4 NamedColor.rebeccapurple ≡ "rebeccapurple"

in  { Type = NamedColor, show, show4 }
