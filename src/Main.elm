module Main exposing (main)

import Browser exposing (element)
import Html exposing (Html)
import Html.Attributes exposing (attribute)
import Ionic exposing (..)
import Ionic.Attributes exposing (..)
import Ionic.Events exposing (..)
import Ionic.Ports exposing (..)
import Process
import Task


type alias Model =
    { datetime : String }


type Msg
    = CreateAlert
    | CreateLoading
    | CreateToast
    | DateTimeChanged String
    | OnRefresh
    | RefreshComplete
    | OKButtonClicked


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CreateAlert ->
            ( model, createAlert { header = "Header", message = "Message" } )

        CreateLoading ->
            ( model, createLoading () )

        CreateToast ->
            ( model, createToast () )

        DateTimeChanged datetime ->
            ( { model | datetime = datetime }, Cmd.none )

        OnRefresh ->
            ( model, Task.perform (\_ -> RefreshComplete) (Process.sleep 3000) )

        RefreshComplete ->
            ( model, refreshComplete () )

        OKButtonClicked ->
            let
                _ =
                    Debug.log "Log" "Ok button clicked"
            in
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    app []
        [ splitPane [ contentId "main" ]
            [ menu
            , content [ id "main" ]
                [ refresher
                , header
                , searchbar [] []
                , card
                , list model
                , fab
                ]
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    onClickOkButton (\_ -> OKButtonClicked)


refresher : Html Msg
refresher =
    Ionic.refresher
        [ slot "fixed", onRefresh OnRefresh ]
        [ refresherContent [] []
        ]


header : Html Msg
header =
    Ionic.header
        []
        [ toolbar
            []
            [ buttons
                [ slot "start" ]
                [ menuButton [] [] ]
            , title [] [ text "Top" ]
            ]
        ]


card : Html Msg
card =
    Ionic.card
        []
        [ cardHeader
            []
            [ cardSubtitle [] [ text "Card Subtitle" ]
            , cardTitle [] [ text "Card Title" ]
            ]
        , cardContent
            []
            [ text "Keep close to Nature's heart... and break clear away, once in awhile, and climb a mountain or spend a week in the woods. Wash your spirit clean." ]
        ]


list : Model -> Html Msg
list model =
    Ionic.list
        []
        [ listHeader [] [ label [] [ text "Item Header" ] ]
        , item
            []
            [ label [] [ text "Date" ]
            , datetime
                [ onChange DateTimeChanged
                , displayFormat "YYYY/MM/DD"
                , value model.datetime
                ]
                []
            ]
        , item
            []
            [ label [] [ text "Checkbox" ]
            , checkbox [ slot "end", color "danger", checked ] []
            ]
        , item
            [ onClick CreateAlert ]
            [ label [] [ text "Alert" ]
            , button [] [ text "Alert" ]
            ]
        , item
            [ onClick CreateLoading ]
            [ label [] [ text "Loading" ]
            , button [] [ text "Loading" ]
            ]
        , item
            [ onClick CreateToast ]
            [ label [] [ text "Toast" ]
            , button [] [ text "Toast" ]
            ]
        , itemDivider
            []
            [ label [] [ text "Item Divider" ] ]
        , item
            []
            [ range [ Ionic.Attributes.max "200", Ionic.Attributes.min "0", color "primary" ] []
            ]
        , item
            []
            [ label [] [ text "Chip" ]
            , chip
                []
                [ label [] [ text "Item Header" ]
                , icon [ name "close-circle" ] []
                ]
            ]
        , item
            []
            [ label [] [ text "Select" ]
            , select
                [ value "A", okText "Okay", cancelText "Dismiss" ]
                [ selectOption [ value "A" ] [ text "A" ]
                , selectOption [ value "B" ] [ text "B" ]
                , selectOption [ value "C" ] [ text "C" ]
                , selectOption [ value "D" ] [ text "D" ]
                , selectOption [ value "E" ] [ text "E" ]
                ]
            ]
        , item
            []
            [ label [] [ text "Toggle" ]
            , toggle [ checked ] []
            ]
        , item
            []
            [ label [] [ text "Badge" ]
            , badge [ color "warning" ] [ text "44" ]
            ]
        ]


fab : Html Msg
fab =
    Ionic.fab
        [ horizontal "end", vertical "bottom", slot "fixed" ]
        [ fabButton
            []
            [ icon [ name "add" ] [] ]
        , fabList
            [ side "top" ]
            [ fabButton [] [ icon [ name "logo-facebook" ] [] ]
            , fabButton [] [ icon [ name "logo-twitter" ] [] ]
            ]
        ]


menu : Html Msg
menu =
    Ionic.menu
        [ side "start", contentId "main" ]
        [ Ionic.header
            []
            [ toolbar [] [ title [] [ text "Menu" ] ]
            ]
        , content
            []
            [ item [] [ text "Item" ] ]
        ]


main : Program () Model Msg
main =
    element
        { init = \_ -> ( { datetime = "2020-01-01" }, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
