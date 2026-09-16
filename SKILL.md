---
name: doodle-landing
description: >
  Use when the user asks to make a landing page for X, build a hand-drawn
  site for X, create a doodle landing page, or generate a sketchy /
  Excalidraw-style marketing page from a title. Triggers include "make me a
  landing page for X", "build a hand-drawn site for X", and "doodle landing
  page". Generates a Vite + React site whose UI chrome comes from doodleui-react.
---

# doodle-landing

Given **only a title**, generate a complete, ready-to-run landing page that looks hand-drawn (Excalidraw / sketchbook), uses `doodleui-react` for every piece of UI chrome, and does not collapse into the same hero + 3-cards template.

Live docs: https://doodle-ui.netlify.app/
Package: https://www.npmjs.com/package/doodleui-react

## Hard gates

Stop and fix before generating code if any of these would be violated:

1. **Title is mandatory.** If the request has no clear title/name for the page, ask for one and wait. Do not invent a placeholder title.
2. **Every button, card, input, badge, alert, modal, divider, progress bar, tooltip, checkbox, radio, and textarea comes from `doodleui-react`.** No raw `<button>` / Tailwind "card" / shadcn stand-ins.
3. **Install the latest published `doodleui-react` at generation time.** Run `npm view doodleui-react version` first. Never pin a version written into this skill.
4. **Re-fetch live docs for every component you actually use** (`https://doodle-ui.netlify.app/docs/<component>/`) before writing final JSX. The cache in [reference/library-api.md](reference/library-api.md) is a starting map, not source of truth.
5. **Pick a layout from [reference/layout-archetypes.md](reference/layout-archetypes.md) that fits this title.** Do not default to hero + 3-feature-grid.
6. **Write all copy yourself** from the title. The user does not supply headline/sections/CTAs.
7. **Images: user-supplied URLs win; otherwise Pexels; never paid/watermarked/scraped random web photos.**

Do not scaffold into the directory that contains this `SKILL.md`.

## Workflow

Copy and complete in order:

```
Generate:
- [ ] 1 Title present? If not, ask and stop.
- [ ] 2 Parse optional palette + images
- [ ] 3 Classify domain (web search if ambiguous)
- [ ] 4 Read layout-archetypes.md → pick one → vary order/count/images
- [ ] 5 npm view doodleui-react version → npm install doodleui-react
- [ ] 6 Re-fetch docs for each component you will use
- [ ] 7 Source Pexels images (or user images)
- [ ] 8 Scaffold Vite + React + TS (scripts/setup.sh)
- [ ] 9 Write the landing page + paper/ink CSS
- [ ] 10 README (archetype, palette, image credits)
- [ ] 11 Dev server starts; page is one screen of real doodle-ui chrome
```

### 1. Title

Required. A product name, event name, personal name, cause, or working title counts. "Make a landing page" without a subject does not.

Ask once: **"What should the landing page be titled / named?"** Then wait.

### 2. Optional inputs

- **Color palette** — hex codes, named colors, or a vibe (`pastel`, `monochrome ink`). If present, map onto `--paper`, `--ink`, `--accent`, and `sketchColor` on every doodle-ui component. If absent, use library defaults: paper `#eef0ea`, ink `#1f1d1a`, one accent chosen to fit the title's mood (library default accent is `#e24b3b`).
- **Images** — if the user passed files or URLs, use those. Otherwise search Pexels.

### 3. Classify the title

Decide domain/intent: product/SaaS, event, portfolio, nonprofit, personal, waitlist, physical product, community, marketplace, etc.

**Web-search the title** when it is a proper noun, brand, niche term, event name, or otherwise unfamiliar. The layout choice must be informed, not guessed.

### 4. Pick a layout archetype

Read [reference/layout-archetypes.md](reference/layout-archetypes.md). Choose the named archetype that best fits the classified domain.

Then **vary within that archetype** so two similar titles do not look identical:

- Section **order** (e.g. social proof before features, or after)
- Section **count** (3–6 supporting sections, not always 3)
- **Image placement** (left/right/full-bleed/none/background)

Log the choice in a **file comment at the top of the generated landing component**, not in chat:

```tsx
/** Archetype: waitlist-coming-soon — title is a pre-launch product with no shipping date. Varied: no nav, email field before social proof. */
```

### 5. Library install (every generation)

```bash
npm view doodleui-react version    # confirm latest; do not assume
npm install doodleui-react         # unpinned; writes whatever is latest now
```

Peer: `react` / `react-dom` >= 18. rough.js ships bundled. Prefer the scaffold in [scripts/setup.sh](scripts/setup.sh).

Wrap the app root in **both** providers (TooltipProvider is required even if you only use a couple of tooltips — Modal/Checkbox/Radio also rely on the Radix + sketch stack sitting under these):

```tsx
import {
  SketchSeedProvider,
  TooltipProvider,
  Button,
  Card,
  Input,
} from "doodleui-react";

<SketchSeedProvider>
  <TooltipProvider>
    {/* page */}
  </TooltipProvider>
</SketchSeedProvider>
```

