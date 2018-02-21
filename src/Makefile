# Compiler settings
##########################################################################
CC      = gcc
CFLAGS  = -c -Wall -W -ansi -pedantic -O3
LFLAGS  = -s
CFLAGS_EXE = -c -Wall -w -O3 -s

# Library building settings
##########################################################################
MKLIB    = ar
LIBFLAGS = -rcs
LIBNAME  = libbcl.a

# Library object files
##########################################################################
LIBOBJS = rle.o shannonfano.o huffman.o rice.o lz.o

# Default build option
##########################################################################
all: $(LIBNAME) bfc bcltest

$(LIBNAME): $(LIBOBJS)
	$(MKLIB) $(LIBFLAGS) $(LIBNAME) $(LIBOBJS)

# Executable building rule
##########################################################################
bfc: bfc.o $(LIBNAME)
	$(CC) $(LFLAGS) bfc.o $(LIBNAME) -o bfc

bcltest: bcltest.o systimer.o $(LIBNAME)
	$(CC) $(LFLAGS) bcltest.o systimer.o $(LIBNAME) -o bcltest

# Library object compiler rules
##########################################################################
rle.o: rle.c rle.h
	$(CC) $(CFLAGS) rle.c

shannonfano.o: shannonfano.c shannonfano.h
	$(CC) $(CFLAGS) shannonfano.c

huffman.o: huffman.c huffman.h
	$(CC) $(CFLAGS) huffman.c

rice.o: rice.c rice.h
	$(CC) $(CFLAGS) rice.c

lz.o: lz.c lz.h
	$(CC) $(CFLAGS) lz.c

##########################################################################
# Executable compiler rules
##########################################################################
bfc.o: bfc.c rle.h shannonfano.h huffman.h rice.h lz.h
	$(CC) $(CFLAGS_EXE) bfc.c

bcltest.o: bcltest.c rle.h shannonfano.h huffman.h rice.h lz.h systimer.h
	$(CC) $(CFLAGS_EXE) bcltest.c

systimer.o: systimer.c
	$(CC) $(CFLAGS_EXE) systimer.c
