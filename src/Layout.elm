module Layout exposing (view)

import Html exposing (Html, div)
import Counter
import Market
import Cookie


-- View


view : Counter.Model -> Html Counter.Action
view model =
    div []
        [ Counter.view model
        , Market.view model
        , Cookie.view model
        ]
