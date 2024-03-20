@echo on
setlocal EnableDelayedExpansion

set "input_string=%1"
set "delimiter=\"

:loop
for /f "tokens=1* delims=%delimiter%" %%a in ("%input_string%") do (
    set "last_substring=%%a"
    set "input_string=%%b"
)

if defined input_string goto loop

set "input_string=%last_substring%"
set "delimiter=."

for /f "tokens=1 delims=%delimiter%" %%a in ("%input_string%") do (
    set "first_substring=%%a"
)

echo @echo off > "D:\cmdtools\path\%first_substring%.bat"
echo "%1" %%* >> "D:\cmdtools\path\%first_substring%.bat"
