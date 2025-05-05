# Compiler and flags
CC = g++  # Default for local testing
CXXFLAGS = -g -std=c++17 -Wall -Wextra -pthread
LDFLAGS = -pthread
LDFLAGS += -static-libstdc++
TARGET = ../out/Cortex-A7/MCIMX7D7/Debug/debug_test
SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)

# Cross-compilation setup, the bin directory containing the following executable should be added to PATH
CC = arm-none-linux-gnueabihf-g++
#CXXFLAGS += --sysroot=/path/to/sysroot  # If needed

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.o

# Helper targets
run: $(TARGET)
	./$(TARGET)

debug: $(TARGET)
	gdb -q ./$(TARGET)
