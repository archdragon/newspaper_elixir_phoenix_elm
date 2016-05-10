module NewspaperPage where

import Html exposing (..)
import Html.Attributes exposing (class, src)

type alias NewspaperPage =
  {
    title: String,
    articles: List Article
  }

type alias Article =
  {
    title: String,
    colSize: String,
    image: String
  }

newspaperPageView : NewspaperPage -> Html
newspaperPageView model =
  div []
    [ 
      div [ class "container" ][
        div [ class "col-sm-12" ][ h1 [] [ text model.title ] ],
        div [ class "col-sm-12 info-bar" ][ text "01 II 2020" ]
      ],
      div [] 
        [ div [ class "container" ]
         (List.map (\t ->
         div [ class t.colSize ][
           h2 [] [ text t.title ],
           case t.image of
             "" -> 
               span [][]
             _  -> 
               img [ src "/images/pic_person.jpg", class "article-image pull-left" ] []
           , 
           p [ class "fake-text" ] [ text "████ █████ ██████████ ███████ ███████ ███████ ████████████ ████ ███████ █ ████ █ █████ █ █████" ],
           p [ class "fake-text" ] [ text "█████████ ██████████ ███ ███ ███████ ███████ ██████ █████ ████████ ████████ █████ █ █████" ],
           p [ class "fake-text" ] [ text "████ █████ ██████ ███ ██ ████ ███████ ███████ ████████████ ████████████ █████ █████ █ █████" ]
         ]) model.articles)
        ]
    ]
