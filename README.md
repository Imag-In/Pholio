# Pholio

**Your photos, on your drives, under your control.**

Pholio is a desktop application to organise, browse and search large photo and video collections — tens of
thousands of files — wherever they live: your computer's own disk, USB drives, a NAS or any network share (choose one or a combination, according to your
performance expectation).

## Download

Installers for **macOS** (Apple Silicon and Intel), **Windows** and **Linux** are attached to each
[release](../../releases/latest).

The installers are not signed yet, so your system may warn you the first time you open Pholio:

- **macOS** — right-click the app, choose *Open*, then confirm.
- **Windows** — on the "Windows protected your PC" screen, click *More info*, then *Run anyway*.

## Main features

- **Libraries** — add the folders you want, on as many drives as you like; Pholio indexes them and keeps up
  with what changes. Several independent libraries can live side by side.
- **A fast timeline** — every photo and video in one smooth, date-ordered grid, grouped by day, that stays
  fluid on very large collections. Double-click for a full-screen view, browse with the arrow keys.
- **Everything about a photo** — capture date, camera and settings, file details, location on a map, and
  the complete list of the metadata stored in the file.
- **Fix what's wrong** — correct a capture date, set or change a location, rate a photo; location and rating
  can also be applied to a whole day's selection at once.
- **Places** — locations are turned into place names without any internet connection; an online place search
  can be added if you want more precise addresses.
- **People and pets** — faces and animals are detected and grouped on your own computer; give a person a
  name once and all their photos become searchable.
- **Search** — type a word, a place, a person, or combine filters such as a minimum rating or a folder (`beach r:4+`, `p:Alice path:Holidays`). The `?` next to
  the search bar explains everything.
- **Favourites**, light and dark themes, English and French.

## Your files stay yours

Pholio never touches the pictures themselves: no re-encoding, no resizing, no moving or renaming behind your
back. Its own index lives in a separate database.

When you do edit something — a date, a location, a rating, keywords or people — Pholio writes it into the
file using the standard metadata fields every serious photo application understands. That way your work is
not locked into Pholio: another cataloguing tool, today or in ten years, will read the same information.

## Why a desktop application

Pholio is deliberately **not** a cloud service.

Most photo apps today want your pictures uploaded to someone else's servers before you can organise them.
Pholio goes the other way: it works directly on the drives you already own — internal disk, external and USB
drives, NAS, network shares — indexes them properly, and lets you find anything in seconds, offline.

The goal is to take back control of your own photos first. Publishing a selection to the cloud later, when *you* decide to, is welcome — as an extra step, not
as the price of admission.

## A rewrite, with AI

Pholio is the rewrite of an older personal project. This new version was built with heavy help from AI
coding assistants: they wrote a large share of the code, under close direction and review. It is a real-world
experiment in what a single developer can build this way.

## Open source — but not here, yet

Pholio is open source. Its source code is nevertheless **not** published on GitHub, and that is a deliberate
choice.

Using AI to help write the code is one thing. Letting the code be used to train AI models is another, and it
should require the author's consent. GitHub's policy on how hosted repositories may be used for AI training is
not clear enough to give that assurance, so this repository only hosts the installers and the release notes.

The sources will soon be available on a self-hosted Gitea instance — a link will be added here.

## Release notes

Every release comes with its notes, also kept in [`release_note/`](release_note/).
