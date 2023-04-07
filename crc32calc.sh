#!/bin/bash

#version 0.1 2023-04-07
#joakim ringstad

#Kör i terminal
#python:    crc32calc.py <fil att beräkna>
#shell:     ./crc32calc.sh <fil att beräkna>
#batch:     crc32calc.bat <fil att beräkna>

#OUTPUT
#>Filinformation för <fil att beräkna>: 
#>Storlek: 1086 bytes
#>Skapades: 2023-04-07 21:00:08
#>Senast ändrad: 2023-04-07 20:58:30
#>CRC-32: 3668bb75
# Testa om perl-archive-zip är installerat
if ! pacman -Qs perl-archive-zip > /dev/null; then
    echo "Error: Missing package perl-archive-zip"
    exit 1
fi
# Kontrollera om en fil har dragits till skriptet
if [ $# -lt 1 ]; then
    echo "Ange en fil att beräkna CRC-32 för genom att dra filen till skriptet"
    exit 1
fi

# Läs in filen som dras till skriptet
filename=$1

# Beräkna CRC-32
crc=$(crc32 "$filename")

# Hämta filstorlek, när filen skapades och när filen senast ändrades
size=$(stat -c%s "$filename")
created=$(stat -c%W "$filename")
modified=$(stat -c%Y "$filename")

# Konvertera tidstämplar till datetime-objekt och formatera till strängar
created_date=$(date -d @$created +"%Y-%m-%d %H:%M:%S")
modified_date=$(date -d @$modified +"%Y-%m-%d %H:%M:%S")

# Skriv ut resultatet
echo "File information for: $filename"
echo "Size: $size bytes"
echo "Created: $created_date"
echo "Modified: $modified_date"
echo "CRC-32: $crc"
