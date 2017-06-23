module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode
import Maybe exposing (Maybe)
import Result exposing (Result)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( buildModel Nothing, goFetchJSON )


jsonString =
    """
[42, 100]
"""


decodeIntList : List Int
decodeIntList =
    let
        r =
            Decode.decodeString (Decode.list Decode.int) jsonString
    in
    case r of
        Ok v ->
            v

        Err _ ->
            [ 9999 ]


decodedInt : Int
decodedInt =
    let
        r =
            Decode.decodeString Decode.int "42"
    in
    case r of
        Ok v ->
            v

        Err _ ->
            9999


dataSetURL =
    "https://data.cityofnewyork.us/api/views/5t4n-d72c/rows.json?accessType=DOWNLOAD"


reportDecoder : Decode.Decoder Report
reportDecoder =
    Decode.map
        Report
        (Decode.field "meta" (Decode.field "view" (Decode.field "name" Decode.string)))


goFetchJSON : Cmd Msg
goFetchJSON =
    Http.send Parsed
        (Http.get dataSetURL reportDecoder)



-- MODEL


buildModel : Maybe Report -> Model
buildModel report =
    case report of
        Just r ->
            Model decodedInt decodeIntList r

        Nothing ->
            Model decodedInt decodeIntList (Report "none")


type alias Model =
    { anInt : Int, anIntList : List Int, report : Report }


type alias Report =
    { name : String }



-- UPDATE


type Msg
    = Parsed (Result Http.Error Report)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Parsed (Ok report) ->
            ( buildModel (Just report), Cmd.none )

        Parsed (Err s) ->
            ( buildModel Nothing, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    ul []
        [ li [] [ text ("single int " ++ toString model.anInt) ]
        , li [] [ text ("int list " ++ toString model.anIntList) ]
        , li [] [ text ("meta -> view -> name " ++ toString model.report.name) ]
        , li [] [ text ("data size " ++ toString model.anIntList) ]
        , li [] [ text ("columns " ++ toString model.anIntList) ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
