#!/bin/bash

echo "Sartu lehenengo balioa:"
read lehenengo_balio


echo "Aukeratu eragiketa (+, -, *, /):"
read eragiketa

echo "Sartu bigarren balioa:"
read bigarren_balio


case $eragiketa in
    "+") emaitza=$(echo "$lehenengo_balio + $bigarren_balio" | bc) ;;
    "-") emaitza=$(echo "$lehenengo_balio - $bigarren_balio" | bc) ;;
    "*") emaitza=$(echo "$lehenengo_balio * $bigarren_balio" | bc) ;;
    "/") emaitza=$(echo "scale=2; $lehenengo_balio / $bigarren_balio" | bc) ;;
    *) echo "Errorea: Eragiketa okerra." ;;
esac

echo "Emaitza: $emaitza"