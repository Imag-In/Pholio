# 🚀 Pholio 2026.9.1

_2026-09-30 · 30 changes (last 30 commits)_

## 🧩 build

### 💄 Style

- commit the pom.xml layout sortpom produces

## 🧩 distrib

### 🔧 Chores

- update jdeploy title.

## 🧩 gallery

### ✨ Features

- read the all-metadata dialog straight from the file
- smooth isolated wheel notches and widen mid-row date gap
- make the grid-mode media info overlay slightly translucent
- bring the action-selection checkbox and date actions menu back
- replace ThumbnailGalleryPane with a justified grid (JustifiedGalleryPane)
- add GalleryGridItem, a header/content item split

### 🐛 Bug fixes

- retry the selection-highlight resync across a few pulses
- clear stale :hover on a reused card that changed column
- force an immediate CSS pass after every selection/checked pseudo-class flip
- resync selection highlight against the live scene, not per-cell state
- collapse detail info pane when photo detail closes
- retry thumbnail decode when the file isn't on disk yet

### ♻️ Refactoring

- let the parent layout own all inter-card spacing
- render date headers as their own fixed-height grid item
- move the detail-mode info panel into PhotoDetailPane

### 🔧 Chores

- remove temporary missing-thumbnail diagnostic logging

### 🔹 debug

- log the decode-pool backlog alongside the paint-state dump

## 🧩 geocoding

### ✨ Features

- save only the locality as a photo's place name

## 🧩 git

### 🔧 Chores

- ignore the nested distrib worktree

## 🧩 packaging

### ✨ Features

- fit the app icon to the macOS icon grid

### 🐛 Bug fixes

- pass jDeploy launch arguments as separate entries

## 🧩 release

### ✨ Features

- generate a release note and publish it with the release
- add a maven release profile with YYYY.M.N versions

## 🧩 scheduling

### ✨ Features

- let a startup task's shouldRun computation pass data to run

## 🧩 search

### ✨ Features

- add a search syntax guide below the search bar

### 🐛 Bug fixes

- drop the quotes around a quoted free-text phrase

### 📝 Documentation

- explain that named people are found through synced tags

## 🧩 general

### ✅ Tests

- align geo initializer and legacy gallery tests with current behavior
