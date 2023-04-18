# Notes

* When updating `icu`, you will need to generate the `icudtXXl.dat` file. The `build_icusources.sh` script will handle generating the file. After that make sure to run the following commands:

```bash
cp $ICU_ROOT/tmp/build/data/out/icudt64l.dat $ICU_ROOT/icuSources/data/out/icudt64l.dat
xz -z $ICU_ROOT/icuSources/data/out/icudt64l.dat
```
