let app_store_key : String = "mbt-workflow"

fn view(
  store : Store
) -> @respo_node.RespoNode[ActionOp]!@respo_node.RespoCommonError {
  if false {
    raise @respo_node.RespoCommonError("TODO")
  }
  // @dom_ffi.log("Store to render: " + store.to_json().stringify(indent=2))
  let _states = store.get_states()
  div(
    class_name=@respo.ui_global,
    style=respo_style(padding=Px(12)),
    [
      div(
        style=respo_style(
          display=Flex,
          flex_direction=Column,
          max_width=Px(1200),
          padding=Px(40),
          margin=Auto,
        ),
        [
          div(
            [
              img(
                src="https://cos-sh.tiye.me/cos-up/bb4c2755050318e864b56f59145d726e-SubstractRespo.png",
                alt="Respo",
              ),
            ],
          ),
          div(
            [
              span(
                inner_text="This is an intro page for Respo on MoonBit. ",
                [],
              ),
              a(
                href="https://mooncakes.io/docs/#/tiye/respo/",
                inner_text="Find more on Respo docs.",
                target=Blank,
              ),
            ],
          ),
          div(
            [
              div(
                [
                  span(
                    inner_text="Here a demo describing JSX-like syntax in MoonBit:",
                    [],
                  ),
                ],
              ),
              pre(
                class_name=str_spaced([@respo.ui_font_code, style_code_block]),
                inner_text=dom_demo,
              ),
            ],
          ),
        ],
      ),
    ],
  )
}

fn main {
  let window = @dom_ffi.window()
  let mount_target = window
    .document()
    .query_selector(".app")
    .reinterpret_as_node()
  let app : @respo.RespoApp[Store] = {
    store: Ref::new(@respo.try_load_storage(app_store_key)),
    mount_target,
    storage_key: app_store_key,
  }
  app.backup_model_beforeunload()
  // @dom_ffi.log("store: " + app.store.val.to_json().stringify(indent=2))
  app.render_loop(
    fn() { view!(app.store.val) },
    fn(op) {
      @dom_ffi.log("Action: " + op.to_string())
      app.store.val.update(op)
    },
  )
  let dev_mode = @dom_ffi.get_url_search_params(
    window.get_location().get_search(),
  ).get("mode")
  @dom_ffi.log("dev mode: " + dev_mode.to_string())
}

let dom_demo =
  #|div(
  #|  [
  #|    span(
  #|      inner_text="This is an intro page for Respo on MoonBit. ",
  #|      [],
  #|    ),
  #|    a(
  #|      href="https://mooncakes.io/docs/#/tiye/respo/",
  #|      inner_text="Find more on Respo docs.",
  #|      target=Blank,
  #|    ),
  #|  ],
  #|),

let style_code_block : String = declare_static_style(
  [
    (
      "&",
      respo_style(
        padding=Px(12),
        background_color=Hsl(0, 0, 95),
        line_height=Em(1.6),
      ),
    ),
    ("pre&", respo_style(margin=Px(0))),
  ],
)
