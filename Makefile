hw: hw.nim hi.c hw.ptp.c hw.tp.c hi.h hw.ptp.h
	nim c --cincludes=. --parallelBuild:1 hw.nim

hw.tp.c: hw.tp.tp
	lttng-gen-tp $< -o hw.tp.c -o hw.tp.h

.PHONY: clean
clean:
	@rm -rf nimcache hw.tp.c hw.tp.h
