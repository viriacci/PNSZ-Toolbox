# Podpis wydania

Wydanie `v1.0.0` jest podpisane certyfikatem self-signed przeznaczonym do Code Signing.

Publiczny certyfikat jest dostępny w katalogu `certs/`. Prywatny klucz PFX jest przechowywany poza repozytorium. Nie należy dodawać go do Git, publicznych załączników ani pipeline'u bez bezpiecznego magazynu sekretów.

## Weryfikacja

```powershell
.\scripts\verify-signature.ps1
```

Brak zaufania do certyfikatu self-signed nie oznacza automatycznie uszkodzenia podpisu. Windows rozróżnia integralność podpisu od zaufania do wydawcy.

## Lokalny trust

Jeżeli certyfikat pochodzi z zaufanej kopii repozytorium lub bezpośrednio od autora:

```powershell
.\scripts\trust-self-signed-cert.ps1
```

Skrypt instaluje wyłącznie publiczną część certyfikatu w magazynach bieżącego użytkownika.

## Następne wydania

Kolejne wersje powinny być podpisywane tym samym prywatnym kluczem, jeśli mają zachować ciągłość self-signed publishera. Przy przejściu na publicznie zaufany certyfikat Code Signing prywatny self-signed PFX można wycofać z procesu wydawniczego.
