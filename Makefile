# Compiler and Flags
CC = gcc
CFLAGS = -Wall -Wextra -g -std=c99
TARGET = program
SRC = main.c

# Default rule: compile the executable
all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

# Run under Valgrind to detect memory errors
valgrind: $(TARGET)
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(TARGET) 5

# Custom build command with AddressSanitizer (ASan)
asan:
	$(CC) $(CFLAGS) -fsanitize=address -o $(TARGET)_asan $(SRC)
	./$(TARGET)_asan 5

# Clean generated binaries
clean:
	rm -f $(TARGET) $(TARGET)_asan

.PHONY: all valgrind asan clean