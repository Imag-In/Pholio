# 🚀 Pholio 2026.11.11

_2026-11-22 · 36 changes since v2026.11.10_

## ✨ Features

### 🏷️ assistant

- pick the chat's agent from the panel
- offer GitHub Copilot CLI as the chat's agent

### 🏷️ gallery

- show a photo's information in the right-hand bar

### 🏷️ library

- show where the library migrations stand
- stop setting the catch-up bits and clear them once their migrations are played
- let a library migration wait for others and skip the files' reach
- make the window wait while another library opens, and go back to the one before a deletion
- play versioned catch-ups once per library, apart from the other work

### 🏷️ people

- one name, one person or animal
- record a change of the people as one operation, undoable

### 🏷️ shell

- pin every right-hand panel alike, see-through while floating

## 🐛 Bug fixes

### 🏷️ health

- find the photos that lost their GPS version, and put it back
- keep a darktable duplicate's sidecar with its original photo

### 🏷️ journal

- drop quietly the look for interrupted operations of a library closed meanwhile

### 🏷️ media

- put right the multi-picture indexes an older Pholio left wrong

### 🏷️ metadata

- keep the GPS version of a TIFF when its XMP is rewritten
- keep the GPS version a file has when rewriting its EXIF
- read the rating a file's XMP gives, and keep it in step when writing

### 🏷️ people

- show an animal on the photos where only its body was found
- ask before the info panel creates a person, open a face's person from its menu
- move faces by the name field of a person's page

### 🏷️ thumbnails

- relocate a duplicate's thumbnail one rewrite at a time

## ♻️ Refactoring

### 🏷️ device

- read the device tags of older files as a library migration

### 🏷️ hdr

- read the exposure of older files as a library migration

### 🏷️ library

- tell the analyses of processing_flags from the catch-ups of a version
- read the IPTC country of older files as a library migration
- read the crop of older files as a library migration
- find the Samsung motion photos of older files as a library migration
- read the description of older files as a library migration
- read the keyword hierarchy of older files as a library migration

## 📝 Documentation

### 🏷️ library

- describe every bit of processing_flags

### 🏷️ whatsnew

- write the notes of 2026.11.11

## ✅ Tests

### 🏷️ metadata

- keep a JPEG's extended XMP segments when Pholio rewrites its XMP

### 🏷️ persistence

- open a library left at its first migration, whatever the last one
- leave out the last migration, V83, as a library to migrate

## 🔧 Chores

### 🏷️ dev

- follow pholio.log in the worktree launcher
