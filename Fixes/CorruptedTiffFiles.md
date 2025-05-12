# Corrupted TIFF Files (Windows)

Some `.tiff` image files, especially those modified and saved by MS Paint, may contain malformed metadata or tag structures that make them unreadable by most tools (e.g. ImageMagick, PIL, OpenCV, or tifffile). Due to not checking these malformed lines, the images remain renderable in MS Paint and can be losslessly saved as a .bmp file.

This process can be automated for a large number of corrupted files using AutoHotkey. The process is slow, taking ~12 seconds per image, due to the sleep lines between commands.

## Installation
Download AutoHotkey v1.1 from: https://www.autohotkey.com/download/

## convert_with_paint.ahk script

Use notepad to create the following script, named `convert_with_paint.ahk`:

```ahk
#NoEnv
SetTitleMatchMode, 2
fileToOpen = %1%

Run, mspaint.exe "%fileToOpen%"
WinWaitActive, Paint
Sleep, 2000

Send, {F12} ; Open Save As dialog
Sleep, 1000

Send, {Tab} ; Focus filetype dropdown
Sleep, 500
Send, {Down 1}
Sleep, 500
Send, {Up 3}
Sleep, 500

Send, {Enter}
Sleep, 500
Send, {Enter}
Sleep, 500
Send, {Enter}
Sleep, 1000

Send, !{F4} ; Close Paint
Sleep, 2000
```

## launch.bat script

Use notepad to create the following script, named `launch.bat`

```bat
@echo off
setlocal enabledelayedexpansion

:: Folder with your TIFFs
set "INPUT_DIR=C:\Users\<YourName>\path_to_images"
set "SCRIPT=C:\Users\<YourName>\path_to_convert_with_paint.ahk"
set "AHK=C:\Program Files\AutoHotkey\v1.1\AutoHotkeyU64.exe"

for %%F in ("%INPUT_DIR%\*.tif*") do (
    echo Converting %%~nxF
    start "" "%AHK%" "%SCRIPT%" "%%F"
    timeout /t 12 >nul
)

```

## Run script
`Warning`: This process can be interfered with by pop-up, notifications, or windows focus changes. Closing all other applications and disconnecting from the internet is recommended. Don't touch the keyboard or mouse while the process is running.

To start the script, double click on launch.bat.
