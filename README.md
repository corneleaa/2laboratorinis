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
| struct  | 10000             |  0.0493194     |    0.0499338   |  0.050816      | 0.050023     |
| class   | 10000             | 0.167645       |   0.163228     |    0.162441    | 0,164438     |
| struct  | 100000            | 0.608104       |0.600919        |   0.600398     | 0.603141     |
| class   | 100000            | 1.616947       |  1.607257      |   1.604870     | 1.609691     |
| struct  | 1000000           | 3.30546        |     3.31671    |     3.30523    | 3.09133      |
| class   | 1000000           | 11.184668      |  11.123527     |     11.141683  | 11.149959    |

**Išvada:**
Palyginus struct ir class realizacijų veikimo spartą naudojant tą pačią aplinką, tą patį konteinerį (vector), tą pačią dalijimo strategiją (strategija Nr. 3) ir identiškus įvesties failus, matyti ryški ir nuosekli tendencija: struktūra visais atvejais yra reikšmingai greitesnė už klasę.
---

## Kompiliatoriaus optimizavimo flagų analizė (`-O1`, `-O2`, `-O3`)
## Kompiliatoriaus optimizavimo flagų analizė (`-O1`, `-O2`, `-O3`)

Naudota **klasės (class)** versija, 1 000 000 studentų, strategija 3 (optimizuota).

| Optimizavimo flagas | Bandymas 1 (s) | Bandymas 2 (s) | Bandymas 3 (s) | Vidurkis (s) | EXE dydis (KB) |
| ------------------- | -------------- | -------------- | -------------- | ------------ | -------------- |
| -O1                 | 2.827848       | 2.696453       | 2.727201       | **2.750501** | 85             |
| -O2                 | 2.727996       | 2.645678       | 2.653861       | **2.675845** | 85             |
| -O3                 | 2.675905       | 2.679350       | 2.580973       | **2.645409** | 85             |
**Išvada:**
Atlikus programos veikimo laiko analizę su skirtingais kompiliatoriaus optimizavimo flagais (-O1, -O2, -O3), matyti, kad optimizavimo lygis turi aiškią ir nuoseklią įtaką bendram veikimo greičiui. Mažiausią greitį demonstravo versija, sukompiliuota naudojant -O1 flagą, kadangi šis atliko tik bazines optimizacijas. Naudojant -O2 našumas pagerėjo, o -O3 suteikė dar šiek tiek papildomo greičio dėl agresyvesnių optimizavimo technikų
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

## Versijų istorija

| Versija | Aprašas            | Pakeitimai                                               |
| ------- | ------------------ | -------------------------------------------------------- |
| v1.0    | Struct realizacija | Studentų rūšiavimas naudojant `struct`                   |
| v1.1    | Class realizacija  | Naudojama `class Studentas`, destruktorius, flag analizė |

---

