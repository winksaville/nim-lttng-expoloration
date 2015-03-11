# Makefile for lttng testing

# Use gcc to link the object files and the libraries.
# See nimcache/hw.o target below
hw: nimcache/hw.o Makefile
	gcc -o hw  nimcache/system.o nimcache/hw.o nimcache/hw_ptp.o nimcache/hw_tp.o nimcache/hi.o -llttng-ust -ldl

# Compile without linking (--noLinking). This is necessary because
# I don't know how to get nim to add the "-llttng-ust" to the command line
# when it links the file together.
nimcache/hw.o: hw.nim hi.c hw_ptp.c hi.h hw_ptp.h hw_tp.c Makefile
	nim c --noLinking --cincludes=. --listCmd hw.nim

# Convert hw_tp.tp to "C" (i.e. .h and .c files)
hw_tp.c: hw_tp.tp Makefile
	lttng-gen-tp $< -o hw_tp.c -o hw_tp.h

# Clean build artificats
.PHONY: clean
clean:
	@rm -rf hw nimcache hw_tp.c hw_tp.h
