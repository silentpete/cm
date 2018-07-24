@ECHO off

ECHO Detecting permissions...
NET session > nul 2>&1
if %errorLevel% == 0 (
    echo Administrative permissions confirmed.
) else (
    echo Current permissions inadequate.
)

PAUSE

:: References
:: - https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
