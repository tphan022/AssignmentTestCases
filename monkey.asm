
_monkey:     file format elf32-i386


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
    100f:	e8 14 0c 00 00       	call   1c28 <init_q>
	lock_init(&s->lock);
    1014:	8b 45 08             	mov    0x8(%ebp),%eax
    1017:	89 04 24             	mov    %eax,(%esp)
    101a:	e8 f3 0a 00 00       	call   1b12 <lock_init>
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
    1036:	e8 e5 0a 00 00       	call   1b20 <lock_acquire>
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
    105a:	e8 e0 0a 00 00       	call   1b3f <lock_release>
		return;
    105f:	eb 27                	jmp    1088 <sem_acquire+0x5e>
	}	
	
	add_q(&s->q, getpid());	
    1061:	e8 b2 05 00 00       	call   1618 <getpid>
    1066:	8b 55 08             	mov    0x8(%ebp),%edx
    1069:	83 c2 08             	add    $0x8,%edx
    106c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1070:	89 14 24             	mov    %edx,(%esp)
    1073:	e8 d2 0b 00 00       	call   1c4a <add_q>
	lock_release(&s->lock);
    1078:	8b 45 08             	mov    0x8(%ebp),%eax
    107b:	89 04 24             	mov    %eax,(%esp)
    107e:	e8 bc 0a 00 00       	call   1b3f <lock_release>
	tsleep();
    1083:	e8 c0 05 00 00       	call   1648 <tsleep>
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
    1096:	e8 85 0a 00 00       	call   1b20 <lock_acquire>
	if (empty_q(&s->q) == 1)
    109b:	8b 45 08             	mov    0x8(%ebp),%eax
    109e:	83 c0 08             	add    $0x8,%eax
    10a1:	89 04 24             	mov    %eax,(%esp)
    10a4:	e8 01 0c 00 00       	call   1caa <empty_q>
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
    10c8:	e8 f7 0b 00 00       	call   1cc4 <pop_q>
    10cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		twakeup(tid);
    10d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d3:	89 04 24             	mov    %eax,(%esp)
    10d6:	e8 75 05 00 00       	call   1650 <twakeup>
	}
		
	lock_release(&s->lock);
    10db:	8b 45 08             	mov    0x8(%ebp),%eax
    10de:	89 04 24             	mov    %eax,(%esp)
    10e1:	e8 59 0a 00 00       	call   1b3f <lock_release>
};
    10e6:	c9                   	leave  
    10e7:	c3                   	ret    

000010e8 <main>:
} mutex;

int num_dom = 0;

