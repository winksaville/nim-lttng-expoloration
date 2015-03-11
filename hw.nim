{.compile: "./hw_tp.c".}
{.compile: "./hw_ptp.c".}

import rdstdin

# C externs
proc ptp_hw_tp1(int_arg: int, string_arg: cstring) {.importc, header: "hw_ptp.h".}

# A global counter for delay loop
var
  gInt: int64 = 0

# Read from stdin so we can start a lttng session
discard readLineFromStdin "Press enter to contine: "

# Emit the hw_tp1 public tracepoint
ptp_hw_tp1(1, "a")

# Delay
var loops = 1
for i in 1..loops:
  for j in 1..100_000_000:
    gInt += 1

# Emit a second hw_tp1 public tracepoint
ptp_hw_tp1(2, "b")

# We're done
echo "done gInt=" & $gInt

