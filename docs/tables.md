# Tables: Organizing Tabular Data

`gig` provides a simple yet powerful way to create responsive tables within your documentation. The engine automatically handles column alignment, cell wrapping, and even adapts the layout for narrow terminals.

## Structure

Tables are formed by a contiguous block of lines, each starting with the `| ` (pipe followed by a space) trigger. The very first `| ` line in a table block is automatically treated as the header row.

Columns are separated by the `|` character.

```gig
| Header 1 | Header 2 | Header 3
| Value A1 | Value B1 | Value C1
| Value A2 | A very long value that will wrap automatically | Value C2
```

## How Tables Render

*   **Auto-Header:** The first row will be styled with a distinct background (Warm Cream) to differentiate it as the header.
*   **Responsive Wrapping:** Content within each cell will automatically wrap to multiple lines if it exceeds the calculated column width. The `gig` engine is smart about distributing space and maintaining readability.
*   **Unicode Grid:** Tables are rendered using Unicode box-drawing characters for clean borders, ensuring a professional appearance across various terminals.
*   **Dynamic Column Sizing:** You do not need to manually align columns in your source `.gg` file. The `gig` engine calculates optimal column widths based on the content to maximize readability.
*   **Narrow Terminal Adaptation:** For very narrow terminals, `gig` intelligently adapts by stacking multi-column tables into a more readable vertical bulleted definition format, preserving information even in constrained environments.

## Best Practices for Tables

*   **Keep it Simple:** Tables are best for presenting structured, comparable data. Avoid overly complex information that might be better suited for prose.
*   **Clear Headers:** Use concise and descriptive headers to clearly label each column's content.
*   **No Manual Alignment:** Resist the urge to manually add spaces to align your columns in the source file; the engine will handle this for you and your manual efforts will be ignored.
*   **Continuation Rule (Not Applicable):** Unlike other block types, the continuation rule (starting a line with a space) does not apply *within* a table cell. If you need multi-line content within a single cell, the engine's automatic wrapping will handle it. A new `| ` line always signifies a new table row.