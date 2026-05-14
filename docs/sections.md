# Guide Sections: Categorizing Your GIG Pages

# Guide Sections: Categorizing Your GIG Pages

Guides are organized into numbered and lettered **sections** to aid categorization and search.

## Section Categories

| Section | Category | Description |
| :--- | :--- | :--- |
| `1` | **User Commands** | Shell tools and executables (e.g., `ls`, `gig`). |
| `2` | **System Calls** | Kernel-provided functions. |
| `3` | **Library Functions** | Library-based functions (e.g., C standard library). |
| `4` | **Special Files** | Device files (e.g., `/dev`). |
| `5` | **File Formats** | Format specs (e.g., `.gg`, `passwd`). |
| `6` | **Games** | Games and interactive demos. |
| `7` | **Miscellaneous** | Overviews, standards, and specifications. |
| `8` | **System Admin** | Root or administration commands. |
| `9` | **Kernel Routines** | Non-standard kernel internal functions. |
| `n` | **New / Pending** | Drafts or recently added documentation. |
| `l` | **Local** | Project-specific or local guides. |

## Tiered Search Order

If a section is not specified (e.g., `gig ls`), the engine searches in this order:

`1` → `n` → `l` → `8` → `3` → `2` → `5` → `4` → `9` → `6` → `7`

## Best Practices

- **Choose Appropriately** : Assign the section that best fits the content type.
- **Consistency** : Use standard sections to maintain user familiarity.