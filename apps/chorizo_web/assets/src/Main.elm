module Main exposing (main)

import Debug exposing (log)
import Browser
import Html exposing (..)
import Html.Attributes exposing (id, class, for, placeholder, type_, name, value, required)
import Html.Events exposing (onInput, onSubmit)
import Http
import Json.Encode as Encode
import Json.Decode exposing (string)

main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

type alias Model =
  { email : String
  , password : String
  , loginError : String
  }

init : () -> (Model, Cmd Msg)
init _ =
  (Model "" "" "", Cmd.none)

type Msg
  = Email String
  | Password String
  | Submit
  | AuthenticationResponse (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Email email ->
      ({ model | email = email }, Cmd.none)

    Password password ->
      ({ model | password = password }, Cmd.none)

    Submit ->
      (model, postCredentials model)

    AuthenticationResponse response ->
      case response of
        Ok url ->
          (model, Cmd.none)

        Err error ->
          ({model | loginError = "Server error, please try again."}, Cmd.none)

subscriptions model =
  Sub.none

view : Model -> Html Msg
view model =
  div [id "loginPrompt"] [
    h2 [] [text "Please Log In"],
    if String.length model.loginError > 0
      then div [class "error"] [text model.loginError]
      else text "",
    form [onSubmit Submit] [
      div [class "form-group"] [
        label [for "emailInput"] [text "Email"],
        input [
          class "form-control",
          type_ "email",
          id "emailInput",
          name "email",
          required True,
          value model.email,
          placeholder "Your account Email",
          onInput Email
          ] []
      ],

      div [class "form-group"] [
        label [for "passwordInput"] [text "Password"],
        input [
          class "form-control",
          type_ "password",
          id "passwordInput",
          name "password",
          required True,
          value model.password,
          placeholder "Your account Password",
          onInput Password
          ] []
      ],

      button [
        type_ "submit",
        class "btn btn-primary"
        ] [text "Log In"]
    ]
  ]

encode : Model -> Encode.Value
encode model =
  Encode.object
    [ ("email", Encode.string model.email)
    , ("password", Encode.string model.password)
    ]

postCredentials : Model -> Cmd Msg
postCredentials model =
  Http.post
    { url = "/api/authenticate"
    , body = Http.jsonBody (encode model)
    , expect = Http.expectJson AuthenticationResponse string
    }
