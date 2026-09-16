# Layout archetypes

Pick **one named archetype** per title. Do not default to `hero-feature-grid`.

After picking, vary **section order**, **section count** (3–6 supporting blocks), and **image placement** so two titles in the same domain still look different.

Put the pick + one-sentence why in a comment at the top of the generated landing component.

---

## 1. `hero-feature-grid`

**Suits:** SaaS tools, apps, utilities, developer products, browser extensions.

**Spine:** Sticky or simple `nav` (links + `Button` CTA) → large hero (headline, subhead, primary `Button`, optional `Badge`) → 3–6 feature `Card`s (not always a 3-column grid — try 2+spotlight, staggered, or 1+2) → optional `Alert` proof/quote → closing CTA band → footer.

**Chrome:** `Button`, `Card`, `Badge`, `Tooltip` on feature names, optional `Modal` for “See how it works”.

**When not to use:** Pre-launch with nothing to show (`waitlist-coming-soon`); a person or studio (`story-alternating` / `portfolio-work-grid`); a conference (`event-timeline`).

**Variation knobs:** Features before or after a “how it works” Divider strip; screenshot `Card` on left vs. type-only hero; pricing teaser vs. none.

---

## 2. `story-alternating`

**Suits:** Personal brands, creatives, writers, coaches, memoir-ish products.

**Spine:** Quiet name-in-`nav` → full-width statement hero (little chrome) → alternating image/text rows (Pexels portraits or craft photos in `Card`, copy beside) → a pull-quote `Alert` → one CTA (`Button` or `Modal` contact) → footer.

**Chrome:** `Card`, `Divider` between chapters, `Button`, `Badge` for roles/tags, `Modal` for contact.

**When not to use:** Feature-comparison SaaS; ticketed events.

**Variation knobs:** Start with image, not headline; 2 vs. 4 chapters; contact as inline `Input`+`Textarea` vs. Modal.

---

## 3. `waitlist-coming-soon`

**Suits:** Pre-launch products, “coming soon” brands, unreleased tools, teasers.

**Spine:** Almost no nav → oversized headline → one sentence → `Input` (email) + `Button` → tiny `Checkbox` (updates consent) → optional 2–3 `Badge`s or a single `Alert` (“first 100 get X”) → footer with a date or “no spam”.

**Chrome:** `Input`, `Button`, `Checkbox`, `Badge`, `Alert`. Resist adding a feature grid.

**When not to use:** Shipping product with pricing or a portfolio of work.

**Variation knobs:** Split paper (left type / right doodle or photo); stacked center; waitlist inside a single large `Card`.

---

## 4. `event-timeline`

**Suits:** Conferences, workshops, courses, cohorts, launches with a date, festivals.

**Spine:** Event `Badge` (date/city) in hero → ticket `Button` → vertical timeline: each stop is a heading + copy beside a vertical `Divider` (explicit height on the column) → speakers or sessions as `Card`s → `Progress` for “seats claimed” optional → footer with venue.

**Chrome:** `Divider` (vertical), `Card`, `Badge`, `Button`, `Progress`, `Modal` for ticket/confirm.

**When not to use:** Evergreen SaaS with no date.

**Variation knobs:** Horizontal day tabs simulated with `Badge`+sections (not library Tabs unless asked); agenda before speakers; image of venue as full-bleed under a paper overlay.

---

## 5. `pricing-forward`

**Suits:** Products/services with paid plans, agencies with packages, memberships with tiers.

**Spine:** Short hero (problem + promise) → **pricing `Card`s first or second** (2–4 tiers; one `Badge` “most drawn”) → included/not via `Checkbox` display or simple lists inside cards → FAQ as stacked `Alert`s or `Divider`-separated list → CTA → footer.

**Chrome:** `Card` (tiers, `footer` for the `Button`), `Badge`, `Button`, `Radio`/`RadioGroup` for monthly vs. yearly, `Tooltip` on limits.

**When not to use:** Free community; waitlist; a gallery.

**Variation knobs:** 2 tiers vs. 4; toggle billing with `RadioGroup`; lead with a single “one price” Card then add-ons.

---

## 6. `manifesto-longform`

