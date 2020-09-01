module WarekiTest exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Wareki


suite : Test
suite =
    describe "All"
        [ describe "toWareki"
            [ test "toWareki.Nothing" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "100-01-01"
                    |> Expect.equal "Do not exists matched Wareki."
            , test "toWareki.令和" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "2020-05-01"
                    |> Expect.equal "令和2年5月1日"
            , test "toWareki.平成7年" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1995-03-27"
                    |> Expect.equal "平成7年3月27日"
            , test "toWareki.平成6年" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1994-10-01"
                    |> Expect.equal "平成6年10月1日"
            , test "toWareki.昭和" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1980-01-01"
                    |> Expect.equal "昭和55年1月1日"
            , test "toWareki.大正" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1920-02-22"
                    |> Expect.equal "大正9年2月22日"
            , test "toWareki.明治" <|
                \_ ->
                    Wareki.toWarekiFromIsoString "1880-07-07"
                    |> Expect.equal "明治13年7月7日"
            ]
        ]
