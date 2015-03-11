hw: hw.nim hi.c hw_ptp.c hi.h hw_ptp.h hw_tp.c
	nim c --cincludes=. --parallelBuild:1 hw.nim

hw_tp.c: hw_tp.tp
	lttng-gen-tp $< -o hw_tp.c -o hw_tp.h

.PHONY: clean
clean:
	@rm -rf hw nimcache hw_tp.c hw_tp.h
