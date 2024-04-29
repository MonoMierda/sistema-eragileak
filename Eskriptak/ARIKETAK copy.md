- [Ariketak](#ariketak)
  - [Ariketa 1](#ariketa-1)
  - [Ariketa 2](#ariketa-2)
  - [Ariketa 3](#ariketa-3)
  - [Ariketa 4](#ariketa-4)
  - [Ariketa 5](#ariketa-5)
  - [Ariketa 6](#ariketa-6)
  - [Ariketa 7](#ariketa-7)



# Ariketak
## Ariketa 1

```bash
#!/bin/bash

echo "zein zara?"
whoami

echo "Non nago?"
pwd
```

## Ariketa 2

```bash
#!/bin/bash
 
echo "Jarri Urtea"
read Urtea

echo "Jarri Hilabetea"
read Hilabetea

cal $Hilabetea $Urtea
```

## Ariketa 3
```bash
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
```

## Ariketa 4

```bash
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
```

## Ariketa 5
```bash

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
```

## Ariketa 6
```bash
#!/bin/bash


echo "Sartu fitxategiaren izena"
read -a fitxategiak

for fitxategia in "${fitxategiak[@]}"; do
    if [ -e "$fitxategia" ]; then
        echo "Fitxategia $fitxategia existitzen da."
        echo "Fitxategiaren Edukia: $fitxategia"
        cat "$fitxategia"
        
    else
        echo "Fitxategia $fitxategia ez da existitzen."
    fi
done
```

## Ariketa 7 

```bash
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

```