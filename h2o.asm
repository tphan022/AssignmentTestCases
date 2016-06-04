
_h2o:     file format elf32-i386


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
    100f:	e8 54 0c 00 00       	call   1c68 <init_q>
	lock_init(&s->lock);
    1014:	8b 45 08             	mov    0x8(%ebp),%eax
    1017:	89 04 24             	mov    %eax,(%esp)
    101a:	e8 33 0b 00 00       	call   1b52 <lock_init>
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
    1036:	e8 25 0b 00 00       	call   1b60 <lock_acquire>
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
    105a:	e8 20 0b 00 00       	call   1b7f <lock_release>
		return;
    105f:	eb 27                	jmp    1088 <sem_acquire+0x5e>
	}	
	
	add_q(&s->q, getpid());	
    1061:	e8 f2 05 00 00       	call   1658 <getpid>
    1066:	8b 55 08             	mov    0x8(%ebp),%edx
    1069:	83 c2 08             	add    $0x8,%edx
    106c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1070:	89 14 24             	mov    %edx,(%esp)
    1073:	e8 12 0c 00 00       	call   1c8a <add_q>
	lock_release(&s->lock);
    1078:	8b 45 08             	mov    0x8(%ebp),%eax
    107b:	89 04 24             	mov    %eax,(%esp)
    107e:	e8 fc 0a 00 00       	call   1b7f <lock_release>
	tsleep();
    1083:	e8 00 06 00 00       	call   1688 <tsleep>
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
    1096:	e8 c5 0a 00 00       	call   1b60 <lock_acquire>
	if (empty_q(&s->q) == 1)
    109b:	8b 45 08             	mov    0x8(%ebp),%eax
    109e:	83 c0 08             	add    $0x8,%eax
    10a1:	89 04 24             	mov    %eax,(%esp)
    10a4:	e8 41 0c 00 00       	call   1cea <empty_q>
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
    10c8:	e8 37 0c 00 00       	call   1d04 <pop_q>
    10cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		twakeup(tid);
    10d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d3:	89 04 24             	mov    %eax,(%esp)
    10d6:	e8 b5 05 00 00       	call   1690 <twakeup>
	}
		
	lock_release(&s->lock);
    10db:	8b 45 08             	mov    0x8(%ebp),%eax
    10de:	89 04 24             	mov    %eax,(%esp)
    10e1:	e8 99 0a 00 00       	call   1b7f <lock_release>
};
    10e6:	c9                   	leave  
    10e7:	c3                   	ret    

000010e8 <main>:
} mutex;

int count = 0;

int main()
{
    10e8:	55                   	push   %ebp
    10e9:	89 e5                	mov    %esp,%ebp
    10eb:	83 e4 f0             	and    $0xfffffff0,%esp
    10ee:	83 ec 30             	sub    $0x30,%esp
	sem_init(&s_h, 0);	
    10f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10f8:	00 
    10f9:	c7 04 24 4c 1e 00 00 	movl   $0x1e4c,(%esp)
    1100:	e8 fb fe ff ff       	call   1000 <sem_init>
	sem_init(&s_o, 0);	
    1105:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    110c:	00 
    110d:	c7 04 24 64 1e 00 00 	movl   $0x1e64,(%esp)
    1114:	e8 e7 fe ff ff       	call   1000 <sem_init>
	lock_init(&mutex.lock);
    1119:	c7 04 24 60 1e 00 00 	movl   $0x1e60,(%esp)
    1120:	e8 2d 0a 00 00       	call   1b52 <lock_init>

	printf(1, "start ...\n");
    1125:	c7 44 24 04 7d 1d 00 	movl   $0x1d7d,0x4(%esp)
    112c:	00 
    112d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1134:	e8 38 06 00 00       	call   1771 <printf>
	void * tid2 = thread_create(H_ready, (void*) 0);
    1139:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1140:	00 
    1141:	c7 04 24 3c 13 00 00 	movl   $0x133c,(%esp)
    1148:	e8 4d 0a 00 00       	call   1b9a <thread_create>
    114d:	89 44 24 18          	mov    %eax,0x18(%esp)
	if(tid2 == 0) 
    1151:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    1156:	75 19                	jne    1171 <main+0x89>
	{
		printf(1, "thread_create failed.\n");
    1158:	c7 44 24 04 88 1d 00 	movl   $0x1d88,0x4(%esp)
    115f:	00 
    1160:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1167:	e8 05 06 00 00       	call   1771 <printf>
		exit();
    116c:	e8 67 04 00 00       	call   15d8 <exit>
	}

	void * tid3 = thread_create(H_ready, (void*) 0);
    1171:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1178:	00 
    1179:	c7 04 24 3c 13 00 00 	movl   $0x133c,(%esp)
    1180:	e8 15 0a 00 00       	call   1b9a <thread_create>
    1185:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	if(tid3 == 0) 
    1189:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    118e:	75 19                	jne    11a9 <main+0xc1>
	{
		printf(1, "thread_create failed.\n");
    1190:	c7 44 24 04 88 1d 00 	movl   $0x1d88,0x4(%esp)
    1197:	00 
    1198:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    119f:	e8 cd 05 00 00       	call   1771 <printf>
		exit();
    11a4:	e8 2f 04 00 00       	call   15d8 <exit>
	}

	void * tid1 = thread_create(O_ready, (void*) 0);
    11a9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b0:	00 
    11b1:	c7 04 24 b4 12 00 00 	movl   $0x12b4,(%esp)
    11b8:	e8 dd 09 00 00       	call   1b9a <thread_create>
    11bd:	89 44 24 20          	mov    %eax,0x20(%esp)
	if(tid1 == 0) 
    11c1:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
    11c6:	75 19                	jne    11e1 <main+0xf9>
	{
		printf(1, "thread_create failed.\n");
    11c8:	c7 44 24 04 88 1d 00 	movl   $0x1d88,0x4(%esp)
    11cf:	00 
    11d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d7:	e8 95 05 00 00       	call   1771 <printf>
		exit();
    11dc:	e8 f7 03 00 00       	call   15d8 <exit>
	}

	void * tid4 = thread_create(H_ready, (void*) 0);
    11e1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11e8:	00 
    11e9:	c7 04 24 3c 13 00 00 	movl   $0x133c,(%esp)
    11f0:	e8 a5 09 00 00       	call   1b9a <thread_create>
    11f5:	89 44 24 24          	mov    %eax,0x24(%esp)
	if(tid4 == 0) 
    11f9:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
    11fe:	75 19                	jne    1219 <main+0x131>
	{
		printf(1, "thread_create failed.\n");
    1200:	c7 44 24 04 88 1d 00 	movl   $0x1d88,0x4(%esp)
    1207:	00 
    1208:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    120f:	e8 5d 05 00 00       	call   1771 <printf>
		exit();
    1214:	e8 bf 03 00 00       	call   15d8 <exit>
	}

	void * tid5 = thread_create(H_ready, (void*) 0);
    1219:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1220:	00 
    1221:	c7 04 24 3c 13 00 00 	movl   $0x133c,(%esp)
    1228:	e8 6d 09 00 00       	call   1b9a <thread_create>
    122d:	89 44 24 28          	mov    %eax,0x28(%esp)
	if(tid5 == 0) 
    1231:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
    1236:	75 19                	jne    1251 <main+0x169>
	{
		printf(1, "thread_create failed.\n");
    1238:	c7 44 24 04 88 1d 00 	movl   $0x1d88,0x4(%esp)
    123f:	00 
    1240:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1247:	e8 25 05 00 00       	call   1771 <printf>
		exit();
    124c:	e8 87 03 00 00       	call   15d8 <exit>
	}

	void * tid6 = thread_create(O_ready, (void*) 0);
    1251:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1258:	00 
    1259:	c7 04 24 b4 12 00 00 	movl   $0x12b4,(%esp)
    1260:	e8 35 09 00 00       	call   1b9a <thread_create>
    1265:	89 44 24 2c          	mov    %eax,0x2c(%esp)
	if(tid6 == 0) 
    1269:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
    126e:	75 19                	jne    1289 <main+0x1a1>
	{
		printf(1, "thread_create failed.\n");
    1270:	c7 44 24 04 88 1d 00 	movl   $0x1d88,0x4(%esp)
    1277:	00 
    1278:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127f:	e8 ed 04 00 00       	call   1771 <printf>
		exit();
    1284:	e8 4f 03 00 00       	call   15d8 <exit>
	}

	while(wait()>0);
    1289:	e8 52 03 00 00       	call   15e0 <wait>
    128e:	85 c0                	test   %eax,%eax
    1290:	7f f7                	jg     1289 <main+0x1a1>
	printf(1, "count = %d\n", count);
    1292:	a1 3c 1e 00 00       	mov    0x1e3c,%eax
    1297:	89 44 24 08          	mov    %eax,0x8(%esp)
    129b:	c7 44 24 04 9f 1d 00 	movl   $0x1d9f,0x4(%esp)
    12a2:	00 
    12a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12aa:	e8 c2 04 00 00       	call   1771 <printf>

	exit();
    12af:	e8 24 03 00 00       	call   15d8 <exit>

000012b4 <O_ready>:
	return 0;
}

