# gigs: The General Interactive Guide Collection

A curated registry of high-quality, terminal-friendly documentation (`.gg` files) designed for the `gig` engine.

## Viewing Guides

To view any guide in this collection, ensure the `gig` engine is installed. Search for guides by section and name.

**Examples:**
```bash
gig ls          # View the 'ls' guide from the default search path
gig 1 grep      # View 'grep' specifically from section 1
gig view doc.gg # Render a local guide file
```

## Installation & Sync

You can install and synchronize the full `gigs` collection directly through the `gig` engine using the built-in `sync` command. This ensures your local guide library is up-to-date with the latest versions.

```bash
gig sync
```

This command performs an atomic update, downloading the latest guides and placing them in the appropriate system directory (`/usr/share/gig/` or the Termux equivalent).

## Structure

Guides are organized by standard Unix manual sections: `gigs/<section>/<name>.gg`.

- **Section 1:** User Commands (`ls`, `grep`, `tar`, etc.)
- **Section 7:** Miscellaneous (`example`, overview)
- **Section n/l:** New and Local drafts

## Writing Guides

Interested in authoring your own `.gg` files? Check out our comprehensive syntax and style documentation:
- [Introduction to GIGs](./docs/introduction.md)
- [Best Practices](./docs/best_practices.md)
- [Metadata & Formatting](./docs/metadata.md)

## Contributing

We welcome new guides and improvements! Please follow our [CONTRIBUTING.md](./CONTRIBUTING.md) guidelines.