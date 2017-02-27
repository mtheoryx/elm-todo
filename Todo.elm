import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram)

main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }

--model
type alias Model =
    { todo: String
    }

model =
    { todo = ""
    , todos = [ "Buy Milk", "Order medicine", "Walk the dog" ]
    }

--update
type Msg = UpdateText String

update msg model =
    case msg of
        UpdateText text ->
            { model | todo = text }

--view

todoItem todo =
    li []
        [ text todo ]

todoList todos =
    let
        children = List.map todoItem todos
    in
        ul [] children

view model =
    div []
        [ input [ type_ "text" ] []
        , button [] [ text "Add Todo" ]
        , todoList model.todos
        ]
