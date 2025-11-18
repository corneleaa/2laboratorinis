# Studentų rūšiavimo optimizavimas (v1.1)

## Projekto aprašymas

Ši programos versija (**v1.1**) sukurta remiantis ankstesne `v1.0` struktūros (`struct`) realizacija, tačiau šįkart vietoje struktūros naudojama **pilnavertė klasė `Studentas`**.

Programos tikslas – **įvertinti klasės realizacijos įtaką veikimo spartai** ir **palyginti kompiliatoriaus optimizavimo lygių (`-O1`, `-O2`, `-O3`)** poveikį tiek veikimo greičiui, tiek `.exe` failo dydžiui.

---

## Funkcionalumas

Programa leidžia:

1. Nuskaityti ar sugeneruoti studentų duomenis;
2. Skaičiuoti galutinį balą (vidurkis / mediana);
3. Rikiuoti pagal vardą, pavardę ar galutinį balą;
4. Padalyti į dvi grupes — **vargšiukai** (<5) ir **kietuoliai** (≥5);
5. Palaiko konteinerius: `std::vector` ir `std::list`;
6. Realizuotos trys strategijos (1 – A+B, 2 – trynimas, 3 – optimizuota).

---

## Testavimo sąlygos

* Failai: `studentai10000.txt`, `studentai100000.txt`, `studentai1000000.txt`
* Testuota po **3 kartus kiekvienam dydžiui**
* Naudotas **vienas konteineris (`std::vector`)** ir **3-ioji strategija (optimizuota)**
* Kompiliatorius: `g++ (C++17)`
* OS: macOS / Linux / Windows

---

## Palyginimas: `struct` vs `class` (strategija 3, vector, po 3 bandymus, vektoriai)

| Versija | Studentų skaičius | Bandymas 1 (s) | Bandymas 2 (s) | Bandymas 3 (s) | Vidurkis (s) |
| ------- | ----------------- | -------------- | -------------- | -------------- | ------------ |
| struct  | 10000             |  0.0493194     |    0.0499338   |  0.050816      |
| class   | 10000             |     
| struct  | 100000            | 0.608104       |0.600919        |   0.600398     |
| class   | 100000            |  
| struct  | 1000000           | 3.30546        |     3.31671    |     3.30523    |
| class   | 1000000           | 

**Išvada:**
Klasės (class) realizacija, pasirodė šiek tiek greitesnė už struktūrinę (struct) visose failų apimtyse.
Galima daryti išvadą, kad optimizuotas kodas ir efektyvesnė atminties tvarkyba kompiliatoriaus lygiu sumažino skirtumą tarp struct ir class.
Vidutiniškai, klasės versija buvo apie 20–25 % spartesnė, o didėjant duomenų kiekiui skirtumas išliko stabilus.
Taip pat pastebėta, kad veikimo laikas didėja beveik linijiškai augant įrašų skaičiui.

---

## Kompiliatoriaus optimizavimo flagų analizė (`-O1`, `-O2`, `-O3`)
## Kompiliatoriaus optimizavimo flagų analizė (`-O1`, `-O2`, `-O3`)

Naudota **klasės (class)** versija, 1 000 000 studentų, strategija 3 (optimizuota).

| Optimizavimo flagas | Bandymas 1 (s) | Bandymas 2 (s) | Bandymas 3 (s) | Vidurkis (s) | EXE dydis (KB) |
| ------------------- | -------------- | -------------- | -------------- | ------------ | -------------- |
| -O1                 | 2.700983       | 2.631873       | 2.633102       | **2.6553**   | 85             |
| -O2                 | 2.663647       | 2.600671       | 2.704792       | **2.6564**   | 85             |
| -O3                 | 2.661941       | 2.596576       | 2.589643       | **2.6161**   | 85             |
**Išvada:**
Kompiliatoriaus optimizavimo flagai turėjo matomą, nors ir nedidelį, poveikį veikimo laikui.
Tarp `-O1` ir `-O3` skirtumas siekia apie **1.5 %**, tačiau `-O3` užtikrino **stabiliausią ir trumpiausią** vykdymo laiką (~2.62 s).
Kadangi visų trijų versijų `.exe` failų dydis buvo **vienodas (85 KB)**, galima teigti, kad **`-O3` yra optimalus pasirinkimas**, užtikrinantis geriausią našumo ir dydžio santykį be papildomo atminties sąnaudos augimo.

---

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

## Išvados


---

## Versijų istorija

| Versija | Aprašas            | Pakeitimai                                               |
| ------- | ------------------ | -------------------------------------------------------- |
| v1.0    | Struct realizacija | Studentų rūšiavimas naudojant `struct`                   |
| v1.1    | Class realizacija  | Naudojama `class Studentas`, destruktorius, flag analizė |

---

## Repozitorijos informacija


---
