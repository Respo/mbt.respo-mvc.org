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
  span,
}

///|
using @css {respo_style}

///|
using @respo_node {type RespoNode}

///|
using @markdown {comp_md}

// ============================================================================
// Main Container
// ============================================================================

///|
/// container of page
fn[T] comp_container() -> RespoNode[T] {
  div(class_name=str_spaced([@respo.ui_global, style_page_container]), [
    // Hero Section
    comp_hero(),
    // Features Section
    comp_features(),
    // Code Examples Section
    comp_code_examples(),
    // Getting Started Section
    comp_getting_started(),
    // Why MoonBit Section
    comp_why_moonbit(),
    // Community Section
    comp_community(),
    // Footer
    comp_footer(),
  ])
}

// ============================================================================
// Hero Section
// ============================================================================

///|
fn[T] comp_hero() -> RespoNode[T] {
  div(class_name=style_hero, [
    div(class_name=style_hero_content, [
      // Logo
      img(
        width=120,
        src="https://cdn.tiye.me/logo/respo.png",
        alt="Respo Logo",
        class_name=style_hero_logo,
      ),
      // Title
      div(class_name=style_hero_title, [text_node("Respo")]),
      // Tagline
      div(class_name=style_hero_tagline, [
        text_node("Virtual DOM Library for MoonBit"),
      ]),
      // Description
      div(class_name=style_hero_description, [
        text_node(
          "Build fast, interactive web interfaces with functional components, immutable data, and efficient rendering.",
        ),
      ]),
      // CTA Buttons
      div(class_name=style_hero_buttons, [
        a(href="https://mooncakes.io/docs/tiye/respo", target=Blank, children=[
          button(
            class_name=str_spaced([style_btn_primary]),
            inner_text="Get Started",
          ),
        ]),
        space(width=16),
        a(href="https://github.com/Respo/respo.mbt", target=Blank, children=[
          button(
            class_name=str_spaced([@respo.ui_button, style_btn_secondary]),
            inner_text="GitHub",
          ),
        ]),
      ]),
    ]),
  ])
}

// ============================================================================
// Features Section
// ============================================================================

///|
fn[T] comp_features() -> RespoNode[T] {
  div(class_name=style_section, [
    div(class_name=style_section_title, [text_node("Why Respo?")]),
    div(class_name=style_features_grid, [
      comp_feature_card(
        "🔥", "Hot Reload Friendly", "Global states tree design enables seamless hot reload during development. State persists across code changes.",
      ),
      comp_feature_card(
        "🌳", "States Tree with Cursor", "All states stored in a single atom with tree structure. Use cursor to locate and update nested states precisely.",
      ),
      comp_feature_card(
        "➡️", "Uni-directional Data Flow", "Actions can only be dispatched from user events. Predictable state updates with clear data flow.",
      ),
      comp_feature_card(
        "✨", "Type-Safe & Autocomplete", "Leverage MoonBit's powerful type system. Full IDE support with autocompletion for components and styles.",
      ),
      comp_feature_card(
        "🎯", "Pure Effects System", "Effects handle DOM side effects only, cannot dispatch actions. Clean separation of concerns.",
      ),
      comp_feature_card(
        "⚡", "Efficient Rendering", "Virtual DOM diffing with reference equality. Unchanged data means skipped re-renders.",
      ),
    ]),
  ])
}

///|
fn[T] comp_feature_card(
  icon : String,
  title : String,
  description : String,
) -> RespoNode[T] {
  div(class_name=style_feature_card, [
    span(class_name=style_feature_icon, inner_text=icon, []),
    div(class_name=style_feature_title, [text_node(title)]),
    div(class_name=style_feature_description, [text_node(description)]),
  ])
}

// ============================================================================
// Code Examples Section
// ============================================================================

