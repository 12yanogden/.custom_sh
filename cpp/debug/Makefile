CC = g++
CFLAGS = -g -Wall
LDFLAGS = -lpthread

all: libs div

libs: libs.cpp
	$(CC) $(CFLAGS) libs.cpp -o libs
	chmod 775 libs

div: div.cpp
	$(CC) $(CFLAGS) div.cpp -o div
	chmod 775 div
