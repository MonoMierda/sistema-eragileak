# Baimenak Linux
- [Baimenak Linux](#baimenak-linux)
  - [Fitxategi eta direktorioen baimenak](#fitxategi-eta-direktorioen-baimenak)
    - [Baimen taldeak](#baimen-taldeak)
    - [Baimenak esleitzen modu sinbolikoan](#baimenak-esleitzen-modu-sinbolikoan)
    - [Baimenak modu oktalean](#baimenak-modu-oktalean)
  - [Sticky bit baimena](#sticky-bit-baimena)
  - [SUID eta GUID baimenak](#suid-eta-guid-baimenak)
    - [SUID](#suid)
  - [Ezaugarri bereziak Lsattr eta chattr](#ezaugarri-bereziak-lsattr-eta-chattr)
- [Ariketak](#ariketak)
  - [Ariketak 1](#ariketak-1)
  - [Ariketak 2](#ariketak-2)
  - [Ariketak 3](#ariketak-3)
  - [Ariketa 4](#ariketa-4)
  - [Ariketa 5](#ariketa-5)
  - [Ariketa 6](#ariketa-6)
  - [Ariketa 7](#ariketa-7)

## Fitxategi eta direktorioen baimenak

Fitxategi eta direktorioen baimenak hurrengo aginduarekin ikusi ditzake

```bash
ls -al
```
![alt text](image.png)

### Baimen taldeak

- **Jabea (user)**: Fitxategi bat sortzen dugunean sortzailea jabea izango da defektuz.
- **Taldea(group)**: Fitxategi baten jabetza talde bati ere bai dagokio.
- **Bestea(other)**: Jabea edo taldekideak ez direnak 

![alt text](image-1.png)

### Baimenak esleitzen modu sinbolikoan

Linux-ek hiru baimen mota nagusi ditu: erabiltzailea (user), taldea (group) eta beste guztiak (others). Baimenak aldatzeko, `chmod` (change mode) komandoa erabiltzen da. Hemen dituzu baimen moten adibideak eta `chmod` komandoaren erabilera:

1. **Erabiltzailea (User)**: Fitxategi edo karpeta bat erabiltzaile bati nola erabiliko zaion zehazteko baimena.

   ```bash
   chmod u+x file.txt
   ```

   Hemen, `u` erabiltzaileari dagozkion baimenak aldatzen dira. `+x` fitxategia exekutagarri bihurtzen du.

2. **Taldea (Group)**: Talde bateko erabiltzaileei nola erabiliko zaie fitxategi edo karpeta bat.

   ```bash
   chmod g-w file.txt
   ```

   Hemen, `g` taldeari dagozkion baimenak aldatzen dira. `-w` idazteko baimena kentzen du.

3. **Beste guztiak (Others)**: Fitxategi edo karpeta bat beste erabiltzaile guztientzako nola erabiliko den zehazteko baimena.

   ```bash
   chmod o+r file.txt
   ```

   Hemen, `o` beste guztiak dagozkion baimenak aldatzen dira. `+r` irakurtzeko baimena ematen du.

Baimenak aldatzeko, erabilera eta sintaxiaren argibide gehiago lortzeko, `man chmod` komandoa erabil dezakezu Linux terminaletik.

Adibidez, jabeari (user) exekutatzeko baimena horrela eman ahal diogu
```bash
chmod u+x text.txt
```
Honela, taldeari eta bestei exekutatzeko eta idazteko baimenak emango diogu
```bash
chmod go+wx text.txt
```

Besteei, irakurtzeko baimena horrela kendu diezaiokegu.
```bash
chmod o-r text.txt
```

### Baimenak modu oktalean

- 0 = 000 = --- = baimenarik gabe 
- 1 = 001 = --X = exekuzio baimena
- 2 = 010 = -W- = idazteko baimena
- 3 = 011 = -WX = idazteko eta exekutatzeko baimena
- 4 = 100 = R-- = irakurtzeko baimena
- 5 = 101 = R-X = irakurtzeko eta exekutatzeko baimena
- 6 = 110 = RW- = irakurtzeko eta idazteko baimena
- 7 = 111 = RWX = irakurtzeko, idazteko eta exekutatzeko baimena

Adibidez baimen guztiak kentzeko 
```bash
chmod 000 text.txt
```

Baimen guztiak gehitzeko
```bash
chmod 777 text.txt
```

Erabiltzaileari baimen guztiak emateko eta besteei edo taldekidei irakurtze eta exekuzio baimenak emateko 
```bash
chmod 755 text.txt
```

## Sticky bit baimena

Sticky bit daukan fitxategi edo direktorio bat bakarrik jabea edo rootek aldatu ahal dio izena edo ezabatu ahal du.

Sticky bita jartzeko 
```bash
chmod +t text.txt
```
Sticky bita kentzeko 
```bash
chmod -t text.txt
```
![alt text](image-2.png)

## SUID eta GUID baimenak

### SUID

SUID aktibatuta dagoenean fitxategi hau exekutatzen duen erabiltzaileak sortzailearen baimenak izango ditu.

```bash
chmod u+s text.txt
```

Sortu exekutable bat root bezala hurrengo edukiarekin eta izenarekin.

suidtext.sh
```bash
#!/bin/bash
echo erabiltzailea
id
echo exekuzio baimen erabiltzailea
echo $EUID
```

Baimenak esleituko dizkiogu fitxategiari
```bash
chmod 755 suidtext.sh
```

Ezarri SUID suidtext.sh fitxategiari

```bash
chmod u+s suidtext.sh
```
```bash
chmod 4755 suidtext.sh
```
Nola idatzi 

## Ezaugarri bereziak Lsattr eta chattr

Ezaugarrri bereziak ikusteko `lsattr` agindua erabiliko dugu.

Ezaugarri bereziak aldatzeko `chattr` agindua erabiliko dugu.

Adibidez i atributoaren fitxategi bat inmutablea bilakatzen digu. Hau esan nahi du inork ezin duela ezabatu, ezta root-ek. Ezabatu nahi izaterakotan, i atributoa kendu beharko genioke lehenago.
```bash
chattr +i text.txt
lsattr text.txt
```

**u** ezaugarriarekin fitxategi bat ezabatzen dugunean datuak gordeta gelditzen dira eta bere berreskurapena ahalbidetzen du.
```bash
chattr +u text.txt
```


**e** ezaugarriarekin fitxategi bat ezabatzen denean, okupatzen zuen memoria zeroekin berridazten da.

```bash
chattr +e text.txt
```

**c** ezaugarriarekin fitxategi bat konprimituta gordeko da.
```bash
chattr +c text.txt
```

**a** ezaugarriarekin fitxategi bati bakarrik gehitu ahal zaizkio gauzak, hau da, ezin da aldatu aurretik zegoen ezer.
```bash
chattr +a text.txt
```

# Ariketak

## Ariketak 1

lotu dagokion baimenarekin: 
  
  - rwx--x--x  711
  - --x-w--wx  123
  - --x-----x  101
  - -wx-wx-wx  333
  - r-xrw-rwx  567
  - rwxrw-r-x  765
  - --xrw--w-  162
  - r--rw--w-  462
  - --xrw---x  161


## Ariketak 2

Zein da fitxategi honen baimenen baimena modu oktalean?
![alt text](image-3.png)

Baimena modu oktalean da 546 


## Ariketak 3

Jarri hurrengo baimenak modu oktalean

- r--r-xrw-   456
- --xr-xr--   154
- r--------   400
- --------x   001
- rwsr-xr-x   4755
- rwxr-sr-x   2755
- r--rw---t   1460

## Ariketa 4

Zer gertatuko da hurrengo agindua exekutatzerakoan?

![](image-4.png)

2. 'Whoami' komandoaren output-a ezin izango da file fitxategian gorde, jabea izan arren, fitxategian esleitutako baimena gailentzen delako


## Ariketa 5 

Nola lortuko zenuke "file" artxiboaren baimenak ikusten den moduan aldatzeko?

![](image-5.png)

chmod 741 file

## Ariketa 6

Zortzitarrean zer baimen esleitu beharko dut artxiboak adierazitako baimenak izan ditzan lortzeko?

![alt text](image-6.png)

chmod 625 file 

## Ariketa 7 

Honako baimen hauek konfiguratuta dituen fitxategi hau ezabatu ahal izango dut?

![alt text](image-7.png)

BAI