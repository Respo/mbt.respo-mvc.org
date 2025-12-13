import { createHighlighter } from "shiki";

// import "github-markdown-css";

import mbt from "./moonbit.tmLanguage.json";

let theme = "one-dark-pro";

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

  // Wait for MoonBit code to define onImportsLoaded
  if (typeof window.onImportsLoaded === "function") {
    window.onImportsLoaded();
  } else {
    // Poll until the function is available
    const waitForMoonbit = () => {
      if (typeof window.onImportsLoaded === "function") {
        window.onImportsLoaded();
      } else {
        requestAnimationFrame(waitForMoonbit);
      }
    };
    waitForMoonbit();
  }
};

main();
