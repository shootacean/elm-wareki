module Wareki exposing (toWarekiFromIsoString)

{-| This library convert date-string to Wareki (japanese-era) in Elm.

# Convert Functions
@docs toWarekiFromIsoString
-}

import Time exposing (Month(..))
import Date

type alias Wareki =
    { name : String
    , from : WarekiDate
    , to : WarekiDate
    , max : Int
    }

type alias WarekiDate =
    { year : Int
    , month : Month
    , day : Int
    }

warekiList : List Wareki
warekiList =
    [ { name = "令和", from = { year = 2019, month = May, day = 1 }, to = { year = 9999, month = Dec, day = 31 } , max = 2 }
    , { name = "平成", from = { year = 1989, month = Jan, day = 8 }, to = { year = 2019, month = Apr, day = 30 } , max = 31 }
    , { name = "昭和", from = { year = 1926, month = Dec, day = 25 }, to = { year = 1989, month = Jan, day = 7 } , max = 64 }
    , { name = "大正", from = { year = 1912, month = Jul, day = 30 }, to = { year = 1926, month = Dec, day = 24 } , max = 15 }
    , { name = "明治", from = { year = 1868, month = Jan, day = 25 }, to = { year = 1912, month = Jul, day = 29 } , max = 45 }
    ]

{-| This functions convert date-string to Wareki(japanese-era) string:

    toWarekiFromIsoString "2020-05-01" == "令和2年5月1日"
    toWarekiFromIsoString "hoge" == "Do not exists matched Wareki."
-}
toWarekiFromIsoString : String -> String
toWarekiFromIsoString s =
    let
        date = Date.fromIsoString s
            |> Result.withDefault (Date.fromCalendarDate 0 Jan 1)
        wareki = List.filter (\w -> is w date) warekiList
            |> List.head
    in
        case wareki of
            Nothing ->
                "Do not exists matched Wareki."
            Just d ->
                d.name ++ String.fromInt ((Date.year date) - d.from.year + 1) ++ "年"
                ++ String.fromInt (Date.monthNumber date) ++ "月"
                ++ String.fromInt (Date.day date) ++ "日"

is : Wareki -> Date.Date -> Bool
is w d =
    let
        from = Date.fromCalendarDate w.from.year w.from.month w.from.day
        to = Date.fromCalendarDate w.to.year w.to.month w.to.day
    in
        Date.isBetween from to d
