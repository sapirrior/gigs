# gigs: The General Interactive Guide Collection

This repository is a curated collection of `.gg` files, which are General Interactive Guides designed to be rendered by the `gig` engine. It serves as a central registry for high-quality, terminal-friendly documentation.

## Viewing Guides

To view any of the guides in this collection, you need to have the `gig` engine installed on your system. Once installed, you can view a guide by specifying its section and name.

**Example:**
```bash
gig 7 example
```
(This assumes `example.gg` is located in `gigs/7/` and the `gig` engine can find it.)

## Installation (Automated)

To easily install the `gigs` collection on your system, you can use the `install.sh` script directly from the GitHub repository. This script will download the latest release, extract the `gigs` pages, and place them in the appropriate system directory (e.g., `/usr/share/gig`).

**Warning:** Piping scripts directly from the internet into your shell (`sh`) can be a security risk. Always review the script's content before execution if you have any concerns.

**One-liner command:**
```bash
curl -sSL https://raw.githubusercontent.com/sapirrior/gigs/v0.2.0/install.sh | sudo sh
```
This command will:
1.  Download the `install.sh` script from the `v0.2.0` release.
2.  Execute it with `sudo` privileges to install the `gigs` collection to `/usr/share/gig`.
3.  The script will prompt you for confirmation at each major step.


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