module TestParp exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Parp exposing (parp)
import Test exposing (..)


suite : Test
suite =
    describe "The Parp module"
        [ test "parp" <| \_ -> Expect.equal "Parp!" parp
        ]
