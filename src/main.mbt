///|
let app_store_key : String = "respo-mbt-home"

///|
fn view(
  store : Store,
) -> @respo_node.RespoNode[ActionOp] raise @respo_node.RespoCommonError {
  if false {
    raise @respo_node.RespoCommonError("TODO")
  }
  // @dom_ffi.log("Store to render: " + store.to_json().stringify(indent=2))
  let _states = store.get_states()
  comp_container()
}

///|
fn start_app() -> Unit {
  let window = @dom_ffi.window()
  let mount_target = window
    .document()
    .query_selector(".app")
    .unwrap()
    .reinterpret_as_node()
  let app : @respo.RespoApp[Store] = {
    store: Ref::new(@respo.try_load_storage(app_store_key)),
    mount_target,
    storage_key: app_store_key,
  }
  app.backup_model_beforeunload()
  // @dom_ffi.log("store: " + app.store.val.to_json().stringify(indent=2))
  app.render_loop(fn() { view(app.store.val) }, fn(op) {
    @dom_ffi.log("Action: " + op.to_string())
    app.store.val.update(op)
  })
  let dev_mode = @dom_ffi.new_url_search_params(window.location().search()).get(
    "mode",
  )
  @dom_ffi.log("dev mode: " + dev_mode.to_string())
}

///|
/// waits for imports to be loaded
extern "js" fn hook_onload(f : () -> Unit) -> Unit =
  #| (f) => window.onImportsLoaded=f

///|
fn main {
  hook_onload(fn() { start_app() })
}
