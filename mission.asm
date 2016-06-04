
_mission:     file format elf32-i386


Disassembly of section .text:

00001000 <sem_init>:
	int value;		// increment/decrement value
	struct queue q;    	// waiting queue
};

void sem_init(struct Semaphore * s, int a)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 18             	sub    $0x18,%esp
	init_q(&s->q);
    1006:	8b 45 08             	mov    0x8(%ebp),%eax
    1009:	83 c0 08             	add    $0x8,%eax
    100c:	89 04 24             	mov    %eax,(%esp)
    100f:	e8 ac 0c 00 00       	call   1cc0 <init_q>
	lock_init(&s->lock);
    1014:	8b 45 08             	mov    0x8(%ebp),%eax
    1017:	89 04 24             	mov    %eax,(%esp)
    101a:	e8 8b 0b 00 00       	call   1baa <lock_init>
	s->value = a;
    101f:	8b 45 08             	mov    0x8(%ebp),%eax
    1022:	8b 55 0c             	mov    0xc(%ebp),%edx
    1025:	89 50 04             	mov    %edx,0x4(%eax)
};	
    1028:	c9                   	leave  
    1029:	c3                   	ret    

0000102a <sem_acquire>:
	

void sem_acquire(struct Semaphore * s)
{
    102a:	55                   	push   %ebp
    102b:	89 e5                	mov    %esp,%ebp
    102d:	83 ec 18             	sub    $0x18,%esp
	lock_acquire(&s->lock);
    1030:	8b 45 08             	mov    0x8(%ebp),%eax
    1033:	89 04 24             	mov    %eax,(%esp)
    1036:	e8 7d 0b 00 00       	call   1bb8 <lock_acquire>
	if (s->value > 0)
    103b:	8b 45 08             	mov    0x8(%ebp),%eax
    103e:	8b 40 04             	mov    0x4(%eax),%eax
    1041:	85 c0                	test   %eax,%eax
    1043:	7e 1c                	jle    1061 <sem_acquire+0x37>
	{
		s->value--;
    1045:	8b 45 08             	mov    0x8(%ebp),%eax
    1048:	8b 40 04             	mov    0x4(%eax),%eax
    104b:	8d 50 ff             	lea    -0x1(%eax),%edx
    104e:	8b 45 08             	mov    0x8(%ebp),%eax
    1051:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
    1054:	8b 45 08             	mov    0x8(%ebp),%eax
    1057:	89 04 24             	mov    %eax,(%esp)
    105a:	e8 78 0b 00 00       	call   1bd7 <lock_release>
		return;
    105f:	eb 27                	jmp    1088 <sem_acquire+0x5e>
	}	
	
	add_q(&s->q, getpid());	
    1061:	e8 4a 06 00 00       	call   16b0 <getpid>
    1066:	8b 55 08             	mov    0x8(%ebp),%edx
    1069:	83 c2 08             	add    $0x8,%edx
    106c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1070:	89 14 24             	mov    %edx,(%esp)
    1073:	e8 6a 0c 00 00       	call   1ce2 <add_q>
	lock_release(&s->lock);
    1078:	8b 45 08             	mov    0x8(%ebp),%eax
    107b:	89 04 24             	mov    %eax,(%esp)
    107e:	e8 54 0b 00 00       	call   1bd7 <lock_release>
	tsleep();
    1083:	e8 58 06 00 00       	call   16e0 <tsleep>
};
    1088:	c9                   	leave  
    1089:	c3                   	ret    

0000108a <sem_signal>:

void sem_signal(struct Semaphore * s)
{
    108a:	55                   	push   %ebp
    108b:	89 e5                	mov    %esp,%ebp
    108d:	83 ec 28             	sub    $0x28,%esp
	lock_acquire(&s->lock);
    1090:	8b 45 08             	mov    0x8(%ebp),%eax
    1093:	89 04 24             	mov    %eax,(%esp)
    1096:	e8 1d 0b 00 00       	call   1bb8 <lock_acquire>
	if (empty_q(&s->q) == 1)
    109b:	8b 45 08             	mov    0x8(%ebp),%eax
    109e:	83 c0 08             	add    $0x8,%eax
    10a1:	89 04 24             	mov    %eax,(%esp)
    10a4:	e8 99 0c 00 00       	call   1d42 <empty_q>
    10a9:	83 f8 01             	cmp    $0x1,%eax
    10ac:	75 11                	jne    10bf <sem_signal+0x35>
	{
		s->value++;
    10ae:	8b 45 08             	mov    0x8(%ebp),%eax
    10b1:	8b 40 04             	mov    0x4(%eax),%eax
    10b4:	8d 50 01             	lea    0x1(%eax),%edx
    10b7:	8b 45 08             	mov    0x8(%ebp),%eax
    10ba:	89 50 04             	mov    %edx,0x4(%eax)
    10bd:	eb 1c                	jmp    10db <sem_signal+0x51>
	}
	
	else
	{
		int tid = pop_q(&s->q);
    10bf:	8b 45 08             	mov    0x8(%ebp),%eax
    10c2:	83 c0 08             	add    $0x8,%eax
    10c5:	89 04 24             	mov    %eax,(%esp)
    10c8:	e8 8f 0c 00 00       	call   1d5c <pop_q>
    10cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		twakeup(tid);
    10d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d3:	89 04 24             	mov    %eax,(%esp)
    10d6:	e8 0d 06 00 00       	call   16e8 <twakeup>
	}
		
	lock_release(&s->lock);
    10db:	8b 45 08             	mov    0x8(%ebp),%eax
    10de:	89 04 24             	mov    %eax,(%esp)
    10e1:	e8 f1 0a 00 00       	call   1bd7 <lock_release>
};
    10e6:	c9                   	leave  
    10e7:	c3                   	ret    

000010e8 <main>:

int num_miss = 0;
int num_cann = 0;