void O_ready(void * arg_ptr)
{
    12b4:	55                   	push   %ebp
    12b5:	89 e5                	mov    %esp,%ebp
    12b7:	83 ec 18             	sub    $0x18,%esp
	printf(1, "made one Oxygen atom!\n");
    12ba:	c7 44 24 04 ab 1d 00 	movl   $0x1dab,0x4(%esp)
    12c1:	00 
    12c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12c9:	e8 a3 04 00 00       	call   1771 <printf>

	sem_acquire(&s_h);
    12ce:	c7 04 24 4c 1e 00 00 	movl   $0x1e4c,(%esp)
    12d5:	e8 50 fd ff ff       	call   102a <sem_acquire>
	sem_acquire(&s_h);
    12da:	c7 04 24 4c 1e 00 00 	movl   $0x1e4c,(%esp)
    12e1:	e8 44 fd ff ff       	call   102a <sem_acquire>
	sem_signal(&s_o);
    12e6:	c7 04 24 64 1e 00 00 	movl   $0x1e64,(%esp)
    12ed:	e8 98 fd ff ff       	call   108a <sem_signal>
	sem_signal(&s_o);
    12f2:	c7 04 24 64 1e 00 00 	movl   $0x1e64,(%esp)
    12f9:	e8 8c fd ff ff       	call   108a <sem_signal>

	lock_acquire(&mutex.lock);
    12fe:	c7 04 24 60 1e 00 00 	movl   $0x1e60,(%esp)
    1305:	e8 56 08 00 00       	call   1b60 <lock_acquire>
	count++;	
    130a:	a1 3c 1e 00 00       	mov    0x1e3c,%eax
    130f:	83 c0 01             	add    $0x1,%eax
    1312:	a3 3c 1e 00 00       	mov    %eax,0x1e3c
	printf(1, "made one water molecule!\n");
    1317:	c7 44 24 04 c2 1d 00 	movl   $0x1dc2,0x4(%esp)
    131e:	00 
    131f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1326:	e8 46 04 00 00       	call   1771 <printf>
	lock_release(&mutex.lock);
    132b:	c7 04 24 60 1e 00 00 	movl   $0x1e60,(%esp)
    1332:	e8 48 08 00 00       	call   1b7f <lock_release>

	texit();
    1337:	e8 44 03 00 00       	call   1680 <texit>

0000133c <H_ready>:
}

