///|
struct Store {
  states : @respo.RespoStatesTree
} derive(ToJson, @json.FromJson)

///|
impl Default for Store with default() -> Store {
  { states: @respo.RespoStatesTree::default() }
}

///|
struct Task {
  id : String
  done : Bool
  content : String
  time : Double
} derive(Default, Eq, Hash, ToJson, @json.FromJson)

///|
enum ActionOp {
  StatesChange(@respo.RespoUpdateState)
}

///|
impl @respo_node.RespoAction for ActionOp with build_states_action(cursor, a, j) {
  StatesChange({
    cursor,
    data: if a is Some(a) {
      Some(@dom_ffi.js_obscure_to_v(a))
    } else {
      None
    },
    backup: j,
  })
}

///|
impl Show for ActionOp with output(self, logger) {
  let ret = match self {
    StatesChange(state) =>
      "StatesChange(cursor: \{state.cursor}, backup: \{state.backup.to_json()})"
  }
  logger.write_string(ret)
}

///|
fn Store::get_states(self : Store) -> @respo.RespoStatesTree {
  self.states
}

///|
/// TODO mutation might break memoization infuture
fn Store::update(self : Store, op : ActionOp) -> Unit {
  match op {
    StatesChange(states) => self.states.set_in_mut(states)
  }
}
