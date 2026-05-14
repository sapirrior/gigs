# Inline Styling: Adding Emphasis and Clarity

Beyond block-level triggers, the `gig` engine automatically "senses" specific patterns within your text and applies semantic highlighting. This allows you to add emphasis, clarify technical terms, and improve readability without needing explicit escape sequences or complex markup.

## Automatic Semantic Highlighting

The engine recognizes the following patterns and styles them accordingly:

| Pattern | Style | Purpose & Example |
| :--- | :--- | :--- |
| `**text**` | **Bold** | Used for strong emphasis or highlighting keywords. <br> Example: `**Important Note:** This is crucial.` |
| `` `command` `` | Sage Green | Identifies command names, binaries, or short code snippets. <br> Example: To list files, use the `` `ls` `` command. |
| `<var>` | Terracotta | Denotes placeholders, required arguments, or variables that users need to replace. <br> Example: `gig <guide_name>` will display the guide. |
| `[opt]` | Grey | Indicates optional flags or parameters for commands. <br> Example: `ls [options] [file...]` |
| `{link(section)}` | Slate Blue (Underlined) | Creates a cross-reference to another `gig` page. The `gig` engine will automatically resolve these links. <br> Example: See `{pager(7)}` for more details. |
| `"str"` | Terracotta | Highlights double-quoted strings, often representing specific values or literals. <br> Example: Set the `@name` to `"my-awesome-guide"`. |
| `--flag` | Sage Green | Automatically detects and styles hyphenated command-line flags. <br> Example: Use the `--help` flag for usage information. |
| `-f` | Sage Green | Also detects single-hyphen flags. <br> Example: The `-v` flag shows version. |

## Best Practices for Inline Styling

*   **Be Semantic:** Use the styling that best fits the *meaning* of the text, not just its visual appearance. For example, use `` `command` `` for commands, not just any text you want to be green.
*   **Avoid Overuse:** While powerful, excessive inline styling can make your document visually noisy and harder to read. Use it judiciously to highlight key information.
*   **Consistency:** Maintain a consistent approach to styling within your `gig` pages to ensure clarity for your readers.