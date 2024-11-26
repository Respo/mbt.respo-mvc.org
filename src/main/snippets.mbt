let snippet_div =
  #| div(
  #|   class_name="demo",
  #|   style=@respo_node.respo_style(
  #|     color=Red,
  #|     font_size=16,
  #|     font_family="Helvetic",
  #|   ),
  #|   event={}..set(Click, fn(e, d) { println("TODO") }),
  #|   [],
  #| )

let snippet_nested =
  #| div([span([]), div([])])

let snippet_text_node =
  #| text_node("demo", class_name="demo")

let snippet_css =
  #| let style_hover = declare_static_style(
  #|   [
  #|     ("&", respo_style(color=Hex(255, 255, 255))),
  #|     ("&:hover", respo_style(color=Hex(239, 239, 239))),
  #|   ],
  #| )

let snippet_component =
  #| fn comp_demo[T](p1 : String, p2 : String) -> @respo_node.RespoNode[T] {
  #|   div([text_node(p1), text_node(p2)])
  #| }
  #| comp_demo("a", "b")

let snippet_component_effects =
  #| fn comp_demo[T](p1 : String, p2 : String) -> @respo_node.RespoNode[T] {
  #|   div([text_node(p1), text_node(p2)])
  #|   // TODO
  #| }
  #|
  #| comp_demo("a", "b")
