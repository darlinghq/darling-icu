# Notes

The tree is Apple's ICU release as published at
https://github.com/apple-oss-distributions/ICU, unmodified, plus Darling's
`darling/` directory. `icuSources` links to `icu/icu4c/source`, the path at
which Darling's build and SDK find the ICU sources and headers.

* `darling/CMakeLists.txt` builds libicucore. Its source list,
  `darling/icucore_sources.cmake`, holds the sources of the objects that Apple's
  makefile links into the library (`stubdata`, `common`, `i18n` and `io`); after
  updating the sources, regenerate it from the object files of a host build
  (below) and check the flags against the `CFLAGS`/`CXXFLAGS` of the makefile.
* The data package `darling/data/icudtXXl.dat.xz` is built from these sources.
  Run `darling/scripts/build_icusources.sh`; it builds ICU on the host and
  leaves the package in `tmp/build/data/out`. Then:

```bash
xz -9e -c tmp/build/data/out/icudt78l.dat > darling/data/icudt78l.dat.xz
```

  The `.xz` file is stored in git LFS (see `.gitattributes`).

## ICU-76142.4.7 (macOS 26.4)

ICU 78.1. `icudt78l.dat` SHA-256:
`aaa258f9b1727443c4297da7120ba26b2d8382608e7a41297d8b49e530e811c3`.
