module WarekiTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Time
import Wareki exposing (..)


suite : Test
suite =
    describe "All"
        [ describe "toNengo"
            [ test "toNengo.昭和" <|
                \_ ->
                    Time.millisToPosix 0
                    |> Wareki.toNengoFromPosix
                    |> Expect.equal (Ok "昭和")
            , test "toNengo.平成" <|
                \_ ->
                    Time.millisToPosix 796303523000
                    |> Wareki.toNengoFromPosix
                    |> Expect.equal (Ok "平成")
            , test "toNengo.令和" <|
                \_ ->
                    Time.millisToPosix 1599909981000
                    |> Wareki.toNengoFromPosix
                    |> Expect.equal (Ok "令和")
            ]
        , describe "toWarekiFromIsoString"
            [ test "toWarekiFromIsoString.Nothing" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "100-01-01"
                    |> Expect.equal "Do not exists matched Wareki."
            , test "toWarekiFromIsoString.令和" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "2020-05-01"
                    |> Expect.equal "令和2年5月1日"
            , test "toWarekiFromIsoString.平成7年" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1995-03-27"
                    |> Expect.equal "平成7年3月27日"
            , test "toWarekiFromIsoString.平成6年" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1994-10-01"
                    |> Expect.equal "平成6年10月1日"
            , test "toWarekiFromIsoString.昭和" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1980-01-01"
                    |> Expect.equal "昭和55年1月1日"
            , test "toWarekiFromIsoString.大正" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1920-02-22"
                    |> Expect.equal "大正9年2月22日"
            , test "toWarekiFromIsoString.明治" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1880-07-07"
                    |> Expect.equal "明治13年7月7日"
            ]
        ]