int main()
{
    10e8:	55                   	push   %ebp
    10e9:	89 e5                	mov    %esp,%ebp
    10eb:	83 e4 f0             	and    $0xfffffff0,%esp
    10ee:	83 ec 20             	sub    $0x20,%esp
	sem_init(&s_m, 0);	
    10f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10f8:	00 
    10f9:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    1100:	e8 fb fe ff ff       	call   1000 <sem_init>
	sem_init(&s_c, 0);	
    1105:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    110c:	00 
    110d:	c7 04 24 a4 1e 00 00 	movl   $0x1ea4,(%esp)
    1114:	e8 e7 fe ff ff       	call   1000 <sem_init>
	lock_init(&mutex.lock);
    1119:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    1120:	e8 85 0a 00 00       	call   1baa <lock_init>

	printf(1, "start ...\n");
    1125:	c7 44 24 04 d5 1d 00 	movl   $0x1dd5,0x4(%esp)
    112c:	00 
    112d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1134:	e8 90 06 00 00       	call   17c9 <printf>
	void * tid2 = thread_create(MissionaryArrives, (void*) 0);
    1139:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1140:	00 
    1141:	c7 04 24 ef 11 00 00 	movl   $0x11ef,(%esp)
    1148:	e8 a5 0a 00 00       	call   1bf2 <thread_create>
    114d:	89 44 24 14          	mov    %eax,0x14(%esp)
	if(tid2 == 0) 
    1151:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
    1156:	75 19                	jne    1171 <main+0x89>
	{
		printf(1, "thread_create failed.\n");
    1158:	c7 44 24 04 e0 1d 00 	movl   $0x1de0,0x4(%esp)
    115f:	00 
    1160:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1167:	e8 5d 06 00 00       	call   17c9 <printf>
		exit();
    116c:	e8 bf 04 00 00       	call   1630 <exit>
	}

	void * tid3 = thread_create(MissionaryArrives, (void*) 0);
    1171:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1178:	00 
    1179:	c7 04 24 ef 11 00 00 	movl   $0x11ef,(%esp)
    1180:	e8 6d 0a 00 00       	call   1bf2 <thread_create>
    1185:	89 44 24 18          	mov    %eax,0x18(%esp)
	if(tid3 == 0) 
    1189:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    118e:	75 19                	jne    11a9 <main+0xc1>
	{
		printf(1, "thread_create failed.\n");
    1190:	c7 44 24 04 e0 1d 00 	movl   $0x1de0,0x4(%esp)
    1197:	00 
    1198:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    119f:	e8 25 06 00 00       	call   17c9 <printf>
		exit();
    11a4:	e8 87 04 00 00       	call   1630 <exit>
	}

	void * tid1 = thread_create(CannibalArrives, (void*) 0);
    11a9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b0:	00 
    11b1:	c7 04 24 e1 12 00 00 	movl   $0x12e1,(%esp)
    11b8:	e8 35 0a 00 00       	call   1bf2 <thread_create>
    11bd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	if(tid1 == 0) 
    11c1:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    11c6:	75 19                	jne    11e1 <main+0xf9>
	{
		printf(1, "thread_create failed.\n");
    11c8:	c7 44 24 04 e0 1d 00 	movl   $0x1de0,0x4(%esp)
    11cf:	00 
    11d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d7:	e8 ed 05 00 00       	call   17c9 <printf>
		exit();
    11dc:	e8 4f 04 00 00       	call   1630 <exit>
	{
		printf(1, "thread_create failed.\n");
		exit();
	}
*/
	while(wait()>0);
    11e1:	e8 52 04 00 00       	call   1638 <wait>
    11e6:	85 c0                	test   %eax,%eax
    11e8:	7f f7                	jg     11e1 <main+0xf9>
//	printf(1, "count = %d\n", count);

	exit();
    11ea:	e8 41 04 00 00       	call   1630 <exit>

000011ef <MissionaryArrives>:
	return 0;
}

void MissionaryArrives(void * arg_ptr)
{
    11ef:	55                   	push   %ebp
    11f0:	89 e5                	mov    %esp,%ebp
    11f2:	83 ec 18             	sub    $0x18,%esp
	printf(1, "Missionary arrived!\n");
    11f5:	c7 44 24 04 f7 1d 00 	movl   $0x1df7,0x4(%esp)
    11fc:	00 
    11fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1204:	e8 c0 05 00 00       	call   17c9 <printf>
	if(num_miss == 2)
    1209:	a1 78 1e 00 00       	mov    0x1e78,%eax
    120e:	83 f8 02             	cmp    $0x2,%eax
    1211:	75 31                	jne    1244 <MissionaryArrives+0x55>
	{
		sem_signal(&s_m);
    1213:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    121a:	e8 6b fe ff ff       	call   108a <sem_signal>
		sem_signal(&s_m);
    121f:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    1226:	e8 5f fe ff ff       	call   108a <sem_signal>
		printf(1, "Boat is leaving!\n");
    122b:	c7 44 24 04 0c 1e 00 	movl   $0x1e0c,0x4(%esp)
    1232:	00 
    1233:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    123a:	e8 8a 05 00 00       	call   17c9 <printf>
    123f:	e9 98 00 00 00       	jmp    12dc <MissionaryArrives+0xed>
	}
	
	else if (num_miss == 1 && num_cann == 1)
    1244:	a1 78 1e 00 00       	mov    0x1e78,%eax
    1249:	83 f8 01             	cmp    $0x1,%eax
    124c:	75 38                	jne    1286 <MissionaryArrives+0x97>
    124e:	a1 7c 1e 00 00       	mov    0x1e7c,%eax
    1253:	83 f8 01             	cmp    $0x1,%eax
    1256:	75 2e                	jne    1286 <MissionaryArrives+0x97>
	{
		sem_signal(&s_c);
    1258:	c7 04 24 a4 1e 00 00 	movl   $0x1ea4,(%esp)
    125f:	e8 26 fe ff ff       	call   108a <sem_signal>
		sem_signal(&s_m);
    1264:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    126b:	e8 1a fe ff ff       	call   108a <sem_signal>
		printf(1, "Boat is leaving!\n");
    1270:	c7 44 24 04 0c 1e 00 	movl   $0x1e0c,0x4(%esp)
    1277:	00 
    1278:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127f:	e8 45 05 00 00       	call   17c9 <printf>
		sem_signal(&s_m);
		sem_signal(&s_m);
		printf(1, "Boat is leaving!\n");
	}
	
	else if (num_miss == 1 && num_cann == 1)
    1284:	eb 56                	jmp    12dc <MissionaryArrives+0xed>
		printf(1, "Boat is leaving!\n");
	}

	else 
	{
		lock_acquire(&mutex.lock);
    1286:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    128d:	e8 26 09 00 00       	call   1bb8 <lock_acquire>
		num_miss++;
    1292:	a1 78 1e 00 00       	mov    0x1e78,%eax
    1297:	83 c0 01             	add    $0x1,%eax
    129a:	a3 78 1e 00 00       	mov    %eax,0x1e78
		lock_release(&mutex.lock);
    129f:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    12a6:	e8 2c 09 00 00       	call   1bd7 <lock_release>
		sem_acquire(&s_m);
    12ab:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    12b2:	e8 73 fd ff ff       	call   102a <sem_acquire>
		lock_acquire(&mutex.lock);
    12b7:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    12be:	e8 f5 08 00 00       	call   1bb8 <lock_acquire>
		num_miss--;
    12c3:	a1 78 1e 00 00       	mov    0x1e78,%eax
    12c8:	83 e8 01             	sub    $0x1,%eax
    12cb:	a3 78 1e 00 00       	mov    %eax,0x1e78
		lock_release(&mutex.lock);
    12d0:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    12d7:	e8 fb 08 00 00       	call   1bd7 <lock_release>
	}
		
	texit();
    12dc:	e8 f7 03 00 00       	call   16d8 <texit>

000012e1 <CannibalArrives>:
}

