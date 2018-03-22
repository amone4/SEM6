#include "stdio.h"
#include "stdlib.h"

main() {
	char *name = (char*) malloc(10);
	char *dang = (char*) malloc(10);

	printf("%d\n", name);
	printf("%d\n", dang);

	sprintf(dang, "echo %s", "hello world");
	gets(name);

	printf("%s\n", name);
	printf("%s\n", dang);

	system(dang);
	getchar();
}