#!/bin/bash


echo "Sartu fitxategiaren izena:"
read fitxategia


if [ -r "$fitxategia" ]; then
    echo "Fitxategia irakurtzeko baimena dauka."
fi

if [ -w "$fitxategia" ]; then
    echo "Fitxategia idazteko baimena dauka."
fi

if [ -x "$fitxategia" ]; then
    echo "Fitxategia exekutatzeko baimena dauka."