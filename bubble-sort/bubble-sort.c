#include <stdio.h>

#define SIZE 5

void main() {
    int i, j, swapped;
    char arr[SIZE] = {10, 2, 40, 23, 0};

    for (i = 0; i < SIZE - 1; i++) {
        swapped = 0;
        for (j = 0; j < SIZE - i - 1; j++) {
            if (arr[j] > arr[j+1]) {
                int tmp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = tmp;
                swapped = 1;
            }
        } 

        if (!swapped) {
            break;
        }
    }


    printf("[");
    for (j = 0; j < SIZE; j++) {
        printf(" %d ", arr[j]);
    } 
    printf("]\n");
}
