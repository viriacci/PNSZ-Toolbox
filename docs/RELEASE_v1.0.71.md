# PNSZ Toolbox v1.0.71

Małe wydanie poprawkowe modułu **To-do**.

## Zmiana

Pole **Termin** ogranicza rok do maksymalnie czterech cyfr.

Mechanizm ma dwie warstwy zabezpieczenia:

- natywny limit pola `datetime-local` do `9999-12-31T23:59`,
- walidację wartości wpisywanej ręcznie, która przycina rok dłuższy niż cztery cyfry.

Pozostałe funkcje aplikacji są zgodne z `v1.0.7`.

## SHA-256

Podpisany EXE:

```text
0fd27942bbc5686e1c61d0c58a00093fabcf47c1d4c3f20339cfc7a990cd96af
```

Paczka źródłowa:

```text
24b064e4ffaa6f2564f63b7175992006ddbc4755f75a6c5075ca3d5eb730d61d
```

Pełna paczka wydania:

```text
893e6186bac72ae95dd3e1eda626e8a07be337407c5c8fb5d673230696fc2be6
```

Certyfikat Code Signing:

```text
D2E94CBBE08400B3C6D1843671B4DB4345CE6F218B46E4381D333451DD3A1B59
```
