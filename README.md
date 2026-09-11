# PNSZ Toolbox

**PNSZ Toolbox** to desktopowy zestaw narzędzi dla Windows, zebrany w jednym oknie i jednej lokalnej bazie danych. Wersja `1.0.5` zawiera sześć modułów, obsługę wielu użytkowników, jasny i ciemny motyw oraz lokalne przechowywanie danych.

> **Wersja:** 1.0.5  
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

## Co jest w 1.0.5

Największa zmiana w `1.0.5` dotyczy Generatora PDF. Pięć wbudowanych szablonów dostało pełny redesign w kierunku **Corporate Elegant / Executive Minimal**.

- nowe, ciemniejsze nagłówki dokumentów,
- wyraźniejsza hierarchia typografii,
- mniej ramek i pól typu box,
- lżejsze tabele,
- nowe pola podkreślane,
- poprawione odstępy i podpisy,
- spójny wygląd podglądu i finalnego PDF,
- rewizja wbudowanych szablonów podniesiona do `105`,
- zachowane poprawki przełączania szablonów oraz przycisków **Nowy**, **Edytuj** i **Kopiuj**.

## Generator PDF

Generator zawiera pięć szablonów startowych:

- **Notatka służbowa** — granatowy styl executive,
- **Protokół spotkania** — fioletowy styl corporate,
- **Raport statusowy** — ciemnozielony styl raportowy,
- **Wniosek / zgłoszenie** — ciepły brązowo-pomarańczowy akcent,
- **Karta przekazania zadania** — chłodny niebieski styl operacyjny.

Wbudowane szablony są aktualizowane bez kasowania własnych szablonów użytkownika.

## Funkcje

- logowanie wielu użytkowników i konto administratora,
- avatar zapisany w danych aplikacji, bez zależności od pliku źródłowego,
- Generator PDF z wbudowanymi i własnymi szablonami,
- awaryjny wybór nowej lokalizacji, gdy zapamiętana ścieżka zapisu PDF jest niedostępna,
- formatowanie Sticknotes: pogrubienie, kursywa, podkreślenie, przekreślenie oraz listy,
- zabezpieczanie Sticknotes PIN-em,
- link WWW w To-do,
- przewodnik po modułach z możliwością trwałego ukrycia,
- osobny katalog danych dla PNSZ Toolbox,
- Atlas oparty o WebView2 z własnym hostem kart.

## Uruchomienie

Aplikacja jest przenośnym plikiem EXE i nie wymaga instalatora.

WebView2 Runtime jest standardowo obecny w aktualnych Windows 10 i Windows 11. Jeżeli Atlas nie uruchamia stron, warto w pierwszej kolejności sprawdzić Microsoft Edge WebView2 Runtime.

Przy pierwszym uruchomieniu dostępne jest konto `Admin` bez hasła. Hasło administratora można ustawić później w aplikacji.

## Podpis cyfrowy

Build `v1.0.5` jest podpisany tym samym certyfikatem **self-signed Code Signing** co wcześniejsze wydania:

- `Subject: CN=PNSZ Toolbox, O=PanSzczesniak`,
- RSA 3072 / SHA-256,
- EKU: Code Signing,
- ważność: 2026–2036,
- SHA-256 certyfikatu: `D2E94CBBE08400B3C6D1843671B4DB4345CE6F218B46E4381D333451DD3A1B59`.

Publiczny certyfikat znajduje się w `certs/`. Prywatny PFX nie jest publikowany w repozytorium.

Self-signed potwierdza integralność podpisanego pliku i ciągłość klucza wydawcy. Nie daje automatycznego zaufania Windows ani reputacji SmartScreen.

Weryfikacja na Windows:

```powershell
Get-AuthenticodeSignature .\PNSZ_Toolbox_v1.0.5_signed.exe | Format-List *
```

SHA-256 podpisanego EXE:

```text
ded59c992cf05eba1b01deb017146369ec328e783f5bfda75f4307df69ba86f5
```

SHA-256 paczki źródłowej:

```text
392122044a2d30a03ca7545c1f1b23e63b7f6d5d98595dadf0537da8564884d7
```

SHA-256 pełnej paczki wydania:

```text
8ec743ada616f4ea8c82801de013c3a68d15b9a4398f3c160b6e4c8a885afaa0
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
├─ packages/               paczki źródłowe wcześniejszych wydań
├─ scripts/                kontrola podpisu i opcjonalny lokalny trust
└─ README.md
```

## Status

`v1.0.5` jest aktualnym wydaniem PNSZ Toolbox. Ta wersja skupia się na pełnym redesignie pięciu wbudowanych szablonów Generatora PDF oraz zachowaniu stabilności mechaniki edytora i przełączania szablonów.
