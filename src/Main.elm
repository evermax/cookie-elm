module Main exposing (..)

import Counter exposing (Model)
import Layout
import Html.App as Html
import Platform exposing (..)
import Time


sendUpdate : Time.Time -> Counter.Action
sendUpdate time =
    Counter.Update



-- make init retrieve the model from local storage if it exist


init : ( Model, Cmd a )
init =
    ( { cookies = 0.0
      , store =
            { cursor = { nb = 0.0, production = 1.0, price = 10.0, growth = 5.0 }
            , granma = { nb = 0.0, production = 5.0, price = 50.0, growth = 25.0 }
            , farmer = { nb = 0.0, production = 20.0, price = 500.0, growth = 100.0 }
            }
      }
    , Cmd.none
    )


timeUpdate : Model -> Sub Counter.Action
timeUpdate model =
    Time.every (100 * Time.millisecond) sendUpdate



-- Add a new signal, timeSave that will save into localstorage the model


main =
    Html.program
        { init = init
        , view = Layout.view
        , update = Counter.update
        , subscriptions = timeUpdate
        }
