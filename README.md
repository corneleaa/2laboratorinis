# v1.5 Studentų Valdymo Sistema  
Ši projekto versija įgyvendina paveldėjimą, abstrakčią bazinę klasę *Zmogus*, iš jos išvestinę klasę *Studentas*, ir pilnai palaiko visą v1.2 logikos architektūrą: failų generavimą, skaitymą, rūšiavimą, strategijas, konteinerių pasirinkimą ir galutinio balo skaičiavimą pagal vidurkį arba medianą. Kodas papildytas Rule of Three realizacija ir išsamiai dokumentuotas.

## Abstrakti klasė *Zmogus*
v1.5 versijoje *Zmogus* tampa bazine abstrakčia klase, skirta bendriems laukams aprašyti (vardas, pavardė). Jos objekto sukurti nebegalima, nes klasėje yra grynoji virtuali funkcija:
```cpp
virtual void spausdinti(std::ostream& os) const = 0;
```
Tai reiškia, kad ši klasė tik apibrėžia bendrą sąsają visoms išvestinėms klasėms, bet pati negali egzistuoti kaip atskiras objektas. Bandant sukurti:
```cpp
Zmogus z; 
```
kompiliatorius pateikia klaidą. Ši ekrano nuotrauka pateikiama kataloge *screenshots/* ir yra naudojama įrodyti, kad abstraktumas realizuotas teisingai.

<img width="880" height="143" alt="Screenshot 2025-11-27 at 00 09 35" src="https://github.com/user-attachments/assets/2cb5fa44-4763-4209-8458-43a9c430ce0d" />

## Išvestinė klasė *Studentas*
Klasė *Studentas* paveldi *Zmogus* laukus ir papildo juos namų darbų masyvu, egzaminu ir galutinio balo logika. Kadangi klasė saugo dinamiškus duomenis (vector<int>), realizuota Rule of Three:
* kopijavimo konstruktorius,
* priskyrimo operatorius,
* destruktorius.

Šie metodai užtikrina taisyklingą objektų kopijavimą ir resursų atlaisvinimą. Main funkcijoje specialiai įtrauktas Rule of Three demonstravimas:
```cpp
Studentas a;
Studentas b = a; 
Studentas c;
c = a;
```
Tokiu būdu tikrinama, ar kopijavimo mechanizmas veikia korektiškai.

## Programos veikimas ir 1.2 logikos išlaikymas
Programa išlaiko identišką funkcionalumą kaip v1.2: galima generuoti failą, įvesti duomenis ranka arba skaityti iš jau esančio failo. Po duomenų nuskaitymo vartotojas gali pasirinkti, kaip skaičiuoti galutinį balą: pagal vidurkį, medianą arba abu. Tada prašoma pasirinkti konteinerio tipą (vector arba list), rikiavimo kriterijų ir strategiją, pagal kurią išskirstomi studentai į vargšiukus ir kietuolius.

## Naudojami algoritmai ir strategijos
Visi ankstesni suskirstymo metodai yra palikti:
* A+B kopijavimo metodas,
* pašalinimo iš bendros grupės metodas,
* optimizuota greičiausia strategija su `std::remove_if`.

Failų nuskaitymas atliekamas generiškai naudojant šabloninę funkciją `nuskaitytiIsFailoT`, leidžiančią naudoti tiek vector, tiek list konteinerius. Rezultatai automatiškai išvedami į katalogą *results/*.

## Lentelė: Programos komponentai v1.5
| Komponentas | Aprašymas |
|------------|-----------|
| **Zmogus** | Abstrakti bazinė klasė su grynąja virtualia funkcija |
| **Studentas** | Paveldėta klasė su ND, egzaminu ir galutinio balo logika |
| **Rule of Three** | Kopijavimo konstruktorius, operator=, destruktorius |
| **Failų skaitymas/generavimas** | Įgyvendinta identiškai kaip v1.2, išlaikant suderinamumą |
| **Rūšiavimas** | Pagal vardą, pavardę, galutinį balą |
| **Strategijos** | A+B, šalinimo, optimizuota su remove_if |
| **Konteineriai** | vector, list |
| **Abstraktumo demonstracija** | Kompiliatoriaus klaidos nuotrauka README |

## Programos paleidimas
Programą galima paleisti terminale:
```
make
./programa
```
Paleidimo metu vartotojas mato meniu, kuriame pasirenka režimą, konteinerį, strategiją, rikiavimo būdą ir galutinio balo skaičiavimo metodą. Visi rezultatai įrašomi į *results/* aplanką.

## Išvados
v1.5 versija pilnai įgyvendina objektiškai orientuotą architektūrą, paremtą paveldėjimu ir abstrakčiomis klasėmis, išlaiko visą ankstesnę projekto logiką ir papildo ją aiškia struktūra bei tvarkinga Studentas klasės resursų vadyba. Programa veikia greitai, stabiliai ir yra lengvai plečiama ateities versijoms.


## Techninė aplinka

| Parametras     | Reikšmė                                                     |
| -------------- | ----------------------------------------------------------- |
| CPU            | Apple M1 / Intel i5 / kt.                                   |
| RAM            | 8 GB                                                        |
| OS             | macOS 13.5 / Windows 11 / Ubuntu 24.04                      |
| Kompiliatorius | g++ 13.1.0 (C++17)                                          |
| Build flags    | `-std=c++17 -O3`                                            |
| Failų kiekis   | 4 (`main.cpp`, `Studentas.cpp`, `Studentas.h`, `mediana.h`) |

---

## Versijų istorija

| Versija | Aprašas            | Pakeitimai                                               |
| ------- | ------------------ | -------------------------------------------------------- |
| v1.0    | Struct realizacija | Studentų rūšiavimas naudojant `struct`                   |
| v1.1    | Class realizacija  | Naudojama `class Studentas`, destruktorius, flag analizė |
| v1.2    | Rule of three      | įvedama Rule of three, persidengimo operatoriai          |

---

