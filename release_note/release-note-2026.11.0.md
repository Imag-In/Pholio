# 🚀 Pholio 2026.11.0

_2026-11-01 · 126 changes since v2026.10.14_

## ✨ Features

### 🏷️ albums

- record album changes in the journal and undo them

### 🏷️ cli

- add reset-trial to ask for a new pro evaluation

### 🏷️ demo

- add Wikimedia Commons as a second photo source

### 🏷️ duplicates

- compute every tab in the background when the view opens
- count the groups found in each tab's title

### 🏷️ export

- breadcrumb, gallery-like search field and reset on the export screen
- toggle switches for the photos to export
- switches for on/off choices, pills for the format
- choose the metadata kept field by field
- export photos to a folder or a ZIP archive from the Export screen
- export library files to a folder or a ZIP archive

### 🏷️ folders

- close the folder picker from a button, show a folder on enter only

### 🏷️ gallery

- show the progress of a folder load above the grid
- name the file and its kind in a cell still without thumbnail
- name time zones in the date editor
- say in the info pane that a photo moves
- show a Live Photo as one photo with a motion badge
- make pasting metadata on a selection a Pro trial too
- show the turn proposed for a photo in its info panel

### 🏷️ geo

- list search providers in a table, added through a dialog
- show the cities5000 address, a play button and the last import on one line

### 🏷️ health

- give turned photos their own category, and name each severity's count

### 🏷️ import

- copy a Live Photo from a phone as one photo
- import the photo and the video of a Live Photo together

### 🏷️ imports

- import the edited version of a photo by default, and leave out unkept burst images
- bring the albums and people of an apple photos library
- list the apple photos items in icloud only in the import history
- import an apple photos library with its original names and metadata
- lock the import form while the sources are read
- copy newest first and show the import's progress above the grid
- name the faces of google takeout photos from their json
- write the google takeout description into the copy
- turn google takeout albums into library albums
- report google takeout metadata found, missing and unmatched
- read google takeout zip archives in place
- read google takeout json metadata

### 🏷️ library

- say in the add buttons' tooltips that folders can be dropped
- add folders dropped on photos or the list of every folder
- add several folders from the list of every folder
- add several folders at once
- load a large folder in capture-date order
- keep the last five manual copies apart from the rotation
- back up the library database daily and restore a copy
- log when the first embedded thumbnails are written
- log the milestones of a folder import
- pair Live Photos by Apple's content identifier too
- give the video of a Live Photo its photo's date and place
- keep the video of a Live Photo with its photo
- pair the photo and the video of a Live Photo

### 🏷️ licensing

- badge the Pro tag cleanup tabs and the partly free tools
- colour the licence icon after the licence
- say pro licences are free during early access
- show the running Pro evaluation and its end
- enforce the plans, the beta is over
- ask for a Pro evaluation at start-up without a licence installed
- end the tooltip of every Pro action with the PRO tag
- count the free tries by action, not by feature
- let the free edition try Pro features, starting with a place set on a selection

### 🏷️ map

- write the number of photos in the centre of each circle

### 🏷️ mcp

- let the assistant add photos to an album and take them out

### 🏷️ recognition

- say which photos detection has left and resume it
- detect photos shown turned and report them in the health check

### 🏷️ search

- find the photos that move with is:live

### 🏷️ shell

- open the gallery unfiltered from the logo, fold Photos and Albums from their chevron

### 🏷️ sidebar

- show a dot on the trash while it holds files
- list every subfolder used among the recent folders
- show Imports under Tools, before Export

### 🏷️ tags

- move the tag cleanup into Tools, one tab per check

### 🏷️ tools

- title every tool "Tools › its name", Tools a link back
- name each photo's file in the turned photos tool, those offline left unchecked
- turn the checked photos upright at once, the table being their preview
- turn the photos shown turned upright in bulk, as a Pro feature

### 🏷️ ui

- open the user guide on F1, from the preferences' help button
- add import help menu and numbered lists in the guide
- animate the switch from one view to another

### 🏷️ video

- give every video a thumbnail through the OS decoder
- try JavaFX Media on the OS decoder

## 🐛 Bug fixes

### 🏷️ demo

- wait when Flickr throttles instead of skipping the photo

### 🏷️ export

- keep all the metadata at each start, and again once switched back on

### 🏷️ gallery

- zoom the photo open in full around the pointer, as the comparison does
- zoom thumbnails through six sizes, around the photo under the pointer

### 🏷️ i18n

- rebuild the view on screen when the language changes

### 🏷️ imports

- insert naming tokens at the caret

### 🏷️ library

- stop a folder's load before removing the folder
- size the large-folder question by its content
- refuse a restore before copying the library
- keep loading a folder past a file the database refuses
- keep the video of a Live Photo out of checks and counts

### 🏷️ licensing

- widen the pro evaluation welcome so its title shows whole
- reword the pro evaluation welcome

### 🏷️ media

- show the raw files that hold no jpeg preview
- write a decoded image with alpha as a plain RGB thumbnail
- read an iPhone video's content identifier and position

### 🏷️ people

- refresh the people view through a singleton, not its own event listeners

### 🏷️ persistence

- send H2's error journal to the logs, not to .trace.db files

### 🏷️ recognition

- wait for onnx runs in progress when the jvm exits
- send an image with alpha to a provider as a plain RGB JPEG
- mark a photo checked for its orientation without an H2 type error

### 🏷️ tasks

- stop work when cancelled and when the application closes

### 🏷️ tools

- resume the commons listing where the previous run stopped
- keep downloading when two Commons names differ only in case
- download a photo listed twice only once in the big library

### 🏷️ ui

- drop the last task's title from the status bar tooltip once idle
- name the running tasks in the status bar without a run count

## ⚡ Performance

### 🏷️ gallery

- generate the thumbnails of the visible cells first
- show the thumbnail a file embeds until its real one is ready

### 🏷️ library

- load a folder window by window instead of phase by phase

### 🏷️ recognition

- cluster the faces of analysed photos by batches

## ♻️ Refactoring

### 🏷️ licensing

- watch the day change instead of an hourly check
- gather the free allowances in FreeAllowances

### 🏷️ naming

- share the import's file naming with the exports

### 🏷️ ui

- use material design 2 icons everywhere

## 📝 Documentation

### 🏷️ agents

- describe the free tries of Pro features, counted offline

### 🏷️ import

- explain how Live Photos are imported

### 🏷️ library

- record the first load measures of a 10k library

### 🏷️ plan

- record the Live Photo decisions of Imag-In/pholio-roadmap#156

### 🏷️ plans

- record the embedded thumbnail measures
- record the window-by-window loading measures
- list what pholio still needs for a v1

### 🏷️ video

- rule out renaming a MOV for JavaFX Media
- measure imageio-native-video for thumbnails

## 💄 Style

### 🏷️ health

- make the run button green and larger, from the factory

### 🏷️ ui

- show a selected or pressed box by its accent border only

## ✅ Tests

### 🏷️ media

- check the embedded thumbnail follows its content hash
- prove an edit keeps the video of an Android motion photo

## 🔧 Chores

### 🏷️ demo

- build a large test library from Flickr originals
