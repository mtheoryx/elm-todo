import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (beginnerProgram)
import Html.Events exposing (onInput, onClick)

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
type Msg
    = UpdateText String
    | RemoveItem String

update msg model =
    case msg of
        UpdateText text ->
            { model | todo = text }

        RemoveItem todo ->
            { model |
                todos =
                    List.filter (\t -> t /= todo) model.todos}

--view

todoItem todo =
    li []
        [ text todo
        , button [ onClick (RemoveItem todo) ] [ text "X" ]
        ]

todoList todos =
    let
        children = List.map todoItem todos
    in
        ul [] children

view model =
    div []
        [ input [ type_ "text"
        , onInput UpdateText] []
        , button [] [ text "Add Todo" ]
        , div [] [ text model.todo ]
        , todoList model.todos
        ]
