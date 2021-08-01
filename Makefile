CC = gcc
FILES = main.c
CFLAGS = -Wall -Wextra -ansi -Wpedantic

OUTPUT = scc

all: build run clean

build:
	$(CC) $(CFLAGS) $(FILES) -o $(OUTPUT)

run:
	./$(OUTPUT)

clean:
	rm -f $(OUTPUT)