void CannibalArrives(void * arg_ptr)
{
    12e1:	55                   	push   %ebp
    12e2:	89 e5                	mov    %esp,%ebp
    12e4:	83 ec 18             	sub    $0x18,%esp
	printf(1, "Cannibal arrived!\n");
    12e7:	c7 44 24 04 1e 1e 00 	movl   $0x1e1e,0x4(%esp)
    12ee:	00 
    12ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12f6:	e8 ce 04 00 00       	call   17c9 <printf>

	if(num_cann == 2)
    12fb:	a1 7c 1e 00 00       	mov    0x1e7c,%eax
    1300:	83 f8 02             	cmp    $0x2,%eax
    1303:	75 31                	jne    1336 <CannibalArrives+0x55>
	{
		sem_signal(&s_c);
    1305:	c7 04 24 a4 1e 00 00 	movl   $0x1ea4,(%esp)
    130c:	e8 79 fd ff ff       	call   108a <sem_signal>
		sem_signal(&s_c);
    1311:	c7 04 24 a4 1e 00 00 	movl   $0x1ea4,(%esp)
    1318:	e8 6d fd ff ff       	call   108a <sem_signal>
		printf(1, "Boat is leaving!\n");
    131d:	c7 44 24 04 0c 1e 00 	movl   $0x1e0c,0x4(%esp)
    1324:	00 
    1325:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    132c:	e8 98 04 00 00       	call   17c9 <printf>
    1331:	e9 8e 00 00 00       	jmp    13c4 <CannibalArrives+0xe3>
	}
	
	else if (num_miss == 2)
    1336:	a1 78 1e 00 00       	mov    0x1e78,%eax
    133b:	83 f8 02             	cmp    $0x2,%eax
    133e:	75 2e                	jne    136e <CannibalArrives+0x8d>
	{
		sem_signal(&s_m);
    1340:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    1347:	e8 3e fd ff ff       	call   108a <sem_signal>
		sem_signal(&s_m);
    134c:	c7 04 24 8c 1e 00 00 	movl   $0x1e8c,(%esp)
    1353:	e8 32 fd ff ff       	call   108a <sem_signal>
		printf(1, "Boat is leaving!\n");
    1358:	c7 44 24 04 0c 1e 00 	movl   $0x1e0c,0x4(%esp)
    135f:	00 
    1360:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1367:	e8 5d 04 00 00       	call   17c9 <printf>
    136c:	eb 56                	jmp    13c4 <CannibalArrives+0xe3>
	}

	else 
	{
		lock_acquire(&mutex.lock);
    136e:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    1375:	e8 3e 08 00 00       	call   1bb8 <lock_acquire>
		num_cann++;
    137a:	a1 7c 1e 00 00       	mov    0x1e7c,%eax
    137f:	83 c0 01             	add    $0x1,%eax
    1382:	a3 7c 1e 00 00       	mov    %eax,0x1e7c
		lock_release(&mutex.lock);
    1387:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    138e:	e8 44 08 00 00       	call   1bd7 <lock_release>
		sem_acquire(&s_c);
    1393:	c7 04 24 a4 1e 00 00 	movl   $0x1ea4,(%esp)
    139a:	e8 8b fc ff ff       	call   102a <sem_acquire>
		lock_acquire(&mutex.lock);
    139f:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    13a6:	e8 0d 08 00 00       	call   1bb8 <lock_acquire>
		num_cann--;
    13ab:	a1 7c 1e 00 00       	mov    0x1e7c,%eax
    13b0:	83 e8 01             	sub    $0x1,%eax
    13b3:	a3 7c 1e 00 00       	mov    %eax,0x1e7c
		lock_release(&mutex.lock);
    13b8:	c7 04 24 a0 1e 00 00 	movl   $0x1ea0,(%esp)
    13bf:	e8 13 08 00 00       	call   1bd7 <lock_release>
	}
	

	texit();
    13c4:	e8 0f 03 00 00       	call   16d8 <texit>
    13c9:	90                   	nop
    13ca:	90                   	nop
    13cb:	90                   	nop

000013cc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    13cc:	55                   	push   %ebp
    13cd:	89 e5                	mov    %esp,%ebp
    13cf:	57                   	push   %edi
    13d0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    13d1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    13d4:	8b 55 10             	mov    0x10(%ebp),%edx
    13d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    13da:	89 cb                	mov    %ecx,%ebx
    13dc:	89 df                	mov    %ebx,%edi
    13de:	89 d1                	mov    %edx,%ecx
    13e0:	fc                   	cld    
    13e1:	f3 aa                	rep stos %al,%es:(%edi)
    13e3:	89 ca                	mov    %ecx,%edx
    13e5:	89 fb                	mov    %edi,%ebx
    13e7:	89 5d 08             	mov    %ebx,0x8(%ebp)
    13ea:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    13ed:	5b                   	pop    %ebx
    13ee:	5f                   	pop    %edi
    13ef:	5d                   	pop    %ebp
    13f0:	c3                   	ret    

000013f1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    13f1:	55                   	push   %ebp
    13f2:	89 e5                	mov    %esp,%ebp
    13f4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    13f7:	8b 45 08             	mov    0x8(%ebp),%eax
    13fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    13fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    1400:	0f b6 10             	movzbl (%eax),%edx
    1403:	8b 45 08             	mov    0x8(%ebp),%eax
    1406:	88 10                	mov    %dl,(%eax)
    1408:	8b 45 08             	mov    0x8(%ebp),%eax
    140b:	0f b6 00             	movzbl (%eax),%eax
    140e:	84 c0                	test   %al,%al
    1410:	0f 95 c0             	setne  %al
    1413:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1417:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    141b:	84 c0                	test   %al,%al
    141d:	75 de                	jne    13fd <strcpy+0xc>
    ;
  return os;
    141f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1422:	c9                   	leave  
    1423:	c3                   	ret    

00001424 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1424:	55                   	push   %ebp
    1425:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1427:	eb 08                	jmp    1431 <strcmp+0xd>
    p++, q++;
    1429:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    142d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1431:	8b 45 08             	mov    0x8(%ebp),%eax
    1434:	0f b6 00             	movzbl (%eax),%eax
    1437:	84 c0                	test   %al,%al
    1439:	74 10                	je     144b <strcmp+0x27>
    143b:	8b 45 08             	mov    0x8(%ebp),%eax
    143e:	0f b6 10             	movzbl (%eax),%edx
    1441:	8b 45 0c             	mov    0xc(%ebp),%eax
    1444:	0f b6 00             	movzbl (%eax),%eax
    1447:	38 c2                	cmp    %al,%dl
    1449:	74 de                	je     1429 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    144b:	8b 45 08             	mov    0x8(%ebp),%eax
    144e:	0f b6 00             	movzbl (%eax),%eax
    1451:	0f b6 d0             	movzbl %al,%edx
    1454:	8b 45 0c             	mov    0xc(%ebp),%eax
    1457:	0f b6 00             	movzbl (%eax),%eax
    145a:	0f b6 c0             	movzbl %al,%eax
    145d:	89 d1                	mov    %edx,%ecx
    145f:	29 c1                	sub    %eax,%ecx
    1461:	89 c8                	mov    %ecx,%eax
}
    1463:	5d                   	pop    %ebp
    1464:	c3                   	ret    

00001465 <strlen>:

uint
strlen(char *s)
{
    1465:	55                   	push   %ebp
    1466:	89 e5                	mov    %esp,%ebp
    1468:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    146b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1472:	eb 04                	jmp    1478 <strlen+0x13>
    1474:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1478:	8b 45 fc             	mov    -0x4(%ebp),%eax
    147b:	03 45 08             	add    0x8(%ebp),%eax
    147e:	0f b6 00             	movzbl (%eax),%eax
    1481:	84 c0                	test   %al,%al
    1483:	75 ef                	jne    1474 <strlen+0xf>
    ;
  return n;
    1485:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1488:	c9                   	leave  
    1489:	c3                   	ret    

0000148a <memset>:

void*
memset(void *dst, int c, uint n)
{
    148a:	55                   	push   %ebp
    148b:	89 e5                	mov    %esp,%ebp
    148d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1490:	8b 45 10             	mov    0x10(%ebp),%eax
    1493:	89 44 24 08          	mov    %eax,0x8(%esp)
    1497:	8b 45 0c             	mov    0xc(%ebp),%eax
    149a:	89 44 24 04          	mov    %eax,0x4(%esp)
    149e:	8b 45 08             	mov    0x8(%ebp),%eax
    14a1:	89 04 24             	mov    %eax,(%esp)
    14a4:	e8 23 ff ff ff       	call   13cc <stosb>
  return dst;
    14a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14ac:	c9                   	leave  
    14ad:	c3                   	ret    

000014ae <strchr>:

char*
strchr(const char *s, char c)
{
    14ae:	55                   	push   %ebp
    14af:	89 e5                	mov    %esp,%ebp
    14b1:	83 ec 04             	sub    $0x4,%esp
    14b4:	8b 45 0c             	mov    0xc(%ebp),%eax
    14b7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    14ba:	eb 14                	jmp    14d0 <strchr+0x22>
    if(*s == c)
    14bc:	8b 45 08             	mov    0x8(%ebp),%eax
    14bf:	0f b6 00             	movzbl (%eax),%eax
    14c2:	3a 45 fc             	cmp    -0x4(%ebp),%al
    14c5:	75 05                	jne    14cc <strchr+0x1e>
      return (char*)s;
    14c7:	8b 45 08             	mov    0x8(%ebp),%eax
    14ca:	eb 13                	jmp    14df <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    14cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    14d0:	8b 45 08             	mov    0x8(%ebp),%eax
    14d3:	0f b6 00             	movzbl (%eax),%eax
    14d6:	84 c0                	test   %al,%al
    14d8:	75 e2                	jne    14bc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    14da:	b8 00 00 00 00       	mov    $0x0,%eax
}
    14df:	c9                   	leave  
    14e0:	c3                   	ret    

000014e1 <gets>:

char*
gets(char *buf, int max)
{
    14e1:	55                   	push   %ebp
    14e2:	89 e5                	mov    %esp,%ebp
    14e4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    14e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14ee:	eb 44                	jmp    1534 <gets+0x53>
    cc = read(0, &c, 1);
    14f0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14f7:	00 
    14f8:	8d 45 ef             	lea    -0x11(%ebp),%eax
    14fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1506:	e8 3d 01 00 00       	call   1648 <read>
    150b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    150e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1512:	7e 2d                	jle    1541 <gets+0x60>
      break;
    buf[i++] = c;
    1514:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1517:	03 45 08             	add    0x8(%ebp),%eax
    151a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    151e:	88 10                	mov    %dl,(%eax)
    1520:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1524:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1528:	3c 0a                	cmp    $0xa,%al
    152a:	74 16                	je     1542 <gets+0x61>
    152c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1530:	3c 0d                	cmp    $0xd,%al
    1532:	74 0e                	je     1542 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1534:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1537:	83 c0 01             	add    $0x1,%eax
    153a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    153d:	7c b1                	jl     14f0 <gets+0xf>
    153f:	eb 01                	jmp    1542 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1541:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1542:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1545:	03 45 08             	add    0x8(%ebp),%eax
    1548:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    154b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    154e:	c9                   	leave  
    154f:	c3                   	ret    

00001550 <stat>:

int
stat(char *n, struct stat *st)
{
    1550:	55                   	push   %ebp
    1551:	89 e5                	mov    %esp,%ebp
    1553:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1556:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    155d:	00 
    155e:	8b 45 08             	mov    0x8(%ebp),%eax
    1561:	89 04 24             	mov    %eax,(%esp)
    1564:	e8 07 01 00 00       	call   1670 <open>
    1569:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    156c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1570:	79 07                	jns    1579 <stat+0x29>
    return -1;
    1572:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1577:	eb 23                	jmp    159c <stat+0x4c>
  r = fstat(fd, st);
    1579:	8b 45 0c             	mov    0xc(%ebp),%eax
    157c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1580:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1583:	89 04 24             	mov    %eax,(%esp)
    1586:	e8 fd 00 00 00       	call   1688 <fstat>
    158b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    158e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1591:	89 04 24             	mov    %eax,(%esp)
    1594:	e8 bf 00 00 00       	call   1658 <close>
  return r;
    1599:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    159c:	c9                   	leave  
    159d:	c3                   	ret    

0000159e <atoi>:

int
atoi(const char *s)
{
    159e:	55                   	push   %ebp
    159f:	89 e5                	mov    %esp,%ebp
    15a1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    15a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    15ab:	eb 24                	jmp    15d1 <atoi+0x33>
    n = n*10 + *s++ - '0';
    15ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
    15b0:	89 d0                	mov    %edx,%eax
    15b2:	c1 e0 02             	shl    $0x2,%eax
    15b5:	01 d0                	add    %edx,%eax
    15b7:	01 c0                	add    %eax,%eax
    15b9:	89 c2                	mov    %eax,%edx
    15bb:	8b 45 08             	mov    0x8(%ebp),%eax
    15be:	0f b6 00             	movzbl (%eax),%eax
    15c1:	0f be c0             	movsbl %al,%eax
    15c4:	8d 04 02             	lea    (%edx,%eax,1),%eax
    15c7:	83 e8 30             	sub    $0x30,%eax
    15ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    15d1:	8b 45 08             	mov    0x8(%ebp),%eax
    15d4:	0f b6 00             	movzbl (%eax),%eax
    15d7:	3c 2f                	cmp    $0x2f,%al
    15d9:	7e 0a                	jle    15e5 <atoi+0x47>
    15db:	8b 45 08             	mov    0x8(%ebp),%eax
    15de:	0f b6 00             	movzbl (%eax),%eax
    15e1:	3c 39                	cmp    $0x39,%al
    15e3:	7e c8                	jle    15ad <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    15e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    15e8:	c9                   	leave  
    15e9:	c3                   	ret    

000015ea <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    15ea:	55                   	push   %ebp
    15eb:	89 e5                	mov    %esp,%ebp
    15ed:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    15f0:	8b 45 08             	mov    0x8(%ebp),%eax
    15f3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    15f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    15f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    15fc:	eb 13                	jmp    1611 <memmove+0x27>
    *dst++ = *src++;
    15fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1601:	0f b6 10             	movzbl (%eax),%edx
    1604:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1607:	88 10                	mov    %dl,(%eax)
    1609:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    160d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1611:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1615:	0f 9f c0             	setg   %al
    1618:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    161c:	84 c0                	test   %al,%al
    161e:	75 de                	jne    15fe <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1620:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1623:	c9                   	leave  
    1624:	c3                   	ret    
    1625:	90                   	nop
    1626:	90                   	nop
    1627:	90                   	nop

00001628 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1628:	b8 01 00 00 00       	mov    $0x1,%eax
    162d:	cd 40                	int    $0x40
    162f:	c3                   	ret    

00001630 <exit>:
SYSCALL(exit)
    1630:	b8 02 00 00 00       	mov    $0x2,%eax
    1635:	cd 40                	int    $0x40
    1637:	c3                   	ret    

00001638 <wait>:
SYSCALL(wait)
    1638:	b8 03 00 00 00       	mov    $0x3,%eax
    163d:	cd 40                	int    $0x40
    163f:	c3                   	ret    

00001640 <pipe>:
SYSCALL(pipe)
    1640:	b8 04 00 00 00       	mov    $0x4,%eax
    1645:	cd 40                	int    $0x40
    1647:	c3                   	ret    

00001648 <read>:
SYSCALL(read)
    1648:	b8 05 00 00 00       	mov    $0x5,%eax
    164d:	cd 40                	int    $0x40
    164f:	c3                   	ret    

00001650 <write>:
SYSCALL(write)
    1650:	b8 10 00 00 00       	mov    $0x10,%eax
    1655:	cd 40                	int    $0x40
    1657:	c3                   	ret    

00001658 <close>:
SYSCALL(close)
    1658:	b8 15 00 00 00       	mov    $0x15,%eax
    165d:	cd 40                	int    $0x40
    165f:	c3                   	ret    

00001660 <kill>:
SYSCALL(kill)
    1660:	b8 06 00 00 00       	mov    $0x6,%eax
    1665:	cd 40                	int    $0x40
    1667:	c3                   	ret    

00001668 <exec>:
SYSCALL(exec)
    1668:	b8 07 00 00 00       	mov    $0x7,%eax
    166d:	cd 40                	int    $0x40
    166f:	c3                   	ret    

00001670 <open>:
SYSCALL(open)
    1670:	b8 0f 00 00 00       	mov    $0xf,%eax
    1675:	cd 40                	int    $0x40
    1677:	c3                   	ret    

00001678 <mknod>:
SYSCALL(mknod)
    1678:	b8 11 00 00 00       	mov    $0x11,%eax
    167d:	cd 40                	int    $0x40
    167f:	c3                   	ret    

00001680 <unlink>:
SYSCALL(unlink)
    1680:	b8 12 00 00 00       	mov    $0x12,%eax
    1685:	cd 40                	int    $0x40
    1687:	c3                   	ret    

00001688 <fstat>:
SYSCALL(fstat)
    1688:	b8 08 00 00 00       	mov    $0x8,%eax
    168d:	cd 40                	int    $0x40
    168f:	c3                   	ret    

00001690 <link>:
SYSCALL(link)
    1690:	b8 13 00 00 00       	mov    $0x13,%eax
    1695:	cd 40                	int    $0x40
    1697:	c3                   	ret    

00001698 <mkdir>:
SYSCALL(mkdir)
    1698:	b8 14 00 00 00       	mov    $0x14,%eax
    169d:	cd 40                	int    $0x40
    169f:	c3                   	ret    

000016a0 <chdir>:
SYSCALL(chdir)
    16a0:	b8 09 00 00 00       	mov    $0x9,%eax
    16a5:	cd 40                	int    $0x40
    16a7:	c3                   	ret    

000016a8 <dup>:
SYSCALL(dup)
    16a8:	b8 0a 00 00 00       	mov    $0xa,%eax
    16ad:	cd 40                	int    $0x40
    16af:	c3                   	ret    

000016b0 <getpid>:
SYSCALL(getpid)
    16b0:	b8 0b 00 00 00       	mov    $0xb,%eax
    16b5:	cd 40                	int    $0x40
    16b7:	c3                   	ret    

000016b8 <sbrk>:
SYSCALL(sbrk)
    16b8:	b8 0c 00 00 00       	mov    $0xc,%eax
    16bd:	cd 40                	int    $0x40
    16bf:	c3                   	ret    

000016c0 <sleep>:
SYSCALL(sleep)
    16c0:	b8 0d 00 00 00       	mov    $0xd,%eax
    16c5:	cd 40                	int    $0x40
    16c7:	c3                   	ret    

000016c8 <uptime>:
SYSCALL(uptime)
    16c8:	b8 0e 00 00 00       	mov    $0xe,%eax
    16cd:	cd 40                	int    $0x40
    16cf:	c3                   	ret    

000016d0 <clone>:
SYSCALL(clone)
    16d0:	b8 16 00 00 00       	mov    $0x16,%eax
    16d5:	cd 40                	int    $0x40
    16d7:	c3                   	ret    

000016d8 <texit>:
SYSCALL(texit)
    16d8:	b8 17 00 00 00       	mov    $0x17,%eax
    16dd:	cd 40                	int    $0x40
    16df:	c3                   	ret    

000016e0 <tsleep>:
SYSCALL(tsleep)
    16e0:	b8 18 00 00 00       	mov    $0x18,%eax
    16e5:	cd 40                	int    $0x40
    16e7:	c3                   	ret    

000016e8 <twakeup>:
SYSCALL(twakeup)
    16e8:	b8 19 00 00 00       	mov    $0x19,%eax
    16ed:	cd 40                	int    $0x40
    16ef:	c3                   	ret    

000016f0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	83 ec 28             	sub    $0x28,%esp
    16f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    16f9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    16fc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1703:	00 
    1704:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1707:	89 44 24 04          	mov    %eax,0x4(%esp)
    170b:	8b 45 08             	mov    0x8(%ebp),%eax
    170e:	89 04 24             	mov    %eax,(%esp)
    1711:	e8 3a ff ff ff       	call   1650 <write>
}
    1716:	c9                   	leave  
    1717:	c3                   	ret    

00001718 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1718:	55                   	push   %ebp
    1719:	89 e5                	mov    %esp,%ebp
    171b:	53                   	push   %ebx
    171c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    171f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1726:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    172a:	74 17                	je     1743 <printint+0x2b>
    172c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1730:	79 11                	jns    1743 <printint+0x2b>
    neg = 1;
    1732:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1739:	8b 45 0c             	mov    0xc(%ebp),%eax
    173c:	f7 d8                	neg    %eax
    173e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1741:	eb 06                	jmp    1749 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1743:	8b 45 0c             	mov    0xc(%ebp),%eax
    1746:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    1749:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1750:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1753:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1756:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1759:	ba 00 00 00 00       	mov    $0x0,%edx
    175e:	f7 f3                	div    %ebx
    1760:	89 d0                	mov    %edx,%eax
    1762:	0f b6 80 64 1e 00 00 	movzbl 0x1e64(%eax),%eax
    1769:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    176d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1771:	8b 45 10             	mov    0x10(%ebp),%eax
    1774:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1777:	8b 45 f4             	mov    -0xc(%ebp),%eax
    177a:	ba 00 00 00 00       	mov    $0x0,%edx
    177f:	f7 75 d4             	divl   -0x2c(%ebp)
    1782:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1785:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1789:	75 c5                	jne    1750 <printint+0x38>
  if(neg)
    178b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    178f:	74 28                	je     17b9 <printint+0xa1>
    buf[i++] = '-';
    1791:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1794:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1799:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    179d:	eb 1a                	jmp    17b9 <printint+0xa1>
    putc(fd, buf[i]);
    179f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17a2:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    17a7:	0f be c0             	movsbl %al,%eax
    17aa:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ae:	8b 45 08             	mov    0x8(%ebp),%eax
    17b1:	89 04 24             	mov    %eax,(%esp)
    17b4:	e8 37 ff ff ff       	call   16f0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    17b9:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    17bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    17c1:	79 dc                	jns    179f <printint+0x87>
    putc(fd, buf[i]);
}
    17c3:	83 c4 44             	add    $0x44,%esp
    17c6:	5b                   	pop    %ebx
    17c7:	5d                   	pop    %ebp
    17c8:	c3                   	ret    

000017c9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    17c9:	55                   	push   %ebp
    17ca:	89 e5                	mov    %esp,%ebp
    17cc:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    17cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    17d6:	8d 45 0c             	lea    0xc(%ebp),%eax
    17d9:	83 c0 04             	add    $0x4,%eax
    17dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    17df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    17e6:	e9 7e 01 00 00       	jmp    1969 <printf+0x1a0>
    c = fmt[i] & 0xff;
    17eb:	8b 55 0c             	mov    0xc(%ebp),%edx
    17ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17f1:	8d 04 02             	lea    (%edx,%eax,1),%eax
    17f4:	0f b6 00             	movzbl (%eax),%eax
    17f7:	0f be c0             	movsbl %al,%eax
    17fa:	25 ff 00 00 00       	and    $0xff,%eax
    17ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    1802:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1806:	75 2c                	jne    1834 <printf+0x6b>
      if(c == '%'){
    1808:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    180c:	75 0c                	jne    181a <printf+0x51>
        state = '%';
    180e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1815:	e9 4b 01 00 00       	jmp    1965 <printf+0x19c>
      } else {
        putc(fd, c);
    181a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    181d:	0f be c0             	movsbl %al,%eax
    1820:	89 44 24 04          	mov    %eax,0x4(%esp)
    1824:	8b 45 08             	mov    0x8(%ebp),%eax
    1827:	89 04 24             	mov    %eax,(%esp)
    182a:	e8 c1 fe ff ff       	call   16f0 <putc>
    182f:	e9 31 01 00 00       	jmp    1965 <printf+0x19c>
      }
    } else if(state == '%'){
    1834:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    1838:	0f 85 27 01 00 00    	jne    1965 <printf+0x19c>
      if(c == 'd'){
    183e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    1842:	75 2d                	jne    1871 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1844:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1847:	8b 00                	mov    (%eax),%eax
    1849:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1850:	00 
    1851:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1858:	00 
    1859:	89 44 24 04          	mov    %eax,0x4(%esp)
    185d:	8b 45 08             	mov    0x8(%ebp),%eax
    1860:	89 04 24             	mov    %eax,(%esp)
    1863:	e8 b0 fe ff ff       	call   1718 <printint>
        ap++;
    1868:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    186c:	e9 ed 00 00 00       	jmp    195e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1871:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1875:	74 06                	je     187d <printf+0xb4>
    1877:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    187b:	75 2d                	jne    18aa <printf+0xe1>
        printint(fd, *ap, 16, 0);
    187d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1880:	8b 00                	mov    (%eax),%eax
    1882:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1889:	00 
    188a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1891:	00 
    1892:	89 44 24 04          	mov    %eax,0x4(%esp)
    1896:	8b 45 08             	mov    0x8(%ebp),%eax
    1899:	89 04 24             	mov    %eax,(%esp)
    189c:	e8 77 fe ff ff       	call   1718 <printint>
        ap++;
    18a1:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    18a5:	e9 b4 00 00 00       	jmp    195e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    18aa:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    18ae:	75 46                	jne    18f6 <printf+0x12d>
        s = (char*)*ap;
    18b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b3:	8b 00                	mov    (%eax),%eax
    18b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    18b8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    18bc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    18c0:	75 27                	jne    18e9 <printf+0x120>
          s = "(null)";
    18c2:	c7 45 e4 31 1e 00 00 	movl   $0x1e31,-0x1c(%ebp)
        while(*s != 0){
    18c9:	eb 1f                	jmp    18ea <printf+0x121>
          putc(fd, *s);
    18cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18ce:	0f b6 00             	movzbl (%eax),%eax
    18d1:	0f be c0             	movsbl %al,%eax
    18d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    18d8:	8b 45 08             	mov    0x8(%ebp),%eax
    18db:	89 04 24             	mov    %eax,(%esp)
    18de:	e8 0d fe ff ff       	call   16f0 <putc>
          s++;
    18e3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    18e7:	eb 01                	jmp    18ea <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    18e9:	90                   	nop
    18ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18ed:	0f b6 00             	movzbl (%eax),%eax
    18f0:	84 c0                	test   %al,%al
    18f2:	75 d7                	jne    18cb <printf+0x102>
    18f4:	eb 68                	jmp    195e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    18f6:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    18fa:	75 1d                	jne    1919 <printf+0x150>
        putc(fd, *ap);
    18fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18ff:	8b 00                	mov    (%eax),%eax
    1901:	0f be c0             	movsbl %al,%eax
    1904:	89 44 24 04          	mov    %eax,0x4(%esp)
    1908:	8b 45 08             	mov    0x8(%ebp),%eax
    190b:	89 04 24             	mov    %eax,(%esp)
    190e:	e8 dd fd ff ff       	call   16f0 <putc>
        ap++;
    1913:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1917:	eb 45                	jmp    195e <printf+0x195>
      } else if(c == '%'){
    1919:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    191d:	75 17                	jne    1936 <printf+0x16d>
        putc(fd, c);
    191f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1922:	0f be c0             	movsbl %al,%eax
    1925:	89 44 24 04          	mov    %eax,0x4(%esp)
    1929:	8b 45 08             	mov    0x8(%ebp),%eax
    192c:	89 04 24             	mov    %eax,(%esp)
    192f:	e8 bc fd ff ff       	call   16f0 <putc>
    1934:	eb 28                	jmp    195e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1936:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    193d:	00 
    193e:	8b 45 08             	mov    0x8(%ebp),%eax
    1941:	89 04 24             	mov    %eax,(%esp)
    1944:	e8 a7 fd ff ff       	call   16f0 <putc>
        putc(fd, c);
    1949:	8b 45 e8             	mov    -0x18(%ebp),%eax
    194c:	0f be c0             	movsbl %al,%eax
    194f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1953:	8b 45 08             	mov    0x8(%ebp),%eax
    1956:	89 04 24             	mov    %eax,(%esp)
    1959:	e8 92 fd ff ff       	call   16f0 <putc>
      }
      state = 0;
    195e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1965:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1969:	8b 55 0c             	mov    0xc(%ebp),%edx
    196c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    196f:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1972:	0f b6 00             	movzbl (%eax),%eax
    1975:	84 c0                	test   %al,%al
    1977:	0f 85 6e fe ff ff    	jne    17eb <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    197d:	c9                   	leave  
    197e:	c3                   	ret    
    197f:	90                   	nop

00001980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1980:	55                   	push   %ebp
    1981:	89 e5                	mov    %esp,%ebp
    1983:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1986:	8b 45 08             	mov    0x8(%ebp),%eax
    1989:	83 e8 08             	sub    $0x8,%eax
    198c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    198f:	a1 88 1e 00 00       	mov    0x1e88,%eax
    1994:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1997:	eb 24                	jmp    19bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1999:	8b 45 fc             	mov    -0x4(%ebp),%eax
    199c:	8b 00                	mov    (%eax),%eax
    199e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    19a1:	77 12                	ja     19b5 <free+0x35>
    19a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    19a9:	77 24                	ja     19cf <free+0x4f>
    19ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ae:	8b 00                	mov    (%eax),%eax
    19b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19b3:	77 1a                	ja     19cf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19b8:	8b 00                	mov    (%eax),%eax
    19ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
    19bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    19c3:	76 d4                	jbe    1999 <free+0x19>
    19c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19c8:	8b 00                	mov    (%eax),%eax
    19ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19cd:	76 ca                	jbe    1999 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    19cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19d2:	8b 40 04             	mov    0x4(%eax),%eax
    19d5:	c1 e0 03             	shl    $0x3,%eax
    19d8:	89 c2                	mov    %eax,%edx
    19da:	03 55 f8             	add    -0x8(%ebp),%edx
    19dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19e0:	8b 00                	mov    (%eax),%eax
    19e2:	39 c2                	cmp    %eax,%edx
    19e4:	75 24                	jne    1a0a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    19e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19e9:	8b 50 04             	mov    0x4(%eax),%edx
    19ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ef:	8b 00                	mov    (%eax),%eax
    19f1:	8b 40 04             	mov    0x4(%eax),%eax
    19f4:	01 c2                	add    %eax,%edx
    19f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19f9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    19fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ff:	8b 00                	mov    (%eax),%eax
    1a01:	8b 10                	mov    (%eax),%edx
    1a03:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a06:	89 10                	mov    %edx,(%eax)
    1a08:	eb 0a                	jmp    1a14 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1a0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a0d:	8b 10                	mov    (%eax),%edx
    1a0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a12:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1a14:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a17:	8b 40 04             	mov    0x4(%eax),%eax
    1a1a:	c1 e0 03             	shl    $0x3,%eax
    1a1d:	03 45 fc             	add    -0x4(%ebp),%eax
    1a20:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1a23:	75 20                	jne    1a45 <free+0xc5>
    p->s.size += bp->s.size;
    1a25:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a28:	8b 50 04             	mov    0x4(%eax),%edx
    1a2b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a2e:	8b 40 04             	mov    0x4(%eax),%eax
    1a31:	01 c2                	add    %eax,%edx
    1a33:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a36:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1a39:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a3c:	8b 10                	mov    (%eax),%edx
    1a3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a41:	89 10                	mov    %edx,(%eax)
    1a43:	eb 08                	jmp    1a4d <free+0xcd>
  } else
    p->s.ptr = bp;
    1a45:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a48:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1a4b:	89 10                	mov    %edx,(%eax)
  freep = p;
    1a4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a50:	a3 88 1e 00 00       	mov    %eax,0x1e88
}
    1a55:	c9                   	leave  
    1a56:	c3                   	ret    

00001a57 <morecore>:

static Header*
morecore(uint nu)
{
    1a57:	55                   	push   %ebp
    1a58:	89 e5                	mov    %esp,%ebp
    1a5a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1a5d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1a64:	77 07                	ja     1a6d <morecore+0x16>
    nu = 4096;
    1a66:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1a6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a70:	c1 e0 03             	shl    $0x3,%eax
    1a73:	89 04 24             	mov    %eax,(%esp)
    1a76:	e8 3d fc ff ff       	call   16b8 <sbrk>
    1a7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1a7e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1a82:	75 07                	jne    1a8b <morecore+0x34>
    return 0;
    1a84:	b8 00 00 00 00       	mov    $0x0,%eax
    1a89:	eb 22                	jmp    1aad <morecore+0x56>
  hp = (Header*)p;
    1a8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a94:	8b 55 08             	mov    0x8(%ebp),%edx
    1a97:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a9d:	83 c0 08             	add    $0x8,%eax
    1aa0:	89 04 24             	mov    %eax,(%esp)
    1aa3:	e8 d8 fe ff ff       	call   1980 <free>
  return freep;
    1aa8:	a1 88 1e 00 00       	mov    0x1e88,%eax
}
    1aad:	c9                   	leave  
    1aae:	c3                   	ret    

00001aaf <malloc>:

void*
malloc(uint nbytes)
{
    1aaf:	55                   	push   %ebp
    1ab0:	89 e5                	mov    %esp,%ebp
    1ab2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1ab5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab8:	83 c0 07             	add    $0x7,%eax
    1abb:	c1 e8 03             	shr    $0x3,%eax
    1abe:	83 c0 01             	add    $0x1,%eax
    1ac1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1ac4:	a1 88 1e 00 00       	mov    0x1e88,%eax
    1ac9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1acc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ad0:	75 23                	jne    1af5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1ad2:	c7 45 f0 80 1e 00 00 	movl   $0x1e80,-0x10(%ebp)
    1ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1adc:	a3 88 1e 00 00       	mov    %eax,0x1e88
    1ae1:	a1 88 1e 00 00       	mov    0x1e88,%eax
    1ae6:	a3 80 1e 00 00       	mov    %eax,0x1e80
    base.s.size = 0;
    1aeb:	c7 05 84 1e 00 00 00 	movl   $0x0,0x1e84
    1af2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1af5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1af8:	8b 00                	mov    (%eax),%eax
    1afa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1afd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b00:	8b 40 04             	mov    0x4(%eax),%eax
    1b03:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1b06:	72 4d                	jb     1b55 <malloc+0xa6>
      if(p->s.size == nunits)
    1b08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b0b:	8b 40 04             	mov    0x4(%eax),%eax
    1b0e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1b11:	75 0c                	jne    1b1f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1b13:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b16:	8b 10                	mov    (%eax),%edx
    1b18:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b1b:	89 10                	mov    %edx,(%eax)
    1b1d:	eb 26                	jmp    1b45 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1b1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b22:	8b 40 04             	mov    0x4(%eax),%eax
    1b25:	89 c2                	mov    %eax,%edx
    1b27:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1b2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b2d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1b30:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b33:	8b 40 04             	mov    0x4(%eax),%eax
    1b36:	c1 e0 03             	shl    $0x3,%eax
    1b39:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1b3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b42:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b48:	a3 88 1e 00 00       	mov    %eax,0x1e88
      return (void*)(p + 1);
    1b4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b50:	83 c0 08             	add    $0x8,%eax
    1b53:	eb 38                	jmp    1b8d <malloc+0xde>
    }
    if(p == freep)
    1b55:	a1 88 1e 00 00       	mov    0x1e88,%eax
    1b5a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1b5d:	75 1b                	jne    1b7a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b62:	89 04 24             	mov    %eax,(%esp)
    1b65:	e8 ed fe ff ff       	call   1a57 <morecore>
    1b6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1b6d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b71:	75 07                	jne    1b7a <malloc+0xcb>
        return 0;
    1b73:	b8 00 00 00 00       	mov    $0x0,%eax
    1b78:	eb 13                	jmp    1b8d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b80:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b83:	8b 00                	mov    (%eax),%eax
    1b85:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1b88:	e9 70 ff ff ff       	jmp    1afd <malloc+0x4e>
}
    1b8d:	c9                   	leave  
    1b8e:	c3                   	ret    
    1b8f:	90                   	nop

00001b90 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1b90:	55                   	push   %ebp
    1b91:	89 e5                	mov    %esp,%ebp
    1b93:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1b96:	8b 55 08             	mov    0x8(%ebp),%edx
    1b99:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b9f:	f0 87 02             	lock xchg %eax,(%edx)
    1ba2:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1ba5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1ba8:	c9                   	leave  
    1ba9:	c3                   	ret    

00001baa <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1baa:	55                   	push   %ebp
    1bab:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1bad:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1bb6:	5d                   	pop    %ebp
    1bb7:	c3                   	ret    

00001bb8 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1bb8:	55                   	push   %ebp
    1bb9:	89 e5                	mov    %esp,%ebp
    1bbb:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1bbe:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1bc8:	00 
    1bc9:	89 04 24             	mov    %eax,(%esp)
    1bcc:	e8 bf ff ff ff       	call   1b90 <xchg>
    1bd1:	85 c0                	test   %eax,%eax
    1bd3:	75 e9                	jne    1bbe <lock_acquire+0x6>
}
    1bd5:	c9                   	leave  
    1bd6:	c3                   	ret    