///|
fn[T] comp_code_examples() -> RespoNode[T] {
  div(class_name=str_spaced([style_section, style_section_alt]), [
    div(class_name=style_section_title, [text_node("Simple & Expressive")]),
    // Example 1: Component
    div(class_name=style_code_section, [
      div(class_name=style_code_description, [
        div(class_name=style_code_section_title, [
          text_node("Create Components"),
        ]),
        "Components are plain functions. Use pattern matching, loops, and all MoonBit features."
        |> comp_md,
      ]),
      code_block(snippet_component),
    ]),
    // Example 2: State
    div(class_name=style_code_section, [
      div(class_name=style_code_description, [
        div(class_name=style_code_section_title, [
          text_node("States Tree & Cursor"),
        ]),
        "All component states live in a global tree. Use `states.pick(\"key\")` to pass sub-tree, and `states.local_pair()` to get state with cursor for updates."
        |> comp_md,
      ]),
      code_block(snippet_state),
    ]),
    // Example 3: Styling
    div(class_name=style_code_section, [
      div(class_name=style_code_description, [
        div(class_name=style_code_section_title, [
          text_node("Type-Safe Styling"),
        ]),
        "Define styles in MoonBit with `static_style`. Full CSS support with type checking."
        |> comp_md,
      ]),
      code_block(snippet_css),
    ]),
    // Example 4: Events
    div(class_name=style_code_section, [
      div(class_name=style_code_description, [
        div(class_name=style_code_section_title, [text_node("Handle Events")]),
        "Event handlers receive event data and dispatch function. Pattern match on event types."
        |> comp_md,
      ]),
      code_block(snippet_events),
    ]),
    // Example 5: Effects
    div(class_name=style_code_section, [
      div(class_name=style_code_description, [
        div(class_name=style_code_section_title, [text_node("DOM Effects")]),
        "Effects run on mount/update for DOM side effects. They cannot dispatch actions - keeping data flow predictable."
        |> comp_md,
      ]),
      code_block(snippet_effects),
    ]),
  ])
}

// ============================================================================
// Getting Started Section
// ============================================================================

///|
fn[T] comp_getting_started() -> RespoNode[T] {
  div(class_name=style_section, [
    div(class_name=style_section_title, [text_node("Getting Started")]),
    div(class_name=style_getting_started_content, [
      div(class_name=style_step_card, [
        span(class_name=style_step_number, inner_text="1", []),
        div(class_name=style_step_title, [text_node("Install MoonBit")]),
        "Get the MoonBit toolchain from [moonbitlang.com](https://www.moonbitlang.com/download/)"
        |> comp_md,
      ]),
      div(class_name=style_step_card, [
        span(class_name=style_step_number, inner_text="2", []),
        div(class_name=style_step_title, [text_node("Add Respo")]),
        div(class_name=style_command_line, [
          span(
            class_name=str_spaced([@respo.ui_font_code, style_inline_code]),
            inner_text="moon add tiye/respo",
            [],
          ),
        ]),
      ]),
      div(class_name=style_step_card, [
        span(class_name=style_step_number, inner_text="3", []),
        div(class_name=style_step_title, [text_node("Start Building")]),
        "Check out the [Workflow Template](https://github.com/Respo/respo-moonbit-workflow) for a complete example."
        |> comp_md,
      ]),
    ]),
  ])
}

// ============================================================================
// Why MoonBit Section
// ============================================================================

///|
fn[T] comp_why_moonbit() -> RespoNode[T] {
  div(class_name=str_spaced([style_section, style_section_alt]), [
    div(class_name=style_section_title, [text_node("Why MoonBit?")]),
    div(class_name=style_moonbit_intro, [
      text_node(
        "MoonBit is a modern, lightweight programming language with powerful type inference and algebraic data types. Perfect for building robust web applications.",
      ),
    ]),
    div(class_name=style_moonbit_grid, [
      comp_moonbit_feature(
        "🧬", "Algebraic Data Types", "Sum types, pattern matching, and exhaustive checking. Model your domain precisely and safely.",
      ),
      comp_moonbit_feature(
        "🔮", "Powerful Type Inference", "Write less type annotations. The compiler infers types while keeping full type safety.",
      ),
      comp_moonbit_feature(
        "🏷️", "Labeled Arguments", "Named parameters with defaults. Self-documenting APIs that are easy to use and extend.",
      ),
      comp_moonbit_feature(
        "⚡", "Modern Toolchain", "Millisecond compilation, built-in formatter, linter, test runner, and package manager.",
      ),
      comp_moonbit_feature(
        "🪶", "Lightweight Output", "Generates compact JavaScript. Tree-shaking and dead code elimination built-in.",
      ),
      comp_moonbit_feature(
        "🛠️", "First-class IDE Support", "VS Code extension with autocomplete, go-to-definition, and inline diagnostics.",
      ),
    ]),
    div(class_name=style_moonbit_cta, [
      a(href="https://www.moonbitlang.com/", target=Blank, children=[
        button(
          class_name=str_spaced([style_btn_secondary, style_btn_moonbit]),
          inner_text="Learn MoonBit →",
        ),
      ]),
    ]),
  ])
}

