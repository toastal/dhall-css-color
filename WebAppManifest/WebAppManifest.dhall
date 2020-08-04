-- https://w3c.github.io/manifest/
let TextDirection =
        ./TextDirection.dhall sha256:aa6e5b2d0c222d043821cd16c5a249e2d045b3e920e55a9cde06b6951f32d24f
      ? ./TextDirection.dhall

let ImageResource =
        ./ImageResource.dhall sha256:64b1a1d6c7509f0156b8c10e62cd29119645eff5c469e23b7af3cc899e0e9ce1
      ? ./ImageResource.dhall

let DisplayMode =
        ./DisplayMode.dhall sha256:ea8a625a3f2bd2a98b30dc59b4901279c4fc6804f07a11c94dd446d5d691b3e3
      ? ./DisplayMode.dhall

let OrientationLock =
        ./OrientationLock.dhall sha256:a91569d276cf93f6c69760791d4833057db03872f661a8811f7a1b59358a1b64
      ? ./OrientationLock.dhall

let WebAppManifest =
      { dir : Optional TextDirection.Type
      , lang : Optional Text
      , name : Optional Text
      , short_name : Optional Text
      , description : Optional Text
      , icons : Optional (List ImageResource.Type)
      , screenshots : Optional (List ImageResource.Type)
      , categories : Optional (List Text)
      , iarc_rating_id : Optional Text
      , start_url : Optional Text
      , display : Optional DisplayMode.Type
      , orientation : Optional OrientationLock.Type
      , theme_color : Optional Text
      , background_color : Optional Text
      , scope : Optional Text
      , related_applications : Optional (List Text)
      , prefer_related_applications : Optional Bool
      , shortcuts : Optional (List Text)
      }

let default
    : WebAppManifest
    = { dir = None TextDirection.Type
      , lang = None Text
      , name = None Text
      , short_name = None Text
      , description = None Text
      , icons = None (List ImageResource.Type)
      , screenshots = None (List ImageResource.Type)
      , categories = None (List Text)
      , iarc_rating_id = None Text
      , start_url = None Text
      , display = None DisplayMode.Type
      , orientation = None OrientationLock.Type
      , theme_color = None Text
      , background_color = None Text
      , scope = None Text
      , related_applications = None (List Text)
      , prefer_related_applications = None Bool
      , shortcuts = None (List Text)
      }

in  { Type = WebAppManifest, default }
