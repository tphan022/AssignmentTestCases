#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main()
{
	int * a = 0;
	int b = *a;
	
	printf(1, "%d\n", b);

	exit();
	return 0;
}
