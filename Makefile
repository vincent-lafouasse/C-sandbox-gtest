LIB = libmylib.a

BUILD_DIR = ./build
SRC_DIR = ./src
INC_DIR = ./include

SRCS := $(shell find $(SRC_DIR) -name '*.c')
SRCS_H = $(SRCS) $(shell find $(SRC_DIR) -name '*.h')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

###
CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Werror
CFLAGS += -Wmissing-declarations
CFLAGS += -I$(INC_DIR)

$(LIB): $(OBJS)
	ar rcs $(LIB) $(OBJS)

$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: test
test: clean $(LIB)
	cmake -B build -S test
	cmake --build build
	./build/test_runner


.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)
