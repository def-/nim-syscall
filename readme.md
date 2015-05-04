# Raw System Calls for Nim [![Build Status](https://circleci.com/gh/def-/nim-syscall.png)](https://circleci.com/gh/def-/nim-syscall)

Low level system calls, currently Linux x86 & x86_64 only, but meant to be extended on demand.

## Example

```nimrod
discard syscall(WRITE, 1, cstring("Hello!\n"), 7)
```
