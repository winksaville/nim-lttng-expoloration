{.compile: "./hi.c".}
#{.compile: "./hw.ptp.c".}

proc hi() : cstring {.importc: "hi".}

echo "hi=" & $hi()