Optional: wrap with `DoodleUIProvider` to set default `animate`. Sketch draw-in is on by default; pass `animate={false}` per component or on the provider to opt out. Honor `prefers-reduced-motion` (the library already does unless `forceAnimate`).

### 6. Re-fetch props before writing JSX

For each component you will import, fetch `https://doodle-ui.netlify.app/docs/<component>/` and use **those** prop names. Shared sketch props are usually `roughness`, `seed`, `sketchColor`, `className`, `style`, plus `animate` / `bowing` / `fillStyle` if the live page lists them.

Landing-page chrome is limited to these twelve (plus `RadioGroup`, which Radio requires):

Button, Input, Textarea, Checkbox, Radio, Card, Badge, Alert, Modal, Divider, Progress, Tooltip

The published package may export more (Select, Tabs, Accordion, …). **Do not use extras unless the user explicitly asks.** Text stays real HTML (`h1`/`p`/`nav`/`section`/`footer`) — the library draws borders/fills, not type.

Do not strip Radix focus/ARIA on Modal, Tooltip, Checkbox, or Radio.

### 7. Images

1. User-supplied images/URLs → use them.
2. Else extract 2–5 keywords from the title and search Pexels (`https://www.pexels.com` or `https://api.pexels.com/v1/search` when `PEXELS_API_KEY` is set).
3. Hotlink `images.pexels.com` URLs (or download into `public/`). Credit photographer + Pexels in the README.
4. If no honest photo match exists, fall back to abstract SVG doodle shapes — not Unsplash-random, not AI-generated people, not watermarked stock.

Frame photos inside `Card` (or a sketchy CSS clip) so imagery still reads as drawn-on-paper.

### 8. Scaffold

Run [scripts/setup.sh](scripts/setup.sh) into a **new directory** named after a slug of the title (or a path the user gave):

```bash
bash /path/to/doodle-landing/scripts/setup.sh ./slug-from-title
```

Then replace `src/LandingPage.tsx` with the real page. Keep `main.tsx` providers.

Layout CSS (flex/grid/type/spacing) may use plain CSS or Tailwind **utilities**. Tailwind must not recreate buttons, cards, inputs, or badges.

### 9. Content

Write, from the title alone:

- Original headline + subheadline
- 3–6 supporting sections matching the archetype (features, timeline, pricing, quotes, …)
- A CTA that uses `Button` (and `Input` when capturing email)
- Minimal footer

Tone matches the domain: playful for a personal project, credible for a nonprofit, urgent-but-human for a waitlist. Keep it a landing page, not an essay.

### 10. README + verify

Generated README must note: archetype chosen, palette used, image sources/credits.

Start the Vite dev server and confirm the page renders doodle-ui chrome (wobbly strokes, not rounded-rect Tailwind). If browser tools exist, load it. If not, `npm run build` must succeed.

## Theme surface

Map any user palette onto all of these, consistently:

| Token | Default | Where it lands |
| --- | --- | --- |
| `--paper` | `#eef0ea` | `html`/`body` background |
| `--ink` | `#1f1d1a` | text + default `sketchColor` |
| `--accent` | `#e24b3b` | CTAs, selection, Badge `accent`, primary Button |

Pass `sketchColor={ink}` on doodle-ui components (or omit to use `#1f1d1a`). Use `Card fill` sparingly for a paper wash, not as a flat Material card.

Load a hand font (Patrick Hand, Caveat, or Kalam) via Google Fonts and set `--doodle-ui-font`. Body type can be a humanist sans (Outfit is what the docs site uses) — not Inter as the hero look.

Keep a light paper grain and faint ruled lines (see `setup.sh` CSS). This is a sketchbook, not a dark SaaS dashboard.

## Aesthetic constraints

- Looks genuinely sketchy: rough.js strokes, hachure fills, paper background, slightly uneven type hierarchy.
- No AI-purple gradients, glassmorphism, Inter+slate-900, or generic three equal feature cards unless that archetype was deliberately chosen **and** internally varied.
- Shuffle: optional `useSketchSeed().shuffle` Button in a corner is welcome; do not make it the only CTA.
- Lock `seed` on components that must not jump between HMR reloads if it bothers layout (images inside cards).

## Common mistakes

| Excuse | Reality |
| --- | --- |
| "No title, I'll call it Acme" | Ask. Stop. |
| "I'll pin doodleui-react@0.x from memory" | `npm view` then unpinned `npm install` |
| "Tailwind button is faster" | Use `<Button>` from doodleui-react |
| "Hero + 3 cards always works" | Read archetypes; pick from the title |
| "I remember the props" | Re-fetch the docs page |
| "Unsplash is fine" | Pexels or user images only |
| "Library has Tabs now, I'll use them" | Twelve chrome components unless the user asks |
| "I'll skip providers" | SketchSeedProvider + TooltipProvider, always |

## Additional resources

- Component props cache: [reference/library-api.md](reference/library-api.md)
- Layout catalog: [reference/layout-archetypes.md](reference/layout-archetypes.md)
- Scaffold script: [scripts/setup.sh](scripts/setup.sh)
