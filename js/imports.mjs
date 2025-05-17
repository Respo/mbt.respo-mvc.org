import { createHighlighter } from "shiki";

// import "github-markdown-css";

import mbt from "./moonbit.tmLanguage.json";

let theme = "one-light";

let main = async () => {
  const highlighter = await createHighlighter({
    themes: [theme],
    langs: [mbt],
  });

  window.moonbit_code_to_html = (code, lang) => {
    return highlighter.codeToHtml(code, {
      lang: lang || "moonbit",
      theme: theme,
    });
  };
  console.log("injected moonbit_code_to_html");

  window.onImportsLoaded();
};

main();
