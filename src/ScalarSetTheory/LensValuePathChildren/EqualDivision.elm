module ScalarSetTheory.LensValuePathChildren.EqualDivision exposing (equalDivisionChildrenGetter)

import List exposing (map, range)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildren exposing (LensValuePathChildren)
import ScalarSetTheory.LensValuePathChildren.LensValuePathChildrenGetter exposing (LensValuePathChildrenGetter)
import ScalarSetTheory.LensValueStep.LensValueStep exposing (findLensValueStepInPath)
import ScalarSetTheory.Types.Lens exposing (Lens(EqualDivision, NChord))
import ScalarSetTheory.Types.Setting exposing (Setting(Max, Min))
import ScalarSetTheory.Utilities exposing (parseInt)
import ScalarSetTheory.Value.GetValueOfSetting exposing (getValueOfSetting)


equalDivisionChildrenGetter : LensValuePathChildrenGetter
equalDivisionChildrenGetter lensValuePath equalDivisionSettingValues =
    let
        equalDivisionMin =
            getValueOfSetting equalDivisionSettingValues Min

        equalDivisionMax =
            getValueOfSetting equalDivisionSettingValues Max

        -- and eventually other section values and their effects on the values for equal divisions here
        nChordValue =
            case findLensValueStepInPath NChord lensValuePath of
                Just nChordLensValueStep ->
                    parseInt nChordLensValueStep.value

                Nothing ->
                    0

        childrenMin =
            max equalDivisionMin nChordValue

        childrenMax =
            equalDivisionMax

        children =
            range childrenMin childrenMax

        childrenAsStrings =
            map toString children
    in
    LensValuePathChildren EqualDivision childrenAsStrings
