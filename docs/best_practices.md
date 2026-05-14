# Best Practices: Crafting Effective GIG Pages

Creating high-quality `gig` pages involves clear structure, concise writing, and consistent application of Unix documentation conventions.

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