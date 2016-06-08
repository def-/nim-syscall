# Package

version       = "0.1"
author        = "Dennis Felsing"
description   = "Raw system calls for Nim"
license       = "MIT"

srcDir        = "src"

# Dependencies

requires "nim >= 0.10.3"

task tests, "Test syscall":
  exec "nim c -r src/syscall"
