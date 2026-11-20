# 🚀 Pholio 2026.11.9

_2026-11-20 · 94 changes since v2026.11.8_

## ✨ Features

### 🏷️ assistant

- tour the chat panel and its preferences
- offer Google Antigravity as the chat's agent
- log in to Mistral Vibe with a Mistral account
- ship the chat on, the API-key model behind a switch
- offer Mistral Vibe as the chat's agent
- keep a long chat within the model's context, say its usage and cost
- show a download's rate and time left, and the agent's start steps
- keep the chat's prompts and save an answer's search as an album
- offer chat examples combining criteria and the library's people
- fold the agent's steps into one pane before its answer
- show only the chosen agent's settings and pick the model in a list
- offer Mistral, OpenRouter and any OpenAI-compatible service
- chat with Anthropic or OpenAI through the user's API key
- chat with a model the user runs (Ollama, LM Studio)
- install Node.js for the agents published on npm only
- show the PRO badge in the chat panel's header
- follow the answer to the end and add a button back to it
- name the agent, keep the examples and show tables in the chat
- install the agent and try the chat in the free edition
- choose the agent and log in from Pholio
- tell the agent what the user is looking at
- chat with the agent in the right-hand panel
- allow only the tools Pholio serves, set a mode left back
- drive an ACP agent behind a switch, off by default

### 🏷️ compare

- prefer the shot with eyes open in the keep advice
- show the side's badge on compared thumbnails

### 🏷️ gallery

- crop a photo, kept as Camera Raw keeps it in XMP
- show the rating as hearts, one heart filled a fifth per heart
- show a video's codecs and say why one does not play

### 🏷️ hdr

- write an Ultra HDR gain map with a merged series

### 🏷️ health

- name the countries of country-mismatch and take the GPS one

### 🏷️ library

- open a library in one Pholio at a time

### 🏷️ logs

- count a warning repeated by a pass, and say what an import did
- a face line only when faces were found, a line per analysis run
- a line per photo read, and what a folder's load read
- write what runs where at each start, and what a line is for
- turn on a detailed log for the support, off by itself in 24 h
- name photos in log lines as the interface does

### 🏷️ media

- play the video of Android motion photos

### 🏷️ metadata

- read and write the IPTC country of the photos

### 🏷️ search

- help models write searches and complete is: values

### 🏷️ secrets

- keep API keys in the system's secret store

### 🏷️ settings

- group the AI preferences, the MCP server as an expert's section

### 🏷️ support

- send the logs to the support from Pholio

### 🏷️ ui

- resize panels from the seam between them
- give every panel of the right-hand bar the same width

## 🐛 Bug fixes

### 🏷️ assistant

- give Mistral Vibe Pholio's MCP server through its settings
- tell a local or API model to show the photos in the gallery
- read an OpenAI-compatible address without /v1 as its /v1
- give create_album its step in the folded steps
- start the agent when Pholio starts with the panel open

### 🏷️ gallery

- show the heart on any rated photo again
- play a video whose frame is in the viewer's image cache

### 🏷️ import

- record a folder planned in another case as the disk spells it

### 🏷️ imports

- recover an import cut short at startup, its copies claimed

### 🏷️ library

- keep the modification times compared with the disk exact
- stop the work of the library left before opening the next
- let a copy a sync indexed join its import
- leave an import's copies to it when a sync runs meanwhile

### 🏷️ logs

- keep each line on its own class's logger and line

### 🏷️ metadata

- keep a photo's permissions when Pholio writes into it
- name the photos that could not be written from their folder

### 🏷️ persistence

- compact a database once its migrations ran

### 🏷️ preferences

- show the rows a bean reveals while the settings are open

### 🏷️ reorganize

- rename a file or folder whose case alone changes

### 🏷️ task

- bind a task row once, not each time it is shown

### 🏷️ ui

- close the context even when the interface fails to dispose

### 🏷️ video

- let the latest video asked play, not the latest opened

## ⚡ Performance

### 🏷️ analysis

- keep an analysis run open a moment for files arriving one at a time

### 🏷️ compare

- make a thumbnail's compare badge only for a photo compared

### 🏷️ gallery

- read a date header's photos from an index of the days
- write a flush's updated and removed files in one change of the list
- lay a reloaded library out once and measure its first screen

### 🏷️ library

- read a share's entries in parallel and show a sync's progress
- stop watching folders on a network share
- lock root by root so a share's sync holds up no local import

## ♻️ Refactoring

### 🏷️ library

- name a file from its absolute path in one place

### 🏷️ mcp

- name the caller each MCP server serves

### 🏷️ media

- split isFavorite into isTopFavorite and hasRating

## 📝 Documentation

### 🏷️ agents

- describe how the logs reach the support
- say how a log line names a photo and ends a pass
- say where a path shown comes from outside the interface
- describe the import recovery at startup and its claims
- describe root locks, import claims and unwatched shares

### 🏷️ credits

- credit Spring AI, the MCP and ACP Java SDKs

### 🏷️ site

- replace the MCP section with the AI chat
- say in the privacy policy what sending the logs sends

### 🏷️ video

- note the Windows check of the ffmpeg player

### 🏷️ whatsnew

- write the note of 2026.11.9

## ✅ Tests

### 🏷️ library

- count only a test's own notifications and library folders

### 🏷️ general

- keep two tests apart from the other contexts of their fork

## 🔧 Chores

### 🏷️ dev

- add an --assistant option to the worktree launcher
- follow the console of the Pholio a worktree starts

### 🏷️ video

- drop javafx-media, ffmpeg plays every video
