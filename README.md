# Repro of an issue with `tasty-fail-fast`

See https://github.com/MichaelXavier/tasty-fail-fast/issues/5

Run with

```
stack test --test-arguments "--fail-fast --num-threads 1"
```