///|
fn[T] comp_moonbit_feature(
  icon : String,
  title : String,
  description : String,
) -> RespoNode[T] {
  div(class_name=style_moonbit_feature, [
    span(class_name=style_moonbit_icon, inner_text=icon, []),
    div([
      div(class_name=style_moonbit_feature_title, [text_node(title)]),
      div(class_name=style_moonbit_feature_desc, [text_node(description)]),
    ]),
  ])
}

// ============================================================================
// Community Section
// ============================================================================

///|
fn[T] comp_community() -> RespoNode[T] {
  div(class_name=str_spaced([style_section, style_section_alt]), [
    div(class_name=style_section_title, [text_node("Join the Community")]),
    div(class_name=style_community_description, [
      text_node(
        "Respo is open source. Contribute, ask questions, and share your projects.",
      ),
    ]),
    div(class_name=style_community_links, [
      comp_community_link(
        "GitHub", "https://github.com/Respo/respo.mbt", "Source code & issues",
      ),
      comp_community_link(
        "Discussions", "https://github.com/Respo/mbt.respo-mvc.org/discussions",
        "Ask questions & share ideas",
      ),
      comp_community_link(
        "API Docs", "https://mooncakes.io/docs/tiye/respo", "Complete API reference",
      ),
      comp_community_link(
        "MoonBit", "https://www.moonbitlang.com/", "Learn MoonBit language",
      ),
    ]),
  ])
}

///|
fn[T] comp_community_link(
  title : String,
  href_url : String,
  description : String,
) -> RespoNode[T] {
  a(href=href_url, target=Blank, class_name=style_community_card, children=[
    div(class_name=style_community_card_title, [text_node(title)]),
    div(class_name=style_community_card_desc, [text_node(description)]),
  ])
}

// ============================================================================
// Footer
// ============================================================================

///|
fn[T] comp_footer() -> RespoNode[T] {
  div(class_name=style_footer, [
    div(class_name=style_footer_content, [
      div(class_name=style_footer_brand, [
        img(width=32, src="https://cdn.tiye.me/logo/respo.png", alt="Respo"),
        span(inner_text="Respo", []),
      ]),
      div(class_name=style_footer_text, [
        text_node("Built with MoonBit. Inspired by React & Reagent."),
      ]),
      div(class_name=style_footer_links, [
        a(inner_text="GitHub", href="https://github.com/Respo", target=Blank),
        a(
          inner_text="Calcit Version",
          href="https://respo-mvc.org/",
          target=Blank,
        ),
        a(
          inner_text="MoonBit",
          href="https://www.moonbitlang.com/",
          target=Blank,
        ),
      ]),
    ]),
  ])
}

// ============================================================================
// Code Block Component
// ============================================================================

///|
extern "js" fn moonbit_code_to_html(code : String) -> String =
  #| (code) => { return window.moonbit_code_to_html(code)}

///|
/// a custom style for code block with language tag
fn[T] code_block(
  class_name? : String,
  style? : @css.RespoStyle,
  code : String,
) -> RespoNode[T] {
  div(class_name=style_code_wrapper, [
    span(class_name=style_code_lang_tag, inner_text="MoonBit", []),
    pre(
      class_list=[
        @respo.ui_font_code,
        class_name.unwrap_or_default(),
        style_code_block,
      ],
      style=style.unwrap_or_default(),
      innerHTML=moonbit_code_to_html(code),
    ),
  ])
}

