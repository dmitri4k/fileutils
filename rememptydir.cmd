@echo off

for /r %%G in (.) do (
  dir /B "%%~G" | findstr "^" >nul || rd /S /Q "%%~G"
)