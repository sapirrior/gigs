# Metadata Zone: Identifying Your Guide

Every `gig` file begins with a **Metadata Zone**, which provides essential information about your guide. This zone is located at the very top of the `.gg` file and is separated from the main content by a mandatory triple-dash (`---`).

## Structure

The Metadata Zone consists of key-value pairs, where each key starts with an `@` symbol, followed by a space, and then a double-quoted string value.

```gig
@name    "your-guide-name"
@section "section-number-or-letter"
@version "1.0.0"
@author  "Your Name/Organization"
@updated "YYYY-MM-DD"
---
# Content Zone Starts Here
```

## Required Keys

The `gig` engine mandates the presence of the following keys:

*   `@name`: The name of your guide (e.g., `"ls"`, `"gig"`). This is how users will typically look up your guide.
*   `@section`: The manual section your guide belongs to (e.g., `"1"` for user commands, `"7"` for miscellaneous). Refer to the `gig` engine's documentation for a full list of standard sections and their meaning.

## Supported Optional Keys

You can also include additional descriptive metadata:

*   `@version`: The version of your guide (e.g., `"1.0.0"`).
*   `@author`: The author(s) or organization responsible for the guide.
*   `@updated`: The date the guide was last updated, typically in `YYYY-MM-DD` format.

## Best Practices

*   **Consistency:** Use a consistent order for your metadata keys across all your `gig` files.
*   **Accuracy:** Ensure the `@name` and `@section` accurately reflect your guide, as they are crucial for the `gig` engine's search path strategy.
*   **Quoting:** Always enclose values in double quotes, even if they are numerical.