///|
let style_code_wrapper : String = static_style([
  (
    "&",
    respo_style(position=Relative).add("flex", "1").add("min-width", "300px"),
  ),
])

///|
let style_code_lang_tag : String = static_style([
  (
    "&",
    respo_style(
      position=Absolute,
      font_size=11,
      font_weight="600",
      color=Hsl(0, 0, 50),
      padding=4 |> Px,
      border_radius=4,
      background_color=Transparent,
    )
    .add("top", "10px")
    .add("right", "14px")
    .add("letter-spacing", "0.5px")
    .add("text-transform", "uppercase"),
  ),
])

// ============================================================================
// Styles
// ============================================================================

// Page Container

///|
let style_page_container : String = static_style([
  (
    "&",
    respo_style(background_color=RawString("#FAFBFC")).add(
      "min-height", "100vh",
    ),
  ),
])

// Hero Section Styles

///|
let style_hero : String = contained_static_style([
  (
    None,
    "&",
    respo_style(padding=80 |> Px, text_align=Center).add(
      "background", "linear-gradient(180deg, #fff5f5 0%, #ffffff 100%)",
    ),
  ),
  (Some("@media (max-width: 768px)"), "&", respo_style(padding=40 |> Px)),
])

///|
let style_hero_content : String = static_style([
  ("&", respo_style(max_width=800 |> Px, margin=Auto)),
])

///|
let style_hero_logo : String = static_style([
  (
    "&",
    respo_style(margin_bottom=24 |> Px, border_radius=16).add(
      "filter", "drop-shadow(0 4px 12px rgba(200, 50, 50, 0.15))",
    ),
  ),
])

///|
let style_hero_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=64,
      font_weight="700",
      color=Hsl(0, 0, 15),
      margin=Px(0),
      margin_bottom=20 |> Px,
    ),
  ),
])

///|
let style_hero_tagline : String = static_style([
  (
    "&",
    respo_style(
      font_size=24,
      color=Hsl(0, 70, 45),
      margin=Px(0),
      margin_bottom=24 |> Px,
      font_weight="500",
    ),
  ),
])

///|
let style_hero_description : String = static_style([
  (
    "&",
    respo_style(
      font_size=18,
      color=Hsl(0, 0, 40),
      margin=Px(0),
      margin_bottom=32 |> Px,
      line_height=1.6 |> Em,
    ),
  ),
])

///|
let style_hero_buttons : String = static_style([
  (
    "&",
    respo_style(display=Flex, justify_content=Center, align_items=Center)
    .add("flex-wrap", "wrap")
    .add("gap", "12px"),
  ),
])

///|
let style_btn_primary : String = static_style([
  (
    "&",
    respo_style(
      padding=Px(14),
      font_size=16,
      font_weight="600",
      color=White,
      background_color=Hsl(0, 70, 50),
      border=CssBorder(0.0, Solid, Transparent),
      border_radius=8,
      cursor=Pointer,
    )
    .add("padding-left", "28px")
    .add("padding-right", "28px")
    .add("transition", "all 0.2s ease")
    .add("box-shadow", "0 2px 8px rgba(200, 50, 50, 0.25)"),
  ),
  (
    "&:hover",
    respo_style(background_color=Hsl(0, 70, 45))
    .add("transform", "translateY(-1px)")
    .add("box-shadow", "0 4px 12px rgba(200, 50, 50, 0.35)"),
  ),
])

///|
let style_btn_secondary : String = static_style([
  (
    "&",
    respo_style(
      padding=Px(14),
      font_size=16,
      font_weight="600",
      color=Hsl(0, 0, 30),
      background_color=White,
      border=CssBorder(1.0, Solid, Hsl(0, 0, 85)),
      border_radius=8,
      cursor=Pointer,
    )
    .add("padding-left", "28px")
    .add("padding-right", "28px")
    .add("transition", "all 0.2s ease"),
  ),
  (
    "&:hover",
    respo_style(
      background_color=Hsl(0, 0, 97),
      border=CssBorder(1.0, Solid, Hsl(0, 0, 75)),
    ).add("transform", "translateY(-1px)"),
  ),
])

