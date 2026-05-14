# Inline Styling: Adding Emphasis and Clarity

The `gig` engine automatically detects specific patterns within your text and applies semantic highlighting.

## Automatic Semantic Highlighting

| Pattern | Style | Purpose & Example |
| :--- | :--- | :--- |
| `**text**` | **Bold** | Strong emphasis. Example: `**Warning:** Do not delete.` |
| `` `command` `` | Sage Green | Binaries or code snippets. Example: Run the `` `gig` `` tool. |
| `<var>` | Terracotta | Required arguments. Example: `gig <name>` |
| `[opt]` | Grey | Optional flags. Example: `ls [options]` |
| `{link(section)}` | Slate Blue | Cross-references. Example: See `{pager(7)}`. |
| `"str"` | Terracotta | Quoted strings or literals. Example: `@name "test"` |
| `--flag`, `-f` | Sage Green | Hyphenated flags. Example: Use `--help` or `-v`. |

## Best Practices

- **Be Semantic** : Choose styling based on *meaning* (e.g., use `` `command` `` for commands, not just for color).
- **Avoid Noise** : Use highlighting judiciously to maintain readability.
- **Maintain Consistency** : Apply the same styling conventions across all your `gig` pages.