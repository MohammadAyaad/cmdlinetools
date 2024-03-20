@echo off
mkdir tools
mkdir path
setx /M PATH "%PATH%;%~dp0\path"
regedit /s add_cmd_to_context_menu.reg
