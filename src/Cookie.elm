module Cookie exposing (view)

import Html exposing (div)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Counter exposing (Action(Increment))
import Collage exposing (collage, toForm)
import Element exposing (image, toHtml)


-- View


view : Counter.Model -> Html.Html Action
view model =
    div [ class "cookie", onClick (Increment 1) ]
        [ collage 200
            200
            [ image 200 200 "/img/cookie.jpg"
                |> toForm
            ]
            |> toHtml
        ]
