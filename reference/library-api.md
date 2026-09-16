# doodleui-react API cache

**This file is a cache, not source of truth.** Before writing final JSX, re-fetch every component you will import:

`https://doodle-ui.netlify.app/docs/<component>/`

Prop names, variants, and new components change. If the live page disagrees with this file, **the live page wins**.

Package: `doodleui-react` — always `npm view doodleui-react version` then `npm install doodleui-react` (unpinned).

Docs home: https://doodle-ui.netlify.app/
Install notes: https://www.npmjs.com/package/doodleui-react

## Providers (required)

```tsx
import {
  SketchSeedProvider,
  TooltipProvider,
  DoodleUIProvider, // optional: default animate
  useSketchSeed,
} from "doodleui-react";

<SketchSeedProvider>
  <TooltipProvider>
    {children}
  </TooltipProvider>
</SketchSeedProvider>
```

- `SketchSeedProvider` — Shuffle redraws every unlocked sketch. `useSketchSeed()` returns `{ seed, shuffle, setSeed, fontIndex }`. Must wrap any tree that calls `useSketchSeed`. Pass `seed={n}` on a component to lock its wobble.
- `TooltipProvider` — required for `Tooltip`. Wrap once at the root.
- `DoodleUIProvider animate={false}` — optional global opt-out of sketch draw-in.

Import chrome from the same package:

```tsx
import {
  SketchSeedProvider,
  TooltipProvider,
  Button,
  Card,
  Input,
} from "doodleui-react";
```

## Shared sketch props

Present on essentially every component. Confirm on the live page.

| Prop | Type | Default | Notes |
| --- | --- | --- | --- |
| `roughness` | `number` | `1.5` | 0 ≈ geometric, 3+ messy |
| `seed` | `number` | provider / random | Lock pattern; omit to follow Shuffle |
| `sketchColor` | `string` | `#1f1d1a` | Stroke; tints primary/accent fills |
| `className` / `style` | standard | | **Layout only** — the package does not ship a visual CSS framework |
| `animate` | `boolean` | `true` (provider) | Draw-in on mount; live docs confirm |
| `bowing` | `number` | `1` | Line curvature (if listed live) |

Library tokens (docs site + `SKETCH_COLORS`):

| Name | Hex |
| --- | --- |
| ink | `#1f1d1a` |
| paper | `#eef0ea` |
| accent | `#e24b3b` |
| accentFill | `#f4c4bc` |
| secondaryFill | `#d7e3d4` |
| info | `#1d4e89` |
| warning | `#c47b17` |
| error | `#c0392b` |
| success | `#2d6a4f` |

Page CSS variables to set yourself: `--paper`, `--ink`, `--accent`, `--doodle-ui-font`.

## Landing-page allowlist (12)

Only these for interactive/chrome elements unless the user explicitly asks for another documented component. Re-fetch the matching docs URL before use.

### Button — `/docs/button/`

```tsx
<Button variant="primary" size="md" roughness={1.5}>Draw me</Button>
```

| Prop | Type | Default |
| --- | --- | --- |
| `variant` | `"primary" \| "secondary" \| "outline" \| "ghost"` | `"primary"` |
| `size` | `"sm" \| "md" \| "lg"` | `"md"` |
| `disabled` | `boolean` | `false` |

Primary/secondary: hachure fills. Outline: stroke-only. Ghost: stroke on hover.

### Input — `/docs/input/`

```tsx
<Input label="Email" placeholder="you@studio.dev" />
```

| Prop | Type | Default |
| --- | --- | --- |
| `label` | `ReactNode` | — |
| `placeholder` | `string` | — |

Native attrs (`type`, `name`, `autoComplete`, `onChange`) forward. Pass `label`; do not use placeholder-as-label.

### Textarea — `/docs/textarea/`

```tsx
<Textarea label="Note" rows={5} />
```

| Prop | Type | Default |
| --- | --- | --- |
| `label` | `ReactNode` | — |
| `rows` | `number` | `4` |

### Checkbox — `/docs/checkbox/`

Radix. Keep keyboard / mixed / `aria-checked`.

