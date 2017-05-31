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
    , twitterUrl : Maybe String
    , instagramUrl : Maybe String
    }


twillzy : Blogger
twillzy =
    { name = "Will Tan"
    , occupation = "Software developer"
    , company = "ThoughtWorks"
    , profilePic = "static/img/twillzy.jpg"
    , githubUrl = "https://github.com/twillzy"
    , twitterUrl = Just "https://twitter.com/twillzy89"
    , instagramUrl = Nothing
    }


prisonerFatCat : Blogger
prisonerFatCat =
    { name = "Pris The Cat"
    , occupation = "Chief Cat Officer"
    , company = "Google"
    , profilePic = "static/img/pris.jpg"
    , githubUrl = "#"
    , twitterUrl = Nothing
    , instagramUrl = Just "https://www.instagram.com/pristhecat/"
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
    let
        ( socialMedia, socialMediaUrl ) =
            if blogger == twillzy then
                ( "Twitter", Maybe.withDefault "#" blogger.twitterUrl )
            else
                ( "Instagram", Maybe.withDefault "#" blogger.instagramUrl )
    in
        div [ class "container" ]
            [ ul [ class "nav nav-pills navbar-right" ]
                [ li [ attribute "role" "presentation" ]
                    [ a [ href blogger.githubUrl ]
                        [ text "Github" ]
                    ]
                , li [ attribute "role" "presentation" ]
                    [ a [ href socialMediaUrl ]
                        [ text socialMedia ]
                    ]
                ]
            , div [ class "row" ]
                [ div [ class "col-xs-12" ]
                    [ img [ src blogger.profilePic, class "img-circle", onClick ToggleImage ] []
                    , h2 [] [ text blogger.name ]
                    , p [ class "lead" ] [ text (blogger.occupation ++ " at " ++ blogger.company) ]
                    ]
                ]
            ]
