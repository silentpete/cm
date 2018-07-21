:: SETLOCAL can be used to set local variables during run time
:: these can overwrite existing environment variables
@echo off

ECHO %OS%

SETLOCAL
SET OS=blah
ECHO %OS%
ENDLOCAL

ECHO %OS%