// Section Styles

///|
let style_section : String = contained_static_style([
  (
    None,
    "&",
    respo_style(padding=80 |> Px, max_width=1200 |> Px, margin=Auto)
    .add("padding-left", "24px")
    .add("padding-right", "24px"),
  ),
  (Some("@media (max-width: 768px)"), "&", respo_style(padding=40 |> Px)),
])

///|
let style_section_alt : String = static_style([
  ("&", respo_style(background_color=White).add("max-width", "none")),
])

///|
let style_section_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=36,
      font_weight="700",
      color=Hsl(0, 0, 15),
      text_align=Center,
      margin=Px(0),
      margin_bottom=48 |> Px,
    ),
  ),
])

// Features Grid Styles

///|
let style_features_grid : String = contained_static_style([
  (
    None,
    "&",
    respo_style(display=Flex)
    .add("flex-wrap", "wrap")
    .add("gap", "24px")
    .add("justify-content", "center"),
  ),
])

///|
let style_feature_card : String = contained_static_style([
  (
    None,
    "&",
    respo_style(
      background_color=White,
      border_radius=12,
      padding=28 |> Px,
      width=350 |> Px,
      border=CssBorder(1.0, Solid, Hsl(0, 0, 92)),
    )
    .add("box-shadow", "0 2px 8px rgba(0,0,0,0.04)")
    .add("transition", "all 0.2s ease"),
  ),
  (
    None,
    "&:hover",
    respo_style(border=CssBorder(1.0, Solid, Hsl(0, 0, 85)))
    .add("box-shadow", "0 4px 16px rgba(0,0,0,0.08)")
    .add("transform", "translateY(-2px)"),
  ),
  (Some("@media (max-width: 768px)"), "&", respo_style(width=100 |> Percent)),
])

///|
let style_feature_icon : String = static_style([
  (
    "&",
    respo_style(
      font_size=28,
      display=Flex,
      margin_bottom=16 |> Px,
      width=56 |> Px,
      height=56 |> Px,
      border_radius=12,
      background_color=Hsl(0, 70, 97),
      align_items=Center,
      justify_content=Center,
    ),
  ),
])

///|
let style_feature_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=20,
      font_weight="600",
      color=Hsl(0, 0, 15),
      margin=Px(0),
      margin_bottom=8 |> Px,
    ),
  ),
])

///|
let style_feature_description : String = static_style([
  (
    "&",
    respo_style(
      font_size=15,
      color=Hsl(0, 0, 45),
      margin=Px(0),
      line_height=1.6 |> Em,
    ),
  ),
])

// Code Section Styles

///|
let style_code_section : String = contained_static_style([
  (
    None,
    "&",
    respo_style(display=Flex, align_items=FlexStart, margin_bottom=48 |> Px)
    .add("gap", "32px")
    .add("flex-wrap", "wrap"),
  ),
])

///|
let style_code_description : String = contained_static_style([
  (
    None,
    "&",
    respo_style(min_width=280 |> Px, max_width=320 |> Px, line_height=1.7 |> Em)
    .add("flex", "1")
    .add("color", "#555"),
  ),
  (
    Some("@media (max-width: 768px)"),
    "&",
    respo_style(max_width=100 |> Percent, min_width=100 |> Percent),
  ),
])

///|
let style_code_section_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=22,
      font_weight="600",
      color=Hsl(0, 0, 15),
      margin=Px(0),
      margin_bottom=12 |> Px,
    ),
  ),
])

///|
let style_code_block : String = static_style([
  (
    "&",
    respo_style(
      padding=24 |> Px,
      border=CssBorder(1.0, Solid, Hsl(220, 20, 25)),
      border_radius=12,
      line_height=1.7 |> Em,
      font_size=14,
      background_color=RawString("#282c34"),
      color=Hsl(0, 0, 90),
      overflow=Auto,
      margin=Px(0),
    ).add("box-shadow", "0 4px 16px rgba(0,0,0,0.15)"),
  ),
  ("pre&", respo_style(margin=Px(0))),
  ("& pre", respo_style(margin=Px(0), background_color=Transparent)),
  ("& code", respo_style(background_color=Transparent)),
])

