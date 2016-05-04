module Newspaper where

import Html exposing (..)
import NewspaperPage exposing (..)
import Html.Attributes exposing (class)

init : NewspaperPage
init =
  {
    articles = ["one", "two", "three"]
  }

main : Html
main =
  newspaperPageView init
