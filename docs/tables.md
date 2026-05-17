# Tables: Organizing Tabular Data

`gig` provides responsive tables that handle alignment, cell wrapping, and narrow terminal adaptation automatically.

## Structure

Tables start with the `| ` trigger. The first line is always the header row. Columns are separated by `|`.

```gig
| Header 1 | Header 2
| Value A1 | Value B1
| Value A2 | A long value that wraps automatically
```

## Rendering Features

- **Auto-Header** : The first row is styled with a distinct background and is automatically horizontally centered.
- **Left-Aligned Data** : Cell data in subsequent rows remains left-aligned for maximum readability.
- **Responsive Wrapping** : Cell content wraps automatically to fit column widths.
- **Dynamic Sizing** : Column widths are calculated based on content.
- **Narrow Adaptation** : On narrow terminals, tables stack into a vertical definition format.

## Best Practices

- **Keep it Simple** : Use tables for structured, comparable data.
- **Clear Headers** : Use concise labels.
- **No Manual Alignment** : Do not add extra spaces for alignment; the engine handles this.