# Block Types: Structuring Your Content

The core of a `gig` page's content is built using **Block Types**, which are defined by a "first-character trigger" at the beginning of each line. These triggers tell the `gig` engine how to semantically interpret and visually render your content.

## The Continuation Rule

For multi-line blocks (like paragraphs or bullet points that wrap), subsequent lines should start with at least one space. This signals to the engine that the line is a continuation of the previous block, preventing it from being interpreted as a new block type.

```gig
. This is a very long paragraph that spans multiple
  lines in the source file, but the `gig` engine
  will treat it as a single body of text.
```

## Available Block Triggers

| Trigger | Semantic Meaning | Usage Example | Rendering Notes |
| :--- | :--- | :--- | :--- |
| `# ` | **Header** | `# NAME` | Primary section title (e.g., NAME, SYNOPSIS). Renders in a bold cream color with 0 indentation and adds vertical spacing. Use for major sections of a manual page. |
| `## ` | **Subheader** | `## DESCRIPTION` | Secondary section title (e.g., OPTIONS, EXAMPLES). Renders in a bold sand color with partial indentation and vertical spacing. Use for sub-sections within a major section. |
| `. ` | **Body Text** | `. This is a standard paragraph of text.` | General prose. Renders with a 10% proportional indent and automatically wraps to fit the terminal width. Ideal for descriptions and explanations. |
| `! ` | **Literal** | `! #include <stdio.h>` | Unformatted, technical text (code snippets, raw data). Renders in sage green with a 15% proportional indent. **Does not wrap** and will be truncated with an ellipsis if it exceeds terminal width. |
| `* ` | **Bullet** | `* Item one in a list.` | Standard list item. Renders with a grey bullet point and a 15% proportional indent. Supports wrapping for long list items. |
| `- ` | **Definition** | `- Term : Description of the term.` | Used for term-description pairs. The `Term` part is bold, and the `Description` wraps with a 15% proportional indent. The first colon `:` separates the term from its description. |
| `| ` | **Table Row** | `| Header A | Header B` | Used to construct tables. All lines starting with `| ` directly below each other form a table. The first line forms the header. Detailed in `tables.md`. |
| `$ ` | **Shell Command** | `$ ls -la /usr/local/bin` | Example shell command. Renders in sage green with a 15% proportional indent. Useful for demonstrating command-line usage. |
| `> ` | **Quote/Note** | `> This is an important note or a quotation.` | Highlighted text, often for tips, warnings, or quotes. Renders in olive green, italicized, with a 15% proportional indent. |
| ` ` | **Continuation** | `(start with space)` | Appends to the previous block. See "The Continuation Rule" above. |