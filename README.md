# PNSZ Toolbox

**PNSZ Toolbox** to desktopowy zestaw narzędzi dla Windows, zebrany w jednym oknie i jednej lokalnej bazie danych.

> **Wersja:** 1.0.71  
> **Autor:** PanSzczesniak  
> **System:** Windows 10/11 x64  
> **UI:** WebView2

## Moduły

| Moduł | Do czego służy |
| --- | --- |
| **Generator PDF** | Tworzenie dokumentów PDF na bazie gotowych lub własnych szablonów. |
| **Biblioteka** | Lokalna baza dokumentów i materiałów z wyszukiwaniem. |
| **Zegar** | Ewidencja czasu i rodzajów dni. |
| **Sticknotes** | Notatki z formatowaniem, przeciąganiem i opcjonalnym PIN-em. |
| **To-do** | Zadania z terminem, kontaktem i opcjonalnym adresem WWW. |
| **Atlas** | Przeglądarka osadzona w aplikacji; domyślną kartą jest Google. |

## Co jest w 1.0.71

`1.0.71` jest małym wydaniem poprawkowym po `1.0.7`.

- **To-do:** rok w polu **Termin** jest ograniczony do maksymalnie czterech cyfr,
- pole ma limit daty do `9999-12-31 23:59`,
- dodatkowa walidacja przycina ręcznie wpisany rok dłuższy niż cztery cyfry,
- zachowane są wszystkie poprawki samouczków z `1.0.7`,
- zachowana jest nowa ikona aplikacji z `1.0.6`.

## Ostatnie większe zmiany

### 1.0.7

- poprawiona kolejność warstw samouczka,
- dialog samouczka pozostaje nad przyciemnieniem i podświetleniem,
- poprawione pozycjonowanie dialogu po scrollowaniu i po załadowaniu iframe,
- poprawiona obsługa kroków wskazujących elementy wewnątrz modułów.

### 1.0.6

- dodane osobne samouczki do wszystkich modułów i Ustawień,
- możliwość ponownego uruchamiania przewodników z menu `?`,
- osobne ustawienie **Nie pokazuj** dla każdego przewodnika,
- nowa ikona aplikacji.

### 1.0.5

- pełny redesign pięciu wbudowanych szablonów Generatora PDF,
- styl Corporate Elegant / Executive Minimal,
- spójny wygląd podglądu i finalnego PDF.

## Generator PDF

Generator zawiera pięć szablonów startowych:

- **Notatka służbowa**,
- **Protokół spotkania**,
- **Raport statusowy**,
- **Wniosek / zgłoszenie**,
- **Karta przekazania zadania**.

Wbudowane szablony są aktualizowane bez kasowania własnych szablonów użytkownika.

## Funkcje

- obsługa wielu użytkowników i konto administratora,
- avatary przechowywane wewnątrz danych aplikacji,
- Generator PDF z wbudowanymi i własnymi szablonami,
- awaryjny wybór nowej lokalizacji zapisu PDF, gdy zapamiętany folder jest niedostępny,
- Biblioteka dokumentów,
- Zegar,
- Sticknotes z formatowaniem tekstu i opcjonalnym PIN-em,
- To-do z terminem, kontaktem i adresem WWW,
- Atlas oparty o WebView2,
- jasny i ciemny motyw,
- samouczki nawigacji, wszystkich modułów i Ustawień,
- lokalne backupy i mechanizmy kontroli integralności danych.

## Uruchomienie

Aplikacja jest przenośnym plikiem EXE i nie wymaga instalatora.

WebView2 Runtime jest standardowo obecny w aktualnych Windows 10 i Windows 11. Jeżeli Atlas nie uruchamia stron, warto sprawdzić Microsoft Edge WebView2 Runtime.

Przy pierwszym uruchomieniu dostępne jest konto `Admin` bez hasła. Hasło administratora można ustawić później w aplikacji.

## Podpis cyfrowy

Build `v1.0.71` jest podpisany tym samym certyfikatem **self-signed Code Signing** co wcześniejsze wydania:

- `Subject: CN=PNSZ Toolbox, O=PanSzczesniak`,
- RSA 3072 / SHA-256,
- EKU: Code Signing,
- ważność: 2026–2036,
- SHA-256 certyfikatu: `D2E94CBBE08400B3C6D1843671B4DB4345CE6F218B46E4381D333451DD3A1B59`.

Publiczny certyfikat znajduje się w `certs/`. Prywatny PFX nie jest publikowany w repozytorium.

Self-signed potwierdza integralność podpisanego pliku i ciągłość klucza wydawcy. Nie daje automatycznego zaufania Windows ani reputacji SmartScreen.

Weryfikacja na Windows:

```powershell
Get-AuthenticodeSignature .\PNSZ_Toolbox_v1.0.71_signed.exe | Format-List *
```

SHA-256 podpisanego EXE:

```text
0fd27942bbc5686e1c61d0c58a00093fabcf47c1d4c3f20339cfc7a990cd96af
```

SHA-256 paczki źródłowej:

```text
24b064e4ffaa6f2564f63b7175992006ddbc4755f75a6c5075ca3d5eb730d61d
```

SHA-256 pełnej paczki wydania:

```text
893e6186bac72ae95dd3e1eda626e8a07be337407c5c8fb5d673230696fc2be6
```

## Dane

Dane aplikacji trafiają do lokalnego katalogu PNSZ Toolbox. Moduły korzystają z jednej bazy. PNSZ Toolbox nie wymaga konta w zewnętrznej usłudze do działania podstawowych modułów.

Atlas otwiera zwykłe strony internetowe, więc jego karty korzystają z sieci na takich samych zasadach jak przeglądarka.

## Build

Wymagania dla procesu budowania:

- Python 3,
- Go 1.23+,
- Windows target `amd64`,
- natywne składniki Core, Atlas Host i WebView2Loader z paczki źródłowej wydania.

Build:

```powershell
python source/build.py
```

Skrypt pakuje moduły HTML, osadza shell w Core, uruchamia `go vet` i buduje launcher Windows. Podpis cyfrowy jest osobnym etapem.

## Repozytorium

```text
PNSZ-Toolbox/
├─ certs/                  publiczny certyfikat Code Signing
├─ docs/                   changelog, audyt i informacje o podpisie
├─ packages/               paczki źródłowe wcześniejszych wydań
├─ scripts/                kontrola podpisu i opcjonalny lokalny trust
└─ README.md
```

## Status

`v1.0.71` jest aktualnym wydaniem PNSZ Toolbox.