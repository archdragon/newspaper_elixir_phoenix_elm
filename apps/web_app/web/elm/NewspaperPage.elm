module NewspaperPage where

import Html exposing (..)
import Html.Attributes exposing (class)

type alias NewspaperPage =
  {
    articles: List String
  }

type alias Article =
  {
    title: String
  }

newspaperPageView : NewspaperPage -> Html
newspaperPageView model =
  div []
    [ div [ class "page-header" ] 
        [ text "Real Newspaper" ],
      div [] 
        (List.map (\t -> text t) model.articles)]