///|
let style_inline_code : String = static_style([
  (
    "&",
    respo_style(
      padding=8 |> Px,
      font_size=14,
      background_color=Hsl(220, 15, 18),
      color=Hsl(40, 80, 70),
      border_radius=6,
      border=CssBorder(1.0, Solid, Hsl(220, 15, 28)),
    )
    .add("padding-left", "16px")
    .add("padding-right", "16px"),
  ),
])

///|
let style_command_line : String = static_style([
  ("&", respo_style(margin_top=8 |> Px)),
])

// Getting Started Styles

///|
let style_getting_started_content : String = contained_static_style([
  (
    None,
    "&",
    respo_style(display=Flex)
    .add("gap", "24px")
    .add("flex-wrap", "wrap")
    .add("justify-content", "center"),
  ),
])

///|
let style_step_card : String = contained_static_style([
  (
    None,
    "&",
    respo_style(
      background_color=White,
      border_radius=12,
      padding=32 |> Px,
      width=320 |> Px,
      border=CssBorder(1.0, Solid, Hsl(0, 0, 92)),
      text_align=Center,
    )
    .add("box-shadow", "0 2px 8px rgba(0,0,0,0.04)")
    .add("transition", "all 0.2s ease"),
  ),
  (
    None,
    "&:hover",
    respo_style(border=CssBorder(1.0, Solid, Hsl(0, 70, 80)))
    .add("box-shadow", "0 4px 16px rgba(0,0,0,0.08)")
    .add("transform", "translateY(-2px)"),
  ),
  (Some("@media (max-width: 768px)"), "&", respo_style(width=100 |> Percent)),
])

///|
let style_step_number : String = static_style([
  (
    "&",
    respo_style(
      display=Flex,
      width=48 |> Px,
      height=48 |> Px,
      border_radius=48,
      background_color=Hsl(0, 70, 50),
      color=White,
      font_size=20,
      font_weight="700",
      margin=Auto,
      margin_bottom=20 |> Px,
      align_items=Center,
      justify_content=Center,
    ).add("box-shadow", "0 2px 8px rgba(200, 50, 50, 0.3)"),
  ),
])

///|
let style_step_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=18,
      font_weight="600",
      color=Hsl(0, 0, 15),
      margin=Px(0),
      margin_bottom=12 |> Px,
    ),
  ),
])

// Why MoonBit Section Styles

///|
let style_moonbit_intro : String = static_style([
  (
    "&",
    respo_style(
      font_size=18,
      color=Hsl(0, 0, 45),
      text_align=Center,
      margin=Px(0),
      margin_bottom=48 |> Px,
      max_width=700 |> Px,
      line_height=1.7 |> Em,
    )
    .add("margin-left", "auto")
    .add("margin-right", "auto"),
  ),
])

///|
let style_moonbit_grid : String = contained_static_style([
  (
    None,
    "&",
    respo_style(display=Flex, max_width=900 |> Px, margin=Auto)
    .add("flex-wrap", "wrap")
    .add("gap", "24px")
    .add("justify-content", "center"),
  ),
])

///|
let style_moonbit_feature : String = contained_static_style([
  (
    None,
    "&",
    respo_style(
      display=Flex,
      align_items=FlexStart,
      background_color=RawString("#FAFBFC"),
      border_radius=12,
      padding=20 |> Px,
      width=420 |> Px,
      border=CssBorder(1.0, Solid, Hsl(0, 0, 92)),
    )
    .add("gap", "16px")
    .add("text-align", "left"),
  ),
  (Some("@media (max-width: 768px)"), "&", respo_style(width=100 |> Percent)),
])

///|
let style_moonbit_icon : String = static_style([
  (
    "&",
    respo_style(
      font_size=24,
      display=Flex,
      width=48 |> Px,
      height=48 |> Px,
      border_radius=10,
      background_color=Hsl(210, 60, 95),
      align_items=Center,
      justify_content=Center,
    ).add("flex-shrink", "0"),
  ),
])

