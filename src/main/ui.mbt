///| a custom style for code block
fn code_block[T](
  class_name? : String,
  style? : @respo_node.RespoStyle,
  code : String
) -> @respo_node.RespoNode[T] {
  pre(
    class_name=str_some_spaced([
      Some(@respo.ui_font_code),
      Some(@respo.ui_expand),
      class_name,
      Some(style_code_block),
    ]),
    style=style.or_default(),
    inner_text=code,
  )
}

///|
fn str_some_spaced(arr : Array[String?]) -> String {
  arr.filter(fn(x) { not(x.is_empty()) }).map(fn(x) { x.unwrap() })
  |> String::concat(separator=" ")
}

///|
let style_code_block : String = declare_static_style([
  (
    "&",
    respo_style(
      padding=Px(8),
      // background_color=Hsl(0, 0, 95),
      border=(1.0, Solid, Hsl(0, 0, 90)),
      border_radius=4,
      line_height=Em(1.6),
      font_size=13,
    ),
  ),
  ("pre&", respo_style(margin=Px(0))),
])
