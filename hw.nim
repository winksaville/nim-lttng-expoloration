{.compile: "./hi.c".}
{.compile: "./hw_tp.c".}
{.compile: "./hw_ptp.c".}

proc hi() : cstring {.importc: "hi".}

proc ptp_hw_tp1() {.importc: "ptp_hw_tp1".}

var
  gInt: int64 = 0

echo "hi=" & $hi()
ptp_hw_tp1()

var loops = 1
for i in 1..loops:
  for j in 1..100_000_000:
    gInt += 1

ptp_hw_tp1()
echo "hw: done gInt=" & $gInt

