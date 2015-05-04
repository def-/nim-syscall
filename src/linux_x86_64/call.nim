import nr

proc syscall*(n: Number): clong {.inline.} =
  {.emit: """asm volatile(
    "syscall" : "=a"(`result`)
              : "a"((long)`n`)
              : "memory", "r11", "rcx", "cc");""".}

proc syscall*(n: Number, a1: any): clong {.inline.} =
  {.emit: """asm volatile(
    "syscall" : "=a"(`result`)
              : "a"((long)`n`), "D"((long)`a1`)
              : "memory", "r11", "rcx", "cc");""".}

proc syscall*(n: Number, a1, a2: any): clong {.inline.} =
  {.emit: """asm volatile(
    "syscall" : "=a"(`result`)
              : "a"((long)`n`), "D"((long)`a1`), "S"((long)`a2`)
              : "memory", "r11", "rcx", "cc");""".}

proc syscall*(n: Number, a1, a2, a3: any): clong {.inline.} =
  {.emit: """asm volatile(
    "syscall" : "=a"(`result`)
              : "a"((long)`n`), "D"((long)`a1`), "S"((long)`a2`),
                 "d"((long)`a3`)
              : "memory", "r11", "rcx", "cc");""".}

proc syscall*(n: Number, a1, a2, a3, a4: any): clong {.inline.} =
  {.emit: """asm volatile(
    "mov %5, %%r10;"
    "syscall" : "=a"(`result`)
              : "a"((long)`n`), "D"((long)`a1`), "S"((long)`a2`),
                "d"((long)`a3`), "r"((long)`a4`)
              : "memory", "r11", "rcx", "cc");""".}

proc syscall*(n: Number, a1, a2, a3, a4, a5: any): clong {.inline.} =
  {.emit: """asm volatile(
    "mov %5, %%r10;"
    "mov %6, %%r8;"
    "syscall" : "=a"(`result`)
              : "a"((long)`n`), "D"((long)`a1`), "S"((long)`a2`),
                "d"((long)`a3`), "r"((long)`a4`), "r"((long)`a5`)
              : "memory", "r11", "rcx", "cc");""".}

proc syscall*(n: Number, a1, a2, a3, a4, a5, a6: any): clong {.inline.} =
  {.emit: """asm volatile(
    "mov %5, %%r10;"
    "mov %6, %%r8;"
    "mov %7, %%r9;"
    "syscall" : "=a"(`result`)
              : "a"((long)`n`), "D"((long)`a1`), "S"((long)`a2`),
                "d"((long)`a3`), "r"((long)`a4`), "r"((long)`a5`),
                "r"((long)`a6)
              : "memory", "r11", "rcx", "cc");""".}
