module ScalarSetTheory.Table.TableMinRow exposing (minDropdown, tableMinRow)

import Html exposing (Attribute, Html, div, select, text)
import Html.Events exposing (onInput)
import List exposing (map)
import ScalarSetTheory.Components.Dropdown exposing (dropdownOptions)
import ScalarSetTheory.Model exposing (Model)
import ScalarSetTheory.Msg exposing (..)
import ScalarSetTheory.Sections.Section exposing (Section)
import ScalarSetTheory.Sections.SectionAndItsCurrentSettings exposing (SectionAndItsCurrentSettings, getSectionAndItsCurrentSettingsBySection)
import ScalarSetTheory.Table.TableNode exposing (TableNode(TableNode))
import ScalarSetTheory.Table.TableRow exposing (tableRow)
import ScalarSetTheory.Utilities exposing (parseInt)
import Tuple exposing (first, second)


tableMinRow : Model -> TableNode
tableMinRow model =
    tableRow
        ([ text "min" ]
            ++ map sectionToMinDropdown (sectionAndMinPerSection model.sectionsAndTheirCurrentSettings)
        )


sectionToMinDropdown : ( Section, Int ) -> Html Msg
sectionToMinDropdown sectionAndMin =
    minDropdown (first sectionAndMin) (second sectionAndMin)


minDropdown : Section -> Int -> Html Msg
minDropdown section selectedOption =
    select
        (minAttributes section)
        (dropdownOptions section (toString selectedOption))


minAttributes : Section -> List (Attribute Msg)
minAttributes section =
    [ onInput (\newMin -> minOnInputHandler newMin section) ]


minOnInputHandler : String -> Section -> Msg
minOnInputHandler newMin section =
    UpdateSectionMin (parseInt newMin) section


sectionAndMinPerSection : List SectionAndItsCurrentSettings -> List ( Section, Int )
sectionAndMinPerSection sectionsAndTheirCurrentSettings =
    map (\sectionAndItsCurrentSettings -> sectionAndMin sectionAndItsCurrentSettings.section sectionsAndTheirCurrentSettings) sectionsAndTheirCurrentSettings


sectionAndMin : Section -> List SectionAndItsCurrentSettings -> ( Section, Int )
sectionAndMin section sectionsAndTheirCurrentSettings =
    let
        sectionAndItsCurrentSettings =
            getSectionAndItsCurrentSettingsBySection section sectionsAndTheirCurrentSettings
    in
    ( section, sectionAndItsCurrentSettings.min )