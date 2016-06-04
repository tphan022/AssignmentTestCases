#include "semaphore.h"

void O_ready(void * arg_ptr);
void H_ready(void * arg_ptr);

struct Semaphore s_h; 
struct Semaphore s_o;

struct mutex 
{
	lock_t lock;
} mutex;

int count = 0;

int main()
{
	sem_init(&s_h, 0);	
	sem_init(&s_o, 0);	
	lock_init(&mutex.lock);

	printf(1, "start ...\n");
	void * tid2 = thread_create(H_ready, (void*) 0);
	if(tid2 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid3 = thread_create(H_ready, (void*) 0);
	if(tid3 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid1 = thread_create(O_ready, (void*) 0);
	if(tid1 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid4 = thread_create(H_ready, (void*) 0);
	if(tid4 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid5 = thread_create(H_ready, (void*) 0);
	if(tid5 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid6 = thread_create(O_ready, (void*) 0);
	if(tid6 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	while(wait()>0);
	printf(1, "count = %d\n", count);

	exit();
	return 0;
}

void O_ready(void * arg_ptr)
{
	printf(1, "made one Oxygen atom!\n");

	sem_acquire(&s_h);
	sem_acquire(&s_h);
	sem_signal(&s_o);
	sem_signal(&s_o);

	lock_acquire(&mutex.lock);
	count++;	
	printf(1, "made one water molecule!\n");
	lock_release(&mutex.lock);

	texit();
}

void H_ready(void * arg_ptr)
{
	sem_signal(&s_h);
	sem_acquire(&s_o);

	printf(1, "made one Hydrogen atom!\n");

	texit();
}
