# doodle-landing

A [Cursor](https://cursor.com) and [Claude Code](https://claude.com/claude-code) skill that builds a **hand-drawn landing page from a title**: one Vite + React + TypeScript app, every button/card/input/badge/modal/divider/progress/tooltip from `[doodleui-react](https://www.npmjs.com/package/doodleui-react)`, layout chosen from named archetypes (not a default hero + three cards), copy written from the title, images from Pexels or user URLs.

Not a Tailwind chrome clone. Not a dark SaaS template. Not conceptcraft (that is narrative concept sites).

## Live example

[doodle-ui.netlify.app](https://doodle-ui.netlify.app/) — live component docs and sketch previews for the library this skill imports. Each generated landing is title-specific; there is no single canonical demo URL.

## Install

Claude Code:

```bash
git clone https://github.com/KanchanaSW/doodle-landing ~/.claude/skills/doodle-landing
```

Cursor:

```bash
git clone https://github.com/KanchanaSW/doodle-landing ~/.cursor/skills/doodle-landing
```

Or, from a local checkout, symlink into both runtimes:

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

That links:

- `~/.cursor/skills/doodle-landing` — Cursor
- `~/.claude/skills/doodle-landing` — Claude Code

Both runtimes pick up `SKILL.md` on the next session. Then, in any project:

1. Give a **title** (product, event, person, cause, or working name). Palette and images are optional.
2. Ask:

> make me a landing page for Night School Press, use skill doodle-landing

or:

> doodle landing page titled "Mudlark Mugs" — palette #f4efe6 / #1f1d1a / #c45c26 , use skill doodle-landing

## What's in the box

```
SKILL.md                         hard gates + ordered workflow
reference/layout-archetypes.md   waitlist, timeline, pricing, manifesto, portfolio, …
reference/library-api.md         props cache — re-fetch live docs before JSX
scripts/install.sh               dual-runtime symlink
scripts/setup.sh                 Vite + React + TS scaffold (paper/ink CSS)
```

## The format in one paragraph

The agent classifies the title (web search when the name is ambiguous), picks one archetype from `reference/layout-archetypes.md`, and varies section order, count, and image placement so similar titles do not look identical. It installs the latest published `doodleui-react`, re-fetches `https://doodle-ui.netlify.app/docs/<component>/` for every component used, wraps the app in `SketchSeedProvider` and `TooltipProvider`, maps optional palette onto `--paper` / `--ink` / `--accent` and `sketchColor`, sources Pexels or user images with credits in the generated README, scaffolds via `scripts/setup.sh` into a new directory (never into the skill folder), and ships one screen of real sketch chrome — rough.js strokes, paper grain, hand type — with HTML for prose and doodle-ui for all interactive chrome.

## After install

Restart Cursor / start a new Claude Code session so the skill description is in the catalog. Provide a title (required) and ask to scaffold a doodle landing; the agent should read `SKILL.md` then `reference/layout-archetypes.md` before picking layout and components.

## Credits

- Format and skill by [Kanchana Walagambahu](https://github.com/KanchanaSW).
- UI chrome from `[doodleui-react](https://www.npmjs.com/package/doodleui-react)` ([docs](https://doodle-ui.netlify.app/)).

## License

MIT — see [LICENSE](LICENSE).