```tsx
<Checkbox label="Keep the wobble" defaultChecked />
```

| Prop | Type |
| --- | --- |
| `label` | `ReactNode` |
| `checked` | `boolean \| "indeterminate"` |
| `onCheckedChange` | `(checked: boolean \| "indeterminate") => void` |

### Radio — `/docs/radio/`

Must live inside `RadioGroup`. Import both.

```tsx
import { RadioGroup, Radio } from "doodleui-react";

<RadioGroup defaultValue="pen">
  <Radio value="pen" label="Pen" />
  <Radio value="pencil" label="Pencil" />
</RadioGroup>
```

`RadioGroup`: Radix root (`value`, `onValueChange`, `orientation`, `disabled`). Sketch props live on each `Radio`. `Radio.value` is required.

### Card — `/docs/card/`

```tsx
<Card title="Field notes" shadow>
  A container with a sketch border.
</Card>
```

| Prop | Type | Default |
| --- | --- | --- |
| `title` | `ReactNode` | — |
| `footer` | `ReactNode` | — |
| `shadow` | `boolean` | `true` (offset rough.js rect, not CSS drop-shadow) |
| `fill` | `string` | — |

### Badge — `/docs/badge/`

```tsx
<Badge variant="accent">sketch</Badge>
```

`variant`: `"default" | "accent" | "outline"` (default `"default"`).

### Alert — `/docs/alert/`

```tsx
<Alert variant="info" title="Heads up">Callouts keep a color-coded stroke.</Alert>
```

`variant`: `"info" | "warning" | "error" | "success"`. Body copy stays ink-colored.

### Modal — `/docs/modal/`

Radix Dialog. Focus trap, Escape, ARIA labelling stay intact.

```tsx
<Modal title="Scratch pad" trigger={<Button>Open modal</Button>}>
  Any content.
</Modal>
```

| Prop | Notes |
| --- | --- |
| `trigger` | Radix Trigger asChild |
| `title` | visually hidden title used if omitted |
| `description` | optional |
| `open` / `onOpenChange` | controlled API |

Compound exports exist if live docs still list them: `ModalRoot`, `ModalTrigger`, `ModalClose`, `ModalTitle`, `ModalDescription`.

### Divider — `/docs/divider/`

```tsx
<Divider />
<Divider orientation="vertical" style={{ height: 120 }} />
```

`orientation`: `"horizontal" | "vertical"`. Vertical needs an explicit height.

### Progress — `/docs/progress/`

```tsx
<Progress value={62} max={100} />
```

Exposes `role="progressbar"` + aria-value*. `value` default 0, `max` default 100.

### Tooltip — `/docs/tooltip/`

Requires `TooltipProvider`. Trigger must accept a ref (native elements and doodle-ui `Button` work; custom components need `forwardRef`).

```tsx
<Tooltip content="A small sketch bubble">
  <Button variant="outline">Hover me</Button>
</Tooltip>
```

| Prop | Type | Default |
| --- | --- | --- |
| `content` | `ReactNode` | required |
| `side` | `"top" \| "right" \| "bottom" \| "left"` | `"top"` |
| `delayDuration` | `number` | `200` |

## Out of allowlist

The package also exports Select, NativeSelect, Switch, Slider, Tabs, Accordion, Table, Toast, Avatar, Pagination, Breadcrumb, Skeleton, Stepper, Label, Field, Collapsible, Popover, DropdownMenu, Dialog, AlertDialog, Command, Combobox, Kbd, Spinner, Toggle, ToggleGroup, InputGroup, InputOTP, ScrollArea, Resizable, HoverCard, ContextMenu, NavigationMenu, Menubar, Sheet, Drawer, AspectRatio, Empty, Heading, Text, Blockquote, InlineCode, Highlight, Sidebar, Carousel, `RoughSvg`, and more.

**Landing pages generated by this skill stay on the twelve above** unless the user names an extra component. If they do, re-fetch that component's docs page and keep providers/a11y intact.

## Text

Headings, paragraphs, lists, `nav`, `section`, `footer`, links: semantic HTML. Do not replace them with library typography components unless asked.
