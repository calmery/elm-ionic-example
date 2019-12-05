module Ionic exposing (app, badge, button, buttons, card, cardContent, cardHeader, cardSubtitle, cardTitle, checkbox, chip, content, datetime, fab, fabButton, fabList, header, icon, item, itemDivider, label, list, listHeader, menu, menuButton, page, range, refresher, refresherContent, searchbar, select, selectOption, splitPane, text, title, toggle, toolbar)

import Html exposing (node)


app attributes childrens =
    node "ion-app"
        attributes
        ([ node "ion-toast-controller" [] []
         , node "ion-loading-controller" [] []
         , node "ion-alert-controller" [] []
         ]
            ++ childrens
        )


badge =
    node "ion-badge"


button =
    node "ion-button"


buttons =
    node "ion-buttons"


card =
    node "ion-card"


cardContent =
    node "ion-card-content"


cardHeader =
    node "ion-card-header"


cardSubtitle =
    node "ion-card-subtitle"


cardTitle =
    node "ion-card-title"


checkbox =
    node "ion-checkbox"


chip =
    node "ion-chip"


content =
    node "ion-content"


datetime =
    node "ion-datetime"


fab =
    node "ion-fab"


fabButton =
    node "ion-fab-button"


fabList =
    node "ion-fab-list"


header =
    node "ion-header"


icon =
    node "ion-icon"


item =
    node "ion-item"


itemDivider =
    node "ion-item-divider"


label =
    node "ion-label"


list =
    node "ion-list"


listHeader =
    node "ion-list-header"


menu =
    node "ion-menu"


menuButton =
    node "ion-menu-button"


page =
    node "ion-page"


range =
    node "ion-range"


refresher =
    node "ion-refresher"


refresherContent =
    node "ion-refresher-content"


searchbar =
    node "ion-searchbar"


select =
    node "ion-select"


selectOption =
    node "ion-select-option"


splitPane =
    node "ion-split-pane"


text =
    Html.text


title =
    node "ion-title"


toggle =
    node "ion-toggle"


toolbar =
    node "ion-toolbar"
