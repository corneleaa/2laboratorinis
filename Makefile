# Kompiliatorius ir bendri nustatymai
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra

SRC = main.cpp studentas.cpp
OBJ = $(SRC:.cpp=.o)

TARGET = projektas

# ====== Numatytoji komanda: O2 optimizacija ======
all: CXXFLAGS += -O2
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJ)

# ====== .o failų generavimas ======
%.o: %.cpp studentas.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

# ====== O1 testas ======
O1: CXXFLAGS += -O1
O1:
	$(CXX) $(CXXFLAGS) -o progO1 $(SRC)

# ====== O2 testas ======
O2: CXXFLAGS += -O2
O2:
	$(CXX) $(CXXFLAGS) -o progO2 $(SRC)

# ====== O3 testas ======
O3: CXXFLAGS += -O3
O3:
	$(CXX) $(CXXFLAGS) -o progO3 $(SRC)

# ====== Paleidimas ======
run: $(TARGET)
	./$(TARGET)

# ====== Išvalymas ======
clean:
	rm -f $(OBJ) $(TARGET) progO1 progO2 progO3

