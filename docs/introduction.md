# How to Write General Interactive Guides (GIGs)

Welcome to the `gigs` project! This documentation aims to guide you through the process of creating `.gg` files – the General Interactive Guides that are rendered by the `gig` engine. Unlike traditional static documentation, `gig` files offer a rich, interactive, and beautifully formatted experience directly within your terminal.

## Emulating Manual Pages

It's important to understand that when writing `gig` pages, you are not introducing new rules or paradigms. Instead, the goal is to leverage the `gig` engine's powerful syntax to create documentation that closely emulates the familiar structure and style of traditional Unix manual pages. Think of it as a modern, interactive take on `man` pages.

Your `gig` pages should strive for:
*   **Clear Sections:** Organize your content into logical, well-defined sections, similar to `NAME`, `SYNOPSIS`, `DESCRIPTION`, `OPTIONS`, `EXAMPLES`, and `SEE ALSO` found in manual pages.
*   **Concise Language:** Get straight to the point. Manual pages are known for their brevity and precision.
*   **Structured Information:** Use the available block types and inline styling to present information in a hierarchical and easily digestible manner.
*   **Consistency:** Maintain a consistent style and structure across all your `gig` pages for a cohesive user experience.

The following sections will detail the specific syntax elements and best practices to help you craft effective and well-structured `gig` documentation.