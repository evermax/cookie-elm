module Market exposing (view)

import Html exposing (..)
import Counter exposing (Action(..), Item(..))
import String
import Html.Events exposing (onClick)
import Html.Attributes exposing (style, class)


-- View


view : Counter.Model -> Html Action
view model =
    ul []
        [ li [] [ button [ onClick (Buy Cursor) ] [ text (String.concat [ "Cursor ", toString model.store.cursor.nb ]) ], text (String.concat [ "Price: ", toString model.store.cursor.price ]) ]
        , li [] [ button [ onClick (Buy Granma) ] [ text (String.concat [ "Granma ", toString model.store.granma.nb ]) ], text (String.concat [ "Price: ", toString model.store.granma.price ]) ]
        , li [] [ button [ onClick (Buy Farmer) ] [ text (String.concat [ "Farmer ", toString model.store.farmer.nb ]) ], text (String.concat [ "Price: ", toString model.store.farmer.price ]) ]
        ]
