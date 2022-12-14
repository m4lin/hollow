.POSIX:

NAME    = hollow
VERSION = 1

CC     = cc
CFLAGS = -std=c11 -D_POSIX_C_SOURCE=200809L -Wall -Wextra -pedantic -O2
LDLIBS = -s -lX11

BIN_DIR = /usr/local/bin

SRC = hollow.c
OBJ = hollow.o

all: $(NAME)
$(NAME): $(OBJ)
install: all
	@mkdir -p $(BIN_DIR)
	@mv $(NAME) $(BIN_DIR)
	@rm -f $(OBJ)
	@echo Done moving the binary to ${DESTDIR}${BIN_DIR}
uninstall:
	@rm -f $(BIN_DIR)/$(NAME)
	@echo Done removing the binary from $(BIN_DIR)

.PHONY: all install uninstall
