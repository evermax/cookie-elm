import Counter exposing (update, Model)
import Layout exposing (view)
import StartApp exposing (start)
import Effects exposing (Effects)
import Time


-- make init retrieve the model from local storage if it exist
init : ( Model, Effects a )
init = 
  (
    { cookies = 0.0
    , store =
      { cursor = { nb = 0.0, production = 1.0, price = 10.0, growth = 1.0 }
      , granma = { nb = 0.0, production = 5.0, price = 50.0, growth = 5.0 }
      , farmer = { nb = 0.0, production = 20.0, price = 500.0, growth = 50.0 }
      }
    }
    , Effects.none
  )

timeUpdate : Signal Counter.Action
timeUpdate = Signal.map Counter.Update (Time.every (100 * Time.millisecond))

-- Add a new signal, timeSave that will save into localstorage the model.

app = 
  start
    { init = init
    , view = view
    , update = update
    , inputs = [timeUpdate]
    }

main = app.html