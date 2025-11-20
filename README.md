# Studentų informacinė sistema (v1.2)

Ši programa realizuoja pilnai funkcionalią **Studentas** klasę, atitinkančią trijų metodų taisyklę (*Rule of Three*) ir turinčią perdengtus įvesties/išvesties operatorius (`operator>>`, `operator<<`). Sistemoje įgyvendinti trys duomenų įvedimo būdai (rankinis, iš failo ir automatinis generavimas) bei du išvedimo būdai (į ekraną ir į failą).

Programa palaiko `std::vector` ir `std::list` konteinerius, rikiavimą pagal vardą, pavardę arba galutinį balą, tris skaidymo strategijas bei pateikia veikimo laiko matavimus (skaitymas, rikiavimas, skaidymas, rašymas). Ši versija atitinka visus v1.2 reikalavimus ir yra parengta testavimui bei demonstravimui.

---

# 1. Studentas klasė ir Rule of Three

Klasėje įgyvendinti šie trys specialieji metodai:

- **Copy constructor**
- **Copy assignment operator**
- **Destructor**

Rule of three veikimas
Studentas a;
Studentas b = a;
Studentas c;
c = a;
**2. Įvesties ir išvesties operatoriai**
operator>>
Nuskaito studento:
vardą
pavardę
5 namų darbus
egzaminą
iškart perskaičiuoja galutinį balą
operator<<
Gražiai suformatuotai išveda į ekraną ar į failą:

Vardas      Pavarde     Galutinis

**Išvada**
<img width="350" height="374" alt="Screenshot 2025-11-20 at 16 16 48" src="https://github.com/user-attachments/assets/ade0f416-0722-43e0-b85c-259a31407736" />

<img width="476" height="374" alt="Screenshot 2025-11-20 at 16 16 00" src="https://github.com/user-attachments/assets/10019093-4a90-4785-96ec-bfd997c5951a" />
<img width="387" height="372" alt="Screenshot 2025-11-20 at 16 19 57" src="https://github.com/user-attachments/assets/59996a14-5968-4198-9267-c47d14f08d7f" />
<img width="476" height="374" alt="Screenshot 2025-11-20 at 16 16 00" src="https://github.com/user-attachments/assets/55aeed0d-57c1-453b-9028-9d40b0950182" />

Programa pilnai realizuoja Studentas klasę ir visus v1.2 funkcionalumus, užtikrina patikimą duomenų apdorojimą bei leidžia atlikti efektyvią studentų analizę pagal įvairius kriterijus.

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

