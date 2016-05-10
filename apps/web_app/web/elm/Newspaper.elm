module Newspaper where

import Html exposing (..)
import NewspaperPage exposing (..)
import Html.Attributes exposing (class)
import Random exposing(..)
import Time exposing (Time) 

-- randomHeaderGenerator: Generator String
-- randomHeaderGenerator =
--  map (\n -> "RandomHeader") (int 0 25)

-- randomHeaderText: String
-- randomHeaderText = 
--  randomHeaderGenerator
seed0 = initialSeed 31415
(myint, seed1) = generate (int 0 100) seed0

randomInt: Int
randomInt = myint

exampleTitles : List String
exampleTitles =
  [
  ]

  -- generate (randomHeader) - Seed -> String, Seed

init : NewspaperPage
init =
  {
    title = "Greetings Fellow Humans",
    articles = [
      {title = "title 1", colSize = "col-sm-7", image = "/images/pic_person.jpg"},
      {title = "title 1", colSize = "col-sm-5", image = ""},

      {title = "title 2", colSize = "col-sm-4", image = ""},
      {title = "title 2", colSize = "col-sm-4", image = ""},
      {title = "title 2", colSize = "col-sm-4", image = ""},

      {title = "title 2", colSize = "col-sm-12", image = ""},
      {title = "title 2", colSize = "col-sm-12", image = ""}
    ]
  }

main : Html
main =
  newspaperPageView init
