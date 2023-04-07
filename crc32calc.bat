@echo off
chcp 1252 > nul
rem version 0.1 2023-04-07
rem joakim ringstad 
rem Kör i terminal
rem python:    crc32calc.py <fil att beräkna>
rem shell:     ./crc32calc.sh <fil att beräkna>
rem batch:     crc32calc.bat <fil att beräkna>rem 
rem OUTPUT
rem >Filinformation för <fil att beräkna>: 
rem >Storlek: 1086 bytes
rem >Skapades: 2023-04-07 21:00:08
rem >Senast ändrad: 2023-04-07 20:58:30
rem >CRC-32: 3668bb75

rem Kontrollera om en fil har dragits till skriptet
if "%~1"=="" (
    echo Ange en fil att beräkna CRC-32 för genom att dra filen till skriptet
    exit /b 1
)

rem Läs in filen som dras till skriptet
set "filename=%~1"

rem Beräkna CRC-32
set "crc="
for /f %%a in ('CertUtil -hashfile "%filename%" CRC32 ^| findstr /r "[0-9A-Fa-f]*"') do set "crc=%%a"

rem Hämta filstorlek, när filen skapades och när filen senast ändrades
for /f "usebackq tokens=1,2 delims==." %%a in (`wmic datafile where "name='%filename:\=\\%'" get CreationDate^,LastModified^,FileSize /format:list ^| findstr /r "[0-9]*"`) do (
    if "%%a"=="FileSize" set "size=%%b"
    if "%%a"=="CreationDate" set "created=%%b"
    if "%%a"=="LastModified" set "modified=%%b"
)

rem Konvertera tidstämplar till datetime-objekt och formatera till strängar
for /f "tokens=1-6 delims=., " %%a in ("%created%") do set "created_date=%%a-%%b-%%c %%d:%%e:%%f"
for /f "tokens=1-6 delims=., " %%a in ("%modified%") do set "modified_date=%%a-%%b-%%c %%d:%%e:%%f"

rem Skriv ut resultatet
echo File information for: %filename%:
echo Size: %size% bytes
echo Created: %created_date%
echo Modified: %modified_date%
echo CRC-32: %crc%
