#!/bin/bash

echo "Idatzi lehenengo izena"
read izena1


echo "Idatzi bigarren izena"
read izena2

if [ "$izena1" = "$izena2" ]; then
    echo "Berdinak dira."
else
    echo "Desberdinak dira."
fi

