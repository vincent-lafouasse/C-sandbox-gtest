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
test: $(LIB)
	cmake -B build -S test
	cmake --build build
	./build/test_runner


.PHONY: clean
clean:
	$(RM) -r build
