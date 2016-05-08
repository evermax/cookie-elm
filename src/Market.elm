module Market where

import Html exposing (..)
import Counter
import String
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, class)


-- View

view : Signal.Address Counter.Action -> Counter.Model -> Html
view address model =
  ul []
    [ li [] [button [ regOnClick address Counter.Cursor ] [ text (String.concat ["Cursor ", toString model.store.cursor.nb]) ], text (String.concat ["Price: ", toString model.store.cursor.price]) ]
    , li [] [button [ regOnClick address Counter.Granma ] [ text (String.concat ["Granma ", toString model.store.granma.nb]) ], text (String.concat ["Price: ", toString model.store.granma.price]) ]
    , li [] [button [ regOnClick address Counter.Farmer ] [ text (String.concat ["Farmer ", toString model.store.farmer.nb]) ], text (String.concat ["Price: ", toString model.store.farmer.price]) ]
    ]

regOnClick : Signal.Address Counter.Action -> Counter.Item -> Html.Attribute
regOnClick address item =
  onClick address (Counter.Buy item)