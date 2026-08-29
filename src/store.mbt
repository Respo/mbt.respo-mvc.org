///|
struct Store {
  states : @respo.RespoStatesTree
} derive(Eq, ToJson, @json.FromJson)

///|
impl Default for Store with fn default() -> Store {
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
type ActionOp = Unit

///|
fn Store::get_states(self : Store) -> @respo.RespoStatesTree {
  self.states
}

///|
/// Immutable update: returns a new Store with the action applied
fn Store::update(self : Store, _op : ActionOp) -> Store {
  self
}
