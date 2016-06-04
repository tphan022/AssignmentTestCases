#include "types.h"
#include "queue.h"
#include "user.h"

// every time semaphore is declared, 
// initialize its queue field using init_q
// and its lock field using lock_init
struct Semaphore 
{
	lock_t lock;	// lock
	int value;		// increment/decrement value
	struct queue q;    	// waiting queue
};

void sem_init(struct Semaphore * s, int a)
{
	init_q(&s->q);
	lock_init(&s->lock);
	s->value = a;
};	
	

void sem_acquire(struct Semaphore * s)
{
	lock_acquire(&s->lock);
	if (s->value > 0)
	{
		s->value--;
		lock_release(&s->lock);
		return;
	}	
	
	add_q(&s->q, getpid());	
	lock_release(&s->lock);
	tsleep();
};

void sem_signal(struct Semaphore * s)
{
	lock_acquire(&s->lock);
	if (empty_q(&s->q) == 1)
	{
		s->value++;
	}
	
	else
	{
		int tid = pop_q(&s->q);
		twakeup(tid);
	}
		
	lock_release(&s->lock);
};





