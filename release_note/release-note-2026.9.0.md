# 🚀 Pholio 2026.9.0

_2026-09-30 · 30 changes (last 30 commits)_

## ✨ Features

### 🏷️ gallery

- read the all-metadata dialog straight from the file
- smooth isolated wheel notches and widen mid-row date gap
- make the grid-mode media info overlay slightly translucent
- bring the action-selection checkbox and date actions menu back
- replace ThumbnailGalleryPane with a justified grid (JustifiedGalleryPane)
- add GalleryGridItem, a header/content item split

### 🏷️ geocoding

- save only the locality as a photo's place name

### 🏷️ packaging

- fit the app icon to the macOS icon grid

### 🏷️ release

- group the release note by type, then by scope
- generate a release note and publish it with the release
- add a maven release profile with YYYY.M.N versions

### 🏷️ search

- add a search syntax guide below the search bar

## 🐛 Bug fixes

### 🏷️ gallery

- retry the selection-highlight resync across a few pulses
- clear stale :hover on a reused card that changed column
- force an immediate CSS pass after every selection/checked pseudo-class flip
- resync selection highlight against the live scene, not per-cell state

### 🏷️ packaging

- pass jDeploy launch arguments as separate entries

### 🏷️ search

- drop the quotes around a quoted free-text phrase

## ♻️ Refactoring

### 🏷️ cli

- make headless the explicit default launch mode

### 🏷️ gallery

- let the parent layout own all inter-card spacing
- render date headers as their own fixed-height grid item
- move the detail-mode info panel into PhotoDetailPane

## 📝 Documentation

### 🏷️ search

- explain that named people are found through synced tags

### 🏷️ general

- add a README with an overview, dev options and the release command

## 💄 Style

### 🏷️ build

- commit the pom.xml layout sortpom produces

## ✅ Tests

### 🏷️ general

- align geo initializer and legacy gallery tests with current behavior

## 📦 Build

### 🏷️ general

- drop unused libraries from the executable jar

## 🔧 Chores

### 🏷️ distrib

- update jdeploy title.

### 🏷️ git

- ignore the nested distrib worktree

### 🏷️ release

- 2026.9.1
