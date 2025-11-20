#   Makefile Studentas v1.2

# Kompiliatorius ir flag'ai
CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra

# Failai
SRC = main.cpp studentas.cpp
OBJ = $(SRC:.cpp=.o)
EXEC = projektas

# Default komanda
all: $(EXEC)

# Linkinimas
$(EXEC): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Kompiliavimas .cpp → .o
%.o: %.cpp studentas.h
	$(CXX) $(CXXFLAGS) -c $<

# Išvalymas
clean:
	rm -f $(OBJ) $(EXEC)

# Išvalyti viską + sukurti iš naujo
rebuild: clean all

# Paleidimas
run: $(EXEC)
	./$(EXEC)