void H_ready(void * arg_ptr)
{
    133c:	55                   	push   %ebp
    133d:	89 e5                	mov    %esp,%ebp
    133f:	83 ec 18             	sub    $0x18,%esp
	sem_signal(&s_h);
    1342:	c7 04 24 4c 1e 00 00 	movl   $0x1e4c,(%esp)
    1349:	e8 3c fd ff ff       	call   108a <sem_signal>
	sem_acquire(&s_o);
    134e:	c7 04 24 64 1e 00 00 	movl   $0x1e64,(%esp)
    1355:	e8 d0 fc ff ff       	call   102a <sem_acquire>

	printf(1, "made one Hydrogen atom!\n");
    135a:	c7 44 24 04 dc 1d 00 	movl   $0x1ddc,0x4(%esp)
    1361:	00 
    1362:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1369:	e8 03 04 00 00       	call   1771 <printf>

	texit();
    136e:	e8 0d 03 00 00       	call   1680 <texit>
    1373:	90                   	nop

00001374 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1374:	55                   	push   %ebp
    1375:	89 e5                	mov    %esp,%ebp
    1377:	57                   	push   %edi
    1378:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1379:	8b 4d 08             	mov    0x8(%ebp),%ecx
    137c:	8b 55 10             	mov    0x10(%ebp),%edx
    137f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1382:	89 cb                	mov    %ecx,%ebx
    1384:	89 df                	mov    %ebx,%edi
    1386:	89 d1                	mov    %edx,%ecx
    1388:	fc                   	cld    
    1389:	f3 aa                	rep stos %al,%es:(%edi)
    138b:	89 ca                	mov    %ecx,%edx
    138d:	89 fb                	mov    %edi,%ebx
    138f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1392:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1395:	5b                   	pop    %ebx
    1396:	5f                   	pop    %edi
    1397:	5d                   	pop    %ebp
    1398:	c3                   	ret    

00001399 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1399:	55                   	push   %ebp
    139a:	89 e5                	mov    %esp,%ebp
    139c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    139f:	8b 45 08             	mov    0x8(%ebp),%eax
    13a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    13a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    13a8:	0f b6 10             	movzbl (%eax),%edx
    13ab:	8b 45 08             	mov    0x8(%ebp),%eax
    13ae:	88 10                	mov    %dl,(%eax)
    13b0:	8b 45 08             	mov    0x8(%ebp),%eax
    13b3:	0f b6 00             	movzbl (%eax),%eax
    13b6:	84 c0                	test   %al,%al
    13b8:	0f 95 c0             	setne  %al
    13bb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    13bf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    13c3:	84 c0                	test   %al,%al
    13c5:	75 de                	jne    13a5 <strcpy+0xc>
    ;
  return os;
    13c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13ca:	c9                   	leave  
    13cb:	c3                   	ret    

000013cc <strcmp>:

int
strcmp(const char *p, const char *q)
{
    13cc:	55                   	push   %ebp
    13cd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    13cf:	eb 08                	jmp    13d9 <strcmp+0xd>
    p++, q++;
    13d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    13d5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    13d9:	8b 45 08             	mov    0x8(%ebp),%eax
    13dc:	0f b6 00             	movzbl (%eax),%eax
    13df:	84 c0                	test   %al,%al
    13e1:	74 10                	je     13f3 <strcmp+0x27>
    13e3:	8b 45 08             	mov    0x8(%ebp),%eax
    13e6:	0f b6 10             	movzbl (%eax),%edx
    13e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ec:	0f b6 00             	movzbl (%eax),%eax
    13ef:	38 c2                	cmp    %al,%dl
    13f1:	74 de                	je     13d1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    13f3:	8b 45 08             	mov    0x8(%ebp),%eax
    13f6:	0f b6 00             	movzbl (%eax),%eax
    13f9:	0f b6 d0             	movzbl %al,%edx
    13fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ff:	0f b6 00             	movzbl (%eax),%eax
    1402:	0f b6 c0             	movzbl %al,%eax
    1405:	89 d1                	mov    %edx,%ecx
    1407:	29 c1                	sub    %eax,%ecx
    1409:	89 c8                	mov    %ecx,%eax
}
    140b:	5d                   	pop    %ebp
    140c:	c3                   	ret    

0000140d <strlen>:

uint
strlen(char *s)
{
    140d:	55                   	push   %ebp
    140e:	89 e5                	mov    %esp,%ebp
    1410:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1413:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    141a:	eb 04                	jmp    1420 <strlen+0x13>
    141c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1420:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1423:	03 45 08             	add    0x8(%ebp),%eax
    1426:	0f b6 00             	movzbl (%eax),%eax
    1429:	84 c0                	test   %al,%al
    142b:	75 ef                	jne    141c <strlen+0xf>
    ;
  return n;
    142d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1430:	c9                   	leave  
    1431:	c3                   	ret    

00001432 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1432:	55                   	push   %ebp
    1433:	89 e5                	mov    %esp,%ebp
    1435:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1438:	8b 45 10             	mov    0x10(%ebp),%eax
    143b:	89 44 24 08          	mov    %eax,0x8(%esp)
    143f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1442:	89 44 24 04          	mov    %eax,0x4(%esp)
    1446:	8b 45 08             	mov    0x8(%ebp),%eax
    1449:	89 04 24             	mov    %eax,(%esp)
    144c:	e8 23 ff ff ff       	call   1374 <stosb>
  return dst;
    1451:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1454:	c9                   	leave  
    1455:	c3                   	ret    

00001456 <strchr>:

char*
strchr(const char *s, char c)
{
    1456:	55                   	push   %ebp
    1457:	89 e5                	mov    %esp,%ebp
    1459:	83 ec 04             	sub    $0x4,%esp
    145c:	8b 45 0c             	mov    0xc(%ebp),%eax
    145f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1462:	eb 14                	jmp    1478 <strchr+0x22>
    if(*s == c)
    1464:	8b 45 08             	mov    0x8(%ebp),%eax
    1467:	0f b6 00             	movzbl (%eax),%eax
    146a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    146d:	75 05                	jne    1474 <strchr+0x1e>
      return (char*)s;
    146f:	8b 45 08             	mov    0x8(%ebp),%eax
    1472:	eb 13                	jmp    1487 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1474:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1478:	8b 45 08             	mov    0x8(%ebp),%eax
    147b:	0f b6 00             	movzbl (%eax),%eax
    147e:	84 c0                	test   %al,%al
    1480:	75 e2                	jne    1464 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1482:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1487:	c9                   	leave  
    1488:	c3                   	ret    

00001489 <gets>:

char*
gets(char *buf, int max)
{
    1489:	55                   	push   %ebp
    148a:	89 e5                	mov    %esp,%ebp
    148c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    148f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1496:	eb 44                	jmp    14dc <gets+0x53>
    cc = read(0, &c, 1);
    1498:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    149f:	00 
    14a0:	8d 45 ef             	lea    -0x11(%ebp),%eax
    14a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    14a7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14ae:	e8 3d 01 00 00       	call   15f0 <read>
    14b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    14b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14ba:	7e 2d                	jle    14e9 <gets+0x60>
      break;
    buf[i++] = c;
    14bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14bf:	03 45 08             	add    0x8(%ebp),%eax
    14c2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    14c6:	88 10                	mov    %dl,(%eax)
    14c8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    14cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14d0:	3c 0a                	cmp    $0xa,%al
    14d2:	74 16                	je     14ea <gets+0x61>
    14d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14d8:	3c 0d                	cmp    $0xd,%al
    14da:	74 0e                	je     14ea <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    14dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14df:	83 c0 01             	add    $0x1,%eax
    14e2:	3b 45 0c             	cmp    0xc(%ebp),%eax
    14e5:	7c b1                	jl     1498 <gets+0xf>
    14e7:	eb 01                	jmp    14ea <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    14e9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    14ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14ed:	03 45 08             	add    0x8(%ebp),%eax
    14f0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    14f3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14f6:	c9                   	leave  
    14f7:	c3                   	ret    

000014f8 <stat>:

int
stat(char *n, struct stat *st)
{
    14f8:	55                   	push   %ebp
    14f9:	89 e5                	mov    %esp,%ebp
    14fb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14fe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1505:	00 
    1506:	8b 45 08             	mov    0x8(%ebp),%eax
    1509:	89 04 24             	mov    %eax,(%esp)
    150c:	e8 07 01 00 00       	call   1618 <open>
    1511:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1514:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1518:	79 07                	jns    1521 <stat+0x29>
    return -1;
    151a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    151f:	eb 23                	jmp    1544 <stat+0x4c>
  r = fstat(fd, st);
    1521:	8b 45 0c             	mov    0xc(%ebp),%eax
    1524:	89 44 24 04          	mov    %eax,0x4(%esp)
    1528:	8b 45 f0             	mov    -0x10(%ebp),%eax
    152b:	89 04 24             	mov    %eax,(%esp)
    152e:	e8 fd 00 00 00       	call   1630 <fstat>
    1533:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1536:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1539:	89 04 24             	mov    %eax,(%esp)
    153c:	e8 bf 00 00 00       	call   1600 <close>
  return r;
    1541:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1544:	c9                   	leave  
    1545:	c3                   	ret    

00001546 <atoi>:

int
atoi(const char *s)
{
    1546:	55                   	push   %ebp
    1547:	89 e5                	mov    %esp,%ebp
    1549:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    154c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1553:	eb 24                	jmp    1579 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1555:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1558:	89 d0                	mov    %edx,%eax
    155a:	c1 e0 02             	shl    $0x2,%eax
    155d:	01 d0                	add    %edx,%eax
    155f:	01 c0                	add    %eax,%eax
    1561:	89 c2                	mov    %eax,%edx
    1563:	8b 45 08             	mov    0x8(%ebp),%eax
    1566:	0f b6 00             	movzbl (%eax),%eax
    1569:	0f be c0             	movsbl %al,%eax
    156c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    156f:	83 e8 30             	sub    $0x30,%eax
    1572:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1575:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1579:	8b 45 08             	mov    0x8(%ebp),%eax
    157c:	0f b6 00             	movzbl (%eax),%eax
    157f:	3c 2f                	cmp    $0x2f,%al
    1581:	7e 0a                	jle    158d <atoi+0x47>
    1583:	8b 45 08             	mov    0x8(%ebp),%eax
    1586:	0f b6 00             	movzbl (%eax),%eax
    1589:	3c 39                	cmp    $0x39,%al
    158b:	7e c8                	jle    1555 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    158d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1590:	c9                   	leave  
    1591:	c3                   	ret    

00001592 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1592:	55                   	push   %ebp
    1593:	89 e5                	mov    %esp,%ebp
    1595:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1598:	8b 45 08             	mov    0x8(%ebp),%eax
    159b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    159e:	8b 45 0c             	mov    0xc(%ebp),%eax
    15a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    15a4:	eb 13                	jmp    15b9 <memmove+0x27>
    *dst++ = *src++;
    15a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15a9:	0f b6 10             	movzbl (%eax),%edx
    15ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15af:	88 10                	mov    %dl,(%eax)
    15b1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    15b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    15b9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    15bd:	0f 9f c0             	setg   %al
    15c0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    15c4:	84 c0                	test   %al,%al
    15c6:	75 de                	jne    15a6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    15c8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    15cb:	c9                   	leave  
    15cc:	c3                   	ret    
    15cd:	90                   	nop
    15ce:	90                   	nop
    15cf:	90                   	nop

000015d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    15d0:	b8 01 00 00 00       	mov    $0x1,%eax
    15d5:	cd 40                	int    $0x40
    15d7:	c3                   	ret    

000015d8 <exit>:
SYSCALL(exit)
    15d8:	b8 02 00 00 00       	mov    $0x2,%eax
    15dd:	cd 40                	int    $0x40
    15df:	c3                   	ret    

000015e0 <wait>:
SYSCALL(wait)
    15e0:	b8 03 00 00 00       	mov    $0x3,%eax
    15e5:	cd 40                	int    $0x40
    15e7:	c3                   	ret    

000015e8 <pipe>:
SYSCALL(pipe)
    15e8:	b8 04 00 00 00       	mov    $0x4,%eax
    15ed:	cd 40                	int    $0x40
    15ef:	c3                   	ret    

000015f0 <read>:
SYSCALL(read)
    15f0:	b8 05 00 00 00       	mov    $0x5,%eax
    15f5:	cd 40                	int    $0x40
    15f7:	c3                   	ret    

000015f8 <write>:
SYSCALL(write)
    15f8:	b8 10 00 00 00       	mov    $0x10,%eax
    15fd:	cd 40                	int    $0x40
    15ff:	c3                   	ret    

00001600 <close>:
SYSCALL(close)
    1600:	b8 15 00 00 00       	mov    $0x15,%eax
    1605:	cd 40                	int    $0x40
    1607:	c3                   	ret    

00001608 <kill>:
SYSCALL(kill)
    1608:	b8 06 00 00 00       	mov    $0x6,%eax
    160d:	cd 40                	int    $0x40
    160f:	c3                   	ret    

00001610 <exec>:
SYSCALL(exec)
    1610:	b8 07 00 00 00       	mov    $0x7,%eax
    1615:	cd 40                	int    $0x40
    1617:	c3                   	ret    

00001618 <open>:
SYSCALL(open)
    1618:	b8 0f 00 00 00       	mov    $0xf,%eax
    161d:	cd 40                	int    $0x40
    161f:	c3                   	ret    

00001620 <mknod>:
SYSCALL(mknod)
    1620:	b8 11 00 00 00       	mov    $0x11,%eax
    1625:	cd 40                	int    $0x40
    1627:	c3                   	ret    

00001628 <unlink>:
SYSCALL(unlink)
    1628:	b8 12 00 00 00       	mov    $0x12,%eax
    162d:	cd 40                	int    $0x40
    162f:	c3                   	ret    

00001630 <fstat>:
SYSCALL(fstat)
    1630:	b8 08 00 00 00       	mov    $0x8,%eax
    1635:	cd 40                	int    $0x40
    1637:	c3                   	ret    

00001638 <link>:
SYSCALL(link)
    1638:	b8 13 00 00 00       	mov    $0x13,%eax
    163d:	cd 40                	int    $0x40
    163f:	c3                   	ret    

00001640 <mkdir>:
SYSCALL(mkdir)
    1640:	b8 14 00 00 00       	mov    $0x14,%eax
    1645:	cd 40                	int    $0x40
    1647:	c3                   	ret    

00001648 <chdir>:
SYSCALL(chdir)
    1648:	b8 09 00 00 00       	mov    $0x9,%eax
    164d:	cd 40                	int    $0x40
    164f:	c3                   	ret    

00001650 <dup>:
SYSCALL(dup)
    1650:	b8 0a 00 00 00       	mov    $0xa,%eax
    1655:	cd 40                	int    $0x40
    1657:	c3                   	ret    

00001658 <getpid>:
SYSCALL(getpid)
    1658:	b8 0b 00 00 00       	mov    $0xb,%eax
    165d:	cd 40                	int    $0x40
    165f:	c3                   	ret    

00001660 <sbrk>:
SYSCALL(sbrk)
    1660:	b8 0c 00 00 00       	mov    $0xc,%eax
    1665:	cd 40                	int    $0x40
    1667:	c3                   	ret    

00001668 <sleep>:
SYSCALL(sleep)
    1668:	b8 0d 00 00 00       	mov    $0xd,%eax
    166d:	cd 40                	int    $0x40
    166f:	c3                   	ret    

00001670 <uptime>:
SYSCALL(uptime)
    1670:	b8 0e 00 00 00       	mov    $0xe,%eax
    1675:	cd 40                	int    $0x40
    1677:	c3                   	ret    

00001678 <clone>:
SYSCALL(clone)
    1678:	b8 16 00 00 00       	mov    $0x16,%eax
    167d:	cd 40                	int    $0x40
    167f:	c3                   	ret    

00001680 <texit>:
SYSCALL(texit)
    1680:	b8 17 00 00 00       	mov    $0x17,%eax
    1685:	cd 40                	int    $0x40
    1687:	c3                   	ret    

00001688 <tsleep>:
SYSCALL(tsleep)
    1688:	b8 18 00 00 00       	mov    $0x18,%eax
    168d:	cd 40                	int    $0x40
    168f:	c3                   	ret    

00001690 <twakeup>:
SYSCALL(twakeup)
    1690:	b8 19 00 00 00       	mov    $0x19,%eax
    1695:	cd 40                	int    $0x40
    1697:	c3                   	ret    

00001698 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1698:	55                   	push   %ebp
    1699:	89 e5                	mov    %esp,%ebp
    169b:	83 ec 28             	sub    $0x28,%esp
    169e:	8b 45 0c             	mov    0xc(%ebp),%eax
    16a1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    16a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    16ab:	00 
    16ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
    16af:	89 44 24 04          	mov    %eax,0x4(%esp)
    16b3:	8b 45 08             	mov    0x8(%ebp),%eax
    16b6:	89 04 24             	mov    %eax,(%esp)
    16b9:	e8 3a ff ff ff       	call   15f8 <write>
}
    16be:	c9                   	leave  
    16bf:	c3                   	ret    

000016c0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    16c0:	55                   	push   %ebp
    16c1:	89 e5                	mov    %esp,%ebp
    16c3:	53                   	push   %ebx
    16c4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    16c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    16ce:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    16d2:	74 17                	je     16eb <printint+0x2b>
    16d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    16d8:	79 11                	jns    16eb <printint+0x2b>
    neg = 1;
    16da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    16e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    16e4:	f7 d8                	neg    %eax
    16e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    16e9:	eb 06                	jmp    16f1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    16eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    16f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    16f8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    16fb:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1701:	ba 00 00 00 00       	mov    $0x0,%edx
    1706:	f7 f3                	div    %ebx
    1708:	89 d0                	mov    %edx,%eax
    170a:	0f b6 80 28 1e 00 00 	movzbl 0x1e28(%eax),%eax
    1711:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1715:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1719:	8b 45 10             	mov    0x10(%ebp),%eax
    171c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    171f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1722:	ba 00 00 00 00       	mov    $0x0,%edx
    1727:	f7 75 d4             	divl   -0x2c(%ebp)
    172a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    172d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1731:	75 c5                	jne    16f8 <printint+0x38>
  if(neg)
    1733:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1737:	74 28                	je     1761 <printint+0xa1>
    buf[i++] = '-';
    1739:	8b 45 ec             	mov    -0x14(%ebp),%eax
    173c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1741:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1745:	eb 1a                	jmp    1761 <printint+0xa1>
    putc(fd, buf[i]);
    1747:	8b 45 ec             	mov    -0x14(%ebp),%eax
    174a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    174f:	0f be c0             	movsbl %al,%eax
    1752:	89 44 24 04          	mov    %eax,0x4(%esp)
    1756:	8b 45 08             	mov    0x8(%ebp),%eax
    1759:	89 04 24             	mov    %eax,(%esp)
    175c:	e8 37 ff ff ff       	call   1698 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1761:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1765:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1769:	79 dc                	jns    1747 <printint+0x87>
    putc(fd, buf[i]);
}
    176b:	83 c4 44             	add    $0x44,%esp
    176e:	5b                   	pop    %ebx
    176f:	5d                   	pop    %ebp
    1770:	c3                   	ret    

00001771 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1771:	55                   	push   %ebp
    1772:	89 e5                	mov    %esp,%ebp
    1774:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1777:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    177e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1781:	83 c0 04             	add    $0x4,%eax
    1784:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1787:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    178e:	e9 7e 01 00 00       	jmp    1911 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1793:	8b 55 0c             	mov    0xc(%ebp),%edx
    1796:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1799:	8d 04 02             	lea    (%edx,%eax,1),%eax
    179c:	0f b6 00             	movzbl (%eax),%eax
    179f:	0f be c0             	movsbl %al,%eax
    17a2:	25 ff 00 00 00       	and    $0xff,%eax
    17a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    17aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17ae:	75 2c                	jne    17dc <printf+0x6b>
      if(c == '%'){
    17b0:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    17b4:	75 0c                	jne    17c2 <printf+0x51>
        state = '%';
    17b6:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    17bd:	e9 4b 01 00 00       	jmp    190d <printf+0x19c>
      } else {
        putc(fd, c);
    17c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17c5:	0f be c0             	movsbl %al,%eax
    17c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    17cc:	8b 45 08             	mov    0x8(%ebp),%eax
    17cf:	89 04 24             	mov    %eax,(%esp)
    17d2:	e8 c1 fe ff ff       	call   1698 <putc>
    17d7:	e9 31 01 00 00       	jmp    190d <printf+0x19c>
      }
    } else if(state == '%'){
    17dc:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    17e0:	0f 85 27 01 00 00    	jne    190d <printf+0x19c>
      if(c == 'd'){
    17e6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    17ea:	75 2d                	jne    1819 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    17ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ef:	8b 00                	mov    (%eax),%eax
    17f1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    17f8:	00 
    17f9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1800:	00 
    1801:	89 44 24 04          	mov    %eax,0x4(%esp)
    1805:	8b 45 08             	mov    0x8(%ebp),%eax
    1808:	89 04 24             	mov    %eax,(%esp)
    180b:	e8 b0 fe ff ff       	call   16c0 <printint>
        ap++;
    1810:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1814:	e9 ed 00 00 00       	jmp    1906 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1819:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    181d:	74 06                	je     1825 <printf+0xb4>
    181f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1823:	75 2d                	jne    1852 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1825:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1828:	8b 00                	mov    (%eax),%eax
    182a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1831:	00 
    1832:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1839:	00 
    183a:	89 44 24 04          	mov    %eax,0x4(%esp)
    183e:	8b 45 08             	mov    0x8(%ebp),%eax
    1841:	89 04 24             	mov    %eax,(%esp)
    1844:	e8 77 fe ff ff       	call   16c0 <printint>
        ap++;
    1849:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    184d:	e9 b4 00 00 00       	jmp    1906 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1852:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1856:	75 46                	jne    189e <printf+0x12d>
        s = (char*)*ap;
    1858:	8b 45 f4             	mov    -0xc(%ebp),%eax
    185b:	8b 00                	mov    (%eax),%eax
    185d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1860:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1864:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1868:	75 27                	jne    1891 <printf+0x120>
          s = "(null)";
    186a:	c7 45 e4 f5 1d 00 00 	movl   $0x1df5,-0x1c(%ebp)
        while(*s != 0){
    1871:	eb 1f                	jmp    1892 <printf+0x121>
          putc(fd, *s);
    1873:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1876:	0f b6 00             	movzbl (%eax),%eax
    1879:	0f be c0             	movsbl %al,%eax
    187c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1880:	8b 45 08             	mov    0x8(%ebp),%eax
    1883:	89 04 24             	mov    %eax,(%esp)
    1886:	e8 0d fe ff ff       	call   1698 <putc>
          s++;
    188b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    188f:	eb 01                	jmp    1892 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1891:	90                   	nop
    1892:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1895:	0f b6 00             	movzbl (%eax),%eax
    1898:	84 c0                	test   %al,%al
    189a:	75 d7                	jne    1873 <printf+0x102>
    189c:	eb 68                	jmp    1906 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    189e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    18a2:	75 1d                	jne    18c1 <printf+0x150>
        putc(fd, *ap);
    18a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a7:	8b 00                	mov    (%eax),%eax
    18a9:	0f be c0             	movsbl %al,%eax
    18ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    18b0:	8b 45 08             	mov    0x8(%ebp),%eax
    18b3:	89 04 24             	mov    %eax,(%esp)
    18b6:	e8 dd fd ff ff       	call   1698 <putc>
        ap++;
    18bb:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    18bf:	eb 45                	jmp    1906 <printf+0x195>
      } else if(c == '%'){
    18c1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    18c5:	75 17                	jne    18de <printf+0x16d>
        putc(fd, c);
    18c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ca:	0f be c0             	movsbl %al,%eax
    18cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    18d1:	8b 45 08             	mov    0x8(%ebp),%eax
    18d4:	89 04 24             	mov    %eax,(%esp)
    18d7:	e8 bc fd ff ff       	call   1698 <putc>
    18dc:	eb 28                	jmp    1906 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    18de:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    18e5:	00 
    18e6:	8b 45 08             	mov    0x8(%ebp),%eax
    18e9:	89 04 24             	mov    %eax,(%esp)
    18ec:	e8 a7 fd ff ff       	call   1698 <putc>
        putc(fd, c);
    18f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18f4:	0f be c0             	movsbl %al,%eax
    18f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    18fb:	8b 45 08             	mov    0x8(%ebp),%eax
    18fe:	89 04 24             	mov    %eax,(%esp)
    1901:	e8 92 fd ff ff       	call   1698 <putc>
      }
      state = 0;
    1906:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    190d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1911:	8b 55 0c             	mov    0xc(%ebp),%edx
    1914:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1917:	8d 04 02             	lea    (%edx,%eax,1),%eax
    191a:	0f b6 00             	movzbl (%eax),%eax
    191d:	84 c0                	test   %al,%al
    191f:	0f 85 6e fe ff ff    	jne    1793 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1925:	c9                   	leave  
    1926:	c3                   	ret    
    1927:	90                   	nop

00001928 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1928:	55                   	push   %ebp
    1929:	89 e5                	mov    %esp,%ebp
    192b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    192e:	8b 45 08             	mov    0x8(%ebp),%eax
    1931:	83 e8 08             	sub    $0x8,%eax
    1934:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1937:	a1 48 1e 00 00       	mov    0x1e48,%eax
    193c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    193f:	eb 24                	jmp    1965 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1941:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1944:	8b 00                	mov    (%eax),%eax
    1946:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1949:	77 12                	ja     195d <free+0x35>
    194b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    194e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1951:	77 24                	ja     1977 <free+0x4f>
    1953:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1956:	8b 00                	mov    (%eax),%eax
    1958:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    195b:	77 1a                	ja     1977 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    195d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1960:	8b 00                	mov    (%eax),%eax
    1962:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1965:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1968:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    196b:	76 d4                	jbe    1941 <free+0x19>
    196d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1970:	8b 00                	mov    (%eax),%eax
    1972:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1975:	76 ca                	jbe    1941 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1977:	8b 45 f8             	mov    -0x8(%ebp),%eax
    197a:	8b 40 04             	mov    0x4(%eax),%eax
    197d:	c1 e0 03             	shl    $0x3,%eax
    1980:	89 c2                	mov    %eax,%edx
    1982:	03 55 f8             	add    -0x8(%ebp),%edx
    1985:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1988:	8b 00                	mov    (%eax),%eax
    198a:	39 c2                	cmp    %eax,%edx
    198c:	75 24                	jne    19b2 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    198e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1991:	8b 50 04             	mov    0x4(%eax),%edx
    1994:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1997:	8b 00                	mov    (%eax),%eax
    1999:	8b 40 04             	mov    0x4(%eax),%eax
    199c:	01 c2                	add    %eax,%edx
    199e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19a1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    19a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19a7:	8b 00                	mov    (%eax),%eax
    19a9:	8b 10                	mov    (%eax),%edx
    19ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19ae:	89 10                	mov    %edx,(%eax)
    19b0:	eb 0a                	jmp    19bc <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    19b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19b5:	8b 10                	mov    (%eax),%edx
    19b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19ba:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    19bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19bf:	8b 40 04             	mov    0x4(%eax),%eax
    19c2:	c1 e0 03             	shl    $0x3,%eax
    19c5:	03 45 fc             	add    -0x4(%ebp),%eax
    19c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19cb:	75 20                	jne    19ed <free+0xc5>
    p->s.size += bp->s.size;
    19cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19d0:	8b 50 04             	mov    0x4(%eax),%edx
    19d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19d6:	8b 40 04             	mov    0x4(%eax),%eax
    19d9:	01 c2                	add    %eax,%edx
    19db:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    19e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19e4:	8b 10                	mov    (%eax),%edx
    19e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19e9:	89 10                	mov    %edx,(%eax)
    19eb:	eb 08                	jmp    19f5 <free+0xcd>
  } else
    p->s.ptr = bp;
    19ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19f0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    19f3:	89 10                	mov    %edx,(%eax)
  freep = p;
    19f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19f8:	a3 48 1e 00 00       	mov    %eax,0x1e48
}
    19fd:	c9                   	leave  
    19fe:	c3                   	ret    

000019ff <morecore>:

static Header*
morecore(uint nu)
{
    19ff:	55                   	push   %ebp
    1a00:	89 e5                	mov    %esp,%ebp
    1a02:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1a05:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1a0c:	77 07                	ja     1a15 <morecore+0x16>
    nu = 4096;
    1a0e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1a15:	8b 45 08             	mov    0x8(%ebp),%eax
    1a18:	c1 e0 03             	shl    $0x3,%eax
    1a1b:	89 04 24             	mov    %eax,(%esp)
    1a1e:	e8 3d fc ff ff       	call   1660 <sbrk>
    1a23:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1a26:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1a2a:	75 07                	jne    1a33 <morecore+0x34>
    return 0;
    1a2c:	b8 00 00 00 00       	mov    $0x0,%eax
    1a31:	eb 22                	jmp    1a55 <morecore+0x56>
  hp = (Header*)p;
    1a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a3c:	8b 55 08             	mov    0x8(%ebp),%edx
    1a3f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a45:	83 c0 08             	add    $0x8,%eax
    1a48:	89 04 24             	mov    %eax,(%esp)
    1a4b:	e8 d8 fe ff ff       	call   1928 <free>
  return freep;
    1a50:	a1 48 1e 00 00       	mov    0x1e48,%eax
}
    1a55:	c9                   	leave  
    1a56:	c3                   	ret    

00001a57 <malloc>:

void*
malloc(uint nbytes)
{
    1a57:	55                   	push   %ebp
    1a58:	89 e5                	mov    %esp,%ebp
    1a5a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a60:	83 c0 07             	add    $0x7,%eax
    1a63:	c1 e8 03             	shr    $0x3,%eax
    1a66:	83 c0 01             	add    $0x1,%eax
    1a69:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1a6c:	a1 48 1e 00 00       	mov    0x1e48,%eax
    1a71:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a74:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a78:	75 23                	jne    1a9d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1a7a:	c7 45 f0 40 1e 00 00 	movl   $0x1e40,-0x10(%ebp)
    1a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a84:	a3 48 1e 00 00       	mov    %eax,0x1e48
    1a89:	a1 48 1e 00 00       	mov    0x1e48,%eax
    1a8e:	a3 40 1e 00 00       	mov    %eax,0x1e40
    base.s.size = 0;
    1a93:	c7 05 44 1e 00 00 00 	movl   $0x0,0x1e44
    1a9a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aa0:	8b 00                	mov    (%eax),%eax
    1aa2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1aa5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aa8:	8b 40 04             	mov    0x4(%eax),%eax
    1aab:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1aae:	72 4d                	jb     1afd <malloc+0xa6>
      if(p->s.size == nunits)
    1ab0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ab3:	8b 40 04             	mov    0x4(%eax),%eax
    1ab6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1ab9:	75 0c                	jne    1ac7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1abb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1abe:	8b 10                	mov    (%eax),%edx
    1ac0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ac3:	89 10                	mov    %edx,(%eax)
    1ac5:	eb 26                	jmp    1aed <malloc+0x96>
      else {
        p->s.size -= nunits;
    1ac7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aca:	8b 40 04             	mov    0x4(%eax),%eax
    1acd:	89 c2                	mov    %eax,%edx
    1acf:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1ad2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ad5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1ad8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1adb:	8b 40 04             	mov    0x4(%eax),%eax
    1ade:	c1 e0 03             	shl    $0x3,%eax
    1ae1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1ae4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ae7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1af0:	a3 48 1e 00 00       	mov    %eax,0x1e48
      return (void*)(p + 1);
    1af5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1af8:	83 c0 08             	add    $0x8,%eax
    1afb:	eb 38                	jmp    1b35 <malloc+0xde>
    }
    if(p == freep)
    1afd:	a1 48 1e 00 00       	mov    0x1e48,%eax
    1b02:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1b05:	75 1b                	jne    1b22 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b0a:	89 04 24             	mov    %eax,(%esp)
    1b0d:	e8 ed fe ff ff       	call   19ff <morecore>
    1b12:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1b15:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b19:	75 07                	jne    1b22 <malloc+0xcb>
        return 0;
    1b1b:	b8 00 00 00 00       	mov    $0x0,%eax
    1b20:	eb 13                	jmp    1b35 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b22:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b25:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b28:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b2b:	8b 00                	mov    (%eax),%eax
    1b2d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1b30:	e9 70 ff ff ff       	jmp    1aa5 <malloc+0x4e>
}
    1b35:	c9                   	leave  
    1b36:	c3                   	ret    
    1b37:	90                   	nop

00001b38 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1b38:	55                   	push   %ebp
    1b39:	89 e5                	mov    %esp,%ebp
    1b3b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1b3e:	8b 55 08             	mov    0x8(%ebp),%edx
    1b41:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b44:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b47:	f0 87 02             	lock xchg %eax,(%edx)
    1b4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1b4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1b50:	c9                   	leave  
    1b51:	c3                   	ret    

00001b52 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1b52:	55                   	push   %ebp
    1b53:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1b55:	8b 45 08             	mov    0x8(%ebp),%eax
    1b58:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1b5e:	5d                   	pop    %ebp
    1b5f:	c3                   	ret    

00001b60 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1b60:	55                   	push   %ebp
    1b61:	89 e5                	mov    %esp,%ebp
    1b63:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1b66:	8b 45 08             	mov    0x8(%ebp),%eax
    1b69:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1b70:	00 
    1b71:	89 04 24             	mov    %eax,(%esp)
    1b74:	e8 bf ff ff ff       	call   1b38 <xchg>
    1b79:	85 c0                	test   %eax,%eax
    1b7b:	75 e9                	jne    1b66 <lock_acquire+0x6>
}
    1b7d:	c9                   	leave  
    1b7e:	c3                   	ret    

00001b7f <lock_release>:
void lock_release(lock_t *lock){
    1b7f:	55                   	push   %ebp
    1b80:	89 e5                	mov    %esp,%ebp
    1b82:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1b85:	8b 45 08             	mov    0x8(%ebp),%eax
    1b88:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b8f:	00 
    1b90:	89 04 24             	mov    %eax,(%esp)
    1b93:	e8 a0 ff ff ff       	call   1b38 <xchg>
}
    1b98:	c9                   	leave  
    1b99:	c3                   	ret    

00001b9a <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1b9a:	55                   	push   %ebp
    1b9b:	89 e5                	mov    %esp,%ebp
    1b9d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1ba0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1ba7:	e8 ab fe ff ff       	call   1a57 <malloc>
    1bac:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1baf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1bb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bb8:	25 ff 0f 00 00       	and    $0xfff,%eax
    1bbd:	85 c0                	test   %eax,%eax
    1bbf:	74 15                	je     1bd6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1bc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bc4:	89 c2                	mov    %eax,%edx
    1bc6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1bcc:	b8 00 10 00 00       	mov    $0x1000,%eax
    1bd1:	29 d0                	sub    %edx,%eax
    1bd3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1bd6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1bda:	75 1b                	jne    1bf7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1bdc:	c7 44 24 04 fc 1d 00 	movl   $0x1dfc,0x4(%esp)
    1be3:	00 
    1be4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1beb:	e8 81 fb ff ff       	call   1771 <printf>
        return 0;
    1bf0:	b8 00 00 00 00       	mov    $0x0,%eax
    1bf5:	eb 6f                	jmp    1c66 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1bf7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1bfa:	8b 55 08             	mov    0x8(%ebp),%edx
    1bfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c00:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1c04:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c08:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1c0f:	00 
    1c10:	89 04 24             	mov    %eax,(%esp)
    1c13:	e8 60 fa ff ff       	call   1678 <clone>
    1c18:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1c1b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c1f:	79 1b                	jns    1c3c <thread_create+0xa2>
        printf(1,"clone fails\n");
    1c21:	c7 44 24 04 0a 1e 00 	movl   $0x1e0a,0x4(%esp)
    1c28:	00 
    1c29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c30:	e8 3c fb ff ff       	call   1771 <printf>
        return 0;
    1c35:	b8 00 00 00 00       	mov    $0x0,%eax
    1c3a:	eb 2a                	jmp    1c66 <thread_create+0xcc>
    }
    if(tid > 0){
    1c3c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c40:	7e 05                	jle    1c47 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1c42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c45:	eb 1f                	jmp    1c66 <thread_create+0xcc>
    }
    if(tid == 0){
    1c47:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c4b:	75 14                	jne    1c61 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1c4d:	c7 44 24 04 17 1e 00 	movl   $0x1e17,0x4(%esp)
    1c54:	00 
    1c55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c5c:	e8 10 fb ff ff       	call   1771 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1c61:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c66:	c9                   	leave  
    1c67:	c3                   	ret    

00001c68 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1c68:	55                   	push   %ebp
    1c69:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1c6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1c74:	8b 45 08             	mov    0x8(%ebp),%eax
    1c77:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1c7e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c81:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1c88:	5d                   	pop    %ebp
    1c89:	c3                   	ret    

00001c8a <add_q>:

void add_q(struct queue *q, int v){
    1c8a:	55                   	push   %ebp
    1c8b:	89 e5                	mov    %esp,%ebp
    1c8d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1c90:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1c97:	e8 bb fd ff ff       	call   1a57 <malloc>
    1c9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1c9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ca2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1ca9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cac:	8b 55 0c             	mov    0xc(%ebp),%edx
    1caf:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1cb1:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb4:	8b 40 04             	mov    0x4(%eax),%eax
    1cb7:	85 c0                	test   %eax,%eax
    1cb9:	75 0b                	jne    1cc6 <add_q+0x3c>
        q->head = n;
    1cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbe:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cc1:	89 50 04             	mov    %edx,0x4(%eax)
    1cc4:	eb 0c                	jmp    1cd2 <add_q+0x48>
    }else{
        q->tail->next = n;
    1cc6:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc9:	8b 40 08             	mov    0x8(%eax),%eax
    1ccc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ccf:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1cd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cd8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1cdb:	8b 45 08             	mov    0x8(%ebp),%eax
    1cde:	8b 00                	mov    (%eax),%eax
    1ce0:	8d 50 01             	lea    0x1(%eax),%edx
    1ce3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce6:	89 10                	mov    %edx,(%eax)
}
    1ce8:	c9                   	leave  
    1ce9:	c3                   	ret    

00001cea <empty_q>:

int empty_q(struct queue *q){
    1cea:	55                   	push   %ebp
    1ceb:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1ced:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf0:	8b 00                	mov    (%eax),%eax
    1cf2:	85 c0                	test   %eax,%eax
    1cf4:	75 07                	jne    1cfd <empty_q+0x13>
        return 1;
    1cf6:	b8 01 00 00 00       	mov    $0x1,%eax
    1cfb:	eb 05                	jmp    1d02 <empty_q+0x18>
    else
        return 0;
    1cfd:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1d02:	5d                   	pop    %ebp
    1d03:	c3                   	ret    

00001d04 <pop_q>:
int pop_q(struct queue *q){
    1d04:	55                   	push   %ebp
    1d05:	89 e5                	mov    %esp,%ebp
    1d07:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1d0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0d:	89 04 24             	mov    %eax,(%esp)
    1d10:	e8 d5 ff ff ff       	call   1cea <empty_q>
    1d15:	85 c0                	test   %eax,%eax
    1d17:	75 5d                	jne    1d76 <pop_q+0x72>
       val = q->head->value; 
    1d19:	8b 45 08             	mov    0x8(%ebp),%eax
    1d1c:	8b 40 04             	mov    0x4(%eax),%eax
    1d1f:	8b 00                	mov    (%eax),%eax
    1d21:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1d24:	8b 45 08             	mov    0x8(%ebp),%eax
    1d27:	8b 40 04             	mov    0x4(%eax),%eax
    1d2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1d2d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d30:	8b 40 04             	mov    0x4(%eax),%eax
    1d33:	8b 50 04             	mov    0x4(%eax),%edx
    1d36:	8b 45 08             	mov    0x8(%ebp),%eax
    1d39:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d3f:	89 04 24             	mov    %eax,(%esp)
    1d42:	e8 e1 fb ff ff       	call   1928 <free>
       q->size--;
    1d47:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4a:	8b 00                	mov    (%eax),%eax
    1d4c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d52:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1d54:	8b 45 08             	mov    0x8(%ebp),%eax
    1d57:	8b 00                	mov    (%eax),%eax
    1d59:	85 c0                	test   %eax,%eax
    1d5b:	75 14                	jne    1d71 <pop_q+0x6d>
            q->head = 0;
    1d5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d60:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1d67:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1d71:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d74:	eb 05                	jmp    1d7b <pop_q+0x77>
    }
    return -1;
    1d76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1d7b:	c9                   	leave  
    1d7c:	c3                   	ret    
