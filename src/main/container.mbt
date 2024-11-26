/// container of page
fn comp_container[T]() -> @respo_node.RespoNode[T] {
  div(
    class_name=str_spaced([@respo.ui_global, @respo.ui_fullscreen]),
    style=respo_style(padding=Px(12)),
    [
      div(
        class_name=@respo.ui_column,
        style=respo_style(
          display=Flex,
          flex_direction=Column,
          max_width=Px(1200),
          padding=Px(40),
          margin=Auto,
        ),
        [
          div(
            class_name=str_spaced([@respo.ui_row_center, style_gap]),
            [
              img(
                width=160,
                src="https://cos-sh.tiye.me/cos-up/bb4c2755050318e864b56f59145d726e-SubstractRespo.png",
                alt="Respo",
              ),
              div(
                class_name=@respo.ui_column,
                [
                  text_node(
                    "Respo",
                    class_name=@respo.ui_font_fancy,
                    style=respo_style(font_size=32),
                  ),
                  text_node("Virtual DOM library on MoonBit."),
                  div(
                    [
                      @respo_node.button(
                        class_name=@respo.ui_button_primary,
                        inner_text="Guidebook",
                      ),
                      @respo_node.space(width=16),
                      @respo_node.a(
                        inner_text="API Docs",
                        target=Blank,
                        href="https://mooncakes.io/docs/#/tiye/respo/",
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          @respo_node.space(height=20),
          comp_paired(
            text_node(
              "Create elements in Calcit indentation syntax with `@respo_node.div`",
            ),
            code_block(snippet_div),
          ),
          @respo_node.space(height=20),
          comp_paired(
            text_node("Add nested elemets"),
            code_block(snippet_nested),
          ),
          @respo_node.space(height=20),
          comp_paired(
            text_node("Add text nodes with `@respo_node.text_node`"),
            code_block(snippet_text_node),
          ),
          @respo_node.space(height=20),
          comp_paired(
            text_node("CSS in MoonBit with `@respo.declare_static_style`"),
            code_block(snippet_css),
          ),
          @respo_node.space(height=20),
          div([text_node(class_name=style_section_title, "Create Components")]),
          @respo_node.space(height=20),
          comp_paired(
            text_node("To defined component, try plain function"),
            code_block(snippet_component),
          ),
          @respo_node.space(height=20),
          comp_paired(
            text_node("To defined component with effects"),
            code_block(snippet_component_effects),
          ),
        ],
      ),
    ],
  )
}

fn comp_paired[T](
  left : @respo_node.RespoNode[T],
  right : @respo_node.RespoNode[T]
) -> @respo_node.RespoNode[T] {
  div(
    class_name=@respo.ui_row,
    [
      div(class_name=str_spaced([@respo.ui_expand]), [left]),
      div(class_name=str_spaced([@respo.ui_expand]), [right]),
    ],
  )
}

let style_gap : String = declare_static_style([("&", respo_style(gap=Px(12)))])

let style_section_title : String = declare_static_style(
  [("&", respo_style(font_weight="Bold", font_size=20))],
)
