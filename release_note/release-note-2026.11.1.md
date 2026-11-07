# 🚀 Pholio 2026.11.1

_2026-11-07 · 66 changes since v2026.11.0_

## ✨ Features

### 🏷️ devices

- make clock correction a pro feature

### 🏷️ gallery

- name a face with a click, open its person with a double click
- analyse the faces of a photo again from the info panel
- assign a face to a person from the info panel
- show each person's own face, larger, in the info panel
- check every photo shown with one icon or Cmd+A

### 🏷️ imports

- find a device's clock difference on import
- correct a device's clock on import
- add keywords and a place to every photo imported
- resume an interrupted import

### 🏷️ licensing

- make the apple photos import free
- use a switch for usage statistics and larger text in the first-start window
- welcome the first start with a wizard

### 🏷️ naming

- offer the default pattern once the field has the focus

### 🏷️ people

- focus merge in the merge confirmation
- mark a person as an animal, or back as a person

### 🏷️ recognition

- let the user choose the animal detection model
- detect animals with YOLOX-S and their own confidence floor

### 🏷️ reorganize

- say in the folder pattern's field what switching it off means
- refine the reorganize tool's form
- add the reorganize folders tool
- move files and keep the library in step, undoable
- plan folder reorganizations from the library

### 🏷️ search

- search a range of dates with date:2024..2025
- find the photos with an animal, by species

### 🏷️ ui

- hide the task monitor while no task runs
- complete with the first of several suggestions

## 🐛 Bug fixes

### 🏷️ gallery

- show a thumbnail missing from the cache as an error
- browse the photos with the arrows from the info panel
- refresh the info panel once the photo analysed again has its faces grouped
- come back to the photo selected on back from another view
- keep I and arrows typed in an info panel field

### 🏷️ i18n

- keep apostrophes in plural messages with a number

### 🏷️ library

- leave a folder alone in a sync while its first load records its files

### 🏷️ licensing

- show the licence text again

### 🏷️ mcp

- stop the server without waiting for open client streams

### 🏷️ naming

- follow the scene's focus owner to offer the default pattern

### 🏷️ people

- keep the faces of group photos by default

### 🏷️ persistence

- reopen an H2 database once migrated

### 🏷️ settings

- step the recognition spinners by 0.01

### 🏷️ status

- open the task list from a click on the progress bar

### 🏷️ task

- cancel a task without interrupting its thread

### 🏷️ tools

- wrap a long tool name in its box

### 🏷️ ui

- drop a library folder's row as soon as its removal is asked
- stop tile grids flickering on a click in another row

## ⚡ Performance

### 🏷️ library

- show the first photos of a folder load sooner
- read each photo once for its hash and its thumbnail

### 🏷️ media

- hash files a chunk at a time

### 🏷️ recognition

- give thumbnails the cpu pool before background analysis

### 🏷️ thumbnails

- ship libjpeg-turbo for macos too
- decode thumbnails with libjpeg-turbo on windows and linux
- decode thumbnails with macos imageio at the size asked for
- draw and write thumbnails as 3-byte BGR images

## ♻️ Refactoring

### 🏷️ licensing

- extract the evaluation request from the startup task

### 🏷️ thumbnails

- decode photos for thumbnails behind an interface

## 📝 Documentation

### 🏷️ imports

- plan import batch corrections

### 🏷️ site

- add the mcp screenshot
- add the phone import screenshot
- retake the screenshots on the 100k library
- add the phone import and list apple photos as free
- describe albums, health check, tools and the shipped pro features
- update the performance figures after the single read
- add the performance figures

### 🏷️ general

- update plans.

## ✅ Tests

### 🏷️ thumbnails

- compare the thumbnail decoders of the machine on a real folder

## 🔧 Chores

### 🏷️ tools

- add a script running Pholio in a directory of its own
