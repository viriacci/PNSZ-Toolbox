# PNSZ Toolbox

**PNSZ Toolbox** to desktopowy zestaw narzędzi dla Windows, zebrany w jednym oknie i jednej lokalnej bazie danych. Wersja `1.0.1` zawiera sześć modułów, obsługę wielu użytkowników, jasny i ciemny motyw oraz lokalne przechowywanie danych.

> **Wersja:** 1.0.1  
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

## Co jest w 1.0.1

- Generator PDF automatycznie odtwarza pięć szablonów startowych, jeżeli brakuje ich w bazie,
- Biblioteka używa neutralnego nazewnictwa „dokument” zamiast „instrukcja”,
- moduł czasu nosi nazwę **Zegar** bez numeru wersji w interfejsie i eksporcie,
- poprawione przewijanie listy rodzaju godzin/dnia,
- zaznaczanie tekstu w Sticknotes nie zamyka już okna tworzenia notatki,
- tytuł natywnego okna jest wymuszany na **PNSZ Toolbox**,
- katalog runtime launchera nie używa już nazwy `PNSZ Toolbox Storage1`,
- zachowana poprawka awaryjnego wyboru lokalizacji zapisu PDF z v1.0.0.

## Funkcje

- logowanie wielu użytkowników i konto administratora,
- avatar zapisany w danych aplikacji, bez zależności od pliku źródłowego,
- Generator PDF z neutralnymi szablonami biurowymi,
- awaryjny wybór nowej lokalizacji, gdy zapamiętana ścieżka zapisu PDF jest niedostępna,
- formatowanie Sticknotes: pogrubienie, kursywa, podkreślenie, przekreślenie oraz listy,
- zabezpieczanie Sticknotes PIN-em,
- link WWW w To-do,
- przewodnik po modułach z możliwością trwałego ukrycia,
- osobny katalog danych dla PNSZ Toolbox,
- Atlas oparty o WebView2 z własnym hostem kart.

## Generator PDF

Generator zawiera pięć szablonów startowych:

- Notatka służbowa,
- Protokół spotkania,
- Raport statusowy,
- Wniosek / zgłoszenie,
- Karta przekazania zadania.

W v1.0.1 brakujące szablony są automatycznie odtwarzane również w istniejącej bazie użytkownika.

## Uruchomienie

Aplikacja jest przenośnym plikiem EXE i nie wymaga instalatora.

WebView2 Runtime jest standardowo obecny w aktualnych Windows 10 i Windows 11. Jeżeli Atlas nie uruchamia stron, warto w pierwszej kolejności sprawdzić właśnie WebView2 Runtime.

Przy pierwszym uruchomieniu dostępne jest konto `Admin` bez hasła. Hasło administratora można ustawić później w aplikacji.

## Podpis cyfrowy

Build `v1.0.1` jest podpisany tym samym certyfikatem **self-signed Code Signing** co v1.0.0:

- `Subject: CN=PNSZ Toolbox, O=PanSzczesniak`,
- RSA 3072 / SHA-256,
- EKU: Code Signing,
- ważność: 2026–2036,
- SHA-256 certyfikatu: `D2E94CBBE08400B3C6D1843671B4DB4345CE6F218B46E4381D333451DD3A1B59`.

Publiczny certyfikat znajduje się w `certs/`. Prywatny PFX nie jest publikowany w repozytorium.

Self-signed potwierdza integralność podpisanego pliku i ciągłość klucza wydawcy. Nie daje automatycznego zaufania Windows ani reputacji SmartScreen.

Weryfikacja na Windows:

```powershell
Get-AuthenticodeSignature .\PNSZ_Toolbox_v1.0.1_signed.exe | Format-List *
```

SHA-256 podpisanego EXE:

```text
abb8dd7af6e7d3925afc259fe64bd672964034d19d661f072621166166527f1b
```

## Dane

Dane aplikacji trafiają do lokalnego katalogu PNSZ Toolbox. Moduły korzystają z jednej bazy. PNSZ Toolbox nie wymaga konta w zewnętrznej usłudze do działania podstawowych modułów.

Atlas otwiera zwykłe strony internetowe, więc jego karty korzystają z sieci na takich samych zasadach jak przeglądarka.

## Build

Wymagania dla obecnego procesu budowania:

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
├─ packages/               paczki źródłowe wydań
├─ scripts/                kontrola podpisu i opcjonalny lokalny trust
└─ README.md
```

Paczka źródłowa v1.0.1 znajduje się w:

```text
packages/PNSZ_Toolbox_Source_v1.0.1.zip
```

## Status

`v1.0.1` jest poprawkowym wydaniem PNSZ Toolbox, skupionym na Generatorze PDF, Bibliotece, Zegarze, Sticknotes oraz zachowaniu natywnego okna aplikacji.
