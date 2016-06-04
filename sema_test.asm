
_sema_test:     file format elf32-i386


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
    100f:	e8 d4 09 00 00       	call   19e8 <init_q>
	lock_init(&s->lock);
    1014:	8b 45 08             	mov    0x8(%ebp),%eax
    1017:	89 04 24             	mov    %eax,(%esp)
    101a:	e8 b3 08 00 00       	call   18d2 <lock_init>
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
    1036:	e8 a5 08 00 00       	call   18e0 <lock_acquire>
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
    105a:	e8 a0 08 00 00       	call   18ff <lock_release>
		return;
    105f:	eb 27                	jmp    1088 <sem_acquire+0x5e>
	}	
	
	add_q(&s->q, getpid());	
    1061:	e8 72 03 00 00       	call   13d8 <getpid>
    1066:	8b 55 08             	mov    0x8(%ebp),%edx
    1069:	83 c2 08             	add    $0x8,%edx
    106c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1070:	89 14 24             	mov    %edx,(%esp)
    1073:	e8 92 09 00 00       	call   1a0a <add_q>
	lock_release(&s->lock);
    1078:	8b 45 08             	mov    0x8(%ebp),%eax
    107b:	89 04 24             	mov    %eax,(%esp)
    107e:	e8 7c 08 00 00       	call   18ff <lock_release>
	tsleep();
    1083:	e8 80 03 00 00       	call   1408 <tsleep>
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
    1096:	e8 45 08 00 00       	call   18e0 <lock_acquire>
	if (empty_q(&s->q) == 1)
    109b:	8b 45 08             	mov    0x8(%ebp),%eax
    109e:	83 c0 08             	add    $0x8,%eax
    10a1:	89 04 24             	mov    %eax,(%esp)
    10a4:	e8 c1 09 00 00       	call   1a6a <empty_q>
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
    10c8:	e8 b7 09 00 00       	call   1a84 <pop_q>
    10cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
		twakeup(tid);
    10d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d3:	89 04 24             	mov    %eax,(%esp)
    10d6:	e8 35 03 00 00       	call   1410 <twakeup>
	}
		
	lock_release(&s->lock);
    10db:	8b 45 08             	mov    0x8(%ebp),%eax
    10de:	89 04 24             	mov    %eax,(%esp)
    10e1:	e8 19 08 00 00       	call   18ff <lock_release>
};
    10e6:	c9                   	leave  
    10e7:	c3                   	ret    

000010e8 <main>:
#include "semaphore.h"

