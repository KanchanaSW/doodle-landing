# doodle-landing

A [Cursor](https://cursor.com) and [Claude Code](https://claude.com/claude-code) skill that generates a **hand-drawn landing page** from a title, using [`doodleui-react`](https://www.npmjs.com/package/doodleui-react).

The agent writes the copy, picks a layout that fits the title’s domain, pulls free images from Pexels, and scaffolds a Vite + React + TypeScript app whose buttons, cards, inputs, and other chrome all come from the library.

## Install

From this folder:

```bash
bash scripts/install.sh
```

That symlinks this repo into `~/.cursor/skills/doodle-landing` and `~/.claude/skills/doodle-landing`. Restart Cursor / start a new Claude Code session so the skill is discovered.

## Sample commands

```text
make me a landing page for Night School Press
```

```text
build a hand-drawn site for Harbor Cohort
```

```text
doodle landing page titled "Mudlark Mugs" — palette #f4efe6 / #1f1d1a / #c45c26
```

Title is required. Palette and images are optional.

## Layouts

The skill will not always emit hero + three feature cards. Archetypes live in `reference/layout-archetypes.md` (waitlist, timeline, pricing, manifesto, portfolio, product split, and more).
