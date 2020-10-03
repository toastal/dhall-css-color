-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
{-
  https://drafts.csswg.org/css-color/#predefined

  TODO: Finish? And do custom? I dunno, it’t a lot of work, not supported, and
  is probably not ergonomic for a user to use this library.
-}
let Predefined = < srgb | display-p3 | a98-rgb | prophoto-rgb | rec2020 | lab >

in  { Type = Predefined }
