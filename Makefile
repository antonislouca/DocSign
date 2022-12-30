###############################################
# Makefile for compiling the program skeleton
# 'make' build executable file 'PROJ'
# 'make doxy' build project manual in doxygen
# 'make all' build project + manual
# 'make clean' removes all .o, executable and doxy log
###############################################
PROJ = docsign # the name of the project
CC = gcc # name of compiler
DOXYGEN = doxygen # name of doxygen binary
# define any compile-time flags
CFLAGS = -std=c99  -Wall -O -Wuninitialized -Wunreachable-code -pedantic -DV   # there is a space at the end of this
LFLAGS = -lm -lcrypto 
###############################################
# You don't need to edit anything below this line
###############################################
# list of object files
# The following includes all of them!
C_FILES := $(wildcard *.c)
OBJS := $(patsubst %.c, %.o, $(C_FILES))
# To create the executable file we need the individual
# object files
$(PROJ): $(OBJS)
	$(CC)  -o $(PROJ) $(OBJS) $(LFLAGS)
# To create each individual object file we need to
# compile these files using the following general
# purpose macro
.c.o:
	$(CC) $(CFLAGS) -c $<
# there is a TAB for each identation.
# To make all (program + manual) "make all"
all :
	make
	make doxy
	make lib
# To make all (program + manual) "make doxy"
doxy:
	$(DOXYGEN) Des.conf &> Des.log

lib:	
	ar -cvq libc.a f1.o f2.o
# To clean .o files: "make clean"
clean:
	rm -rf *.o doxygen.log html
