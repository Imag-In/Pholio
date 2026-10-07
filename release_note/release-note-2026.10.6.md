# 🚀 Pholio 2026.10.6

_2026-10-07 · 12 changes since v2026.10.5_

## ✨ Features

### 🏷️ health

- show a compare icon on the open duplicates tool button
- find duplicates and show health results through the search bar
- add date, place and people checks
- add the library health check engine, file checks and dashboard

### 🏷️ library

- sync a library folder as soon as it is reachable again
- flag unreachable library folders in the folder tree
- offer to delete cached thumbnails when deleting a library

## 🐛 Bug fixes

### 🏷️ i18n

- keep apostrophes in formatted messages and fix the delete library text

### 🏷️ library

- name root folders and warn before adding a whole drive

### 🏷️ media

- keep the exif thumbnail readable after a lossless rewrite

## 📝 Documentation

### 🏷️ navigation

- count the tools entries as four, health check included

## ✅ Tests

### 🏷️ media

- check that an in-file metadata write preserves the file
