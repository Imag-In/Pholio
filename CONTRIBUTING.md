# Contributing to Pholio

Thank you for your interest in Pholio. Bug reports, ideas and code contributions are welcome.

## Licence in short

Pholio is **source-available, not open source**. The code is public so that you can read it, but its use is
controlled by the [PolyForm Strict License 1.0.0](LICENSE.txt) and the
[additional permissions](ADDITIONAL-PERMISSIONS.md):

- you may use Pholio as is, for noncommercial purposes only (commercial use, including internal use in a
  company, needs a separate licence from the licensor);
- you may not modify or redistribute it, except to prepare a contribution as described below;
- you may not use the code to train, fine-tune or evaluate machine-learning models without the licensor's
  prior written consent.

## Reporting bugs and ideas

Open an issue on [Imag-In/Pholio](https://github.com/Imag-In/Pholio/issues). For a bug, give the Pholio
version, your operating system, what you did, what you expected and what happened.

## Contributing code

Forks and pull requests are welcome on the reference repository,
https://git.pholio.freeddns.org/Imag-In/pholio (a Gitea instance).

1. **Fork on Gitea** and work in your fork. Forks anywhere else, and any redistribution of the code, are not
   allowed.
2. **Open a pull request** from your fork to `main`. For a large change, opening an issue first to discuss it
   saves everyone time.

That is all: there is nothing to sign or send.

### What happens to your contribution

By opening a pull request, you accept the [Contributor License Agreement](CLA.md) for the code you submit; the
pull request template has a box to tick to say so. In short:

- you keep the copyright of your work, and can still use it as you like;
- you give the licensor a permanent, irrevocable licence to use, modify and distribute it as part of Pholio,
  including under any other licence, commercial ones included;
- you confirm that the code is yours to give — if part of it is not your own work (another project, code
  written for your employer), open an issue to tell us before submitting it.

If you would rather not accept these terms, please do not open a pull request; issues and ideas are still
very welcome.

### Conventions

- Java 27, Maven only (`./mvnw verify` must pass).
- Every source file starts with `SPDX-License-Identifier: LicenseRef-PolyForm-Strict-1.0.0` in a comment.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/), for example
  `fix(gallery): keep the selection after a refresh`; only these subjects reach the release notes.
- Interfaces start with `I`, enums with `E`; unit tests use AssertJ with `SoftAssertions`.
- See [`AGENTS.md`](https://git.pholio.freeddns.org/Imag-In/pholio/src/branch/main/AGENTS.md) for the full code and UI guidelines.
