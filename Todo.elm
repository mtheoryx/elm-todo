import Html exposing (..)
import Html.Attributes exposing (..)

main =
    view

--model
type alias Model =
    { todo: String
    }

model =
    { todo = ""
    , todos = [ "Buy Milk", "Order medicine", "Walk the dog" ]
    }

--update



--view

todoItem todo =
    li []
        [ text todo ]

todoList todos =
    let
        children = List.map todoItem todos
    in
        ul [] children

view =
    div []
        [ input [ type_ "text" ] []
        , button [] [ text "Add Todo" ]
        , todoList model.todos
        ]
