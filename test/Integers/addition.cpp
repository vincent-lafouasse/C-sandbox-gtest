#include "gtest/gtest.h"

extern "C" {
#include "integers/integers.h"
};

TEST(Addition, PositiveNumbers) {
    int expected = 3 + 5;
    int actual = add(3, 5);

    ASSERT_EQ(expected, actual)
        << "Error, expected " << expected << " was " << actual;
}
