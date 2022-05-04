
CC = gcc
CFLAGS = -g3 -Wall -Wextra -Werror
LDFLAGS = -g3

all: flights
	./flights

flights: main.o
	$(CXX) $(LDFLAGS) $^ -o $@ 

clean:
	rm -f flights *.o
