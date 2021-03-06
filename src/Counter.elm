module Counter
    exposing
        ( Item(..)
        , update
        , Model
        , Action(..)
        , view
        )

import Html exposing (..)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)
import Platform exposing (..)
import String


-- Model


type alias StoreItem =
    { nb : Float
    , production : Float
    , price : Float
    , growth : Float
    }


type alias Store =
    { cursor : StoreItem
    , granma : StoreItem
    , farmer : StoreItem
    }


type alias Model =
    { cookies : Float
    , store : Store
    }



-- Update


type Item
    = Cursor
    | Granma
    | Farmer


type Action
    = Increment Float
    | Decrement Float
    | Update
    | Buy Item


update : Action -> Model -> ( Model, Cmd a )
update action model =
    case action of
        Increment val ->
            ( { cookies = model.cookies + val, store = model.store }, Cmd.none )

        Decrement val ->
            ( { cookies = model.cookies + val, store = model.store }, Cmd.none )

        Update ->
            ( generateCookies model, Cmd.none )

        Buy item ->
            case item of
                Cursor ->
                    if model.cookies < model.store.cursor.price then
                        ( model, Cmd.none )
                    else
                        ( { cookies = model.cookies - model.store.cursor.price
                          , store =
                                { cursor =
                                    { nb = model.store.cursor.nb + 1
                                    , production = model.store.cursor.production
                                    , price = model.store.cursor.price + model.store.cursor.growth
                                    , growth = model.store.cursor.growth
                                    }
                                , granma = model.store.granma
                                , farmer = model.store.farmer
                                }
                          }
                        , Cmd.none
                        )

                Granma ->
                    if model.cookies < model.store.granma.price then
                        ( model, Cmd.none )
                    else
                        ( { cookies = model.cookies - model.store.granma.price
                          , store =
                                { cursor = model.store.cursor
                                , granma =
                                    { nb = model.store.granma.nb + 1
                                    , production = model.store.granma.production
                                    , price = model.store.granma.price + model.store.granma.growth
                                    , growth = model.store.granma.growth
                                    }
                                , farmer = model.store.farmer
                                }
                          }
                        , Cmd.none
                        )

                Farmer ->
                    if model.cookies < model.store.farmer.price then
                        ( model, Cmd.none )
                    else
                        ( { cookies = model.cookies - model.store.farmer.price
                          , store =
                                { cursor = model.store.cursor
                                , granma = model.store.granma
                                , farmer =
                                    { nb = model.store.farmer.nb + 1
                                    , production = model.store.farmer.production
                                    , price = model.store.farmer.price + model.store.farmer.growth
                                    , growth = model.store.farmer.growth
                                    }
                                }
                          }
                        , Cmd.none
                        )


generateCookies : Model -> Model
generateCookies model =
    { cookies = model.cookies + (cps model) * 0.1
    , store = model.store
    }


cps : Model -> Float
cps model =
    model.store.cursor.nb
        * model.store.cursor.production
        + model.store.granma.nb
        * model.store.granma.production
        + model.store.farmer.nb
        * model.store.farmer.production



-- View


view : Model -> Html msg
view model =
    div []
        [ div [ countStyle ] [ text (String.concat [ " Cookies: ", toString (round model.cookies), "\nCpS: ", toString (cps model) ]) ] ]


countStyle : Attribute msg
countStyle =
    style
        [ ( "font-size", "20px" )
        , ( "font-family", "monospace" )
        , ( "display", "inline-block" )
        , ( "width", "50px" )
        , ( "text-align", "center" )
        ]