///|
let style_moonbit_feature_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=17,
      font_weight="600",
      color=Hsl(0, 0, 15),
      margin=Px(0),
      margin_bottom=4 |> Px,
    ),
  ),
])

///|
let style_moonbit_feature_desc : String = static_style([
  (
    "&",
    respo_style(
      font_size=14,
      color=Hsl(0, 0, 50),
      margin=Px(0),
      line_height=1.5 |> Em,
    ),
  ),
])

///|
let style_moonbit_cta : String = static_style([
  ("&", respo_style(margin_top=40 |> Px, text_align=Center)),
])

///|
let style_btn_moonbit : String = static_style([
  (
    "&",
    respo_style(
      border=CssBorder(1.0, Solid, Hsl(210, 50, 50)),
      color=Hsl(210, 50, 40),
    ),
  ),
  (
    "&:hover",
    respo_style(
      background_color=Hsl(210, 50, 97),
      border=CssBorder(1.0, Solid, Hsl(210, 50, 40)),
    ),
  ),
])

// Community Section Styles

///|
let style_community_description : String = static_style([
  (
    "&",
    respo_style(
      font_size=18,
      color=Hsl(0, 0, 45),
      text_align=Center,
      margin=Px(0),
      margin_bottom=40 |> Px,
    ),
  ),
])

///|
let style_community_links : String = contained_static_style([
  (
    None,
    "&",
    respo_style(display=Flex)
    .add("gap", "20px")
    .add("flex-wrap", "wrap")
    .add("justify-content", "center"),
  ),
])

///|
let style_community_card : String = contained_static_style([
  (
    None,
    "&",
    respo_style(
      display=Block,
      background_color=RawString("#FAFBFC"),
      border_radius=12,
      padding=24 |> Px,
      width=220 |> Px,
      border=CssBorder(1.0, Solid, Hsl(0, 0, 92)),
      text_align=Center,
    )
    .add("text-decoration", "none")
    .add("transition", "all 0.2s ease")
    .add("box-shadow", "0 1px 3px rgba(0,0,0,0.04)"),
  ),
  (
    None,
    "&:hover",
    respo_style(
      border=CssBorder(1.0, Solid, Hsl(0, 70, 70)),
      background_color=White,
    )
    .add("transform", "translateY(-3px)")
    .add("box-shadow", "0 6px 20px rgba(200, 50, 50, 0.12)"),
  ),
  (Some("@media (max-width: 768px)"), "&", respo_style(width=100 |> Percent)),
])

///|
let style_community_card_title : String = static_style([
  (
    "&",
    respo_style(
      font_size=18,
      font_weight="600",
      color=Hsl(0, 70, 45),
      margin=Px(0),
      margin_bottom=8 |> Px,
    ),
  ),
])

///|
let style_community_card_desc : String = static_style([
  ("&", respo_style(font_size=14, color=Hsl(0, 0, 50), margin=Px(0))),
])

// Footer Styles

///|
let style_footer : String = static_style([
  (
    "&",
    respo_style(
      padding=48 |> Px,
      background_color=Hsl(220, 20, 12),
      color=White,
    ),
  ),
])

///|
let style_footer_content : String = static_style([
  ("&", respo_style(max_width=1200 |> Px, margin=Auto, text_align=Center)),
])

///|
let style_footer_brand : String = static_style([
  (
    "&",
    respo_style(
      display=Flex,
      align_items=Center,
      justify_content=Center,
      margin_bottom=16 |> Px,
      font_size=20,
      font_weight="600",
    ).add("gap", "10px"),
  ),
])

///|
let style_footer_text : String = static_style([
  (
    "&",
    respo_style(
      font_size=14,
      color=Hsl(0, 0, 60),
      margin=Px(0),
      margin_bottom=20 |> Px,
    ),
  ),
])

///|
let style_footer_links : String = static_style([
  ("&", respo_style(display=Flex, justify_content=Center).add("gap", "24px")),
  (
    "& a",
    respo_style(color=Hsl(0, 0, 70), font_size=14).add(
      "text-decoration", "none",
    ),
  ),
  ("& a:hover", respo_style(color=White)),
])
