# Best Practices: Crafting Effective GIG Pages

Creating high-quality `gig` pages involves clear structure, concise writing, and absolute technical fidelity.

## The Manual Page Standard

Every `gig` page must be treated as a professional reference manual. 

### Informative Completeness
- **Manual-Grade Depth**: The information provided must be complete. A user should be able to rely on a GIG as their primary technical reference for a tool or topic.
- **Fundamental Pillars**: Every GIG must include the `NAME`, `SYNOPSIS`, and `DESCRIPTION` sections. These are non-negotiable for structural consistency.
- **Bounded Freedom**: Contributors are free to expand a GIG with new headers (e.g., `EXAMPLES`, `NOTES`, `TIPS`) or modern context. However, you must ensure that your additions do not make the page "fully different" in approach or structure from the rest of the collection.

## Emulating Manual Page Structure

Maintain consistency by organizing your `gig` pages into these standard sections. Use `# ` for major sections and `## ` for sub-sections.

- **`# NAME`** : A single-line summary of the guide's purpose.
  Example: `. gig(1) - interactive guide viewer`

- **`# SYNOPSIS`** : A brief overview of command syntax or usage.
  Example: `$ gig [section] <name>`

- **`# DESCRIPTION`** : A detailed explanation of the tool or topic. Use `. ` for paragraphs.

- **`# OPTIONS`** or **`# COMMANDS`** : Describe flags, parameters, or subcommands. Use `- ` for definitions.

- **`# EXAMPLES`** : Provide practical usage scenarios. Use `$ ` for shell commands.

- **`# FILES`** : List important files or default directories.
  Example:
  - Termux: `/data/data/com.termux/files/usr/share/gig`
  - Linux: `/usr/share/gig`

- **`# SEE ALSO`** : Cross-reference related manual pages or `gig` guides.
  Example: `. man(1), info(1)`

## Writing Style & Tone

- **Concise and Direct** : Avoid filler. Get straight to the technical details.
- **Active Voice** : Use "The command does X" instead of "X is done by the command."
- **Targeted** : Assume a technical audience looking for quick, accurate information.

## Visual Integrity

- **Hierarchy** : Use `# ` and `## ` to create a clear logical flow.
- **Selective Styling** : Use `**bold**`, `` `commands` ``, and `<variables>` to highlight critical info, but avoid visual noise.
- **Whitespace** : Use blank lines between distinct blocks to improve readability and vertical rhythm.
- **Responsiveness** : Ensure tables and long lines stack or truncate gracefully on narrow terminals.