# Best Practices: Crafting Effective GIG Pages

Creating high-quality `gig` pages goes beyond just knowing the syntax. It involves structuring your content effectively, adopting a clear writing style, and consistently applying conventions that make your documentation intuitive and easy to use.

## Emulating Manual Page Structure

As previously discussed, `gig` pages are designed to emulate traditional Unix-style manual pages. Adopting a consistent structure will greatly enhance readability and user familiarity. Consider organizing your `gig` into the following common sections, using `# ` for major sections and `## ` for sub-sections:

*   **`# NAME`**: A single-line summary describing the guide's purpose.
    *   Example: `. gig(1) - interactive guide viewer`
*   **`# SYNOPSIS`**: A brief overview of the command syntax.
    *   Example: `$ gig [section] <name>`
    *   Example: `$ gig view <file.gg>`
*   **`# DESCRIPTION`**: A detailed explanation of what the command/tool does. Use `. ` for paragraphs.
*   **`# OPTIONS`**: Describe command-line options and their effects. Use `- ` for definitions.
    *   Example: `- --help : Display help message and exit.`
*   **`# EXAMPLES`**: Provide practical usage examples. Use `$ ` for shell commands.
*   **`# ENVIRONMENT`**: Document any relevant environment variables.
*   **`# FILES`**: List important files or directories.
*   **`# BUGS`**: Note known issues or where to report them.
*   **`# AUTHORS`**: Credit the authors of the guide.
*   **`# SEE ALSO`**: Cross-reference related `gig` pages using `{link(section)}` or other manual pages/documentation.

## Writing Style & Tone

*   **Be Concise and Direct:** Manual pages are not novels. Get straight to the point and use clear, unambiguous language.
*   **Use Active Voice:** Prefer "The command does X" over "X is done by the command."
*   **Consistent Terminology:** Use the same terms for the same concepts throughout your documentation.
*   **Target Audience:** Assume the reader is a technical user looking for specific information quickly.

## Visual Integrity

The `gig` engine automatically handles much of the visual formatting, but you can enhance it:

*   **Strategic Use of Headers:** Use `# ` and `## ` to create a clear hierarchy that guides the reader through the content.
*   **Inline Styling Judiciously:** Use `**bold**`, `` `commands` ``, and `<variables>` to highlight critical information, but avoid over-styling which can detract from readability.
*   **Whitespace:** While the `gig` engine handles much of the vertical rhythm, thoughtful use of blank lines (by ending a block and starting a new one without a continuation) can improve perceived spacing between distinct ideas.
*   **Review for Responsiveness:** Although `gig` is responsive, mentally (or actually) check how your content might look on both wide and narrow terminals. Ensure tables stack gracefully and long literal lines truncate clearly.