# Contributing to gigs

We warmly welcome contributions to the `gigs` project! Your contributions help grow this collection of high-quality, interactive terminal guides.

## What to Contribute

We are primarily looking for contributions of new `.gg` files or improvements/fixes to existing ones.

## How to Write Your Guide

All `.gg` files must adhere to the `gig` syntax and best practices. Please refer to our comprehensive documentation for detailed guidance:

*   **Introduction to GIGs:** [./docs/introduction.md](./docs/introduction.md)
*   **Guide Sections:** [./docs/sections.md](./docs/sections.md) (Essential for choosing the correct `gigs/<section>/` directory)
*   **Best Practices:** [./docs/best_practices.md](./docs/best_practices.md)
*   **Syntax Details:**
    *   [Metadata Zone](./docs/metadata.md)
    *   [Block Types](./docs/block_types.md)
    *   [Inline Styling](./docs/inline_styling.md)
    *   [Tables](./docs/tables.md)

## Submission Process

We follow a standard GitHub Pull Request (PR) workflow:

1.  **Fork** this repository.
2.  **Clone** your fork locally.
3.  **Create a new branch** for your feature or fix (e.g., `feat/add-new-command-gig`, `fix/fix-typo-in-example`).
4.  **Add or modify** your `.gg` files in the appropriate `gigs/<section>/` directory.
5.  **Test Locally:** Ensure your `gig` pages render correctly using the `gig` engine (e.g., `gig 7 mynewguide`).
6.  **Commit your changes** using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) (e.g., `docs(gigs/1): add new-command.gg`).
7.  **Push** your branch to your fork.
8.  **Open a Pull Request** against the `main` branch of this repository.

## Code of Conduct

Please review our [Code of Conduct](CODE_OF_CONDUCT.md) (not yet implemented, will be linked here when available).

## Questions?

If you have any questions or need clarification, please open an issue in the issue tracker.