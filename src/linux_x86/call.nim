import nr

proc syscall*(n: Number): clong {.inline.} =
  {.emit: """asm volatile(
    "int $0x80" : "=a"(`result`)
                : "a"((long)`n`)
                : "memory", "cc");""".}

proc syscall*(n: Number, a1: any): clong {.inline.} =
  {.emit: """asm volatile(
    "int $0x80" : "=a"(`result`)
                : "a"((long)`n`), "b"((long)`a1`)
                : "memory", "cc");""".}

proc syscall*(n: Number, a1, a2: any): clong {.inline.} =
  {.emit: """asm volatile(
    "int $0x80" : "=a"(`result`)
                : "a"((long)`n`), "b"((long)`a1`), "c"((long)`a2`)
                : "memory", "cc");""".}

proc syscall*(n: Number, a1, a2, a3: any): clong {.inline.} =
  {.emit: """asm volatile(
    "int $0x80" : "=a"(`result`)
                : "a"((long)`n`), "b"((long)`a1`), "c"((long)`a2`),
                   "d"((long)`a3`)
                : "memory", "cc");""".}

proc syscall*(n: Number, a1, a2, a3, a4: any): clong {.inline.} =
  {.emit: """asm volatile(
    "int $0x80" : "=a"(`result`)
                : "a"((long)`n`), "b"((long)`a1`), "c"((long)`a2`),
                  "d"((long)`a3`), "S"((long)`a4`)
                : "memory", "cc");""".}

proc syscall*(n: Number, a1, a2, a3, a4, a5: any): clong {.inline.} =
  {.emit: """asm volatile(
    "int $0x80" : "=a"(`result`)
                : "a"((long)`n`), "b"((long)`a1`), "c"((long)`a2`),
                  "d"((long)`a3`), "S"((long)`a4`), "D"((long)`a5`)
                : "memory", "cc");""".}

#proc syscall*(n: Number, a1, a2, a3, a4, a5, a6: any): clong {.inline.} =
#  discard # TODO
