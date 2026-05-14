# gigs: The General Interactive Guide Collection

This repository is a curated collection of `.gg` files, which are General Interactive Guides designed to be rendered by the `gig` engine. It serves as a central registry for high-quality, terminal-friendly documentation.

## Viewing Guides

To view any of the guides in this collection, you need to have the `gig` engine installed on your system. Once installed, you can view a guide by specifying its section and name.

**Example:**
```bash
gig 7 example
```
(This assumes `example.gg` is located in `gigs/7/` and the `gig` engine can find it.)

## Structure

Guides are organized by standard manual sections, following the convention `gigs/<section>/<name>.gg`.
For instance, `gigs/1/ls.gg` would be the `ls` command in section 1.

## Writing Guides

For comprehensive information on how to author your own `.gg` files, including syntax, metadata, block types, and best practices, please refer to our dedicated documentation:
*   [How to Write GIGs](./docs/introduction.md)

## Contributing

We welcome contributions of new `gig` pages or improvements to existing ones!
Please see our contribution guidelines for details:
*   [CONTRIBUTING.md](./CONTRIBUTING.md)