# Hack for unofficial-builds

Additionnal features:
- add missing recipe: x64-glibc-217 [PR-69](https://github.com/nodejs/unofficial-builds/pull/69)
- allow to build in place from a personal computer
- allow to build behing corporate proxies

To choose which recipes to build:
./x-recipes.sh recipe...

To build only fetch image:
./x-recipes.sh
./x-prepare.sh

To restore all recipes:
./x-recipes.sh all

To build required docker images
./x-prepare.sh

To start building nodejs for each choosen recipes
./x-build.sh v18.14.2

## Notes

If shasum is not available, build.sh will fail at the very end, this should not be a problem.
Else, install shasum (perl-Digest-SHA rpm on centos/rhel).

If npx is not available, build.sh will fail at the very end, this should not be a problem.
