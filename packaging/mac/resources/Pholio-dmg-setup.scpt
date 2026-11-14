-- Pholio: jpackage's DMGsetup.scpt (JDK 27, src/jdk.jpackage/macosx/.../resources/DMGsetup.scpt), used through its
-- resource-dir option (Imag-In/pholio-roadmap#298). jpackage fills the DEPLOY_ placeholders; compare this file with
-- the JDK's after a JDK upgrade.
-- The window is the size of Pholio-background.tiff and the two icons sit at each end of its arrow
-- (tools/icons/make-dmg-background.py in the source repository: SIZE, APP, APPLICATIONS). jpackage's own script lays
-- out any other item in rows and enlarges the window for them, and AppleScript lists the volume's hidden files too
-- (.background, .VolumeIcon.icns, .fseventsd): it always did, so only the two icons are placed in the window here.
tell application "Finder"
  -- jpackage runs this script as soon as the volume is attached, often before the Finder lists it: without this
  -- wait the script failed, jpackage went on, and the image came out with no layout, no background and no link
  -- to Applications.
  repeat 40 times
    if (count of (disks whose URL = "DEPLOY_VOLUME_URL")) > 0 then exit repeat
    delay 0.25
  end repeat

  set theDisk to a reference to (disks whose URL = "DEPLOY_VOLUME_URL")
  open theDisk

  set theWindow to a reference to (container window of disks whose URL = "DEPLOY_VOLUME_URL")

  set current view of theWindow to icon view
  set toolbar visible of theWindow to false
  set statusbar visible of theWindow to false

  -- left, top, right, bottom, title bar included: 640 x 400 for the background, 32 for the title bar
  set the bounds of theWindow to {400, 100, 1040, 532}

  set theViewOptions to a reference to the icon view options of theWindow
  set arrangement of theViewOptions to not arranged
  set icon size of theViewOptions to 128
  set text size of theViewOptions to 13
  set background picture of theViewOptions to POSIX file "DEPLOY_BG_FILE"

  -- Create alias for install location
  do shell script "(cd 'DEPLOY_VOLUME_PATH' && ln -s 'DEPLOY_INSTALL_LOCATION' 'DEPLOY_INSTALL_LOCATION_DISPLAY_NAME')"

  -- A position is the centre of the icon. The hidden items go below the window, for a Finder showing hidden files.
  set allTheFiles to the name of every item of theWindow
  repeat with theFile in allTheFiles
    set theFilePath to POSIX path of theFile
    set appFilePath to POSIX path of "/DEPLOY_TARGET"
    if theFilePath ends with "DEPLOY_INSTALL_LOCATION_DISPLAY_NAME" or theFilePath ends with "DEPLOY_INSTALL_LOCATION" then
      set position of item theFile of theWindow to {480, 215}
    else if theFilePath ends with appFilePath then
      set position of item theFile of theWindow to {160, 215}
    else
      set position of item theFile of theWindow to {320, 1000}
    end if
  end repeat

  update theDisk without registering applications
  delay 5
  close (get window of theDisk)
end tell
