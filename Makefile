# Makefile for lttng testing

# Object files
OBJ_FILES = \
	nimcache/hw.o \
	nimcache/hw_tp.o \
	nimcache/hw_ptp.o \
	nimcache/system.o \
	nimcache/rdstdin.o \
	nimcache/readline.o \
	nimcache/rltypedefs.o \
	nimcache/history.o \
	nimcache/times.o \
	nimcache/strutils.o \
	nimcache/parseutils.o \


LIB_FLAGS = -llttng-ust -ldl

# Use gcc to link the object files and the libraries.
# See nimcache/hw.o target below
hw: nimcache/hw.o Makefile
	gcc -o hw $(OBJ_FILES) $(LIB_FLAGS)

# Compile without linking (--noLinking). This is necessary because
# I don't know how to get nim to add the "-llttng-ust" to the command line
# when it links the file together.
nimcache/hw.o: hw.nim hw_ptp.c hw_ptp.h hw_tp.c Makefile
	nim c --noLinking --cincludes=. --listCmd hw.nim

# Convert hw_tp.tp to "C" (i.e. .h and .c files)
hw_tp.c: hw_tp.tp Makefile
	lttng-gen-tp $< -o hw_tp.c -o hw_tp.h

# Clean build artificats
.PHONY: clean
clean:
	@rm -rf hw nimcache hw_tp.c hw_tp.h
