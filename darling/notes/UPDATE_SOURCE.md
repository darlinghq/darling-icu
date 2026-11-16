# Notes

* When updating `icu`, you will need to generate the `icudtXXl.dat` file. The `build_icusources.sh` script will handle generating the file. After that make sure to run the following commands:

```bash
cp $ICU_ROOT/tmp/build/data/out/icudt64l.dat $ICU_ROOT/icuSources/data/out/icudt64l.dat
xz -z $ICU_ROOT/icuSources/data/out/icudt64l.dat
```

## ICU 78.1 data (`icudt78l.dat.xz`)

`icuSources/data/out/icudt78l.dat.xz` is not built from these sources. It is the unmodified
`icudt78l.dat` from the official ICU 78.1 release (Unicode License v3, text in
`icuSources/data/out/icudt78l.LICENSE`), installed next to `icudt66l.dat` so that ICU 78 clients
find the file they open by name. This libicucore (ICU 66) never reads it.

* Source: `https://github.com/unicode-org/icu/releases/download/release-78.1/icu4c-78.1-data-bin-l.zip`
  (`l` is the little-endian common `.dat` package)
* zip SHA-512: `bac376c4f3f3d9a2cdf05ec8ae6b95697bf00f86bd41b652258f088503a239bc458a4e3fd5e0eed0dfc449de83266c610c5057e300c924ba54f8b23befa514fb`
  (equals the `icu4c-78.1-data-bin-l.zip` line of the release's `SHASUM512.txt`)
* `icudt78l.dat` SHA-256: `6f7f2d12e726f02391d4c6a906e3f0b0af48062d54da22961d57292455fa1c30`
* Recipe: unzip, then `xz -9e -c icudt78l.dat > icuSources/data/out/icudt78l.dat.xz`
