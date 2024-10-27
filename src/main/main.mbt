let app_store_key : String = "mbt-workflow"

struct App {
  store : Ref[Store]
  mount_target : @dom_ffi.Node
}

fn App::get_store(self : App) -> Ref[Store] {
  self.store
}

fn App::get_mount_target(self : App) -> @dom_ffi.Node {
  self.mount_target
}

fn App::dispatch(self : App, op : ActionOp) -> Unit {
  // TODO intent
  @dom_ffi.log("Action: " + op.to_string())
  self.store.val.update(op)
}

fn App::view(
  self : App
) -> @respo_node.RespoNode[ActionOp]!@respo_node.RespoCommonError {
  if false {
    raise @respo_node.RespoCommonError("TODO")
  }
  let store = self.store.val
  // @dom_ffi.log("Store to render: " + store.to_json().stringify(indent=2))
  let states = store.get_states()
  @respo_node.div(
    class_name=@respo.ui_global,
    style=@respo_node.RespoStyle::new(padding=Px(12)),
    [
      @respo_node.div(
        style=@respo_node.RespoStyle::new(
          display=Flex,
          flex_direction=Column,
          max_width=Px(1200),
          padding=Px(40),
          margin=Auto,
        ),
        [
          @respo_node.div(
            [
              @respo_node.img(
                src="https://cos-sh.tiye.me/cos-up/bb4c2755050318e864b56f59145d726e-SubstractRespo.png",
                alt="Respo",
              ),
            ],
          ),
          @respo_node.div(
            [
              @respo_node.span(
                inner_text="This is an intro page for Respo on MoonBit. ",
                [],
              ),
              @respo_node.a(
                href="https://mooncakes.io/docs/#/tiye/respo/",
                inner_text="Find more on Respo docs.",
                target=Blank,
              ),
            ],
          ),
          @respo_node.div(
            [
              @respo_node.div(
                [
                  @respo_node.span(
                    inner_text="Here a demo describing JSX-like syntax in MoonBit:",
                    [],
                  ),
                ],
              ),
              @respo_node.pre(
                class_name=@respo_node.str_spaced(
                  [@respo.ui_font_code, style_code_block],
                ),
                inner_text=dom_demo,
              ),
            ],
          ),
        ],
      ),
    ],
  )
}

fn pick_storage_key() -> String {
  app_store_key
}

fn try_load_storage(self : App) -> Unit!@respo_node.RespoCommonError {
  let window = @dom_ffi.window()
  let storage = window.local_storage()
  let key = pick_storage_key()
  match storage.get_item(key) {
    Some(s) => {
      let store = self.get_store()
      store.val = try_from_string!(s)
    }
    None => raise @respo_node.RespoCommonError("No storage")
  }
}

/// backup store to local storage before unload

fn backup_model_beforeunload(self : App) -> Unit {
  let window = @dom_ffi.window()
  let storage = window.local_storage()
  let p = pick_storage_key()
  let store = self.get_store().val
  let beforeunload = fn(_e : @dom_ffi.BeforeUnloadEvent) {
    let content = store.to_json().stringify(indent=2)
    // util::log!("before unload {} {}", p, content);
    storage.set_item(p, content)
  }
  window.set_onbeforeunload(beforeunload)
}

fn main {
  let app : App = {
    mount_target: @dom_ffi.window()
    .document()
    .query_selector(".app")
    .reinterpret_as_node(),
    store: Ref::new(Store::default()),
  }
  let ret = app.try_load_storage?()
  match ret {
    Ok(_) => ()
    Err(e) => @dom_ffi.error_log(e.to_string())
  }
  app.backup_model_beforeunload()
  @dom_ffi.log("store: " + app.store.val.to_json().stringify(indent=2))
  app.render_loop()
}

fn App::render_loop(self : App) -> Unit {
  let mount_target = self.mount_target
  // let store_to_action = global_store.to_owned()

  let dispatch_action = fn(op : ActionOp) -> Unit!@respo_node.RespoCommonError {
    // @dom_ffi.log("Action: \{op.to_string()}")
    // @dom_ffi.log("Global store: \{global_store.val.to_json()}")

    // Self::dispatch(store_to_action.to_owned(), op)?;
    self.store.val.update(op)
    match op {
      Noop => raise @respo_node.RespoCommonError("TODO")
      _ => ()
    }
  }
  let renderer = fn() -> @respo_node.RespoNode[_]!@respo_node.RespoCommonError {
    self.view!()
  }
  let ret = @respo.render_node?(
    mount_target,
    fn() { self.store },
    renderer,
    dispatch_action,
    Some(100),
  )
  match ret {
    Ok(_) => ()
    Err(e) => @dom_ffi.error_log(e.to_string())
  }
}

let dom_demo =
  #|@respo_node.div(
  #|  [
  #|    @respo_node.span(
  #|      inner_text="This is an intro page for Respo on MoonBit. ",
  #|      [],
  #|    ),
  #|    @respo_node.a(
  #|      href="https://mooncakes.io/docs/#/tiye/respo/",
  #|      inner_text="Find more on Respo docs.",
  #|      target=Blank,
  #|    ),
  #|  ],
  #|),

let style_code_block : String = @respo_node.declare_static_style(
  [
    (
      "&",
      @respo_node.RespoStyle::new(
        padding=Px(12),
        background_color=Hsl(0, 0, 95),
        line_height=Em(1.6),
      ),
    ),
    ("pre&", @respo_node.RespoStyle::new(margin=Px(0))),
  ],
)
