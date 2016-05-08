module Cookie where

import Html exposing (div)
import Html.Attributes exposing (class)
import Counter
import Graphics.Collage exposing (collage, toForm)
import Graphics.Element exposing (image)
import Graphics.Input exposing (clickable)

-- View

view : Signal.Address Counter.Action -> Counter.Model -> Html.Html
view address model =
  div [ class "cookie" ] [
    Html.fromElement (collage 200 200 [
      image 200 200 "/img/cookie.jpg"
      |> clickable (Signal.message address (Counter.Increment 1))
      |> toForm
    ])
  ]