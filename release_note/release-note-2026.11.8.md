# 🚀 Pholio 2026.11.8

_2026-11-16 · 36 changes since v2026.11.7_

## ✨ Features

### 🏷️ cleanup

- sort failed photos, look-alikes and bursts in bulk

### 🏷️ gallery

- play videos in the viewer and from their thumbnail
- animate a live photo of the grid on hover
- animate a live photo in the viewer on demand

### 🏷️ hdr

- open a series' photo larger on double-click and ask two ev of a probable one

### 🏷️ i18n

- parse each language's detection names in the search

### 🏷️ imports

- say an iPhone gives over a cable only the photos it keeps

### 🏷️ media

- make every video's thumbnail through ffmpeg

### 🏷️ search

- find holidays and public holidays with event:
- find the failed photos with quality:

### 🏷️ ui

- try the user guide's examples in Pholio
- open the search bar's help in the side panel
- search the user guide from the help browser
- browse the user guide in the side panel or its own window
- add a right-hand bar of side panels, the help first

### 🏷️ video

- play videos through ffmpeg, hardware decoding first

## 🐛 Bug fixes

### 🏷️ gallery

- show the play button again once a click stops the video
- resume videos with their sound and play them from the grid

### 🏷️ hdr

- leave out exposures changing aperture or iso and reread files out of reach

### 🏷️ import

- fetch the thumbnails on screen first
- list an iphone plugged into windows
- see phones plugged into windows and list them again after a usb mode change

### 🏷️ library

- give video thumbnails to a library opened after the start

### 🏷️ licensing

- badge hdr as pro and show what is pro in clean-up

### 🏷️ media

- decode HEIC and AVIF on Windows when the extensions are installed

## ⚡ Performance

### 🏷️ import

- list an android plugged into a mac at once over plain ptp
- read a phone's files in bulk over mtp on windows

## 📝 Documentation

### 🏷️ import

- record the windows phone imports checked end to end

### 🏷️ video

- document live photo playback in the guide and the docs

### 🏷️ whatsnew

- write the 2026.11.8 note

## 🔧 Chores

### 🏷️ i18n

- mark de, es, ja and zh translations synced
- sync zh translations
- sync ja translations
- sync es translations
- sync de translations

### 🏷️ video

- add ffmpeg decoding probe and minimal player