00001bd7 <lock_release>:
void lock_release(lock_t *lock){
    1bd7:	55                   	push   %ebp
    1bd8:	89 e5                	mov    %esp,%ebp
    1bda:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1bdd:	8b 45 08             	mov    0x8(%ebp),%eax
    1be0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1be7:	00 
    1be8:	89 04 24             	mov    %eax,(%esp)
    1beb:	e8 a0 ff ff ff       	call   1b90 <xchg>
}
    1bf0:	c9                   	leave  
    1bf1:	c3                   	ret    

00001bf2 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1bf2:	55                   	push   %ebp
    1bf3:	89 e5                	mov    %esp,%ebp
    1bf5:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1bf8:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1bff:	e8 ab fe ff ff       	call   1aaf <malloc>
    1c04:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1c0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c10:	25 ff 0f 00 00       	and    $0xfff,%eax
    1c15:	85 c0                	test   %eax,%eax
    1c17:	74 15                	je     1c2e <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1c19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c1c:	89 c2                	mov    %eax,%edx
    1c1e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1c24:	b8 00 10 00 00       	mov    $0x1000,%eax
    1c29:	29 d0                	sub    %edx,%eax
    1c2b:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1c2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1c32:	75 1b                	jne    1c4f <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1c34:	c7 44 24 04 38 1e 00 	movl   $0x1e38,0x4(%esp)
    1c3b:	00 
    1c3c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c43:	e8 81 fb ff ff       	call   17c9 <printf>
        return 0;
    1c48:	b8 00 00 00 00       	mov    $0x0,%eax
    1c4d:	eb 6f                	jmp    1cbe <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1c4f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1c52:	8b 55 08             	mov    0x8(%ebp),%edx
    1c55:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c58:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1c5c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c60:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1c67:	00 
    1c68:	89 04 24             	mov    %eax,(%esp)
    1c6b:	e8 60 fa ff ff       	call   16d0 <clone>
    1c70:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1c73:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c77:	79 1b                	jns    1c94 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1c79:	c7 44 24 04 46 1e 00 	movl   $0x1e46,0x4(%esp)
    1c80:	00 
    1c81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c88:	e8 3c fb ff ff       	call   17c9 <printf>
        return 0;
    1c8d:	b8 00 00 00 00       	mov    $0x0,%eax
    1c92:	eb 2a                	jmp    1cbe <thread_create+0xcc>
    }
    if(tid > 0){
    1c94:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c98:	7e 05                	jle    1c9f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1c9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c9d:	eb 1f                	jmp    1cbe <thread_create+0xcc>
    }
    if(tid == 0){
    1c9f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ca3:	75 14                	jne    1cb9 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1ca5:	c7 44 24 04 53 1e 00 	movl   $0x1e53,0x4(%esp)
    1cac:	00 
    1cad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cb4:	e8 10 fb ff ff       	call   17c9 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1cb9:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1cbe:	c9                   	leave  
    1cbf:	c3                   	ret    

00001cc0 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1cc0:	55                   	push   %ebp
    1cc1:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1cc3:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1ccc:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1cd6:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1ce0:	5d                   	pop    %ebp
    1ce1:	c3                   	ret    

00001ce2 <add_q>:

void add_q(struct queue *q, int v){
    1ce2:	55                   	push   %ebp
    1ce3:	89 e5                	mov    %esp,%ebp
    1ce5:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1ce8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1cef:	e8 bb fd ff ff       	call   1aaf <malloc>
    1cf4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1cf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cfa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1d01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d04:	8b 55 0c             	mov    0xc(%ebp),%edx
    1d07:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1d09:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0c:	8b 40 04             	mov    0x4(%eax),%eax
    1d0f:	85 c0                	test   %eax,%eax
    1d11:	75 0b                	jne    1d1e <add_q+0x3c>
        q->head = n;
    1d13:	8b 45 08             	mov    0x8(%ebp),%eax
    1d16:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1d19:	89 50 04             	mov    %edx,0x4(%eax)
    1d1c:	eb 0c                	jmp    1d2a <add_q+0x48>
    }else{
        q->tail->next = n;
    1d1e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d21:	8b 40 08             	mov    0x8(%eax),%eax
    1d24:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1d27:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1d2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1d30:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1d33:	8b 45 08             	mov    0x8(%ebp),%eax
    1d36:	8b 00                	mov    (%eax),%eax
    1d38:	8d 50 01             	lea    0x1(%eax),%edx
    1d3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3e:	89 10                	mov    %edx,(%eax)
}
    1d40:	c9                   	leave  
    1d41:	c3                   	ret    

00001d42 <empty_q>:

int empty_q(struct queue *q){
    1d42:	55                   	push   %ebp
    1d43:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1d45:	8b 45 08             	mov    0x8(%ebp),%eax
    1d48:	8b 00                	mov    (%eax),%eax
    1d4a:	85 c0                	test   %eax,%eax
    1d4c:	75 07                	jne    1d55 <empty_q+0x13>
        return 1;
    1d4e:	b8 01 00 00 00       	mov    $0x1,%eax
    1d53:	eb 05                	jmp    1d5a <empty_q+0x18>
    else
        return 0;
    1d55:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1d5a:	5d                   	pop    %ebp
    1d5b:	c3                   	ret    

00001d5c <pop_q>:
int pop_q(struct queue *q){
    1d5c:	55                   	push   %ebp
    1d5d:	89 e5                	mov    %esp,%ebp
    1d5f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1d62:	8b 45 08             	mov    0x8(%ebp),%eax
    1d65:	89 04 24             	mov    %eax,(%esp)
    1d68:	e8 d5 ff ff ff       	call   1d42 <empty_q>
    1d6d:	85 c0                	test   %eax,%eax
    1d6f:	75 5d                	jne    1dce <pop_q+0x72>
       val = q->head->value; 
    1d71:	8b 45 08             	mov    0x8(%ebp),%eax
    1d74:	8b 40 04             	mov    0x4(%eax),%eax
    1d77:	8b 00                	mov    (%eax),%eax
    1d79:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1d7c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7f:	8b 40 04             	mov    0x4(%eax),%eax
    1d82:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1d85:	8b 45 08             	mov    0x8(%ebp),%eax
    1d88:	8b 40 04             	mov    0x4(%eax),%eax
    1d8b:	8b 50 04             	mov    0x4(%eax),%edx
    1d8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d91:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1d94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d97:	89 04 24             	mov    %eax,(%esp)
    1d9a:	e8 e1 fb ff ff       	call   1980 <free>
       q->size--;
    1d9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1da2:	8b 00                	mov    (%eax),%eax
    1da4:	8d 50 ff             	lea    -0x1(%eax),%edx
    1da7:	8b 45 08             	mov    0x8(%ebp),%eax
    1daa:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1dac:	8b 45 08             	mov    0x8(%ebp),%eax
    1daf:	8b 00                	mov    (%eax),%eax
    1db1:	85 c0                	test   %eax,%eax
    1db3:	75 14                	jne    1dc9 <pop_q+0x6d>
            q->head = 0;
    1db5:	8b 45 08             	mov    0x8(%ebp),%eax
    1db8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1dbf:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1dc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1dcc:	eb 05                	jmp    1dd3 <pop_q+0x77>
    }
    return -1;
    1dce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1dd3:	c9                   	leave  
    1dd4:	c3                   	ret    
