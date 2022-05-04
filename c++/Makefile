
CXX = g++
CXXFLAGS = -g3 -Wall -Wextra -Werror -Wshadow
LDFLAGS = -g3

all: flights
	./flights

flights: main.o
	$(CXX) $(LDFLAGS) $^ -o $@ 

clean:
	rm -f flights *.o
