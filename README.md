# ASPECT-dump-tool
This is only the dump tool for [ASPECT](https://github.com/aickau/spectra-clustering-tool).

The main purpose of this code base is to reliably compile and run under Linux. The afaConnector is removed.

## How to compile
    git clone https://github.com/bloerg/ASPECT-dump-tool
    cd ASPECT-dump-tool
    cd sdsslib
    make
    cd ..
    cd dump
    make
    
## How to run
Copy dump/dump and dump/sdsslib.so to the intended directory, then run:

    ./dump -h 

for instructions.
