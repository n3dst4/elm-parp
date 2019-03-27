# elm-parp

This repo can be used to reproduce a bug that manifests when using vscode-elm while running `elm-test --watch`.

## Steps

These steps assume you have `elm` and `elm-test` available on your $PATH.

1. clone this repo and cd into the `application` folder
2. `elm-test`
3. observe that the test suite is okay
4. `elm-test --watch`
5. observe that that test suite is still okay
6. run this command which will touch a test file and immediatly `make` it:

    `touch tests/TestParp.elm; elm-test make`

7. observe that it's still all okay

Now it gets good:

8. kill the test runner
9. `cd ../package`
10. `elm-test --watch`
11. observe that on the first run, test suite is *still* okay
12. run this command which will touch a test file and immediatly `make` it:

    `touch tests/TestParp.elm; elm-test make`

13. Boom

    **EXPECTED**: the test suite should re-run as above

    **ACTUAL**: an error from Elm about missing packages??

    ```
    TestParp.elm changed. Rebuilding!
    -- MISSING DEPENDENCIES ----------------------------------------------- elm.json

    Your elm.json is missing some "indirect" dependencies:

        "elm/url": "1.0.0"
        "elm/virtual-dom": "1.0.2"

    This usually means you are editing elm.json by hand. It is much more reliable to use the elm install command instead.

    Compilation failed while attempting to build /home/ndc/git/elm-parp/package/tests/TestParp.elm
    Watching for changes...
    ```

This simulates what happens when vscode-elm attempt to `elm-test make` a test file right after saving.