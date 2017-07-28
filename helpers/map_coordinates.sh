#!/bin/sh

#####################################################################
# This Script takes as input an allSpectra.txt file (output from
# dump -i sofmnet.bin) and generates a csv-file with 5 columns:
# x: x-coordinate of neuron in SOM
# y: y-coordinate of neuron in SOM
# plate: plate id of spectrum in SDSS
# mjd: MJD of spectrum in SDSS
# fiberid: fiber id of spectrum in SDSS
#
# execute like:
# > sh map_coordinates.sh allSpectra.txt
#
######################################################################

inputfile="$1"
if [[ ! -f "$inputfile" ]] ; then
    echo "Inputfile ($inputfile) does not exist."
    exit 1
else

    echo "Extracting SDSS ids from input file..."
    temp_id_file=$(mktemp)
    temp_coord_file=$(mktemp)
    cut -d '-' -f 2,3,4 $inputfile |cut -d '.' -f 1 |tr '-' ',' > "$temp_id_file"
    
    echo "Computing edge length of SOM..."
    num_neurons=$(wc -l "$temp_id_file"|cut -d ' ' -f 1)
    edge_length=1
    while (( $edge_length ** 2 < $num_neurons )) ; do
	edge_length=$((edge_length + 1 ))
    done
    
    echo "Generating coordinate columns..."
    for ((x=0 ; x < $edge_length ; x++)) ; do 
	for ((y=0 ; y < $edge_length ; y++)) ; do 
	    echo "$x,$y" >> "$temp_coord_file"
	done 
    done

    echo "Combining data into output: $inputfile.out ..."
    echo "x,y,plate,mjd,fiberid" > "$inputfile.out"
    paste -d ',' "$temp_coord_file" "$temp_id_file" >> "$inputfile.out"
    
    echo "Tidy up..."
    rm "$temp_coord_file" "$temp_id_file"
    
    echo "Done"
fi