module Ionic.Attributes exposing (cancelText, checked, color, contentId, displayFormat, fullscreen, horizontal, id, max, min, name, okText, side, slot, value, vertical)

import Html.Attributes exposing (attribute)


cancelText =
    attribute "cancel-text"


checked =
    attribute "checked" ""


color =
    attribute "color"


contentId =
    attribute "content-id"


displayFormat =
    attribute "display-format"


fullscreen =
    attribute "fullscreen" ""


horizontal =
    attribute "horizontal"


id =
    Html.Attributes.id


max =
    attribute "max"


min =
    attribute "min"


name =
    attribute "name"


okText =
    attribute "ok-text"


side =
    attribute "side"


slot =
    attribute "slot"


value =
    Html.Attributes.value


vertical =
    attribute "vertical"
