# 🚀 Pholio 2026.10.1

_2026-10-04 · 31 changes since v2026.9.0_

## ✨ Features

### 🏷️ credits

- render the credits from a single markdown file

### 🏷️ gallery

- confirm selection bar changes with the number of files
- copy metadata from a photo and paste it onto a selection
- close the info panel when files are picked for a group action

### 🏷️ import

- add the import screen for devices and other folders
- copy import groups safely into the library and index them as a batch
- analyse import sources for eligible, linked and duplicate files
- add the naming pattern language for imported folders and files

### 🏷️ imports

- add an imports view for folder imports and external changes

### 🏷️ library

- watch library folders for external changes

### 🏷️ metadata

- let edits go to an xmp sidecar instead of the photo file

### 🏷️ tools

- add a Wikimedia Commons demo library downloader

### 🏷️ ui

- show a splash screen while the desktop interface starts

## 🐛 Bug fixes

### 🏷️ gallery

- share one card menu, close it on click and show its shortcut
- thicken and soften the navigation selection frame

### 🏷️ people

- reload the view when the library changes

### 🏷️ ui

- move the search help icon to the right of the search bar
- stop sharing a remembered size between generic dialogs
- shrink the header logo and load a sharper source
- match the full-screen title bar to the theme on macos
- restore finder-sized window buttons on macos and move to java 27
- stack modal dialogs instead of replacing the open one

## ⚡ Performance

### 🏷️ ui

- weave @FxThread at build time, keep the agent as a safety net

## ♻️ Refactoring

### 🏷️ ui

- rename MaintenancePeoplePane to PeopleView

## 📝 Documentation

### 🏷️ general

- move the documented jdk to 27 and keep the import epic plans
- open contributions on gitea and accept the cla by pull request
- license pholio under polyform strict 1.0.0

## 💄 Style

### 🏷️ ui

- share one overlay opacity between the status drawer and the info panel

## 🔧 Chores

### 🏷️ build

- require jdk 27 and spell out the compiler release

### 🏷️ general

- add spdx license identifier to source files
- move the todo list to github issues
