for /F "tokens=*" %%a in ('dir Emuera*.exe /B /O-D') do (start "" "%%a" -Debug & exit /B)
