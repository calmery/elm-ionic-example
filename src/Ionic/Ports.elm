port module Ionic.Ports exposing (createAlert, createLoading, createToast, onClickOkButton, refreshComplete)


port createAlert : { header : String, message : String } -> Cmd msg


port onClickOkButton : (() -> msg) -> Sub msg


port createLoading : () -> Cmd msg


port createToast : () -> Cmd msg


port refreshComplete : () -> Cmd msg
