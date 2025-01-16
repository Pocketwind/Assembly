#include<stdio.h>
#pragma warning(disable:4996)
void print_array(int*, int);
extern "C" void selection_sort(int*,int);
#define SIZE 7
int main()
 {
	int i, array[SIZE];

	for (i = 0; i < SIZE; ++i)
	{
		printf("Enter %dth integer : ", i + 1);
		scanf("%d", &array[i]);
	}
	printf("Before sorting array : ");
	print_array(array, SIZE);

	selection_sort(array, SIZE);

	printf("After sorting array : ");
	print_array(array, SIZE);

	return 0;
}

void print_array(int array[], int size)
{
	printf("[ ");
	for (int i = 0; i < size; ++i)
		printf("%d ", array[i]);
	printf(" ]\n");
}

