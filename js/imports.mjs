import { createHighlighter } from "shiki";

// import "github-markdown-css";

import mbt from "./moonbit.tmLanguage.json";

const highlighter = await createHighlighter({
  themes: ["github-light"],
  langs: [mbt],
});

window.moonbit_code_to_html = (code, lang) => {
  return highlighter.codeToHtml(code, {
    lang: lang || "moonbit",
    theme: "github-light",
  });
};
console.log("injected moonbit_code_to_html");

window.onImportsLoaded();
