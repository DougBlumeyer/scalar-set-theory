module ScalarSetTheory.Types.TableNode exposing (TableNode(TableNode), emptyTableNode, emptyTableNodeList)

import Html exposing (Html, text)
import List exposing (map)
import ScalarSetTheory.Msg exposing (Msg)


type TableNode
    = TableNode
        { cellItself : Html Msg
        , cellChildren : List TableNode
        }


emptyTableNodeList : List TableNode
emptyTableNodeList =
    map TableNode []


emptyTableNode : TableNode
emptyTableNode =
    TableNode
        { cellItself = text ""
        , cellChildren = emptyTableNodeList
        }