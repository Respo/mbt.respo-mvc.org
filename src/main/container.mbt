///|
using @respo_node {
  div,
  str_spaced,
  text_node,
  a,
  img,
  pre,
  static_style,
  contained_static_style,
  button,
  space,
}

///|
using @css {respo_style}

///|
using @respo_node {type RespoNode}

///|
using @markdown {comp_md}

///|
/// container of page
fn[T] comp_container() -> RespoNode[T] {
  div(
    class_name=str_spaced([@respo.ui_global, @respo.ui_fullscreen]),
    style=respo_style(padding=12 |> Px),
    [
      div(class_list=["markdown-body", @respo.ui_column, style_content_area], [
        div(
          class_name=str_spaced([@respo.ui_row_center, style_gap]),
          style=respo_style().add("flex-wrap", "wrap"),
          [
            img(
              width=160,
              src="https://cdn.tiye.me/logo/respo.png",
              alt="Respo",
            ),
            div(class_name=@respo.ui_column, [
              text_node(
                "Respo",
                class_name=@respo.ui_font_fancy,
                style=respo_style(font_size=32),
              ),
              text_node("Virtual DOM library on MoonBit."),
              div([
                a(
                  href="https://github.com/Respo/mbt.respo-mvc.org/discussions",
                  children=[
                    button(
                      class_name=@respo.ui_button,
                      inner_text="Discussions",
                    ),
                  ],
                ),
                space(width=16),
                a(
                  inner_text="API Docs",
                  target=Blank,
                  href="https://mooncakes.io/docs/tiye/respo",
                ),
              ]),
            ]),
          ],
        ),
        comp_paired(
          "Create elements in Calcit indentation syntax with `@respo_node.div`"
          |> comp_md,
          code_block(snippet_div),
        ),
        comp_paired(text_node("Add nested elemets"), code_block(snippet_nested)),
        comp_paired(
          "Add text nodes with `@respo_node.text_node`" |> comp_md,
          code_block(snippet_text_node),
        ),
        comp_paired(
          "CSS in MoonBit with `@respo.declare_static_style`" |> comp_md,
          code_block(snippet_css),
        ),
        div([text_node(class_name=style_section_title, "Create Components")]),
        comp_paired(
          text_node("To defined component, try plain function"),
          code_block(snippet_component),
        ),
        div([text_node(class_name=style_section_title, "Adding Effects")]),
        comp_paired(
          "Define effects according to `RespoEffect` trait. Data is accessible in `self`"
          |> comp_md,
          code_block(snippet_effect_def),
        ),
        comp_paired(
          text_node("Define component with effects"),
          code_block(snippet_component_effects),
        ),
        div([text_node(class_name=style_section_title, "States Management")]),
        comp_paired(
          "Respo uses an Atom to maintain global states. Global states and \"Single Source of Truth\" are preferred"
          |> comp_md,
          code_block(snippet_global_store),
        ),
        comp_paired(
          text_node("To update store"),
          code_block(snippet_update_store),
        ),
        div([
          text_node("More details in the "),
          a(
            inner_text="Workflow",
            href="https://github.com/Respo/respo-moonbit-workflow",
            target=Blank,
          ),
          text_node(" repository"),
        ]),
        div([
          text_node("Major implementation for Respo is "),
          a(
            inner_text="Respo Calcit",
            href="https://respo-mvc.org/",
            target=Blank,
          ),
          text_node("."),
        ]),
        space(height=200),
      ]),
    ],
  )
}

///|
fn[T] comp_paired(left : RespoNode[T], right : RespoNode[T]) -> RespoNode[T] {
  div(
    class_name=@respo.ui_row,
    style=respo_style(gap=Px(20)).add("flex-wrap", "wrap"),
    [
      div(class_list=[@respo.ui_expand, style_section_intro], [left]),
      div(class_name=@respo.ui_expand, [right]),
    ],
  )
}

///|
let style_gap : String = static_style([("&", respo_style(gap=12 |> Px))])

///|
let style_section_title : String = static_style([
  ("&", respo_style(font_weight="Bold", font_size=20)),
])

///|
let style_content_area : String = contained_static_style([
  (
    None,
    "&",
    respo_style(
      display=Flex,
      flex_direction=Column,
      max_width=1200 |> Px,
      margin=Auto,
      gap=20 |> Px,
      padding=40 |> Px,
    ),
  ),
  (
    Some("@media only screen and (max-width: 600px)"),
    "&",
    respo_style(padding=4 |> Px),
  ),
])

///|
let style_section_intro : String = contained_static_style([
  (
    Some("@media only screen and (max-width: 600px)"),
    "&",
    respo_style(width=100 |> Percent),
  ),
])
