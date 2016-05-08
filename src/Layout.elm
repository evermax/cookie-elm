module Layout where

import Html exposing (Html, div)
import Counter
import Market
import Cookie


-- View

view : Signal.Address Counter.Action -> Counter.Model -> Html
view address model =
  div []
  [ Counter.view address model
  , Market.view address model
  , Cookie.view address model
  ]