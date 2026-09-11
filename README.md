# PNSZ Toolbox

**PNSZ Toolbox** to desktopowy zestaw narzędzi dla Windows, zebrany w jednym oknie i jednej bazie danych. Wersja `1.0.0` ma sześć modułów, konta użytkowników, jasny i ciemny motyw oraz lokalne przechowywanie danych.

> **Wersja:** 1.0.0  
> **Autor:** PanSzczesniak  
> **System:** Windows 10/11 x64  
> **UI:** WebView2

## Moduły

| Moduł | Do czego służy |
| --- | --- |
| **Generator PDF** | Tworzenie dokumentów PDF na bazie gotowych lub własnych szablonów. |
| **Biblioteka** | Lokalna baza instrukcji i materiałów z wyszukiwaniem. |
| **Zegar** | Ewidencja czasu i rodzajów dni. |
| **Sticknotes** | Notatki z formatowaniem, przeciąganiem i opcjonalnym PIN-em. |
| **To-do** | Zadania z terminem, kontaktem i opcjonalnym adresem WWW. |
| **Atlas** | Przeglądarka osadzona w aplikacji; domyślną kartą jest Google. |

## Co jest w 1.0.0

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

## Uruchomienie

Gotowy build znajduje się w paczce wydania `PNSZ_Toolbox_v1.0.0_signed_release.zip`. Aplikacja nie wymaga instalatora.

WebView2 Runtime jest standardowo obecny w aktualnych Windows 10 i Windows 11. Jeżeli Atlas nie uruchamia stron, warto w pierwszej kolejności sprawdzić właśnie WebView2 Runtime.

Przy pierwszym uruchomieniu dostępne jest konto `Admin` bez hasła. Hasło administratora można ustawić później w aplikacji.

## Podpis cyfrowy

Build `v1.0.0` jest podpisany certyfikatem **self-signed**:

- `Subject: CN=PNSZ Toolbox, O=PanSzczesniak`,
- RSA / SHA-256,
- EKU: Code Signing,
- ważność: 2026–2036,
- SHA-256 certyfikatu: `D2E94CBBE08400B3C6D1843671B4DB4345CE6F218B46E4381D333451DD3A1B59`.

Publiczny certyfikat jest częścią projektu. Prywatny PFX **nie jest publikowany w repozytorium**. Ten plik pozwala podpisywać kolejne wydania, więc jego upublicznienie unieważniłoby sens całego podpisu szybciej niż zdążyłby zareagować SmartScreen.

Self-signed potwierdza integralność pliku i ciągłość klucza wydawcy. Nie daje automatycznego zaufania Windows ani reputacji SmartScreen.

Weryfikacja na Windows:

```powershell
Get-AuthenticodeSignature .\PNSZ_Toolbox_v1.0.0.exe | Format-List *
```

SHA-256 podpisanego EXE:

```text
8bc489a4531f088db3dded1989f75d4253689253c77ed681ba3ecfec479d4e23
```

## Dane

Dane aplikacji trafiają do lokalnego katalogu PNSZ Toolbox. Moduły korzystają z jednej bazy. PNSZ Toolbox nie wymaga konta w zewnętrznej usłudze do działania podstawowych modułów.

Atlas otwiera zwykłe strony internetowe, więc jego karty korzystają z sieci na takich samych zasadach jak przeglądarka.

## Build

Wymagania:

- Python 3,
- Go 1.23+,
- Windows target `amd64`.

Podstawowy build:

```powershell
python source/build.py
```

Skrypt pakuje moduły HTML, osadza shell w Core, uruchamia `go vet` i buduje launcher Windows. Podpis cyfrowy jest osobnym etapem. Prywatny klucz nie jest zaszyty w kodzie ani w buildzie.

## Struktura projektu

```text
PNSZ-Toolbox/
├─ certs/                  publiczny certyfikat Code Signing
├─ docs/                   changelog, audyt i informacje o podpisie
├─ scripts/                narzędzia do kontroli podpisu
├─ source/                 kod aplikacji
└─ README.md
```

Kod źródłowy obejmuje Generator PDF, Bibliotekę, Zegar, Sticknotes, To-do, Atlas, shell, launcher i referencyjne źródło hosta Atlasu.

## Kontrola integralności

Dane podpisu i hashe wydania są zapisane w `docs/SIGNATURE_INFO.txt`. Repozytorium nie zawiera prywatnego klucza Code Signing.

## Status

`v1.0.0` jest pierwszym wydaniem z uniwersalnym brandingiem PNSZ. Zmiany są sprawdzane pod kątem zgodności z bazą i istniejącymi modułami przed wejściem do wydania.
