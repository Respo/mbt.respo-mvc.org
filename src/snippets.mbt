///|
let snippet_component =
  #| fn comp_counter(states : RespoStatesTree) -> RespoNode[ActionOp] {
  #|   let ((state : CounterState), cursor) = states.local_pair()
  #|
  #|   div(class_name=@respo.ui_column, [
  #|     text_node("Count: \{state.count}"),
  #|     button(
  #|       inner_text="Increment",
  #|       class_name=@respo.ui_button,
  #|       on_click=fn(_e, dispatch) {
  #|         dispatch.set_state(cursor, { count: state.count + 1 })
  #|       },
  #|     ),
  #|   ])
  #| }

///|
let snippet_state =
  #| struct CounterState { count : Int }
  #|   derive(Default, ToJson, FromJson)
  #|
  #| // Parent passes sub-tree to children
  #| fn comp_app(states : RespoStatesTree) -> RespoNode[ActionOp] {
  #|   div([
  #|     comp_header(states.pick("header")),
  #|     comp_counter(states.pick("counter")),
  #|   ])
  #| }
  #|
  #| // Child gets its own state via cursor
  #| fn comp_counter(states : RespoStatesTree) -> RespoNode[ActionOp] {
  #|   let ((state : CounterState), cursor) = states.local_pair()
  #|   button(on_click=fn(_e, dispatch) {
  #|     dispatch.set_state(cursor, { count: state.count + 1 })
  #|   })
  #| }

///|
let snippet_css =
  #| let style_card : String = static_style([
  #|   ("&", respo_style(
  #|     padding=Px(16),
  #|     border_radius=8,
  #|     background_color=White,
  #|   )),
  #|   ("&:hover", respo_style(
  #|     background_color=Hsl(0, 0, 97),
  #|   )),
  #| ])
  #|
  #| // Responsive styles
  #| let style_container : String = contained_static_style([
  #|   (None, "&", respo_style(padding=Px(40))),
  #|   (Some("@media (max-width: 768px)"), "&", respo_style(padding=Px(16))),
  #| ])

///|
let snippet_events =
  #| input(
  #|   value=state.text,
  #|   on_input=fn(e, dispatch) {
  #|     if e is Input(value~, ..) {
  #|       dispatch.set_state(cursor, { text: value })
  #|     }
  #|   },
  #|   on_keydown=fn(e, dispatch) {
  #|     if e is Keyboard(key~, ..) && key == "Enter" {
  #|       dispatch.run(SubmitAction(state.text))
  #|     }
  #|   },
  #| )

///|
let snippet_effects =
  #| struct FocusEffect { should_focus : Bool }
  #|   derive(ToJson)
  #|
  #| impl RespoEffect for FocusEffect with mounted(self, el) {
  #|   if self.should_focus { el.focus() }
  #| }
  #|
  #| // Use effect in component
  #| RespoComponent::named(
  #|   "my-input",
  #|   effects=[FocusEffect { should_focus: true }],
  #|   input(class_name=@respo.ui_input),
  #| ).to_node()
