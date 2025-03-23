CROSS_COMPILE?=

default: writer

writer.o: writer.c
	$(CROSS_COMPILE)gcc -c writer.c -o writer.o

writer: writer.o
	$(CROSS_COMPILE)gcc writer.o -o writer

clean:
	rm -f writer.o
	rm -f writer
