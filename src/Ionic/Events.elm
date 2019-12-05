module Ionic.Events exposing (onChange, onClick, onRefresh)

import Html exposing (Attribute)
import Html.Events exposing (on, onClick, targetValue)
import Json.Decode as Json


onChange : (String -> msg) -> Attribute msg
onChange handler =
    on "ionChange" (Json.map handler targetValue)


onClick =
    Html.Events.onClick


onRefresh message =
    on "ionRefresh" (Json.succeed message)
