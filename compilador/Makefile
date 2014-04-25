CC = gcc
OPTIONS =  -g -I ./.
LIBS =
OBJS = condacto.o errores.o generar.o lexico.o objetos.o procesos.o salidas.o sintacti.o spg.o textos.o vocabula.o cfgvars.o

all: spg

spg: $(OBJS) config.h
	$(CC) $(OPTIONS) -o spg $(OBJS) $(LIBS)

config.h:
	touch config.h

clean:
	rm -f *~ *.o spg

.c.o:
	$(CC) $(OPTIONS) -c $?
