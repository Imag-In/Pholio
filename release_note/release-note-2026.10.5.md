# 🚀 Pholio 2026.10.5

_2026-10-07 · 43 changes since v2026.10.4_

## ✨ Features

### 🏷️ gallery

- distinguish pending, unavailable and failed thumbnails

### 🏷️ import

- make the removable media poll interval configurable
- preview the source as a grid of pictures
- propose an import when a memory card is plugged in
- keep the original file name and the import id in xmp
- resolve {CITY} and {COUNTRY} from gps

### 🏷️ imports

- show the grid by default again
- drop the sources of an unmounted volume and copy a source path
- show the table by default with a stop button
- decode only the previews around the viewport
- count files by kind under the left-aligned filters

### 🏷️ licensing

- add free/pro feature gating and signed licences

### 🏷️ logging

- write rolling log files in release builds

### 🏷️ media

- read the exif of canon cr3 files
- read the recording position of mp4, mov and 3gp videos
- use the full-size jpeg previews embedded in raw files
- decode heif and avif with the os codecs

### 🏷️ memory

- let the user choose the heap target

### 🏷️ site

- mark the pro features as coming soon
- add the library, people, places and import screenshots
- add the first real screenshots
- add a static one-page showcase site

### 🏷️ status-bar

- show a thin task progress bar with counter and current title

### 🏷️ ui

- fade the library grid in after switching library
- save the active window as a png on shift+f12

### 🏷️ viewer

- show tiff, webp and raw at full size, and cmyk jpeg right

## 🐛 Bug fixes

### 🏷️ media

- unmap raw previews as soon as they are read
- find the exif thumbnail a few bytes past its recorded offset
- read bmp, avi and 3gp sizes and the avi recording date
- read matroska and webm metadata

### 🏷️ ui

- show the grid when picking a folder over an open photo
- show the library grid after switching library
- make modal dialogs resizable again

## ♻️ Refactoring

### 🏷️ preferences

- remove preferences nothing reads

## 📝 Documentation

### 🏷️ cla

- govern the cla by quebec law

### 🏷️ import

- record the design of #29, #30, #31 and #33

### 🏷️ media

- plan video thumbnails and playback
- map every declared format against what pholio does with it

## ✅ Tests

### 🏷️ media

- measure import preview reads on a real folder
- add an undecodable jpeg to the non-regression set

### 🏷️ nrt

- read every non-regression file through the real media factories
- add a non-regression media set covering every declared format

## 🔧 Chores

### 🏷️ site

- add a script publishing the site with rsync
