#include "semaphore.h"

void Monkey(void * arg_ptr);
void DomMonkey(void * arg_ptr);

struct Semaphore s_t; 
struct Semaphore s_d;

struct mutex 
{
	lock_t lock;
} mutex;

int num_dom = 0;

int main()
{
	sem_init(&s_d, 0);	
	sem_init(&s_t, 3);	
	lock_init(&mutex.lock);

	printf(1, "start ...\n");
	void * tid2 = thread_create(Monkey, (void*) 0);
	if(tid2 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid3 = thread_create(DomMonkey, (void*) 0);
	if(tid3 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid1 = thread_create(Monkey, (void*) 0);
	if(tid1 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid4 = thread_create(Monkey, (void*) 0);
	if(tid4 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}
/*
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
*/
	while(wait()>0);
//	printf(1, "count = %d\n", count);
	exit();
	return 0;
}

void Monkey(void * arg_ptr)
{
	printf(1, "Monkey arrives!\n");
	if (num_dom > 0)
	{
		sem_acquire(&s_d);
	}

//	thread_yield();	

	sem_acquire(&s_t);
	printf(1, "Grabbed coconut!\n");
	sem_signal(&s_t);

	texit();
}

void DomMonkey(void * arg_ptr)
{	
	printf(1, "Dominant monkey arrives!\n");

	lock_acquire(&mutex.lock);
	num_dom++;
	lock_release(&mutex.lock);

//	thread_yield();

	sem_acquire(&s_t);
	printf(1, "Dominant monkey grabbed coconut!\n");

	sem_signal(&s_t);

	lock_acquire(&mutex.lock);
	num_dom--;
	lock_release(&mutex.lock);

	if (num_dom + 1 == 1)
	sem_signal(&s_d);

	texit();
}
