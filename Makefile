NAME = exec

SRCS := $(shell find src -name '*.c')
OBJS := $(SRCS:%=build/%.o)

###
CFLAGS = -Wall -Wextra -Werror -g3
CPPFLAGS = -I src

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(NAME)

build/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

.PHONY: test
test:
	mkdir -p build/test
	cmake -B build/test -S test
	cmake --build build/test
	GTEST_COLOR=1 ctest --test-dir build/test $(CTEST_OPT)

.PHONY: vtest
vtest: CTEST_OPT += -V
vtest: test

.PHONY: clean
clean:
	$(RM) -r build
