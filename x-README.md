# Hack for unofficial-builds

Additionnal features:
- add missing recipe: x64-glibc-217 [PR-69](https://github.com/nodejs/unofficial-builds/pull/69)
- allow to build in place from a personal computer
- allow to build behind corporate proxies

To configure a proxy, simply set `http_proxy` and `https_proxy`:

```sh
$ export http_proxy=http://127.0.0.1:8888
$ export https_proxy=http://127.0.0.1:8888
```

To choose to build only recipe `x64-glibc-217`:
```sh
$ ./x-recipes.sh x64-glibc-217
```

To build docker images for choosed recipes, which name are all starting with `unofficial-build-recipe-`: 
```sh
$ ./x-prepare.sh
```

Now we should have 2 dockers images:
- `unofficial-build-recipe-fetch-source:latest`
- `unofficial-build-recipe-x64-glibc-217:latest`

To start building nodejs `v18.14.2` for each choosen recipes:
```sh
$ ./x-build.sh v18.14.2
```

To restore all recipes:
```sh
$ ./x-recipes.sh all
```

## Notes

If shasum is not available, build.sh will fail at the very end, this should not be a problem.
Else, install shasum (perl-Digest-SHA rpm on centos/rhel).

If npx is not available, build.sh will fail at the very end, this should not be a problem.
