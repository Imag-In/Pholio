# 🚀 Pholio 2026.10.13

_2026-10-18 · 48 changes since v2026.10.12_

## ✨ Features

### 🏷️ gallery

- move the floating bars out of a selection icon's way
- show the rejected bar's trash action as a round icon
- show icon-only actions in the floating selection bar
- choose which copied metadata to paste

### 🏷️ geo

- add in-memory geo index and grid clustering

### 🏷️ import

- say a long phone listing is the device's wait, not pholio's
- offer a phone's screenshots and app images from its pictures folder
- fill a phone's choice dialog as the phone lists its photos
- show a phone's thumbnails and pick photo by photo before copying
- pick what to copy from a phone's catalogue before downloading
- reach phones plugged into windows through wpd
- reach phones plugged into a mac through imagecapturecore
- import from a device that does not mount as a disk
- propose phones mounted by gvfs on linux

### 🏷️ journal

- preview a batch edit before writing it, exclude files from it
- browse the history of metadata operations and undo them from it
- undo and redo metadata operations, finish interrupted ones
- write every metadata edit through the journal
- record every metadata operation before writing it

### 🏷️ map

- show the photos of small groups at the deepest zooms
- show detailed map tiles with a disk cache
- preview a random photo of a group on hover
- show where photos were taken on the map view
- add offline world map component with Natural Earth basemap

### 🏷️ search

- match any of several tags and complete tag: in the search bar

### 🏷️ shell

- go back to the previous screen with a back button

### 🏷️ tags

- show when a tag was used as a year by month heatmap
- show the tags as a treemap sized by photos, coloured by recency
- add and remove tags on a photo or a selection
- add tags view with usage counts

### 🏷️ ui

- show an under construction picture on the pages still to come

## 🐛 Bug fixes

### 🏷️ album

- a saved search only creates a dynamic album

### 🏷️ import

- wait while macos prepares a phone just plugged in
- wait for a slow phone as long as its catalogue grows
- log why a phone does not list its photos on macos

### 🏷️ map

- open centred on the computer's country and where it was left
- clear the canvas before each frame

### 🏷️ search

- open the search syntax guide at its top

### 🏷️ tags

- show person and animal icons on tag chips, pad the tag field icon

## 📝 Documentation

### 🏷️ agents

- say to rebuild the macos device helper before launching from the ide
- describe jpackage packaging instead of jdeploy

### 🏷️ import

- add a developer matrix of phone protocols by platform
- describe importing from phones for agents and the plan

### 🏷️ journal

- route every metadata write through the journal and its preview

### 🏷️ map

- point the thumbnails zoom TODO to its issue

## 🔧 Chores

### 🏷️ claude

- allow pushing to upstream

### 🏷️ packaging

- remove the jdeploy leftovers

### 🏷️ general

- Sort knowTags
