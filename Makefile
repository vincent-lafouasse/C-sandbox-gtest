EXEC = tests.out

BUILD_DIR = ./build
SRC_DIR = ./src

SRCS := $(shell find $(SRC_DIR) -name '*.c' -or -name '*.cpp')
SRCS_H = $(SRCS) $(shell find $(SRC_DIR) -name '*.h')
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)

### Extra libs go here vvv (e.g. math.h)
LIBS = -lm
LDFLAGS := -lgtest -lgtest_main -lpthread -L/usr/lib -L/usr/local/lib

###
CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Werror
CFLAGS += -Wmissing-declarations

CPPFLAGS := -Wall -Wextra -pedantic -std=c++17

GTESTFLAGS = --gtest_color=yes --gtest_print_time=0

.PHONY: testexec
test: $(BUILD_DIR)/$(EXEC)
	@echo
	@python -c 'print("-" * 80)'
	@echo TEST OUTPUT
	@python -c 'print("-" * 80)'
	@echo
	@./$< $(GTESTFLAGS)

.PHONY: testexec
testexec: $(BUILD_DIR)/$(EXEC)

# Linking
$(BUILD_DIR)/$(EXEC): $(OBJS)
	$(CXX) $^ -o $@ $(LDFLAGS) $(LIBS)

# Compile C 
$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile CPP
$(BUILD_DIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: format
format:
	clang-format -i $(SRCS_H)
