# 🚀 Pholio 2026.10.14

_2026-10-25 · 81 changes since v2026.10.13_

## ✨ Features

### 🏷️ album

- list a photo's albums with their cover and count in the info panel
- choose an album's cover from the gallery
- search an album from the album menus past their limit
- add an album button to the selection bar and track recently used albums
- add the albums view
- list a photo's static albums in the info panel

### 🏷️ devices

- show the GPS time and time zone shares as coloured pills
- deduce places and time zones from the photos around
- find where a device's clock difference changed
- estimate a clock difference from the same scenes
- estimate a device's clock difference automatically
- preview a clock correction on a merged timeline
- correct a device's clock from two photos
- identify cameras by body serial and GPS time

### 🏷️ gallery

- disable the edits of a file whose folder is offline
- rotate a photo left or right from its info panel

### 🏷️ health

- add a tags category with similar and single-photo tag checks

### 🏷️ mcp

- show example prompts in a tour of the MCP preferences
- let the assistant change photos once the user applies the preview
- show the assistant a thumbnail of a photo
- describe the library and one photo to the assistant
- help connect ChatGPT through Codex and Gemini CLI
- move to the next free port when the configured one is taken
- explain how to connect Claude Code and Claude Desktop
- let an assistant search the library and show the result in Pholio
- turn the MCP server on and off without restarting Pholio
- embed an MCP server in a child context, off by default

### 🏷️ onboarding

- show at most three guided tours a day on their own
- list every guided tour in the preferences and replay one from its section

### 🏷️ people

- rename or merge a person from a single name field

### 🏷️ search

- find photos, RAW files or videos with is:photo, is:raw, is:video
- suggest the photos' years, months and days after date:
- suggest the library's folders after path:
- suggest the persons' names after p:
- find an album by its name with album:, its names suggested
- complete the suggestion on right arrow or tab, commit only on enter

### 🏷️ settings

- open help and web pages from a link on the preference's label
- show each assistant's configuration as text to copy
- run preference actions from a green play button
- show values to copy as text with a copy button

### 🏷️ sidebar

- list only the library roots used last, browse every folder in an overlay

### 🏷️ tags

- read, show and write Lightroom's hierarchical keywords
- find and reconcile keywords differing between file and sidecar
- turn star tags into ratings and correct their disagreements
- list similar tags to merge and tags on a single photo
- rename, merge and delete a tag on every photo
- complete the tag being typed and show what Enter adds
- hide the info panel's tag field behind a pencil once a photo has tags

### 🏷️ ui

- open a photo's preview from the file column of every table
- remember the table filters
- let the user sort, filter and align every table, with a remembered layout
- show the tools as boxes instead of a sidebar submenu

## 🐛 Bug fixes

### 🏷️ album

- list a newly created album in the sidebar past its limit
- sort album names ignoring accents

### 🏷️ devices

- zoom the clock timeline smoothly and add zoom buttons
- open the gallery when showing a device's photos

### 🏷️ gallery

- show a transposed or transversed photo the right way up

### 🏷️ search

- show the search bar icons' own tooltips instead of the field's

### 🏷️ settings

- open the preferences when a setting is gated by a Pro feature

### 🏷️ table

- name the library folder first in a file column

### 🏷️ tags

- show the hover of the cleanup's action buttons
- sort the known tags without mutating an immutable list

### 🏷️ test

- initialise the JavaFX CSS classes on the FX thread at toolkit startup

### 🏷️ ui

- show a hand over every clickable control and round the import icons

## ⚡ Performance

### 🏷️ test

- run test classes in parallel forks and leave volume tests to the release

## ♻️ Refactoring

### 🏷️ preview

- let a caller wait for the user's choice in a batch preview

### 🏷️ search

- extract the gallery search into a service outside the interface
- rename the album search prefix to aid:

### 🏷️ sidebar

- move the health check to the sidebar and the change history into tools

### 🏷️ ui

- extract the person name completion into a reusable CompletionField

## 📝 Documentation

### 🏷️ agents

- say where to read the issues the user mentions

### 🏷️ mcp

- add example prompts for the assistant
- explain how the assistant changes photos

### 🏷️ plans

- add the implementation plans of recent work

### 🏷️ general

- send bug reports and ideas to the GitHub issue forms
- point issue references to the Gitea roadmap repository

## 💄 Style

### 🏷️ tags

- edit the info panel's tag in place, as a person's name

## ✅ Tests

### 🏷️ ui

- check the search field's focus owner, not the window's focus

## 🔧 Chores

### 🏷️ tools

- add one-way sync of GitHub user issues into the Gitea roadmap

### 🏷️ general

- keep the Gitea migration plan out of the repository

## 🔹 other

### 🏷️ build

- update surefire config
