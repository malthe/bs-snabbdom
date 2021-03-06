open Snabbdom_base
module VNode = Snabbdom_vnode

external module_eventlisteners : snabbdom_module = "default" [@@bs.module "snabbdom/modules/eventlisteners"]

(* Helper for waiting until post-render before calling a callback *)
let next_tick cb =
    let _ = Snabbdom_dom.set_timeout cb 0 in
    ()

type 'a event_cb = ('a -> unit)
let event_listener key cb = VNode.set_in_data [|"on"; key|] cb

let event event (cb:Dom.event event_cb) = event_listener event cb
let change = event "change"

let mouse event (cb:Dom.mouseEvent event_cb) = event_listener event cb

let click = mouse "click"
let mousedown = mouse "mousedown"
let mouseup = mouse "mouseup"
let mousemove = mouse "mousemove"

let keyboard event (cb:Dom.keyboardEvent event_cb) = event_listener event cb
let keydown = keyboard "keydown"
let keyup = keyboard "keyup"
let keypress = keyboard "keypress"

let drag event (cb:Dom.dragEvent event_cb) = event_listener event cb
let dragenter = drag "dragenter"
let dragover = drag "dragover"
let dragleave = drag "dragleave"
let drop = drag "drop"
