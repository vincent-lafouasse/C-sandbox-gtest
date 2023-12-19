#include "gtest/gtest.h"
#include <stdlib.h>

extern "C" {
#include "my_sorts.h"
};

void test_array_equality(int* array1, int* array2, int array_size) {
  for (int i = 0; i < array_size; i++) {
    ASSERT_EQ(array1[i], array2[i]);
  }
}

TEST(BubbleSort, BubbleSort) {
  int inverted_array[] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
  int sorted_array[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  int array_size = sizeof(sorted_array) / sizeof(int);

  bubble_sort(inverted_array, array_size);
  test_array_equality(inverted_array, sorted_array, array_size);
}
