# Guide Sections: Categorizing Your GIG Pages

In the `gig` ecosystem, guides are organized into numbered and lettered **sections**, following a convention similar to traditional Unix manual pages. Assigning your `.gg` file to an appropriate section helps in its categorization and influences how the `gig` engine locates guides when a specific section isn't provided.

## Section Categories

The `gig` engine supports the following standard manual page sections:

| Section | Category | Description |
| :--- | :--- | :--- |
| `1` | **User Commands** | Executable programs or shell commands (e.g., `ls`, `gig`). |
| `2` | **System Calls** | Functions provided by the kernel. |
| `3` | **Library Functions** | Functions within system libraries (e.g., C standard library functions). |
| `4` | **Special Files** | Device files, usually found in `/dev`. |
| `5` | **File Formats** | File formats and conventions (e.g., `.gg` specs, `passwd` file format). |
| `6` | **Games** | Games and demonstrations. |
| `7` | **Miscellaneous** | Overviews, specifications, and macro packages (e.g., `ascii`, `gig` overview). |
| `8` | **System Administration** | Commands for root or system administrators. |
| `9` | **Kernel Routines** | Non-standard kernel internal functions. |
| `n` | **New / Pending** | Newly drafted or pending guides that haven't been officially categorized. |
| `l` | **Local** | Project-specific or local documentation that is not part of the standard system. |

## Assigning a Section to Your Guide

You assign a section to your `gig` page using the `@section` metadata key in the Metadata Zone of your `.gg` file.

```gig
@name    "my-command"
@section "1"  # Assigning to User Commands section
---
# Content starts here
```

## Tiered Search Order

When a user requests a `gig` guide without specifying a section (e.g., `gig ls`), the `gig` engine performs a **tiered search** across these sections to find the best match. The search prioritizes certain sections over others to provide the most relevant result.

The default tiered search order is:

`1` → `n` → `l` → `8` → `3` → `2` → `5` → `4` → `9` → `6` → `7`

This means that if a guide named "foo" exists in both section `1` and section `7`, `gig` will display the one from section `1` because `1` has a higher priority in the search order.

## Best Practices

*   **Choose Appropriately:** Select the section that most accurately reflects the content and purpose of your `gig` page.
*   **Be Specific:** If your `gig` page could fit into multiple sections, consider the primary context or audience.
*   **Consistency:** Maintain consistency in section assignments across related guides within your project.