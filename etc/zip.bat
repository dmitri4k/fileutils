@echo off
setlocal enabledelayedexpansion

for /r %%i in (*.zip) do (
    for %%j in ("%%~dpi.") do (
        set "fullpath=%%~dpj"
        for %%k in ("!fullpath:.=\!") do (
            set "parent=%%~nk"
        )
    )
    ren "%%i" "!parent!.zip"
)

pause