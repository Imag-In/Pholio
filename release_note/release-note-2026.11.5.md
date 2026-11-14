# 🚀 Pholio 2026.11.5

_2026-11-14 · 39 changes since v2026.11.4_

## ✨ Features

### 🏷️ compare

- measure both photos and suggest the one to keep

### 🏷️ health

- offer a fix for each health check that has one

### 🏷️ imports

- say why a phone lists no file instead of showing none

### 🏷️ map

- show photos on the map before street level

### 🏷️ onboarding

- tour tools › duplicates
- tour the clock's synchronisation the first time it opens
- tour tools › devices
- tour tools › geo, with a guide page of its own
- tour the albums, dynamic ones first
- tour the imports the first time they are opened

### 🏷️ search

- find photos by event with event:
- find photos by scene with scene:
- find photos by object with obj:
- find photos by shot type with plan:
- find pictures by shape with o:

### 🏷️ site

- translate the site into spanish, german, japanese and chinese
- generate one page per language from templates and text files

### 🏷️ ui

- jump to where the scroll bar's track is pressed

### 🏷️ viewer

- list a stack's files and hold V to see its RAW or original

## 🐛 Bug fixes

### 🏷️ imports

- keep the phone's photo list still while it is listed

### 🏷️ onboarding

- reword the add-folder step of the welcome tour
- follow a target that moves more than once

### 🏷️ packaging

- keep windows libraries across upgrades and remake lost thumbnails

### 🏷️ people

- write the people into the photos a few at a time, resumable

### 🏷️ photo

- show the library folder in the preview's path

### 🏷️ recognition

- stop ONNX Runtime before a test fork ends

### 🏷️ ui

- render with OpenGL on macOS to stop Metal crashes

## ♻️ Refactoring

### 🏷️ whatsnew

- move the what's new badge to the status bar

## 📝 Documentation

### 🏷️ i18n

- say how the site's translations are marked synced
- rename "Bilan de santé" to "Diagnostic" in French

### 🏷️ models

- name the processing flag and the task of each analysis

### 🏷️ site

- Update "Bilan de sante" to "Diagnostic"

### 🏷️ userguide

- add first steps, gallery, import, health check and duplicates pages

### 🏷️ whatsnew

- write the 2026.11.5 note

## 💄 Style

### 🏷️ onboarding

- lay the mcp tour texts out in paragraphs and lists
- dim the window less, give the texts room

## ✅ Tests

### 🏷️ recognition

- give MediaEmbeddingStoreTest a model of its own

## 🔧 Chores

### 🏷️ i18n

- mark site translations synced for es, de, ja, zh

### 🏷️ release

- add -Drelease.skipI18n to leave out every translation check
