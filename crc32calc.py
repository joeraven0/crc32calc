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



import sys
import zlib
import os
from datetime import datetime
print("Windows compatible. For Linux, run shell script instead.")
# Kontrollera om en fil har dragits till skriptet
if len(sys.argv) < 2:
    print("Drag a file to calculate the CRC-32 for by dragging the file onto the script.")
    sys.exit(1)

# Läs in filen som dras till skriptet
filename = sys.argv[1]

# Öppna filen i binärläge och beräkna CRC-32
with open(filename, "rb") as f:
    data = f.read()
    crc = zlib.crc32(data)

# Hämta filstorlek, när filen skapades och när filen senast ändrades
size = os.path.getsize(filename)
created = os.path.getctime(filename)
modified = os.path.getmtime(filename)

# Konvertera tidstämplar till datetime-objekt och formatera till strängar
created_date = datetime.fromtimestamp(created).strftime("%Y-%m-%d %H:%M:%S")
modified_date = datetime.fromtimestamp(modified).strftime("%Y-%m-%d %H:%M:%S")

# Skriv ut resultatet
print("File information for {}: ".format(filename))
print("Size: {} bytes".format(size))
print("Created: {}".format(created_date))
print("Modified: {}".format(modified_date))
print("CRC-32: {:08x}".format(crc))
