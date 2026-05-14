# Metadata Zone: Identifying Your Guide

Every `.gg` file begins with a **Metadata Zone**, separated from the content by a triple-dash (`---`).

## Structure

Metadata consists of key-value pairs. Keys start with `@` and values are double-quoted strings.

```gig
@name    "guide-name"
@section "1"
@version "1.0.0"
@author  "Name"
@updated "2026-05-14"
---
# Content starts here
```

## Required Keys

- `@name` : The lookup name of your guide (e.g., `"ls"`, `"gig"`).
- `@section` : The manual section (e.g., `"1"` for user commands, `"7"` for miscellaneous).

## Optional Keys

- `@version` : Current version of the guide.
- `@author` : The author or organization responsible.
- `@updated` : Last update date in `YYYY-MM-DD` format.

## Best Practices

- **Consistency** : Use the same key order across all guides.
- **Accuracy** : Ensure `@name` and `@section` match the file's intended lookup path.
- **Quoting** : Always enclose values in double quotes.