# Compiler settings - Can be customized.
CC = arm-linux-gnueabi-gcc
CFLAGS = -Wall -static

# IP address of the Bebop 2 drone
DRONE_IP = 192.168.42.1

# Source and Binary directories
SRC_DIR = src
BIN_DIR = bin

# Source Files and corresponding Binaries
SOURCES = $(wildcard $(SRC_DIR)/*.c)
BINARIES = $(SOURCES:$(SRC_DIR)/%.c=$(BIN_DIR)/%)

# Default make target
all: $(BINARIES)

# Compiles each program
$(BIN_DIR)/%: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ $<

# Upload all programs to the drone via FTP
upload-all: $(BINARIES)
	@echo "Uploading all binaries to the drone..."
	@ftp -n $(DRONE_IP) << EOF
	user anonymous
	cd /path/to/target/directory
	$(foreach BIN,$^,put $(BIN))
	bye
	EOF
	@echo "Upload complete."

# Compiles the specified program
%: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $(BIN_DIR)/$@ $<

# Upload the specified program to the drone via FTP
upload-%: $(BIN_DIR)/%
	@echo "Uploading $< to the drone..."
	@ftp -n $(DRONE_IP) << EOF
	user anonymous
	cd /path/to/target/directory
	put $<
	bye
	EOF
	@echo "Upload complete."

# Clean up
clean:
	rm -f $(BIN_DIR)/*

# Phony targets
.PHONY: all clean upload-all upload-%