int main()
{
    10e8:	55                   	push   %ebp
    10e9:	89 e5                	mov    %esp,%ebp
    10eb:	83 e4 f0             	and    $0xfffffff0,%esp
    10ee:	83 ec 20             	sub    $0x20,%esp
	sem_init(&s_d, 0);	
    10f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10f8:	00 
    10f9:	c7 04 24 34 1e 00 00 	movl   $0x1e34,(%esp)
    1100:	e8 fb fe ff ff       	call   1000 <sem_init>
	sem_init(&s_t, 3);	
    1105:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    110c:	00 
    110d:	c7 04 24 1c 1e 00 00 	movl   $0x1e1c,(%esp)
    1114:	e8 e7 fe ff ff       	call   1000 <sem_init>
	lock_init(&mutex.lock);
    1119:	c7 04 24 30 1e 00 00 	movl   $0x1e30,(%esp)
    1120:	e8 ed 09 00 00       	call   1b12 <lock_init>

	printf(1, "start ...\n");
    1125:	c7 44 24 04 40 1d 00 	movl   $0x1d40,0x4(%esp)
    112c:	00 
    112d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1134:	e8 f8 05 00 00       	call   1731 <printf>
	void * tid2 = thread_create(Monkey, (void*) 0);
    1139:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1140:	00 
    1141:	c7 04 24 27 12 00 00 	movl   $0x1227,(%esp)
    1148:	e8 0d 0a 00 00       	call   1b5a <thread_create>
    114d:	89 44 24 10          	mov    %eax,0x10(%esp)
	if(tid2 == 0) 
    1151:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    1156:	75 19                	jne    1171 <main+0x89>
	{
		printf(1, "thread_create failed.\n");
    1158:	c7 44 24 04 4b 1d 00 	movl   $0x1d4b,0x4(%esp)
    115f:	00 
    1160:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1167:	e8 c5 05 00 00       	call   1731 <printf>
		exit();
    116c:	e8 27 04 00 00       	call   1598 <exit>
	}

	void * tid3 = thread_create(DomMonkey, (void*) 0);
    1171:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1178:	00 
    1179:	c7 04 24 87 12 00 00 	movl   $0x1287,(%esp)
    1180:	e8 d5 09 00 00       	call   1b5a <thread_create>
    1185:	89 44 24 14          	mov    %eax,0x14(%esp)
	if(tid3 == 0) 
    1189:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
    118e:	75 19                	jne    11a9 <main+0xc1>
	{
		printf(1, "thread_create failed.\n");
    1190:	c7 44 24 04 4b 1d 00 	movl   $0x1d4b,0x4(%esp)
    1197:	00 
    1198:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    119f:	e8 8d 05 00 00       	call   1731 <printf>
		exit();
    11a4:	e8 ef 03 00 00       	call   1598 <exit>
	}

	void * tid1 = thread_create(Monkey, (void*) 0);
    11a9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b0:	00 
    11b1:	c7 04 24 27 12 00 00 	movl   $0x1227,(%esp)
    11b8:	e8 9d 09 00 00       	call   1b5a <thread_create>
    11bd:	89 44 24 18          	mov    %eax,0x18(%esp)
	if(tid1 == 0) 
    11c1:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    11c6:	75 19                	jne    11e1 <main+0xf9>
	{
		printf(1, "thread_create failed.\n");
    11c8:	c7 44 24 04 4b 1d 00 	movl   $0x1d4b,0x4(%esp)
    11cf:	00 
    11d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d7:	e8 55 05 00 00       	call   1731 <printf>
		exit();
    11dc:	e8 b7 03 00 00       	call   1598 <exit>
	}

	void * tid4 = thread_create(Monkey, (void*) 0);
    11e1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11e8:	00 
    11e9:	c7 04 24 27 12 00 00 	movl   $0x1227,(%esp)
    11f0:	e8 65 09 00 00       	call   1b5a <thread_create>
    11f5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	if(tid4 == 0) 
    11f9:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    11fe:	75 19                	jne    1219 <main+0x131>
	{
		printf(1, "thread_create failed.\n");
    1200:	c7 44 24 04 4b 1d 00 	movl   $0x1d4b,0x4(%esp)
    1207:	00 
    1208:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    120f:	e8 1d 05 00 00       	call   1731 <printf>
		exit();
    1214:	e8 7f 03 00 00       	call   1598 <exit>
	{
		printf(1, "thread_create failed.\n");
		exit();
	}
*/
	while(wait()>0);
    1219:	e8 82 03 00 00       	call   15a0 <wait>
    121e:	85 c0                	test   %eax,%eax
    1220:	7f f7                	jg     1219 <main+0x131>
//	printf(1, "count = %d\n", count);
	exit();
    1222:	e8 71 03 00 00       	call   1598 <exit>

00001227 <Monkey>:
	return 0;
}

void Monkey(void * arg_ptr)
{
    1227:	55                   	push   %ebp
    1228:	89 e5                	mov    %esp,%ebp
    122a:	83 ec 18             	sub    $0x18,%esp
	printf(1, "Monkey arrives!\n");
    122d:	c7 44 24 04 62 1d 00 	movl   $0x1d62,0x4(%esp)
    1234:	00 
    1235:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    123c:	e8 f0 04 00 00       	call   1731 <printf>
	if (num_dom > 0)
    1241:	a1 0c 1e 00 00       	mov    0x1e0c,%eax
    1246:	85 c0                	test   %eax,%eax
    1248:	7e 0c                	jle    1256 <Monkey+0x2f>
	{
		sem_acquire(&s_d);
    124a:	c7 04 24 34 1e 00 00 	movl   $0x1e34,(%esp)
    1251:	e8 d4 fd ff ff       	call   102a <sem_acquire>
	}

//	thread_yield();	

	sem_acquire(&s_t);
    1256:	c7 04 24 1c 1e 00 00 	movl   $0x1e1c,(%esp)
    125d:	e8 c8 fd ff ff       	call   102a <sem_acquire>
	printf(1, "Grabbed coconut!\n");
    1262:	c7 44 24 04 73 1d 00 	movl   $0x1d73,0x4(%esp)
    1269:	00 
    126a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1271:	e8 bb 04 00 00       	call   1731 <printf>
	sem_signal(&s_t);
    1276:	c7 04 24 1c 1e 00 00 	movl   $0x1e1c,(%esp)
    127d:	e8 08 fe ff ff       	call   108a <sem_signal>

	texit();
    1282:	e8 b9 03 00 00       	call   1640 <texit>

00001287 <DomMonkey>:
}

void DomMonkey(void * arg_ptr)
{	
    1287:	55                   	push   %ebp
    1288:	89 e5                	mov    %esp,%ebp
    128a:	83 ec 18             	sub    $0x18,%esp
	printf(1, "Dominant monkey arrives!\n");
    128d:	c7 44 24 04 85 1d 00 	movl   $0x1d85,0x4(%esp)
    1294:	00 
    1295:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    129c:	e8 90 04 00 00       	call   1731 <printf>

	lock_acquire(&mutex.lock);
    12a1:	c7 04 24 30 1e 00 00 	movl   $0x1e30,(%esp)
    12a8:	e8 73 08 00 00       	call   1b20 <lock_acquire>
	num_dom++;
    12ad:	a1 0c 1e 00 00       	mov    0x1e0c,%eax
    12b2:	83 c0 01             	add    $0x1,%eax
    12b5:	a3 0c 1e 00 00       	mov    %eax,0x1e0c
	lock_release(&mutex.lock);
    12ba:	c7 04 24 30 1e 00 00 	movl   $0x1e30,(%esp)
    12c1:	e8 79 08 00 00       	call   1b3f <lock_release>

//	thread_yield();

	sem_acquire(&s_t);
    12c6:	c7 04 24 1c 1e 00 00 	movl   $0x1e1c,(%esp)
    12cd:	e8 58 fd ff ff       	call   102a <sem_acquire>
	printf(1, "Dominant monkey grabbed coconut!\n");
    12d2:	c7 44 24 04 a0 1d 00 	movl   $0x1da0,0x4(%esp)
    12d9:	00 
    12da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12e1:	e8 4b 04 00 00       	call   1731 <printf>

	sem_signal(&s_t);
    12e6:	c7 04 24 1c 1e 00 00 	movl   $0x1e1c,(%esp)
    12ed:	e8 98 fd ff ff       	call   108a <sem_signal>

	lock_acquire(&mutex.lock);
    12f2:	c7 04 24 30 1e 00 00 	movl   $0x1e30,(%esp)
    12f9:	e8 22 08 00 00       	call   1b20 <lock_acquire>
	num_dom--;
    12fe:	a1 0c 1e 00 00       	mov    0x1e0c,%eax
    1303:	83 e8 01             	sub    $0x1,%eax
    1306:	a3 0c 1e 00 00       	mov    %eax,0x1e0c
	lock_release(&mutex.lock);
    130b:	c7 04 24 30 1e 00 00 	movl   $0x1e30,(%esp)
    1312:	e8 28 08 00 00       	call   1b3f <lock_release>

	if (num_dom + 1 == 1)
    1317:	a1 0c 1e 00 00       	mov    0x1e0c,%eax
    131c:	85 c0                	test   %eax,%eax
    131e:	75 0c                	jne    132c <DomMonkey+0xa5>
	sem_signal(&s_d);
    1320:	c7 04 24 34 1e 00 00 	movl   $0x1e34,(%esp)
    1327:	e8 5e fd ff ff       	call   108a <sem_signal>

	texit();
    132c:	e8 0f 03 00 00       	call   1640 <texit>
    1331:	90                   	nop
    1332:	90                   	nop
    1333:	90                   	nop

00001334 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1334:	55                   	push   %ebp
    1335:	89 e5                	mov    %esp,%ebp
    1337:	57                   	push   %edi
    1338:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1339:	8b 4d 08             	mov    0x8(%ebp),%ecx
    133c:	8b 55 10             	mov    0x10(%ebp),%edx
    133f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1342:	89 cb                	mov    %ecx,%ebx
    1344:	89 df                	mov    %ebx,%edi
    1346:	89 d1                	mov    %edx,%ecx
    1348:	fc                   	cld    
    1349:	f3 aa                	rep stos %al,%es:(%edi)
    134b:	89 ca                	mov    %ecx,%edx
    134d:	89 fb                	mov    %edi,%ebx
    134f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1352:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1355:	5b                   	pop    %ebx
    1356:	5f                   	pop    %edi
    1357:	5d                   	pop    %ebp
    1358:	c3                   	ret    

00001359 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1359:	55                   	push   %ebp
    135a:	89 e5                	mov    %esp,%ebp
    135c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    135f:	8b 45 08             	mov    0x8(%ebp),%eax
    1362:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1365:	8b 45 0c             	mov    0xc(%ebp),%eax
    1368:	0f b6 10             	movzbl (%eax),%edx
    136b:	8b 45 08             	mov    0x8(%ebp),%eax
    136e:	88 10                	mov    %dl,(%eax)
    1370:	8b 45 08             	mov    0x8(%ebp),%eax
    1373:	0f b6 00             	movzbl (%eax),%eax
    1376:	84 c0                	test   %al,%al
    1378:	0f 95 c0             	setne  %al
    137b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    137f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1383:	84 c0                	test   %al,%al
    1385:	75 de                	jne    1365 <strcpy+0xc>
    ;
  return os;
    1387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    138a:	c9                   	leave  
    138b:	c3                   	ret    

0000138c <strcmp>:

int
strcmp(const char *p, const char *q)
{
    138c:	55                   	push   %ebp
    138d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    138f:	eb 08                	jmp    1399 <strcmp+0xd>
    p++, q++;
    1391:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1395:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1399:	8b 45 08             	mov    0x8(%ebp),%eax
    139c:	0f b6 00             	movzbl (%eax),%eax
    139f:	84 c0                	test   %al,%al
    13a1:	74 10                	je     13b3 <strcmp+0x27>
    13a3:	8b 45 08             	mov    0x8(%ebp),%eax
    13a6:	0f b6 10             	movzbl (%eax),%edx
    13a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ac:	0f b6 00             	movzbl (%eax),%eax
    13af:	38 c2                	cmp    %al,%dl
    13b1:	74 de                	je     1391 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    13b3:	8b 45 08             	mov    0x8(%ebp),%eax
    13b6:	0f b6 00             	movzbl (%eax),%eax
    13b9:	0f b6 d0             	movzbl %al,%edx
    13bc:	8b 45 0c             	mov    0xc(%ebp),%eax
    13bf:	0f b6 00             	movzbl (%eax),%eax
    13c2:	0f b6 c0             	movzbl %al,%eax
    13c5:	89 d1                	mov    %edx,%ecx
    13c7:	29 c1                	sub    %eax,%ecx
    13c9:	89 c8                	mov    %ecx,%eax
}
    13cb:	5d                   	pop    %ebp
    13cc:	c3                   	ret    

000013cd <strlen>:

uint
strlen(char *s)
{
    13cd:	55                   	push   %ebp
    13ce:	89 e5                	mov    %esp,%ebp
    13d0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    13d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    13da:	eb 04                	jmp    13e0 <strlen+0x13>
    13dc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    13e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13e3:	03 45 08             	add    0x8(%ebp),%eax
    13e6:	0f b6 00             	movzbl (%eax),%eax
    13e9:	84 c0                	test   %al,%al
    13eb:	75 ef                	jne    13dc <strlen+0xf>
    ;
  return n;
    13ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13f0:	c9                   	leave  
    13f1:	c3                   	ret    

000013f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
    13f2:	55                   	push   %ebp
    13f3:	89 e5                	mov    %esp,%ebp
    13f5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    13f8:	8b 45 10             	mov    0x10(%ebp),%eax
    13fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    13ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    1402:	89 44 24 04          	mov    %eax,0x4(%esp)
    1406:	8b 45 08             	mov    0x8(%ebp),%eax
    1409:	89 04 24             	mov    %eax,(%esp)
    140c:	e8 23 ff ff ff       	call   1334 <stosb>
  return dst;
    1411:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1414:	c9                   	leave  
    1415:	c3                   	ret    

00001416 <strchr>:

char*
strchr(const char *s, char c)
{
    1416:	55                   	push   %ebp
    1417:	89 e5                	mov    %esp,%ebp
    1419:	83 ec 04             	sub    $0x4,%esp
    141c:	8b 45 0c             	mov    0xc(%ebp),%eax
    141f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1422:	eb 14                	jmp    1438 <strchr+0x22>
    if(*s == c)
    1424:	8b 45 08             	mov    0x8(%ebp),%eax
    1427:	0f b6 00             	movzbl (%eax),%eax
    142a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    142d:	75 05                	jne    1434 <strchr+0x1e>
      return (char*)s;
    142f:	8b 45 08             	mov    0x8(%ebp),%eax
    1432:	eb 13                	jmp    1447 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1434:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1438:	8b 45 08             	mov    0x8(%ebp),%eax
    143b:	0f b6 00             	movzbl (%eax),%eax
    143e:	84 c0                	test   %al,%al
    1440:	75 e2                	jne    1424 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1442:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1447:	c9                   	leave  
    1448:	c3                   	ret    

00001449 <gets>:

char*
gets(char *buf, int max)
{
    1449:	55                   	push   %ebp
    144a:	89 e5                	mov    %esp,%ebp
    144c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    144f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1456:	eb 44                	jmp    149c <gets+0x53>
    cc = read(0, &c, 1);
    1458:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    145f:	00 
    1460:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1463:	89 44 24 04          	mov    %eax,0x4(%esp)
    1467:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    146e:	e8 3d 01 00 00       	call   15b0 <read>
    1473:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1476:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    147a:	7e 2d                	jle    14a9 <gets+0x60>
      break;
    buf[i++] = c;
    147c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    147f:	03 45 08             	add    0x8(%ebp),%eax
    1482:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1486:	88 10                	mov    %dl,(%eax)
    1488:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    148c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1490:	3c 0a                	cmp    $0xa,%al
    1492:	74 16                	je     14aa <gets+0x61>
    1494:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1498:	3c 0d                	cmp    $0xd,%al
    149a:	74 0e                	je     14aa <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    149c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    149f:	83 c0 01             	add    $0x1,%eax
    14a2:	3b 45 0c             	cmp    0xc(%ebp),%eax
    14a5:	7c b1                	jl     1458 <gets+0xf>
    14a7:	eb 01                	jmp    14aa <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    14a9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    14aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14ad:	03 45 08             	add    0x8(%ebp),%eax
    14b0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    14b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14b6:	c9                   	leave  
    14b7:	c3                   	ret    

000014b8 <stat>:

int
stat(char *n, struct stat *st)
{
    14b8:	55                   	push   %ebp
    14b9:	89 e5                	mov    %esp,%ebp
    14bb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14be:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14c5:	00 
    14c6:	8b 45 08             	mov    0x8(%ebp),%eax
    14c9:	89 04 24             	mov    %eax,(%esp)
    14cc:	e8 07 01 00 00       	call   15d8 <open>
    14d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    14d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14d8:	79 07                	jns    14e1 <stat+0x29>
    return -1;
    14da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    14df:	eb 23                	jmp    1504 <stat+0x4c>
  r = fstat(fd, st);
    14e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    14e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    14e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14eb:	89 04 24             	mov    %eax,(%esp)
    14ee:	e8 fd 00 00 00       	call   15f0 <fstat>
    14f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    14f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14f9:	89 04 24             	mov    %eax,(%esp)
    14fc:	e8 bf 00 00 00       	call   15c0 <close>
  return r;
    1501:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1504:	c9                   	leave  
    1505:	c3                   	ret    

00001506 <atoi>:

int
atoi(const char *s)
{
    1506:	55                   	push   %ebp
    1507:	89 e5                	mov    %esp,%ebp
    1509:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    150c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1513:	eb 24                	jmp    1539 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1515:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1518:	89 d0                	mov    %edx,%eax
    151a:	c1 e0 02             	shl    $0x2,%eax
    151d:	01 d0                	add    %edx,%eax
    151f:	01 c0                	add    %eax,%eax
    1521:	89 c2                	mov    %eax,%edx
    1523:	8b 45 08             	mov    0x8(%ebp),%eax
    1526:	0f b6 00             	movzbl (%eax),%eax
    1529:	0f be c0             	movsbl %al,%eax
    152c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    152f:	83 e8 30             	sub    $0x30,%eax
    1532:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1535:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1539:	8b 45 08             	mov    0x8(%ebp),%eax
    153c:	0f b6 00             	movzbl (%eax),%eax
    153f:	3c 2f                	cmp    $0x2f,%al
    1541:	7e 0a                	jle    154d <atoi+0x47>
    1543:	8b 45 08             	mov    0x8(%ebp),%eax
    1546:	0f b6 00             	movzbl (%eax),%eax
    1549:	3c 39                	cmp    $0x39,%al
    154b:	7e c8                	jle    1515 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    154d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1550:	c9                   	leave  
    1551:	c3                   	ret    

00001552 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1552:	55                   	push   %ebp
    1553:	89 e5                	mov    %esp,%ebp
    1555:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1558:	8b 45 08             	mov    0x8(%ebp),%eax
    155b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    155e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1561:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1564:	eb 13                	jmp    1579 <memmove+0x27>
    *dst++ = *src++;
    1566:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1569:	0f b6 10             	movzbl (%eax),%edx
    156c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    156f:	88 10                	mov    %dl,(%eax)
    1571:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1575:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1579:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    157d:	0f 9f c0             	setg   %al
    1580:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1584:	84 c0                	test   %al,%al
    1586:	75 de                	jne    1566 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1588:	8b 45 08             	mov    0x8(%ebp),%eax
}
    158b:	c9                   	leave  
    158c:	c3                   	ret    
    158d:	90                   	nop
    158e:	90                   	nop
    158f:	90                   	nop

00001590 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1590:	b8 01 00 00 00       	mov    $0x1,%eax
    1595:	cd 40                	int    $0x40
    1597:	c3                   	ret    

00001598 <exit>:
SYSCALL(exit)
    1598:	b8 02 00 00 00       	mov    $0x2,%eax
    159d:	cd 40                	int    $0x40
    159f:	c3                   	ret    

000015a0 <wait>:
SYSCALL(wait)
    15a0:	b8 03 00 00 00       	mov    $0x3,%eax
    15a5:	cd 40                	int    $0x40
    15a7:	c3                   	ret    

000015a8 <pipe>:
SYSCALL(pipe)
    15a8:	b8 04 00 00 00       	mov    $0x4,%eax
    15ad:	cd 40                	int    $0x40
    15af:	c3                   	ret    

000015b0 <read>:
SYSCALL(read)
    15b0:	b8 05 00 00 00       	mov    $0x5,%eax
    15b5:	cd 40                	int    $0x40
    15b7:	c3                   	ret    

000015b8 <write>:
SYSCALL(write)
    15b8:	b8 10 00 00 00       	mov    $0x10,%eax
    15bd:	cd 40                	int    $0x40
    15bf:	c3                   	ret    

000015c0 <close>:
SYSCALL(close)
    15c0:	b8 15 00 00 00       	mov    $0x15,%eax
    15c5:	cd 40                	int    $0x40
    15c7:	c3                   	ret    

000015c8 <kill>:
SYSCALL(kill)
    15c8:	b8 06 00 00 00       	mov    $0x6,%eax
    15cd:	cd 40                	int    $0x40
    15cf:	c3                   	ret    

000015d0 <exec>:
SYSCALL(exec)
    15d0:	b8 07 00 00 00       	mov    $0x7,%eax
    15d5:	cd 40                	int    $0x40
    15d7:	c3                   	ret    

000015d8 <open>:
SYSCALL(open)
    15d8:	b8 0f 00 00 00       	mov    $0xf,%eax
    15dd:	cd 40                	int    $0x40
    15df:	c3                   	ret    

000015e0 <mknod>:
SYSCALL(mknod)
    15e0:	b8 11 00 00 00       	mov    $0x11,%eax
    15e5:	cd 40                	int    $0x40
    15e7:	c3                   	ret    

000015e8 <unlink>:
SYSCALL(unlink)
    15e8:	b8 12 00 00 00       	mov    $0x12,%eax
    15ed:	cd 40                	int    $0x40
    15ef:	c3                   	ret    

000015f0 <fstat>:
SYSCALL(fstat)
    15f0:	b8 08 00 00 00       	mov    $0x8,%eax
    15f5:	cd 40                	int    $0x40
    15f7:	c3                   	ret    

000015f8 <link>:
SYSCALL(link)
    15f8:	b8 13 00 00 00       	mov    $0x13,%eax
    15fd:	cd 40                	int    $0x40
    15ff:	c3                   	ret    

00001600 <mkdir>:
SYSCALL(mkdir)
    1600:	b8 14 00 00 00       	mov    $0x14,%eax
    1605:	cd 40                	int    $0x40
    1607:	c3                   	ret    

00001608 <chdir>:
SYSCALL(chdir)
    1608:	b8 09 00 00 00       	mov    $0x9,%eax
    160d:	cd 40                	int    $0x40
    160f:	c3                   	ret    

00001610 <dup>:
SYSCALL(dup)
    1610:	b8 0a 00 00 00       	mov    $0xa,%eax
    1615:	cd 40                	int    $0x40
    1617:	c3                   	ret    

00001618 <getpid>:
SYSCALL(getpid)
    1618:	b8 0b 00 00 00       	mov    $0xb,%eax
    161d:	cd 40                	int    $0x40
    161f:	c3                   	ret    

00001620 <sbrk>:
SYSCALL(sbrk)
    1620:	b8 0c 00 00 00       	mov    $0xc,%eax
    1625:	cd 40                	int    $0x40
    1627:	c3                   	ret    

00001628 <sleep>:
SYSCALL(sleep)
    1628:	b8 0d 00 00 00       	mov    $0xd,%eax
    162d:	cd 40                	int    $0x40
    162f:	c3                   	ret    

00001630 <uptime>:
SYSCALL(uptime)
    1630:	b8 0e 00 00 00       	mov    $0xe,%eax
    1635:	cd 40                	int    $0x40
    1637:	c3                   	ret    

00001638 <clone>:
SYSCALL(clone)
    1638:	b8 16 00 00 00       	mov    $0x16,%eax
    163d:	cd 40                	int    $0x40
    163f:	c3                   	ret    

00001640 <texit>:
SYSCALL(texit)
    1640:	b8 17 00 00 00       	mov    $0x17,%eax
    1645:	cd 40                	int    $0x40
    1647:	c3                   	ret    

00001648 <tsleep>:
SYSCALL(tsleep)
    1648:	b8 18 00 00 00       	mov    $0x18,%eax
    164d:	cd 40                	int    $0x40
    164f:	c3                   	ret    

00001650 <twakeup>:
SYSCALL(twakeup)
    1650:	b8 19 00 00 00       	mov    $0x19,%eax
    1655:	cd 40                	int    $0x40
    1657:	c3                   	ret    

00001658 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1658:	55                   	push   %ebp
    1659:	89 e5                	mov    %esp,%ebp
    165b:	83 ec 28             	sub    $0x28,%esp
    165e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1661:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1664:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    166b:	00 
    166c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    166f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1673:	8b 45 08             	mov    0x8(%ebp),%eax
    1676:	89 04 24             	mov    %eax,(%esp)
    1679:	e8 3a ff ff ff       	call   15b8 <write>
}
    167e:	c9                   	leave  
    167f:	c3                   	ret    

00001680 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1680:	55                   	push   %ebp
    1681:	89 e5                	mov    %esp,%ebp
    1683:	53                   	push   %ebx
    1684:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1687:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    168e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1692:	74 17                	je     16ab <printint+0x2b>
    1694:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1698:	79 11                	jns    16ab <printint+0x2b>
    neg = 1;
    169a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    16a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    16a4:	f7 d8                	neg    %eax
    16a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    16a9:	eb 06                	jmp    16b1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    16ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    16b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    16b8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    16bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16c1:	ba 00 00 00 00       	mov    $0x0,%edx
    16c6:	f7 f3                	div    %ebx
    16c8:	89 d0                	mov    %edx,%eax
    16ca:	0f b6 80 f8 1d 00 00 	movzbl 0x1df8(%eax),%eax
    16d1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    16d5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    16d9:	8b 45 10             	mov    0x10(%ebp),%eax
    16dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    16df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16e2:	ba 00 00 00 00       	mov    $0x0,%edx
    16e7:	f7 75 d4             	divl   -0x2c(%ebp)
    16ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
    16ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    16f1:	75 c5                	jne    16b8 <printint+0x38>
  if(neg)
    16f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    16f7:	74 28                	je     1721 <printint+0xa1>
    buf[i++] = '-';
    16f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16fc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1701:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1705:	eb 1a                	jmp    1721 <printint+0xa1>
    putc(fd, buf[i]);
    1707:	8b 45 ec             	mov    -0x14(%ebp),%eax
    170a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    170f:	0f be c0             	movsbl %al,%eax
    1712:	89 44 24 04          	mov    %eax,0x4(%esp)
    1716:	8b 45 08             	mov    0x8(%ebp),%eax
    1719:	89 04 24             	mov    %eax,(%esp)
    171c:	e8 37 ff ff ff       	call   1658 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1721:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1725:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1729:	79 dc                	jns    1707 <printint+0x87>
    putc(fd, buf[i]);
}
    172b:	83 c4 44             	add    $0x44,%esp
    172e:	5b                   	pop    %ebx
    172f:	5d                   	pop    %ebp
    1730:	c3                   	ret    

00001731 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1731:	55                   	push   %ebp
    1732:	89 e5                	mov    %esp,%ebp
    1734:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1737:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    173e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1741:	83 c0 04             	add    $0x4,%eax
    1744:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1747:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    174e:	e9 7e 01 00 00       	jmp    18d1 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1753:	8b 55 0c             	mov    0xc(%ebp),%edx
    1756:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1759:	8d 04 02             	lea    (%edx,%eax,1),%eax
    175c:	0f b6 00             	movzbl (%eax),%eax
    175f:	0f be c0             	movsbl %al,%eax
    1762:	25 ff 00 00 00       	and    $0xff,%eax
    1767:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    176a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    176e:	75 2c                	jne    179c <printf+0x6b>
      if(c == '%'){
    1770:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1774:	75 0c                	jne    1782 <printf+0x51>
        state = '%';
    1776:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    177d:	e9 4b 01 00 00       	jmp    18cd <printf+0x19c>
      } else {
        putc(fd, c);
    1782:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1785:	0f be c0             	movsbl %al,%eax
    1788:	89 44 24 04          	mov    %eax,0x4(%esp)
    178c:	8b 45 08             	mov    0x8(%ebp),%eax
    178f:	89 04 24             	mov    %eax,(%esp)
    1792:	e8 c1 fe ff ff       	call   1658 <putc>
    1797:	e9 31 01 00 00       	jmp    18cd <printf+0x19c>
      }
    } else if(state == '%'){
    179c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    17a0:	0f 85 27 01 00 00    	jne    18cd <printf+0x19c>
      if(c == 'd'){
    17a6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    17aa:	75 2d                	jne    17d9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    17ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17af:	8b 00                	mov    (%eax),%eax
    17b1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    17b8:	00 
    17b9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    17c0:	00 
    17c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    17c5:	8b 45 08             	mov    0x8(%ebp),%eax
    17c8:	89 04 24             	mov    %eax,(%esp)
    17cb:	e8 b0 fe ff ff       	call   1680 <printint>
        ap++;
    17d0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    17d4:	e9 ed 00 00 00       	jmp    18c6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    17d9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    17dd:	74 06                	je     17e5 <printf+0xb4>
    17df:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    17e3:	75 2d                	jne    1812 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    17e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e8:	8b 00                	mov    (%eax),%eax
    17ea:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    17f1:	00 
    17f2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    17f9:	00 
    17fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    17fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1801:	89 04 24             	mov    %eax,(%esp)
    1804:	e8 77 fe ff ff       	call   1680 <printint>
        ap++;
    1809:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    180d:	e9 b4 00 00 00       	jmp    18c6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1812:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1816:	75 46                	jne    185e <printf+0x12d>
        s = (char*)*ap;
    1818:	8b 45 f4             	mov    -0xc(%ebp),%eax
    181b:	8b 00                	mov    (%eax),%eax
    181d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1820:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1824:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1828:	75 27                	jne    1851 <printf+0x120>
          s = "(null)";
    182a:	c7 45 e4 c2 1d 00 00 	movl   $0x1dc2,-0x1c(%ebp)
        while(*s != 0){
    1831:	eb 1f                	jmp    1852 <printf+0x121>
          putc(fd, *s);
    1833:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1836:	0f b6 00             	movzbl (%eax),%eax
    1839:	0f be c0             	movsbl %al,%eax
    183c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1840:	8b 45 08             	mov    0x8(%ebp),%eax
    1843:	89 04 24             	mov    %eax,(%esp)
    1846:	e8 0d fe ff ff       	call   1658 <putc>
          s++;
    184b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    184f:	eb 01                	jmp    1852 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1851:	90                   	nop
    1852:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1855:	0f b6 00             	movzbl (%eax),%eax
    1858:	84 c0                	test   %al,%al
    185a:	75 d7                	jne    1833 <printf+0x102>
    185c:	eb 68                	jmp    18c6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    185e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1862:	75 1d                	jne    1881 <printf+0x150>
        putc(fd, *ap);
    1864:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1867:	8b 00                	mov    (%eax),%eax
    1869:	0f be c0             	movsbl %al,%eax
    186c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1870:	8b 45 08             	mov    0x8(%ebp),%eax
    1873:	89 04 24             	mov    %eax,(%esp)
    1876:	e8 dd fd ff ff       	call   1658 <putc>
        ap++;
    187b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    187f:	eb 45                	jmp    18c6 <printf+0x195>
      } else if(c == '%'){
    1881:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1885:	75 17                	jne    189e <printf+0x16d>
        putc(fd, c);
    1887:	8b 45 e8             	mov    -0x18(%ebp),%eax
    188a:	0f be c0             	movsbl %al,%eax
    188d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1891:	8b 45 08             	mov    0x8(%ebp),%eax
    1894:	89 04 24             	mov    %eax,(%esp)
    1897:	e8 bc fd ff ff       	call   1658 <putc>
    189c:	eb 28                	jmp    18c6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    189e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    18a5:	00 
    18a6:	8b 45 08             	mov    0x8(%ebp),%eax
    18a9:	89 04 24             	mov    %eax,(%esp)
    18ac:	e8 a7 fd ff ff       	call   1658 <putc>
        putc(fd, c);
    18b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18b4:	0f be c0             	movsbl %al,%eax
    18b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    18bb:	8b 45 08             	mov    0x8(%ebp),%eax
    18be:	89 04 24             	mov    %eax,(%esp)
    18c1:	e8 92 fd ff ff       	call   1658 <putc>
      }
      state = 0;
    18c6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    18cd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    18d1:	8b 55 0c             	mov    0xc(%ebp),%edx
    18d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18d7:	8d 04 02             	lea    (%edx,%eax,1),%eax
    18da:	0f b6 00             	movzbl (%eax),%eax
    18dd:	84 c0                	test   %al,%al
    18df:	0f 85 6e fe ff ff    	jne    1753 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    18e5:	c9                   	leave  
    18e6:	c3                   	ret    
    18e7:	90                   	nop

000018e8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18e8:	55                   	push   %ebp
    18e9:	89 e5                	mov    %esp,%ebp
    18eb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    18ee:	8b 45 08             	mov    0x8(%ebp),%eax
    18f1:	83 e8 08             	sub    $0x8,%eax
    18f4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18f7:	a1 18 1e 00 00       	mov    0x1e18,%eax
    18fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    18ff:	eb 24                	jmp    1925 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1901:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1904:	8b 00                	mov    (%eax),%eax
    1906:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1909:	77 12                	ja     191d <free+0x35>
    190b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    190e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1911:	77 24                	ja     1937 <free+0x4f>
    1913:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1916:	8b 00                	mov    (%eax),%eax
    1918:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    191b:	77 1a                	ja     1937 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    191d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1920:	8b 00                	mov    (%eax),%eax
    1922:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1925:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1928:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    192b:	76 d4                	jbe    1901 <free+0x19>
    192d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1930:	8b 00                	mov    (%eax),%eax
    1932:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1935:	76 ca                	jbe    1901 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1937:	8b 45 f8             	mov    -0x8(%ebp),%eax
    193a:	8b 40 04             	mov    0x4(%eax),%eax
    193d:	c1 e0 03             	shl    $0x3,%eax
    1940:	89 c2                	mov    %eax,%edx
    1942:	03 55 f8             	add    -0x8(%ebp),%edx
    1945:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1948:	8b 00                	mov    (%eax),%eax
    194a:	39 c2                	cmp    %eax,%edx
    194c:	75 24                	jne    1972 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    194e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1951:	8b 50 04             	mov    0x4(%eax),%edx
    1954:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1957:	8b 00                	mov    (%eax),%eax
    1959:	8b 40 04             	mov    0x4(%eax),%eax
    195c:	01 c2                	add    %eax,%edx
    195e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1961:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1964:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1967:	8b 00                	mov    (%eax),%eax
    1969:	8b 10                	mov    (%eax),%edx
    196b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    196e:	89 10                	mov    %edx,(%eax)
    1970:	eb 0a                	jmp    197c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1972:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1975:	8b 10                	mov    (%eax),%edx
    1977:	8b 45 f8             	mov    -0x8(%ebp),%eax
    197a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    197c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    197f:	8b 40 04             	mov    0x4(%eax),%eax
    1982:	c1 e0 03             	shl    $0x3,%eax
    1985:	03 45 fc             	add    -0x4(%ebp),%eax
    1988:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    198b:	75 20                	jne    19ad <free+0xc5>
    p->s.size += bp->s.size;
    198d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1990:	8b 50 04             	mov    0x4(%eax),%edx
    1993:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1996:	8b 40 04             	mov    0x4(%eax),%eax
    1999:	01 c2                	add    %eax,%edx
    199b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    199e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    19a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19a4:	8b 10                	mov    (%eax),%edx
    19a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19a9:	89 10                	mov    %edx,(%eax)
    19ab:	eb 08                	jmp    19b5 <free+0xcd>
  } else
    p->s.ptr = bp;
    19ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19b0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    19b3:	89 10                	mov    %edx,(%eax)
  freep = p;
    19b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19b8:	a3 18 1e 00 00       	mov    %eax,0x1e18
}
    19bd:	c9                   	leave  
    19be:	c3                   	ret    

000019bf <morecore>:

static Header*
morecore(uint nu)
{
    19bf:	55                   	push   %ebp
    19c0:	89 e5                	mov    %esp,%ebp
    19c2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    19c5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    19cc:	77 07                	ja     19d5 <morecore+0x16>
    nu = 4096;
    19ce:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    19d5:	8b 45 08             	mov    0x8(%ebp),%eax
    19d8:	c1 e0 03             	shl    $0x3,%eax
    19db:	89 04 24             	mov    %eax,(%esp)
    19de:	e8 3d fc ff ff       	call   1620 <sbrk>
    19e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    19e6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    19ea:	75 07                	jne    19f3 <morecore+0x34>
    return 0;
    19ec:	b8 00 00 00 00       	mov    $0x0,%eax
    19f1:	eb 22                	jmp    1a15 <morecore+0x56>
  hp = (Header*)p;
    19f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    19f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19fc:	8b 55 08             	mov    0x8(%ebp),%edx
    19ff:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a05:	83 c0 08             	add    $0x8,%eax
    1a08:	89 04 24             	mov    %eax,(%esp)
    1a0b:	e8 d8 fe ff ff       	call   18e8 <free>
  return freep;
    1a10:	a1 18 1e 00 00       	mov    0x1e18,%eax
}
    1a15:	c9                   	leave  
    1a16:	c3                   	ret    

00001a17 <malloc>:

void*
malloc(uint nbytes)
{
    1a17:	55                   	push   %ebp
    1a18:	89 e5                	mov    %esp,%ebp
    1a1a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a20:	83 c0 07             	add    $0x7,%eax
    1a23:	c1 e8 03             	shr    $0x3,%eax
    1a26:	83 c0 01             	add    $0x1,%eax
    1a29:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1a2c:	a1 18 1e 00 00       	mov    0x1e18,%eax
    1a31:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a34:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a38:	75 23                	jne    1a5d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1a3a:	c7 45 f0 10 1e 00 00 	movl   $0x1e10,-0x10(%ebp)
    1a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a44:	a3 18 1e 00 00       	mov    %eax,0x1e18
    1a49:	a1 18 1e 00 00       	mov    0x1e18,%eax
    1a4e:	a3 10 1e 00 00       	mov    %eax,0x1e10
    base.s.size = 0;
    1a53:	c7 05 14 1e 00 00 00 	movl   $0x0,0x1e14
    1a5a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a60:	8b 00                	mov    (%eax),%eax
    1a62:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1a65:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a68:	8b 40 04             	mov    0x4(%eax),%eax
    1a6b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a6e:	72 4d                	jb     1abd <malloc+0xa6>
      if(p->s.size == nunits)
    1a70:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a73:	8b 40 04             	mov    0x4(%eax),%eax
    1a76:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a79:	75 0c                	jne    1a87 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1a7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a7e:	8b 10                	mov    (%eax),%edx
    1a80:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a83:	89 10                	mov    %edx,(%eax)
    1a85:	eb 26                	jmp    1aad <malloc+0x96>
      else {
        p->s.size -= nunits;
    1a87:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a8a:	8b 40 04             	mov    0x4(%eax),%eax
    1a8d:	89 c2                	mov    %eax,%edx
    1a8f:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1a92:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a95:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1a98:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a9b:	8b 40 04             	mov    0x4(%eax),%eax
    1a9e:	c1 e0 03             	shl    $0x3,%eax
    1aa1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1aa4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aa7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aaa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1aad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ab0:	a3 18 1e 00 00       	mov    %eax,0x1e18
      return (void*)(p + 1);
    1ab5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ab8:	83 c0 08             	add    $0x8,%eax
    1abb:	eb 38                	jmp    1af5 <malloc+0xde>
    }
    if(p == freep)
    1abd:	a1 18 1e 00 00       	mov    0x1e18,%eax
    1ac2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1ac5:	75 1b                	jne    1ae2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aca:	89 04 24             	mov    %eax,(%esp)
    1acd:	e8 ed fe ff ff       	call   19bf <morecore>
    1ad2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1ad5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ad9:	75 07                	jne    1ae2 <malloc+0xcb>
        return 0;
    1adb:	b8 00 00 00 00       	mov    $0x0,%eax
    1ae0:	eb 13                	jmp    1af5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1ae2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ae5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1ae8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aeb:	8b 00                	mov    (%eax),%eax
    1aed:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1af0:	e9 70 ff ff ff       	jmp    1a65 <malloc+0x4e>
}
    1af5:	c9                   	leave  
    1af6:	c3                   	ret    
    1af7:	90                   	nop

00001af8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1af8:	55                   	push   %ebp
    1af9:	89 e5                	mov    %esp,%ebp
    1afb:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1afe:	8b 55 08             	mov    0x8(%ebp),%edx
    1b01:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b04:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b07:	f0 87 02             	lock xchg %eax,(%edx)
    1b0a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1b0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1b10:	c9                   	leave  
    1b11:	c3                   	ret    

00001b12 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1b12:	55                   	push   %ebp
    1b13:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1b15:	8b 45 08             	mov    0x8(%ebp),%eax
    1b18:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1b1e:	5d                   	pop    %ebp
    1b1f:	c3                   	ret    

00001b20 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1b20:	55                   	push   %ebp
    1b21:	89 e5                	mov    %esp,%ebp
    1b23:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1b26:	8b 45 08             	mov    0x8(%ebp),%eax
    1b29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1b30:	00 
    1b31:	89 04 24             	mov    %eax,(%esp)
    1b34:	e8 bf ff ff ff       	call   1af8 <xchg>
    1b39:	85 c0                	test   %eax,%eax
    1b3b:	75 e9                	jne    1b26 <lock_acquire+0x6>
}
    1b3d:	c9                   	leave  
    1b3e:	c3                   	ret    

00001b3f <lock_release>:
void lock_release(lock_t *lock){
    1b3f:	55                   	push   %ebp
    1b40:	89 e5                	mov    %esp,%ebp
    1b42:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1b45:	8b 45 08             	mov    0x8(%ebp),%eax
    1b48:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b4f:	00 
    1b50:	89 04 24             	mov    %eax,(%esp)
    1b53:	e8 a0 ff ff ff       	call   1af8 <xchg>
}
    1b58:	c9                   	leave  
    1b59:	c3                   	ret    

00001b5a <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1b5a:	55                   	push   %ebp
    1b5b:	89 e5                	mov    %esp,%ebp
    1b5d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1b60:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1b67:	e8 ab fe ff ff       	call   1a17 <malloc>
    1b6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1b6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b72:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1b75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b78:	25 ff 0f 00 00       	and    $0xfff,%eax
    1b7d:	85 c0                	test   %eax,%eax
    1b7f:	74 15                	je     1b96 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b84:	89 c2                	mov    %eax,%edx
    1b86:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1b8c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1b91:	29 d0                	sub    %edx,%eax
    1b93:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1b96:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1b9a:	75 1b                	jne    1bb7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1b9c:	c7 44 24 04 c9 1d 00 	movl   $0x1dc9,0x4(%esp)
    1ba3:	00 
    1ba4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bab:	e8 81 fb ff ff       	call   1731 <printf>
        return 0;
    1bb0:	b8 00 00 00 00       	mov    $0x0,%eax
    1bb5:	eb 6f                	jmp    1c26 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1bb7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1bba:	8b 55 08             	mov    0x8(%ebp),%edx
    1bbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bc0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1bc4:	89 54 24 08          	mov    %edx,0x8(%esp)
    1bc8:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1bcf:	00 
    1bd0:	89 04 24             	mov    %eax,(%esp)
    1bd3:	e8 60 fa ff ff       	call   1638 <clone>
    1bd8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1bdb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1bdf:	79 1b                	jns    1bfc <thread_create+0xa2>
        printf(1,"clone fails\n");
    1be1:	c7 44 24 04 d7 1d 00 	movl   $0x1dd7,0x4(%esp)
    1be8:	00 
    1be9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bf0:	e8 3c fb ff ff       	call   1731 <printf>
        return 0;
    1bf5:	b8 00 00 00 00       	mov    $0x0,%eax
    1bfa:	eb 2a                	jmp    1c26 <thread_create+0xcc>
    }
    if(tid > 0){
    1bfc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c00:	7e 05                	jle    1c07 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c05:	eb 1f                	jmp    1c26 <thread_create+0xcc>
    }
    if(tid == 0){
    1c07:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c0b:	75 14                	jne    1c21 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1c0d:	c7 44 24 04 e4 1d 00 	movl   $0x1de4,0x4(%esp)
    1c14:	00 
    1c15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c1c:	e8 10 fb ff ff       	call   1731 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1c21:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c26:	c9                   	leave  
    1c27:	c3                   	ret    

00001c28 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1c28:	55                   	push   %ebp
    1c29:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1c2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1c34:	8b 45 08             	mov    0x8(%ebp),%eax
    1c37:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1c3e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c41:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1c48:	5d                   	pop    %ebp
    1c49:	c3                   	ret    

00001c4a <add_q>:

void add_q(struct queue *q, int v){
    1c4a:	55                   	push   %ebp
    1c4b:	89 e5                	mov    %esp,%ebp
    1c4d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1c50:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1c57:	e8 bb fd ff ff       	call   1a17 <malloc>
    1c5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1c5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c62:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1c69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c6c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c6f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1c71:	8b 45 08             	mov    0x8(%ebp),%eax
    1c74:	8b 40 04             	mov    0x4(%eax),%eax
    1c77:	85 c0                	test   %eax,%eax
    1c79:	75 0b                	jne    1c86 <add_q+0x3c>
        q->head = n;
    1c7b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c81:	89 50 04             	mov    %edx,0x4(%eax)
    1c84:	eb 0c                	jmp    1c92 <add_q+0x48>
    }else{
        q->tail->next = n;
    1c86:	8b 45 08             	mov    0x8(%ebp),%eax
    1c89:	8b 40 08             	mov    0x8(%eax),%eax
    1c8c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c8f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1c92:	8b 45 08             	mov    0x8(%ebp),%eax
    1c95:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c98:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1c9b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9e:	8b 00                	mov    (%eax),%eax
    1ca0:	8d 50 01             	lea    0x1(%eax),%edx
    1ca3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca6:	89 10                	mov    %edx,(%eax)
}
    1ca8:	c9                   	leave  
    1ca9:	c3                   	ret    

00001caa <empty_q>:

int empty_q(struct queue *q){
    1caa:	55                   	push   %ebp
    1cab:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1cad:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb0:	8b 00                	mov    (%eax),%eax
    1cb2:	85 c0                	test   %eax,%eax
    1cb4:	75 07                	jne    1cbd <empty_q+0x13>
        return 1;
    1cb6:	b8 01 00 00 00       	mov    $0x1,%eax
    1cbb:	eb 05                	jmp    1cc2 <empty_q+0x18>
    else
        return 0;
    1cbd:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1cc2:	5d                   	pop    %ebp
    1cc3:	c3                   	ret    

00001cc4 <pop_q>:
int pop_q(struct queue *q){
    1cc4:	55                   	push   %ebp
    1cc5:	89 e5                	mov    %esp,%ebp
    1cc7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1cca:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccd:	89 04 24             	mov    %eax,(%esp)
    1cd0:	e8 d5 ff ff ff       	call   1caa <empty_q>
    1cd5:	85 c0                	test   %eax,%eax
    1cd7:	75 5d                	jne    1d36 <pop_q+0x72>
       val = q->head->value; 
    1cd9:	8b 45 08             	mov    0x8(%ebp),%eax
    1cdc:	8b 40 04             	mov    0x4(%eax),%eax
    1cdf:	8b 00                	mov    (%eax),%eax
    1ce1:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1ce4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce7:	8b 40 04             	mov    0x4(%eax),%eax
    1cea:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1ced:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf0:	8b 40 04             	mov    0x4(%eax),%eax
    1cf3:	8b 50 04             	mov    0x4(%eax),%edx
    1cf6:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf9:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1cfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cff:	89 04 24             	mov    %eax,(%esp)
    1d02:	e8 e1 fb ff ff       	call   18e8 <free>
       q->size--;
    1d07:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0a:	8b 00                	mov    (%eax),%eax
    1d0c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d0f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d12:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1d14:	8b 45 08             	mov    0x8(%ebp),%eax
    1d17:	8b 00                	mov    (%eax),%eax
    1d19:	85 c0                	test   %eax,%eax
    1d1b:	75 14                	jne    1d31 <pop_q+0x6d>
            q->head = 0;
    1d1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d20:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1d27:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d34:	eb 05                	jmp    1d3b <pop_q+0x77>
    }
    return -1;
    1d36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1d3b:	c9                   	leave  
    1d3c:	c3                   	ret    
