# Block Types: Structuring Your Content

`gig` pages are built using **Block Types**, identified by a "first-character trigger" at the start of each line.

## The Continuation Rule

For multi-line blocks (paragraphs, lists), subsequent lines must start with at least one space to signal they are a continuation of the previous block.

```gig
. This paragraph spans multiple lines in the source,
  but the `gig` engine renders it as a single,
  automatically wrapped body of text.
```

## Available Block Triggers

| Trigger | Semantic Meaning | Usage Example | Notes |
| :--- | :--- | :--- | :--- |
| `# ` | **Header** | `# NAME` | Primary section title. Bold cream, 0% indent. |
| `## ` | **Subheader** | `## DESCRIPTION` | Secondary title. Bold sand, partial indent. |
| `. ` | **Body Text** | `. This is prose.` | General text. 10% indent, auto-wraps. |
| ! | **Literal** | `! code snippet` | Technical text. Sage green, 15% indent, **no wrap**, smart truncation (...). |
| `* ` | **Bullet** | `* Item one` | List item. Grey bullet, 15% indent. |
| `- ` | **Definition** | `- Term : Description` | Term-description pair. Bold term, 15% indent. |
| `| ` | **Table Row** | `| Header | Data` | Table construction. First row is the header. |
| `$ ` | **Shell Command** | `$ ls -la` | Shell example. Sage green, 15% indent. |
| `> ` | **Quote/Note** | `> Important note` | Callout. Olive green, italicized, 15% indent. |
| ` ` | **Continuation** | `(leading space)` | Appends line to the current block. |