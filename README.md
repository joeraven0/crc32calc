# crc32calc
Calculate CRC32 checksum on Linux or Windows

Run either crc32calc.sh, crc32calc.py (Windows filesystem only) or crc32calc.bat followed by the filename to calculate checksum on.

## Usage

Execute and output as below

```
./crc32calc.sh myfile.txt
File information for: myfile.txt
Size: 812 bytes
Created: 2023-04-07 20:59:38
Modified: 2023-04-07 21:27:51
CRC-32: a0124219

```

### Windows

Run command prompt and run either python or bat file.

```
python crc32calc.py myfile.txt 
```

OR

```
crc32calc.bat myfile.txt
```

## Linux

``` chmod +x crc32calc.sh
./crc32calc.sh myfile.txt
```
