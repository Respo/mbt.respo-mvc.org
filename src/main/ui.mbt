///|
extern "js" fn moonbit_code_to_html(code : String) -> String =
  #| (code) => { return window.moonbit_code_to_html(code)}

///| a custom style for code block
fn code_block[T](
  class_name? : String,
  style? : @respo_node.RespoStyle,
  code : String
) -> @respo_node.RespoNode[T] {
  pre(
    class_list=[
      @respo.ui_font_code,
      @respo.ui_expand,
      class_name.or_default(),
      style_code_block,
    ],
    style=style.or_default(),
    innerHTML=moonbit_code_to_html(code),
  )
}

///|
let style_code_block : String = declare_static_style([
  (
    "&",
    respo_style(
      padding=8 |> Px,
      border=(
        // background_color=Hsl(0, 0, 95),
        1.0,
        Solid,
        Hsl(0, 0, 90),
      ),
      border_radius=4,
      line_height=1.6 |> Em,
      font_size=13,
      background_color=RawString("#FAFAFA"),
    ),
  ),
  ("pre&", respo_style(margin=Px(0))),
  ("pre > pre", respo_style(margin=Px(0))),
])
