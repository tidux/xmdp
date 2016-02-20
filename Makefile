
CC = gcc
CFLAGS = -O3 -Wall
LD = gcc
LDFLAGS =
LIBS = -L../../lib -lxmp -lm

ifeq (Darwin,$(shell uname -s))
	LDFLAGS := -framework Cocoa -lSDLmain
endif

.c.o:
	$(CC) -c -o $*.o $(CFLAGS) $<

all: xmdp

xmdp: mdp.o graphics.o parse.o font1.o font2.o
	$(LD) -o $@ $(LDFLAGS) $+ -lSDL $(LIBS)

clean:
	rm -f core *.o *~

graphics.o parse.o mdp.o: mdp.h
