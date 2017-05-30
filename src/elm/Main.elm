module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- APP


main : Program Never Blogger Msg
main =
    Html.beginnerProgram { model = twillzy, view = view, update = update }



-- MODEL


type alias Blogger =
    { name : String
    , occupation : String
    , company : String
    , profilePic : String
    , githubUrl : String
    , twitterUrl : String
    }


twillzy : Blogger
twillzy =
    { name = "Will Tan"
    , occupation = "Software developer"
    , company = "ThoughtWorks"
    , profilePic = "static/img/twillzy.jpg"
    , githubUrl = "https://github.com/twillzy"
    , twitterUrl = "https://twitter.com/twillzy89"
    }


prisonerFatCat : Blogger
prisonerFatCat =
    { name = "Pris"
    , occupation = "Tech lead"
    , company = "Google"
    , profilePic = "static/img/pris.jpg"
    , githubUrl = "#"
    , twitterUrl = "https://www.instagram.com/pristhecat/"
    }



-- UPDATE


type Msg
    = ToggleImage


update : Msg -> Blogger -> Blogger
update msg blogger =
    case msg of
        ToggleImage ->
            if blogger == twillzy then
                prisonerFatCat
            else
                twillzy



-- VIEW


view : Blogger -> Html Msg
view blogger =
    div [ class "container", style [ ( "text-align", "center" ) ] ]
        [ ul [ class "nav nav-pills navbar-right" ]
            [ li [ attribute "role" "presentation" ]
                [ a [ href blogger.githubUrl ]
                    [ text "Github" ]
                ]
            , li [ attribute "role" "presentation" ]
                [ a [ href blogger.twitterUrl ]
                    [ text "Twitter" ]
                ]
            ]
        , div [ class "row", style [ ( "margin-top", "15em" ) ] ]
            [ div [ class "col-xs-12" ]
                [ img [ src blogger.profilePic, class "img-circle", style styles.img, onClick ToggleImage ] []
                , h2 [] [ text blogger.name ]
                , p [ class "lead" ] [ text (blogger.occupation ++ " at " ++ blogger.company) ]
                ]
            ]
        ]



-- CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "80px" )
        , ( "cursor", "pointer" )
        ]
    }
