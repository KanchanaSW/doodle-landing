#!/usr/bin/env bash
# Scaffold a Vite + React + TypeScript app and install the latest doodleui-react.
# Usage: scripts/setup.sh [target-dir]
# Never bake a doodleui-react version into this script — npm install unpinned.
set -euo pipefail

TARGET="${1:-.}"

if [[ -f "$(cd "$(dirname "$0")/.." && pwd)/SKILL.md" && "$(cd "$TARGET" 2>/dev/null && pwd)" == "$(cd "$(dirname "$0")/.." && pwd)" ]]; then
  echo "Refusing to scaffold inside the doodle-landing skill directory. Pass a different target path." >&2
  exit 1
fi

if ! command -v npm >/dev/null; then
  echo "npm is required" >&2
  exit 1
fi

LATEST="$(npm view doodleui-react version)"
echo "Latest doodleui-react on npm: ${LATEST}"

if [[ ! -f "${TARGET}/package.json" ]]; then
  mkdir -p "$(dirname "$TARGET")"
  npm create vite@latest "$TARGET" -- --template react-ts
fi

cd "$TARGET"

npm install
npm install doodleui-react

INSTALLED="$(node -p "require('./node_modules/doodleui-react/package.json').version")"
echo "Installed doodleui-react@${INSTALLED}"

# --- index.html: hand + body fonts ---
if [[ -f index.html ]]; then
  python3 - <<'PY'
from pathlib import Path
p = Path("index.html")
t = p.read_text()
link = '''    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600&family=Patrick+Hand&display=swap" rel="stylesheet" />
'''
if "fonts.googleapis.com" not in t:
    t = t.replace("<head>", "<head>\n" + link, 1)
    p.write_text(t)
PY
fi

# --- paper / ink CSS ---
cat > src/index.css <<'CSS'
:root {
  --paper: #eef0ea;
  --ink: #1f1d1a;
  --accent: #e24b3b;
  --doodle-ui-font: "Patrick Hand", cursive;
  color: var(--ink);
  background: var(--paper);
  font-family: Outfit, system-ui, sans-serif;
  line-height: 1.5;
  font-weight: 400;
  color-scheme: light;
  font-synthesis: none;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
}

* { box-sizing: border-box; }

html {
  background: var(--paper);
}

body {
  margin: 0;
  min-height: 100dvh;
  background:
    linear-gradient(180deg, rgb(238 240 234 / 0.96), rgb(238 240 234 / 0.96)),
    repeating-linear-gradient(
      0deg,
      transparent,
      transparent 23px,
      rgb(31 29 26 / 0.035) 23px,
      rgb(31 29 26 / 0.035) 24px
    );
  color: var(--ink);
}

#root { min-height: 100dvh; }

.paper-grain {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 1;
  opacity: 0.35;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 180 180' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='2' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.45'/%3E%3C/svg%3E");
  mix-blend-mode: multiply;
}

h1, h2, h3, .hand {
  font-family: var(--doodle-ui-font), "Patrick Hand", cursive;
  font-weight: 400;
  letter-spacing: 0.01em;
}

a { color: var(--ink); }

::selection {
  background: var(--accent);
  color: #f7f6f2;
}

button, input, textarea {
  font: inherit;
}
CSS

# --- providers ---
cat > src/main.tsx <<'TSX'
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { SketchSeedProvider, TooltipProvider } from "doodleui-react";
import App from "./App";
import "./index.css";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <SketchSeedProvider>
      <TooltipProvider>
        <div className="paper-grain" aria-hidden />
        <App />
      </TooltipProvider>
    </SketchSeedProvider>
  </StrictMode>,
);
TSX

cat > src/App.tsx <<'TSX'
import { LandingPage } from "./LandingPage";

export default function App() {
  return <LandingPage />;
}
TSX

cat > src/LandingPage.tsx <<'TSX'
/** Archetype: (replace) — agent fills this file. */
import { Button, Card } from "doodleui-react";

export function LandingPage() {
  return (
    <main style={{ padding: "3rem 1.5rem", maxWidth: 720, margin: "0 auto" }}>
      <Card title="Replace this">
        <p>The doodle-landing skill overwrites this component with the real page.</p>
        <Button variant="primary">Scaffold OK</Button>
      </Card>
    </main>
  );
}
TSX

# Vite scaffold may still import App.css / an assets logo — drop unused CSS import if present
if [[ -f src/App.css ]]; then
  rm -f src/App.css
fi

echo "Scaffold ready in $(pwd)"
echo "Next: overwrite src/LandingPage.tsx, then npm run dev"
