#include "semaphore.h"

void MissionaryArrives(void * arg_ptr);
void CannibalArrives(void * arg_ptr);

struct Semaphore s_m; 
struct Semaphore s_c;

struct mutex 
{
	lock_t lock;
} mutex;

int num_miss = 0;
int num_cann = 0;

int main()
{
	sem_init(&s_m, 0);	
	sem_init(&s_c, 0);	
	lock_init(&mutex.lock);

	printf(1, "start ...\n");
	void * tid2 = thread_create(MissionaryArrives, (void*) 0);
	if(tid2 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid3 = thread_create(MissionaryArrives, (void*) 0);
	if(tid3 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}

	void * tid1 = thread_create(CannibalArrives, (void*) 0);
	if(tid1 == 0) 
	{
		printf(1, "thread_create failed.\n");
		exit();
	}
/*
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
*/
	while(wait()>0);
//	printf(1, "count = %d\n", count);

	exit();
	return 0;
}

void MissionaryArrives(void * arg_ptr)
{
	printf(1, "Missionary arrived!\n");
	if(num_miss == 2)
	{
		sem_signal(&s_m);
		sem_signal(&s_m);
		printf(1, "Boat is leaving!\n");
	}
	
	else if (num_miss == 1 && num_cann == 1)
	{
		sem_signal(&s_c);
		sem_signal(&s_m);
		printf(1, "Boat is leaving!\n");
	}

	else 
	{
		lock_acquire(&mutex.lock);
		num_miss++;
		lock_release(&mutex.lock);
		sem_acquire(&s_m);
		lock_acquire(&mutex.lock);
		num_miss--;
		lock_release(&mutex.lock);
	}
		
	texit();
}

void CannibalArrives(void * arg_ptr)
{
	printf(1, "Cannibal arrived!\n");

	if(num_cann == 2)
	{
		sem_signal(&s_c);
		sem_signal(&s_c);
		printf(1, "Boat is leaving!\n");
	}
	
	else if (num_miss == 2)
	{
		sem_signal(&s_m);
		sem_signal(&s_m);
		printf(1, "Boat is leaving!\n");
	}

	else 
	{
		lock_acquire(&mutex.lock);
		num_cann++;
		lock_release(&mutex.lock);
		sem_acquire(&s_c);
		lock_acquire(&mutex.lock);
		num_cann--;
		lock_release(&mutex.lock);
	}
	

	texit();
}