int main()
{
    10e8:	55                   	push   %ebp
    10e9:	89 e5                	mov    %esp,%ebp
    10eb:	83 e4 f0             	and    $0xfffffff0,%esp
	//struct Semaphore * s = malloc(sizeof(struct Semaphore));
	
	// change to thread_create instead of fork
	// write a test_func for the thread
	
	exit();
    10ee:	e8 65 02 00 00       	call   1358 <exit>
    10f3:	90                   	nop

000010f4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    10f4:	55                   	push   %ebp
    10f5:	89 e5                	mov    %esp,%ebp
    10f7:	57                   	push   %edi
    10f8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    10f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10fc:	8b 55 10             	mov    0x10(%ebp),%edx
    10ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    1102:	89 cb                	mov    %ecx,%ebx
    1104:	89 df                	mov    %ebx,%edi
    1106:	89 d1                	mov    %edx,%ecx
    1108:	fc                   	cld    
    1109:	f3 aa                	rep stos %al,%es:(%edi)
    110b:	89 ca                	mov    %ecx,%edx
    110d:	89 fb                	mov    %edi,%ebx
    110f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1112:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1115:	5b                   	pop    %ebx
    1116:	5f                   	pop    %edi
    1117:	5d                   	pop    %ebp
    1118:	c3                   	ret    

00001119 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1119:	55                   	push   %ebp
    111a:	89 e5                	mov    %esp,%ebp
    111c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    111f:	8b 45 08             	mov    0x8(%ebp),%eax
    1122:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1125:	8b 45 0c             	mov    0xc(%ebp),%eax
    1128:	0f b6 10             	movzbl (%eax),%edx
    112b:	8b 45 08             	mov    0x8(%ebp),%eax
    112e:	88 10                	mov    %dl,(%eax)
    1130:	8b 45 08             	mov    0x8(%ebp),%eax
    1133:	0f b6 00             	movzbl (%eax),%eax
    1136:	84 c0                	test   %al,%al
    1138:	0f 95 c0             	setne  %al
    113b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    113f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1143:	84 c0                	test   %al,%al
    1145:	75 de                	jne    1125 <strcpy+0xc>
    ;
  return os;
    1147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    114a:	c9                   	leave  
    114b:	c3                   	ret    

0000114c <strcmp>:

int
strcmp(const char *p, const char *q)
{
    114c:	55                   	push   %ebp
    114d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    114f:	eb 08                	jmp    1159 <strcmp+0xd>
    p++, q++;
    1151:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1155:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1159:	8b 45 08             	mov    0x8(%ebp),%eax
    115c:	0f b6 00             	movzbl (%eax),%eax
    115f:	84 c0                	test   %al,%al
    1161:	74 10                	je     1173 <strcmp+0x27>
    1163:	8b 45 08             	mov    0x8(%ebp),%eax
    1166:	0f b6 10             	movzbl (%eax),%edx
    1169:	8b 45 0c             	mov    0xc(%ebp),%eax
    116c:	0f b6 00             	movzbl (%eax),%eax
    116f:	38 c2                	cmp    %al,%dl
    1171:	74 de                	je     1151 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1173:	8b 45 08             	mov    0x8(%ebp),%eax
    1176:	0f b6 00             	movzbl (%eax),%eax
    1179:	0f b6 d0             	movzbl %al,%edx
    117c:	8b 45 0c             	mov    0xc(%ebp),%eax
    117f:	0f b6 00             	movzbl (%eax),%eax
    1182:	0f b6 c0             	movzbl %al,%eax
    1185:	89 d1                	mov    %edx,%ecx
    1187:	29 c1                	sub    %eax,%ecx
    1189:	89 c8                	mov    %ecx,%eax
}
    118b:	5d                   	pop    %ebp
    118c:	c3                   	ret    

0000118d <strlen>:

uint
strlen(char *s)
{
    118d:	55                   	push   %ebp
    118e:	89 e5                	mov    %esp,%ebp
    1190:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1193:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    119a:	eb 04                	jmp    11a0 <strlen+0x13>
    119c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    11a3:	03 45 08             	add    0x8(%ebp),%eax
    11a6:	0f b6 00             	movzbl (%eax),%eax
    11a9:	84 c0                	test   %al,%al
    11ab:	75 ef                	jne    119c <strlen+0xf>
    ;
  return n;
    11ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11b0:	c9                   	leave  
    11b1:	c3                   	ret    

000011b2 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11b2:	55                   	push   %ebp
    11b3:	89 e5                	mov    %esp,%ebp
    11b5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11b8:	8b 45 10             	mov    0x10(%ebp),%eax
    11bb:	89 44 24 08          	mov    %eax,0x8(%esp)
    11bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c6:	8b 45 08             	mov    0x8(%ebp),%eax
    11c9:	89 04 24             	mov    %eax,(%esp)
    11cc:	e8 23 ff ff ff       	call   10f4 <stosb>
  return dst;
    11d1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11d4:	c9                   	leave  
    11d5:	c3                   	ret    

000011d6 <strchr>:

char*
strchr(const char *s, char c)
{
    11d6:	55                   	push   %ebp
    11d7:	89 e5                	mov    %esp,%ebp
    11d9:	83 ec 04             	sub    $0x4,%esp
    11dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    11df:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    11e2:	eb 14                	jmp    11f8 <strchr+0x22>
    if(*s == c)
    11e4:	8b 45 08             	mov    0x8(%ebp),%eax
    11e7:	0f b6 00             	movzbl (%eax),%eax
    11ea:	3a 45 fc             	cmp    -0x4(%ebp),%al
    11ed:	75 05                	jne    11f4 <strchr+0x1e>
      return (char*)s;
    11ef:	8b 45 08             	mov    0x8(%ebp),%eax
    11f2:	eb 13                	jmp    1207 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11f4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11f8:	8b 45 08             	mov    0x8(%ebp),%eax
    11fb:	0f b6 00             	movzbl (%eax),%eax
    11fe:	84 c0                	test   %al,%al
    1200:	75 e2                	jne    11e4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1202:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1207:	c9                   	leave  
    1208:	c3                   	ret    

00001209 <gets>:

char*
gets(char *buf, int max)
{
    1209:	55                   	push   %ebp
    120a:	89 e5                	mov    %esp,%ebp
    120c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    120f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1216:	eb 44                	jmp    125c <gets+0x53>
    cc = read(0, &c, 1);
    1218:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    121f:	00 
    1220:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1223:	89 44 24 04          	mov    %eax,0x4(%esp)
    1227:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    122e:	e8 3d 01 00 00       	call   1370 <read>
    1233:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1236:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    123a:	7e 2d                	jle    1269 <gets+0x60>
      break;
    buf[i++] = c;
    123c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    123f:	03 45 08             	add    0x8(%ebp),%eax
    1242:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1246:	88 10                	mov    %dl,(%eax)
    1248:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    124c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1250:	3c 0a                	cmp    $0xa,%al
    1252:	74 16                	je     126a <gets+0x61>
    1254:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1258:	3c 0d                	cmp    $0xd,%al
    125a:	74 0e                	je     126a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    125c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    125f:	83 c0 01             	add    $0x1,%eax
    1262:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1265:	7c b1                	jl     1218 <gets+0xf>
    1267:	eb 01                	jmp    126a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1269:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    126a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    126d:	03 45 08             	add    0x8(%ebp),%eax
    1270:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1273:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1276:	c9                   	leave  
    1277:	c3                   	ret    

00001278 <stat>:

int
stat(char *n, struct stat *st)
{
    1278:	55                   	push   %ebp
    1279:	89 e5                	mov    %esp,%ebp
    127b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    127e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1285:	00 
    1286:	8b 45 08             	mov    0x8(%ebp),%eax
    1289:	89 04 24             	mov    %eax,(%esp)
    128c:	e8 07 01 00 00       	call   1398 <open>
    1291:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1294:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1298:	79 07                	jns    12a1 <stat+0x29>
    return -1;
    129a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    129f:	eb 23                	jmp    12c4 <stat+0x4c>
  r = fstat(fd, st);
    12a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12ab:	89 04 24             	mov    %eax,(%esp)
    12ae:	e8 fd 00 00 00       	call   13b0 <fstat>
    12b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    12b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12b9:	89 04 24             	mov    %eax,(%esp)
    12bc:	e8 bf 00 00 00       	call   1380 <close>
  return r;
    12c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    12c4:	c9                   	leave  
    12c5:	c3                   	ret    

000012c6 <atoi>:

int
atoi(const char *s)
{
    12c6:	55                   	push   %ebp
    12c7:	89 e5                	mov    %esp,%ebp
    12c9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12d3:	eb 24                	jmp    12f9 <atoi+0x33>
    n = n*10 + *s++ - '0';
    12d5:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12d8:	89 d0                	mov    %edx,%eax
    12da:	c1 e0 02             	shl    $0x2,%eax
    12dd:	01 d0                	add    %edx,%eax
    12df:	01 c0                	add    %eax,%eax
    12e1:	89 c2                	mov    %eax,%edx
    12e3:	8b 45 08             	mov    0x8(%ebp),%eax
    12e6:	0f b6 00             	movzbl (%eax),%eax
    12e9:	0f be c0             	movsbl %al,%eax
    12ec:	8d 04 02             	lea    (%edx,%eax,1),%eax
    12ef:	83 e8 30             	sub    $0x30,%eax
    12f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12f5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f9:	8b 45 08             	mov    0x8(%ebp),%eax
    12fc:	0f b6 00             	movzbl (%eax),%eax
    12ff:	3c 2f                	cmp    $0x2f,%al
    1301:	7e 0a                	jle    130d <atoi+0x47>
    1303:	8b 45 08             	mov    0x8(%ebp),%eax
    1306:	0f b6 00             	movzbl (%eax),%eax
    1309:	3c 39                	cmp    $0x39,%al
    130b:	7e c8                	jle    12d5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    130d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1310:	c9                   	leave  
    1311:	c3                   	ret    

00001312 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1312:	55                   	push   %ebp
    1313:	89 e5                	mov    %esp,%ebp
    1315:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1318:	8b 45 08             	mov    0x8(%ebp),%eax
    131b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    131e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1321:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1324:	eb 13                	jmp    1339 <memmove+0x27>
    *dst++ = *src++;
    1326:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1329:	0f b6 10             	movzbl (%eax),%edx
    132c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    132f:	88 10                	mov    %dl,(%eax)
    1331:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1335:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1339:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    133d:	0f 9f c0             	setg   %al
    1340:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1344:	84 c0                	test   %al,%al
    1346:	75 de                	jne    1326 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1348:	8b 45 08             	mov    0x8(%ebp),%eax
}
    134b:	c9                   	leave  
    134c:	c3                   	ret    
    134d:	90                   	nop
    134e:	90                   	nop
    134f:	90                   	nop

00001350 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1350:	b8 01 00 00 00       	mov    $0x1,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <exit>:
SYSCALL(exit)
    1358:	b8 02 00 00 00       	mov    $0x2,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <wait>:
SYSCALL(wait)
    1360:	b8 03 00 00 00       	mov    $0x3,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <pipe>:
SYSCALL(pipe)
    1368:	b8 04 00 00 00       	mov    $0x4,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <read>:
SYSCALL(read)
    1370:	b8 05 00 00 00       	mov    $0x5,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <write>:
SYSCALL(write)
    1378:	b8 10 00 00 00       	mov    $0x10,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <close>:
SYSCALL(close)
    1380:	b8 15 00 00 00       	mov    $0x15,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <kill>:
SYSCALL(kill)
    1388:	b8 06 00 00 00       	mov    $0x6,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <exec>:
SYSCALL(exec)
    1390:	b8 07 00 00 00       	mov    $0x7,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <open>:
SYSCALL(open)
    1398:	b8 0f 00 00 00       	mov    $0xf,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <mknod>:
SYSCALL(mknod)
    13a0:	b8 11 00 00 00       	mov    $0x11,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <unlink>:
SYSCALL(unlink)
    13a8:	b8 12 00 00 00       	mov    $0x12,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <fstat>:
SYSCALL(fstat)
    13b0:	b8 08 00 00 00       	mov    $0x8,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <link>:
SYSCALL(link)
    13b8:	b8 13 00 00 00       	mov    $0x13,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <mkdir>:
SYSCALL(mkdir)
    13c0:	b8 14 00 00 00       	mov    $0x14,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <chdir>:
SYSCALL(chdir)
    13c8:	b8 09 00 00 00       	mov    $0x9,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <dup>:
SYSCALL(dup)
    13d0:	b8 0a 00 00 00       	mov    $0xa,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <getpid>:
SYSCALL(getpid)
    13d8:	b8 0b 00 00 00       	mov    $0xb,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <sbrk>:
SYSCALL(sbrk)
    13e0:	b8 0c 00 00 00       	mov    $0xc,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <sleep>:
SYSCALL(sleep)
    13e8:	b8 0d 00 00 00       	mov    $0xd,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <uptime>:
SYSCALL(uptime)
    13f0:	b8 0e 00 00 00       	mov    $0xe,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <clone>:
SYSCALL(clone)
    13f8:	b8 16 00 00 00       	mov    $0x16,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <texit>:
SYSCALL(texit)
    1400:	b8 17 00 00 00       	mov    $0x17,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <tsleep>:
SYSCALL(tsleep)
    1408:	b8 18 00 00 00       	mov    $0x18,%eax
    140d:	cd 40                	int    $0x40
    140f:	c3                   	ret    

00001410 <twakeup>:
SYSCALL(twakeup)
    1410:	b8 19 00 00 00       	mov    $0x19,%eax
    1415:	cd 40                	int    $0x40
    1417:	c3                   	ret    

00001418 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1418:	55                   	push   %ebp
    1419:	89 e5                	mov    %esp,%ebp
    141b:	83 ec 28             	sub    $0x28,%esp
    141e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1421:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1424:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    142b:	00 
    142c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    142f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1433:	8b 45 08             	mov    0x8(%ebp),%eax
    1436:	89 04 24             	mov    %eax,(%esp)
    1439:	e8 3a ff ff ff       	call   1378 <write>
}
    143e:	c9                   	leave  
    143f:	c3                   	ret    

00001440 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	53                   	push   %ebx
    1444:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1447:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    144e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1452:	74 17                	je     146b <printint+0x2b>
    1454:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1458:	79 11                	jns    146b <printint+0x2b>
    neg = 1;
    145a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1461:	8b 45 0c             	mov    0xc(%ebp),%eax
    1464:	f7 d8                	neg    %eax
    1466:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1469:	eb 06                	jmp    1471 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    146b:	8b 45 0c             	mov    0xc(%ebp),%eax
    146e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    1471:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1478:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    147b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    147e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1481:	ba 00 00 00 00       	mov    $0x0,%edx
    1486:	f7 f3                	div    %ebx
    1488:	89 d0                	mov    %edx,%eax
    148a:	0f b6 80 30 1b 00 00 	movzbl 0x1b30(%eax),%eax
    1491:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1495:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1499:	8b 45 10             	mov    0x10(%ebp),%eax
    149c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    149f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a2:	ba 00 00 00 00       	mov    $0x0,%edx
    14a7:	f7 75 d4             	divl   -0x2c(%ebp)
    14aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    14ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14b1:	75 c5                	jne    1478 <printint+0x38>
  if(neg)
    14b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14b7:	74 28                	je     14e1 <printint+0xa1>
    buf[i++] = '-';
    14b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14bc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    14c1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    14c5:	eb 1a                	jmp    14e1 <printint+0xa1>
    putc(fd, buf[i]);
    14c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14ca:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    14cf:	0f be c0             	movsbl %al,%eax
    14d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    14d6:	8b 45 08             	mov    0x8(%ebp),%eax
    14d9:	89 04 24             	mov    %eax,(%esp)
    14dc:	e8 37 ff ff ff       	call   1418 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14e1:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    14e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14e9:	79 dc                	jns    14c7 <printint+0x87>
    putc(fd, buf[i]);
}
    14eb:	83 c4 44             	add    $0x44,%esp
    14ee:	5b                   	pop    %ebx
    14ef:	5d                   	pop    %ebp
    14f0:	c3                   	ret    

000014f1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14f1:	55                   	push   %ebp
    14f2:	89 e5                	mov    %esp,%ebp
    14f4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14f7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14fe:	8d 45 0c             	lea    0xc(%ebp),%eax
    1501:	83 c0 04             	add    $0x4,%eax
    1504:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1507:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    150e:	e9 7e 01 00 00       	jmp    1691 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1513:	8b 55 0c             	mov    0xc(%ebp),%edx
    1516:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1519:	8d 04 02             	lea    (%edx,%eax,1),%eax
    151c:	0f b6 00             	movzbl (%eax),%eax
    151f:	0f be c0             	movsbl %al,%eax
    1522:	25 ff 00 00 00       	and    $0xff,%eax
    1527:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    152a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    152e:	75 2c                	jne    155c <printf+0x6b>
      if(c == '%'){
    1530:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1534:	75 0c                	jne    1542 <printf+0x51>
        state = '%';
    1536:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    153d:	e9 4b 01 00 00       	jmp    168d <printf+0x19c>
      } else {
        putc(fd, c);
    1542:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1545:	0f be c0             	movsbl %al,%eax
    1548:	89 44 24 04          	mov    %eax,0x4(%esp)
    154c:	8b 45 08             	mov    0x8(%ebp),%eax
    154f:	89 04 24             	mov    %eax,(%esp)
    1552:	e8 c1 fe ff ff       	call   1418 <putc>
    1557:	e9 31 01 00 00       	jmp    168d <printf+0x19c>
      }
    } else if(state == '%'){
    155c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    1560:	0f 85 27 01 00 00    	jne    168d <printf+0x19c>
      if(c == 'd'){
    1566:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    156a:	75 2d                	jne    1599 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    156c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    156f:	8b 00                	mov    (%eax),%eax
    1571:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1578:	00 
    1579:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1580:	00 
    1581:	89 44 24 04          	mov    %eax,0x4(%esp)
    1585:	8b 45 08             	mov    0x8(%ebp),%eax
    1588:	89 04 24             	mov    %eax,(%esp)
    158b:	e8 b0 fe ff ff       	call   1440 <printint>
        ap++;
    1590:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1594:	e9 ed 00 00 00       	jmp    1686 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1599:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    159d:	74 06                	je     15a5 <printf+0xb4>
    159f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    15a3:	75 2d                	jne    15d2 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    15a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a8:	8b 00                	mov    (%eax),%eax
    15aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    15b1:	00 
    15b2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    15b9:	00 
    15ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    15be:	8b 45 08             	mov    0x8(%ebp),%eax
    15c1:	89 04 24             	mov    %eax,(%esp)
    15c4:	e8 77 fe ff ff       	call   1440 <printint>
        ap++;
    15c9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    15cd:	e9 b4 00 00 00       	jmp    1686 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15d2:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    15d6:	75 46                	jne    161e <printf+0x12d>
        s = (char*)*ap;
    15d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15db:	8b 00                	mov    (%eax),%eax
    15dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    15e0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    15e4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    15e8:	75 27                	jne    1611 <printf+0x120>
          s = "(null)";
    15ea:	c7 45 e4 fd 1a 00 00 	movl   $0x1afd,-0x1c(%ebp)
        while(*s != 0){
    15f1:	eb 1f                	jmp    1612 <printf+0x121>
          putc(fd, *s);
    15f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15f6:	0f b6 00             	movzbl (%eax),%eax
    15f9:	0f be c0             	movsbl %al,%eax
    15fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1600:	8b 45 08             	mov    0x8(%ebp),%eax
    1603:	89 04 24             	mov    %eax,(%esp)
    1606:	e8 0d fe ff ff       	call   1418 <putc>
          s++;
    160b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    160f:	eb 01                	jmp    1612 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1611:	90                   	nop
    1612:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1615:	0f b6 00             	movzbl (%eax),%eax
    1618:	84 c0                	test   %al,%al
    161a:	75 d7                	jne    15f3 <printf+0x102>
    161c:	eb 68                	jmp    1686 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    161e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1622:	75 1d                	jne    1641 <printf+0x150>
        putc(fd, *ap);
    1624:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1627:	8b 00                	mov    (%eax),%eax
    1629:	0f be c0             	movsbl %al,%eax
    162c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1630:	8b 45 08             	mov    0x8(%ebp),%eax
    1633:	89 04 24             	mov    %eax,(%esp)
    1636:	e8 dd fd ff ff       	call   1418 <putc>
        ap++;
    163b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    163f:	eb 45                	jmp    1686 <printf+0x195>
      } else if(c == '%'){
    1641:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1645:	75 17                	jne    165e <printf+0x16d>
        putc(fd, c);
    1647:	8b 45 e8             	mov    -0x18(%ebp),%eax
    164a:	0f be c0             	movsbl %al,%eax
    164d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1651:	8b 45 08             	mov    0x8(%ebp),%eax
    1654:	89 04 24             	mov    %eax,(%esp)
    1657:	e8 bc fd ff ff       	call   1418 <putc>
    165c:	eb 28                	jmp    1686 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    165e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1665:	00 
    1666:	8b 45 08             	mov    0x8(%ebp),%eax
    1669:	89 04 24             	mov    %eax,(%esp)
    166c:	e8 a7 fd ff ff       	call   1418 <putc>
        putc(fd, c);
    1671:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1674:	0f be c0             	movsbl %al,%eax
    1677:	89 44 24 04          	mov    %eax,0x4(%esp)
    167b:	8b 45 08             	mov    0x8(%ebp),%eax
    167e:	89 04 24             	mov    %eax,(%esp)
    1681:	e8 92 fd ff ff       	call   1418 <putc>
      }
      state = 0;
    1686:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    168d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1691:	8b 55 0c             	mov    0xc(%ebp),%edx
    1694:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1697:	8d 04 02             	lea    (%edx,%eax,1),%eax
    169a:	0f b6 00             	movzbl (%eax),%eax
    169d:	84 c0                	test   %al,%al
    169f:	0f 85 6e fe ff ff    	jne    1513 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    16a5:	c9                   	leave  
    16a6:	c3                   	ret    
    16a7:	90                   	nop

000016a8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16a8:	55                   	push   %ebp
    16a9:	89 e5                	mov    %esp,%ebp
    16ab:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16ae:	8b 45 08             	mov    0x8(%ebp),%eax
    16b1:	83 e8 08             	sub    $0x8,%eax
    16b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b7:	a1 4c 1b 00 00       	mov    0x1b4c,%eax
    16bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16bf:	eb 24                	jmp    16e5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c4:	8b 00                	mov    (%eax),%eax
    16c6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16c9:	77 12                	ja     16dd <free+0x35>
    16cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16d1:	77 24                	ja     16f7 <free+0x4f>
    16d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d6:	8b 00                	mov    (%eax),%eax
    16d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16db:	77 1a                	ja     16f7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e0:	8b 00                	mov    (%eax),%eax
    16e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16eb:	76 d4                	jbe    16c1 <free+0x19>
    16ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f0:	8b 00                	mov    (%eax),%eax
    16f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16f5:	76 ca                	jbe    16c1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    16f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16fa:	8b 40 04             	mov    0x4(%eax),%eax
    16fd:	c1 e0 03             	shl    $0x3,%eax
    1700:	89 c2                	mov    %eax,%edx
    1702:	03 55 f8             	add    -0x8(%ebp),%edx
    1705:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1708:	8b 00                	mov    (%eax),%eax
    170a:	39 c2                	cmp    %eax,%edx
    170c:	75 24                	jne    1732 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    170e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1711:	8b 50 04             	mov    0x4(%eax),%edx
    1714:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1717:	8b 00                	mov    (%eax),%eax
    1719:	8b 40 04             	mov    0x4(%eax),%eax
    171c:	01 c2                	add    %eax,%edx
    171e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1721:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1724:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1727:	8b 00                	mov    (%eax),%eax
    1729:	8b 10                	mov    (%eax),%edx
    172b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    172e:	89 10                	mov    %edx,(%eax)
    1730:	eb 0a                	jmp    173c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1732:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1735:	8b 10                	mov    (%eax),%edx
    1737:	8b 45 f8             	mov    -0x8(%ebp),%eax
    173a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    173c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    173f:	8b 40 04             	mov    0x4(%eax),%eax
    1742:	c1 e0 03             	shl    $0x3,%eax
    1745:	03 45 fc             	add    -0x4(%ebp),%eax
    1748:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    174b:	75 20                	jne    176d <free+0xc5>
    p->s.size += bp->s.size;
    174d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1750:	8b 50 04             	mov    0x4(%eax),%edx
    1753:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1756:	8b 40 04             	mov    0x4(%eax),%eax
    1759:	01 c2                	add    %eax,%edx
    175b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1761:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1764:	8b 10                	mov    (%eax),%edx
    1766:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1769:	89 10                	mov    %edx,(%eax)
    176b:	eb 08                	jmp    1775 <free+0xcd>
  } else
    p->s.ptr = bp;
    176d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1770:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1773:	89 10                	mov    %edx,(%eax)
  freep = p;
    1775:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1778:	a3 4c 1b 00 00       	mov    %eax,0x1b4c
}
    177d:	c9                   	leave  
    177e:	c3                   	ret    

0000177f <morecore>:

static Header*
morecore(uint nu)
{
    177f:	55                   	push   %ebp
    1780:	89 e5                	mov    %esp,%ebp
    1782:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1785:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    178c:	77 07                	ja     1795 <morecore+0x16>
    nu = 4096;
    178e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1795:	8b 45 08             	mov    0x8(%ebp),%eax
    1798:	c1 e0 03             	shl    $0x3,%eax
    179b:	89 04 24             	mov    %eax,(%esp)
    179e:	e8 3d fc ff ff       	call   13e0 <sbrk>
    17a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    17a6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    17aa:	75 07                	jne    17b3 <morecore+0x34>
    return 0;
    17ac:	b8 00 00 00 00       	mov    $0x0,%eax
    17b1:	eb 22                	jmp    17d5 <morecore+0x56>
  hp = (Header*)p;
    17b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    17b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17bc:	8b 55 08             	mov    0x8(%ebp),%edx
    17bf:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    17c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c5:	83 c0 08             	add    $0x8,%eax
    17c8:	89 04 24             	mov    %eax,(%esp)
    17cb:	e8 d8 fe ff ff       	call   16a8 <free>
  return freep;
    17d0:	a1 4c 1b 00 00       	mov    0x1b4c,%eax
}
    17d5:	c9                   	leave  
    17d6:	c3                   	ret    

000017d7 <malloc>:

void*
malloc(uint nbytes)
{
    17d7:	55                   	push   %ebp
    17d8:	89 e5                	mov    %esp,%ebp
    17da:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17dd:	8b 45 08             	mov    0x8(%ebp),%eax
    17e0:	83 c0 07             	add    $0x7,%eax
    17e3:	c1 e8 03             	shr    $0x3,%eax
    17e6:	83 c0 01             	add    $0x1,%eax
    17e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    17ec:	a1 4c 1b 00 00       	mov    0x1b4c,%eax
    17f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17f8:	75 23                	jne    181d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17fa:	c7 45 f0 44 1b 00 00 	movl   $0x1b44,-0x10(%ebp)
    1801:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1804:	a3 4c 1b 00 00       	mov    %eax,0x1b4c
    1809:	a1 4c 1b 00 00       	mov    0x1b4c,%eax
    180e:	a3 44 1b 00 00       	mov    %eax,0x1b44
    base.s.size = 0;
    1813:	c7 05 48 1b 00 00 00 	movl   $0x0,0x1b48
    181a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    181d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1820:	8b 00                	mov    (%eax),%eax
    1822:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1825:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1828:	8b 40 04             	mov    0x4(%eax),%eax
    182b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    182e:	72 4d                	jb     187d <malloc+0xa6>
      if(p->s.size == nunits)
    1830:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1833:	8b 40 04             	mov    0x4(%eax),%eax
    1836:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1839:	75 0c                	jne    1847 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    183b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    183e:	8b 10                	mov    (%eax),%edx
    1840:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1843:	89 10                	mov    %edx,(%eax)
    1845:	eb 26                	jmp    186d <malloc+0x96>
      else {
        p->s.size -= nunits;
    1847:	8b 45 ec             	mov    -0x14(%ebp),%eax
    184a:	8b 40 04             	mov    0x4(%eax),%eax
    184d:	89 c2                	mov    %eax,%edx
    184f:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1852:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1855:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1858:	8b 45 ec             	mov    -0x14(%ebp),%eax
    185b:	8b 40 04             	mov    0x4(%eax),%eax
    185e:	c1 e0 03             	shl    $0x3,%eax
    1861:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1864:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1867:	8b 55 f4             	mov    -0xc(%ebp),%edx
    186a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    186d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1870:	a3 4c 1b 00 00       	mov    %eax,0x1b4c
      return (void*)(p + 1);
    1875:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1878:	83 c0 08             	add    $0x8,%eax
    187b:	eb 38                	jmp    18b5 <malloc+0xde>
    }
    if(p == freep)
    187d:	a1 4c 1b 00 00       	mov    0x1b4c,%eax
    1882:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1885:	75 1b                	jne    18a2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1887:	8b 45 f4             	mov    -0xc(%ebp),%eax
    188a:	89 04 24             	mov    %eax,(%esp)
    188d:	e8 ed fe ff ff       	call   177f <morecore>
    1892:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1895:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1899:	75 07                	jne    18a2 <malloc+0xcb>
        return 0;
    189b:	b8 00 00 00 00       	mov    $0x0,%eax
    18a0:	eb 13                	jmp    18b5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18ab:	8b 00                	mov    (%eax),%eax
    18ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    18b0:	e9 70 ff ff ff       	jmp    1825 <malloc+0x4e>
}
    18b5:	c9                   	leave  
    18b6:	c3                   	ret    
    18b7:	90                   	nop

000018b8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    18b8:	55                   	push   %ebp
    18b9:	89 e5                	mov    %esp,%ebp
    18bb:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18be:	8b 55 08             	mov    0x8(%ebp),%edx
    18c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    18c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    18c7:	f0 87 02             	lock xchg %eax,(%edx)
    18ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    18d0:	c9                   	leave  
    18d1:	c3                   	ret    

000018d2 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    18d2:	55                   	push   %ebp
    18d3:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    18d5:	8b 45 08             	mov    0x8(%ebp),%eax
    18d8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18de:	5d                   	pop    %ebp
    18df:	c3                   	ret    

000018e0 <lock_acquire>:
void lock_acquire(lock_t *lock){
    18e0:	55                   	push   %ebp
    18e1:	89 e5                	mov    %esp,%ebp
    18e3:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    18e6:	8b 45 08             	mov    0x8(%ebp),%eax
    18e9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    18f0:	00 
    18f1:	89 04 24             	mov    %eax,(%esp)
    18f4:	e8 bf ff ff ff       	call   18b8 <xchg>
    18f9:	85 c0                	test   %eax,%eax
    18fb:	75 e9                	jne    18e6 <lock_acquire+0x6>
}
    18fd:	c9                   	leave  
    18fe:	c3                   	ret    

000018ff <lock_release>:
void lock_release(lock_t *lock){
    18ff:	55                   	push   %ebp
    1900:	89 e5                	mov    %esp,%ebp
    1902:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1905:	8b 45 08             	mov    0x8(%ebp),%eax
    1908:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    190f:	00 
    1910:	89 04 24             	mov    %eax,(%esp)
    1913:	e8 a0 ff ff ff       	call   18b8 <xchg>
}
    1918:	c9                   	leave  
    1919:	c3                   	ret    

0000191a <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    191a:	55                   	push   %ebp
    191b:	89 e5                	mov    %esp,%ebp
    191d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1920:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1927:	e8 ab fe ff ff       	call   17d7 <malloc>
    192c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    192f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1932:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1935:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1938:	25 ff 0f 00 00       	and    $0xfff,%eax
    193d:	85 c0                	test   %eax,%eax
    193f:	74 15                	je     1956 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1941:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1944:	89 c2                	mov    %eax,%edx
    1946:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    194c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1951:	29 d0                	sub    %edx,%eax
    1953:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1956:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    195a:	75 1b                	jne    1977 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    195c:	c7 44 24 04 04 1b 00 	movl   $0x1b04,0x4(%esp)
    1963:	00 
    1964:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196b:	e8 81 fb ff ff       	call   14f1 <printf>
        return 0;
    1970:	b8 00 00 00 00       	mov    $0x0,%eax
    1975:	eb 6f                	jmp    19e6 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1977:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    197a:	8b 55 08             	mov    0x8(%ebp),%edx
    197d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1980:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1984:	89 54 24 08          	mov    %edx,0x8(%esp)
    1988:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    198f:	00 
    1990:	89 04 24             	mov    %eax,(%esp)
    1993:	e8 60 fa ff ff       	call   13f8 <clone>
    1998:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    199b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    199f:	79 1b                	jns    19bc <thread_create+0xa2>
        printf(1,"clone fails\n");
    19a1:	c7 44 24 04 12 1b 00 	movl   $0x1b12,0x4(%esp)
    19a8:	00 
    19a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19b0:	e8 3c fb ff ff       	call   14f1 <printf>
        return 0;
    19b5:	b8 00 00 00 00       	mov    $0x0,%eax
    19ba:	eb 2a                	jmp    19e6 <thread_create+0xcc>
    }
    if(tid > 0){
    19bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19c0:	7e 05                	jle    19c7 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    19c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19c5:	eb 1f                	jmp    19e6 <thread_create+0xcc>
    }
    if(tid == 0){
    19c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19cb:	75 14                	jne    19e1 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    19cd:	c7 44 24 04 1f 1b 00 	movl   $0x1b1f,0x4(%esp)
    19d4:	00 
    19d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19dc:	e8 10 fb ff ff       	call   14f1 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    19e1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    19e6:	c9                   	leave  
    19e7:	c3                   	ret    

000019e8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19e8:	55                   	push   %ebp
    19e9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19eb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19f4:	8b 45 08             	mov    0x8(%ebp),%eax
    19f7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1a01:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a08:	5d                   	pop    %ebp
    1a09:	c3                   	ret    

00001a0a <add_q>:

void add_q(struct queue *q, int v){
    1a0a:	55                   	push   %ebp
    1a0b:	89 e5                	mov    %esp,%ebp
    1a0d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a10:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a17:	e8 bb fd ff ff       	call   17d7 <malloc>
    1a1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a22:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a2c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a2f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a31:	8b 45 08             	mov    0x8(%ebp),%eax
    1a34:	8b 40 04             	mov    0x4(%eax),%eax
    1a37:	85 c0                	test   %eax,%eax
    1a39:	75 0b                	jne    1a46 <add_q+0x3c>
        q->head = n;
    1a3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a41:	89 50 04             	mov    %edx,0x4(%eax)
    1a44:	eb 0c                	jmp    1a52 <add_q+0x48>
    }else{
        q->tail->next = n;
    1a46:	8b 45 08             	mov    0x8(%ebp),%eax
    1a49:	8b 40 08             	mov    0x8(%eax),%eax
    1a4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a4f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a52:	8b 45 08             	mov    0x8(%ebp),%eax
    1a55:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a58:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a5b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5e:	8b 00                	mov    (%eax),%eax
    1a60:	8d 50 01             	lea    0x1(%eax),%edx
    1a63:	8b 45 08             	mov    0x8(%ebp),%eax
    1a66:	89 10                	mov    %edx,(%eax)
}
    1a68:	c9                   	leave  
    1a69:	c3                   	ret    

00001a6a <empty_q>:

int empty_q(struct queue *q){
    1a6a:	55                   	push   %ebp
    1a6b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a70:	8b 00                	mov    (%eax),%eax
    1a72:	85 c0                	test   %eax,%eax
    1a74:	75 07                	jne    1a7d <empty_q+0x13>
        return 1;
    1a76:	b8 01 00 00 00       	mov    $0x1,%eax
    1a7b:	eb 05                	jmp    1a82 <empty_q+0x18>
    else
        return 0;
    1a7d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a82:	5d                   	pop    %ebp
    1a83:	c3                   	ret    

00001a84 <pop_q>:
int pop_q(struct queue *q){
    1a84:	55                   	push   %ebp
    1a85:	89 e5                	mov    %esp,%ebp
    1a87:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8d:	89 04 24             	mov    %eax,(%esp)
    1a90:	e8 d5 ff ff ff       	call   1a6a <empty_q>
    1a95:	85 c0                	test   %eax,%eax
    1a97:	75 5d                	jne    1af6 <pop_q+0x72>
       val = q->head->value; 
    1a99:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9c:	8b 40 04             	mov    0x4(%eax),%eax
    1a9f:	8b 00                	mov    (%eax),%eax
    1aa1:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1aa4:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa7:	8b 40 04             	mov    0x4(%eax),%eax
    1aaa:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1aad:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab0:	8b 40 04             	mov    0x4(%eax),%eax
    1ab3:	8b 50 04             	mov    0x4(%eax),%edx
    1ab6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab9:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1abf:	89 04 24             	mov    %eax,(%esp)
    1ac2:	e8 e1 fb ff ff       	call   16a8 <free>
       q->size--;
    1ac7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aca:	8b 00                	mov    (%eax),%eax
    1acc:	8d 50 ff             	lea    -0x1(%eax),%edx
    1acf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad2:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ad4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad7:	8b 00                	mov    (%eax),%eax
    1ad9:	85 c0                	test   %eax,%eax
    1adb:	75 14                	jne    1af1 <pop_q+0x6d>
            q->head = 0;
    1add:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1ae7:	8b 45 08             	mov    0x8(%ebp),%eax
    1aea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1af1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1af4:	eb 05                	jmp    1afb <pop_q+0x77>
    }
    return -1;
    1af6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1afb:	c9                   	leave  
    1afc:	c3                   	ret    