**Suits:** Causes, nonprofits, newsletters, essays, movements, independent media.

**Spine:** Big manifesto headline → short lede → long-form sections with pull quotes (`Alert` or `<blockquote>` next to a `Divider`) → optional petition/subscribe `Input`+`Button` → footer with a serious, specific CTA.

**Chrome:** `Alert` callouts, `Divider`, `Button`, `Input`, occasional `Badge` for issue tags. Few Cards.

**When not to use:** A feature matrix product; a designer’s work grid.

**Variation knobs:** Quote-first vs. story-first; donate Modal vs. inline; one Pexels documentary photo vs. none.

---

## 7. `portfolio-work-grid`

**Suits:** Agencies, freelancers, illustrators, photographers, studios, galleries.

**Spine:** Name + one-line position → `Badge`-tagged filter row (visual only, or `Checkbox`es) → grid of work `Card`s (image + title + tags) → selected piece `Modal` → contact CTA → footer.

**Chrome:** `Card`, `Badge`, `Modal`, `Button`, `Tooltip` on tools used.

**When not to use:** A SaaS feature page; a waitlist.

**Variation knobs:** 2-column editorial vs. dense 3-column; case study list instead of equal grid; about strip before or after work.

---

## 8. `product-showcase-split`

**Suits:** Physical products, food, fashion, hardware, merch, craft goods.

**Spine:** Split hero (large Pexels product photo in a sketch `Card` / opposite type + `Button`) → materials/details as a short list or `Badge`s → 2–4 supporting photos in a broken grid → optional `Progress` (“batch 03 of 40”) → buy/waitlist CTA → footer.

**Chrome:** `Card`, `Button`, `Badge`, `Modal` (size/notes), `RadioGroup` for variant, `Input` if made-to-order.

**When not to use:** Pure software with no artifact to photograph.

**Variation knobs:** Photo full-bleed behind paper-transparent type; carousel-like row of Cards (CSS overflow, not library Carousel unless asked).

---

## 9. `social-proof-wall`

**Suits:** Communities, bootcamps, memberships, “people already here” products, schools.

**Spine:** Hero with a specific number (`Badge` or `Progress`) → wall of short testimonial `Card`s (mixed sizes, not a 3-equal row) → who it’s for / not for (`Alert` warning vs. success) → join CTA (`Button` + optional `Input`) → footer.

**Chrome:** `Card`, `Badge`, `Alert`, `Button`, `Input`, `Progress`.

**When not to use:** Solo personal site with no community; a silent waitlist.

**Variation knobs:** Testimonials as a vertical strip vs. bento; logos as text `Badge`s; application Modal.

---

## 10. `directory-marketplace`

**Suits:** Local services, marketplaces, directories, “find a ___” products.

**Spine:** Search-forward hero (`Input` + `Button`, optional `RadioGroup` for category) → featured listings as `Card`s with `Badge` status → how it works (3 steps, not necessarily a grid) → trust `Alert` → list-your-thing CTA → footer.

**Chrome:** `Input`, `Button`, `Card`, `Badge`, `Radio`/`RadioGroup`, `Checkbox` filters, `Modal` listing detail.

**When not to use:** A single product; a manifesto.

**Variation knobs:** Map-like doodle instead of a real map; list view vs. card grid; filters in a side column vs. a top row.

---

## Classification cheat sheet

| Title smells like… | Start with |
| --- | --- |
| App, API, “for teams”, productivity | `hero-feature-grid` |
| Person’s name, “studio of”, coach | `story-alternating` or `portfolio-work-grid` |
| “soon”, “join the list”, unreleased | `waitlist-coming-soon` |
| Date, venue, “cohort”, “conference” | `event-timeline` |
| Plans, “pro”, “$”, packages | `pricing-forward` |
| “we believe”, nonprofit, newsletter | `manifesto-longform` |
| Work, gallery, case studies | `portfolio-work-grid` |
| Object you can photograph | `product-showcase-split` |
| Community, students, members | `social-proof-wall` |
| “find a”, “near you”, two-sided | `directory-marketplace` |

If two archetypes fit, pick the one that **changes the page structure**, then vary internals. Never “SaaS default” out of habit.

If the title is ambiguous, web-search it, then choose.
