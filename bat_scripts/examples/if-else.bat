@ECHO off
rem If (condition) (do_something) ELSE (do_something_else)

SET fname=peter
SET lname=gallerani

if 2==2 (echo true) ELSE (echo false)

if 2==3 (echo true) ELSE (echo false)

if NOT 3==3 (
  echo true
) ELSE (
  echo false
)

if %fname%==peter (echo true)

if exist C:\Go (echo true) ELSE (echo false)
