module Tests exposing (all)

import Expect
import ScalarSetTheory.Main exposing (main)
import ScalarSetTheoryTests.Html.DropdownTests exposing (dropdownTests)
import ScalarSetTheoryTests.Html.TableNodeToHtmlTests exposing (tableNodeToHtmlTests)
import ScalarSetTheoryTests.LensValuePathChildValues.EqualDivisionTests exposing (equalDivisionTests)
import ScalarSetTheoryTests.LensValuePathChildValues.NChordTests exposing (nChordTests)
import ScalarSetTheoryTests.LensValueStep.LensValueStepTests exposing (lensValueStepTests)
import ScalarSetTheoryTests.SettingValue.SettingValueTests exposing (settingValueTests)
import ScalarSetTheoryTests.TableNode.LensNodeTests exposing (lensNodeTests)
import ScalarSetTheoryTests.UpdateTests exposing (updateTests)
import ScalarSetTheoryTests.UtilitiesTests exposing (utilitiesTests)
import ScalarSetTheoryTests.Value.GetValueOfSettingTests exposing (getValueOfSettingTests)
import Test exposing (Test, describe)


all : Test
all =
    describe "Scalar Set Theory Test Suite"
        [ updateTests
        , utilitiesTests
        , dropdownTests
        , lensValueStepTests
        , getValueOfSettingTests
        , settingValueTests
        , equalDivisionTests
        , nChordTests
        , lensNodeTests
        , tableNodeToHtmlTests
        ]
