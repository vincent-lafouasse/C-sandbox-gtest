#include "my_sorts.h"

#include <stdio.h>

void bubble_sort(int* array, int array_size) {
  for (int end = array_size - 1; end > 0; end--) {
    for (int i = 0; i < end; i++) {
      if (array[i] > array[i + 1]) {
        swap(array + i, array + i + 1);
      }
    }
  }
}

void swap(int* a, int* b) {
  int temp = *a;
  *a = *b;
  *b = temp;
}
