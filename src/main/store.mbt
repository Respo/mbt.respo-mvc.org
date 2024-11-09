struct Store {
  states : @respo.RespoStatesTree
} derive(ToJson, @json.FromJson)

fn Store::default() -> Store {
  { states: @respo.RespoStatesTree::default() }
}

struct Task {
  id : String
  done : Bool
  content : String
  time : Double
} derive(Default, Eq, Hash, ToJson, @json.FromJson)

enum ActionOp {
  Noop
  StatesChange(@respo.RespoUpdateState)
}

fn ActionOp::default() -> ActionOp {
  Noop
}

impl @respo_node.RespoAction for ActionOp with build_states_action(cursor, a) {
  ActionOp::StatesChange({ cursor, data: Some(a.to_json()) })
}

fn ActionOp::to_string(self : ActionOp) -> String {
  match self {
    Noop => "Noop"
    StatesChange(states) =>
      "StatesChange(\{states.cursor}  \{states.data.to_json()})"
  }
}

fn get_states(self : Store) -> @respo.RespoStatesTree {
  self.states
}

/// TODO mutation might break memoization infuture
fn update(self : Store, op : ActionOp) -> Unit {
  match op {
    StatesChange(states) => self.states.set_in_mut(states)
    _ => ()
  }
}

fn to_string(self : Store) -> String {
  self.to_json().stringify(indent=2)
}
