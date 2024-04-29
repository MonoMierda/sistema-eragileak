#!/bin/bash

karpeta_tamaina_ikusi() {
    echo "Sartu karpeta izena:"
    read karpeta
    du -sh "$karpeta" 2>/dev/null || echo "Errorea: Karpeta ez da existitzen."
}

fitxategiak_listatu() {
    echo "Fitxategiak:"
    ls
}

fitxategi_bat_sortu() {
    echo "Sartu fitxategiaren izena:"
    read izena
    touch "$izena" && echo "$izena fitxategia sortu da." || echo "Errorea: Ezin da fitxategia sortu."
}

karpeta_sortu() {
    echo "Sartu karpeta izena:"
    read izena
    mkdir "$izena" && echo "$izena karpeta sortu da." || echo "Errorea: Karpeta jada existitzen da."
}

karpeta_fitxategiak_ezabatu() {
    echo "Sartu karpeta edo fitxategiaren izena:"
    read izena
    rm -r "$izena" 2>/dev/null && echo "$izena ezabatu da." || echo "Errorea: Ezin da karpeta edo fitxategia ezabatu."
}

menua_erakutsi() {
    while true; do
        echo -e "\nHautatu aukera bat:"
        echo "1. Karpeta tamaina ikusi"
        echo "2. Fitxategiak listatu"
        echo "3. Fitxategi bat sortu"
        echo "4. Karpeta sortu"
        echo "5. Karpeta eta fitxategiak ezabatu"
        echo "6. Irten"
        read aukera
        case $aukera in
            1) karpeta_tamaina_ikusi ;;
            2) fitxategiak_listatu ;;
            3) fitxategi_bat_sortu ;;
            4) karpeta_sortu ;;
            5) karpeta_fitxategiak_ezabatu ;;
            6) break ;;
            *) echo "Aukera okerra, saiatu berriro." ;;
        esac
    done
}

menua_erakutsi
