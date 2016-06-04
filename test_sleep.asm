
_test_sleep:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
    int total;
}ttable;

void func(void *arg_ptr);

int main(int argc, char *argv[]){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
    struct thread * t;
    int i;
    printf(1,"init ttable\n");
    1009:	c7 44 24 04 f4 1b 00 	movl   $0x1bf4,0x4(%esp)
    1010:	00 
    1011:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1018:	e8 c8 05 00 00       	call   15e5 <printf>
    lock_init(&ttable.lock);
    101d:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    1024:	e8 9d 09 00 00       	call   19c6 <lock_init>
    ttable.total = 0;
    1029:	c7 05 04 1e 00 00 00 	movl   $0x0,0x1e04
    1030:	00 00 00 

    lock_acquire(&ttable.lock);
    1033:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    103a:	e8 95 09 00 00       	call   19d4 <lock_acquire>
    for(t=ttable.threads;t < &ttable.threads[64];t++){
    103f:	c7 44 24 14 04 1d 00 	movl   $0x1d04,0x14(%esp)
    1046:	00 
    1047:	eb 0f                	jmp    1058 <main+0x58>
        t->tid = 0;
    1049:	8b 44 24 14          	mov    0x14(%esp),%eax
    104d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    printf(1,"init ttable\n");
    lock_init(&ttable.lock);
    ttable.total = 0;

    lock_acquire(&ttable.lock);
    for(t=ttable.threads;t < &ttable.threads[64];t++){
    1053:	83 44 24 14 04       	addl   $0x4,0x14(%esp)
    1058:	b8 04 1e 00 00       	mov    $0x1e04,%eax
    105d:	39 44 24 14          	cmp    %eax,0x14(%esp)
    1061:	72 e6                	jb     1049 <main+0x49>
        t->tid = 0;
    }
    lock_release(&ttable.lock);
    1063:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    106a:	e8 84 09 00 00       	call   19f3 <lock_release>
    printf(1,"testing thread sleep and wakeup \n\n\n");
    106f:	c7 44 24 04 04 1c 00 	movl   $0x1c04,0x4(%esp)
    1076:	00 
    1077:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    107e:	e8 62 05 00 00       	call   15e5 <printf>
    void *stack = thread_create(func,0);
    1083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    108a:	00 
    108b:	c7 04 24 6c 11 00 00 	movl   $0x116c,(%esp)
    1092:	e8 77 09 00 00       	call   1a0e <thread_create>
    1097:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    thread_create(func,0);
    109b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10a2:	00 
    10a3:	c7 04 24 6c 11 00 00 	movl   $0x116c,(%esp)
    10aa:	e8 5f 09 00 00       	call   1a0e <thread_create>
    thread_create(func,0);
    10af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10b6:	00 
    10b7:	c7 04 24 6c 11 00 00 	movl   $0x116c,(%esp)
    10be:	e8 4b 09 00 00       	call   1a0e <thread_create>

    i=0;
    10c3:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    10ca:	00 
    while(i++ < 1000000);
    10cb:	81 7c 24 18 3f 42 0f 	cmpl   $0xf423f,0x18(%esp)
    10d2:	00 
    10d3:	0f 9e c0             	setle  %al
    10d6:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
    10db:	84 c0                	test   %al,%al
    10dd:	75 ec                	jne    10cb <main+0xcb>
    //find that thread
    lock_acquire(&ttable.lock);
    10df:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    10e6:	e8 e9 08 00 00       	call   19d4 <lock_acquire>
    for(t=ttable.threads;t < &ttable.threads[64];t++){
    10eb:	c7 44 24 14 04 1d 00 	movl   $0x1d04,0x14(%esp)
    10f2:	00 
    10f3:	eb 40                	jmp    1135 <main+0x135>
        if(t->tid != 0){
    10f5:	8b 44 24 14          	mov    0x14(%esp),%eax
    10f9:	8b 00                	mov    (%eax),%eax
    10fb:	85 c0                	test   %eax,%eax
    10fd:	74 31                	je     1130 <main+0x130>
            printf(1,"found one... %d,   wake up lazy boy !!!\n",t->tid);
    10ff:	8b 44 24 14          	mov    0x14(%esp),%eax
    1103:	8b 00                	mov    (%eax),%eax
    1105:	89 44 24 08          	mov    %eax,0x8(%esp)
    1109:	c7 44 24 04 28 1c 00 	movl   $0x1c28,0x4(%esp)
    1110:	00 
    1111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1118:	e8 c8 04 00 00       	call   15e5 <printf>
            twakeup(t->tid);
    111d:	8b 44 24 14          	mov    0x14(%esp),%eax
    1121:	8b 00                	mov    (%eax),%eax
    1123:	89 04 24             	mov    %eax,(%esp)
    1126:	e8 d9 03 00 00       	call   1504 <twakeup>
            i++;
    112b:	83 44 24 18 01       	addl   $0x1,0x18(%esp)

    i=0;
    while(i++ < 1000000);
    //find that thread
    lock_acquire(&ttable.lock);
    for(t=ttable.threads;t < &ttable.threads[64];t++){
    1130:	83 44 24 14 04       	addl   $0x4,0x14(%esp)
    1135:	b8 04 1e 00 00       	mov    $0x1e04,%eax
    113a:	39 44 24 14          	cmp    %eax,0x14(%esp)
    113e:	72 b5                	jb     10f5 <main+0xf5>
            printf(1,"found one... %d,   wake up lazy boy !!!\n",t->tid);
            twakeup(t->tid);
            i++;
        }
    }
    lock_release(&ttable.lock);
    1140:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    1147:	e8 a7 08 00 00       	call   19f3 <lock_release>
    wait();
    114c:	e8 03 03 00 00       	call   1454 <wait>
    wait();
    1151:	e8 fe 02 00 00       	call   1454 <wait>
    wait();
    1156:	e8 f9 02 00 00       	call   1454 <wait>
    free(stack);
    115b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    115f:	89 04 24             	mov    %eax,(%esp)
    1162:	e8 35 06 00 00       	call   179c <free>
    exit();
    1167:	e8 e0 02 00 00       	call   144c <exit>

0000116c <func>:
}

void func(void *arg_ptr){
    116c:	55                   	push   %ebp
    116d:	89 e5                	mov    %esp,%ebp
    116f:	83 ec 28             	sub    $0x28,%esp
    int tid;
    tid = getpid();
    1172:	e8 55 03 00 00       	call   14cc <getpid>
    1177:	89 45 f4             	mov    %eax,-0xc(%ebp)
    lock_acquire(&ttable.lock);
    117a:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    1181:	e8 4e 08 00 00       	call   19d4 <lock_acquire>
    (ttable.threads[ttable.total]).tid = tid;
    1186:	a1 04 1e 00 00       	mov    0x1e04,%eax
    118b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    118e:	89 14 85 04 1d 00 00 	mov    %edx,0x1d04(,%eax,4)
    ttable.total++;
    1195:	a1 04 1e 00 00       	mov    0x1e04,%eax
    119a:	83 c0 01             	add    $0x1,%eax
    119d:	a3 04 1e 00 00       	mov    %eax,0x1e04
    lock_release(&ttable.lock);
    11a2:	c7 04 24 00 1d 00 00 	movl   $0x1d00,(%esp)
    11a9:	e8 45 08 00 00       	call   19f3 <lock_release>

    printf(1,"I am thread %d, is about to sleep\n",tid);
    11ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b1:	89 44 24 08          	mov    %eax,0x8(%esp)
    11b5:	c7 44 24 04 54 1c 00 	movl   $0x1c54,0x4(%esp)
    11bc:	00 
    11bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11c4:	e8 1c 04 00 00       	call   15e5 <printf>
    tsleep();
    11c9:	e8 2e 03 00 00       	call   14fc <tsleep>
    printf(1,"I am wake up!\n");
    11ce:	c7 44 24 04 77 1c 00 	movl   $0x1c77,0x4(%esp)
    11d5:	00 
    11d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11dd:	e8 03 04 00 00       	call   15e5 <printf>
    texit();
    11e2:	e8 0d 03 00 00       	call   14f4 <texit>
    11e7:	90                   	nop

000011e8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    11e8:	55                   	push   %ebp
    11e9:	89 e5                	mov    %esp,%ebp
    11eb:	57                   	push   %edi
    11ec:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    11ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11f0:	8b 55 10             	mov    0x10(%ebp),%edx
    11f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    11f6:	89 cb                	mov    %ecx,%ebx
    11f8:	89 df                	mov    %ebx,%edi
    11fa:	89 d1                	mov    %edx,%ecx
    11fc:	fc                   	cld    
    11fd:	f3 aa                	rep stos %al,%es:(%edi)
    11ff:	89 ca                	mov    %ecx,%edx
    1201:	89 fb                	mov    %edi,%ebx
    1203:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1206:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1209:	5b                   	pop    %ebx
    120a:	5f                   	pop    %edi
    120b:	5d                   	pop    %ebp
    120c:	c3                   	ret    

0000120d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    120d:	55                   	push   %ebp
    120e:	89 e5                	mov    %esp,%ebp
    1210:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1213:	8b 45 08             	mov    0x8(%ebp),%eax
    1216:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1219:	8b 45 0c             	mov    0xc(%ebp),%eax
    121c:	0f b6 10             	movzbl (%eax),%edx
    121f:	8b 45 08             	mov    0x8(%ebp),%eax
    1222:	88 10                	mov    %dl,(%eax)
    1224:	8b 45 08             	mov    0x8(%ebp),%eax
    1227:	0f b6 00             	movzbl (%eax),%eax
    122a:	84 c0                	test   %al,%al
    122c:	0f 95 c0             	setne  %al
    122f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1233:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1237:	84 c0                	test   %al,%al
    1239:	75 de                	jne    1219 <strcpy+0xc>
    ;
  return os;
    123b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    123e:	c9                   	leave  
    123f:	c3                   	ret    

00001240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1243:	eb 08                	jmp    124d <strcmp+0xd>
    p++, q++;
    1245:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1249:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
    1250:	0f b6 00             	movzbl (%eax),%eax
    1253:	84 c0                	test   %al,%al
    1255:	74 10                	je     1267 <strcmp+0x27>
    1257:	8b 45 08             	mov    0x8(%ebp),%eax
    125a:	0f b6 10             	movzbl (%eax),%edx
    125d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1260:	0f b6 00             	movzbl (%eax),%eax
    1263:	38 c2                	cmp    %al,%dl
    1265:	74 de                	je     1245 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1267:	8b 45 08             	mov    0x8(%ebp),%eax
    126a:	0f b6 00             	movzbl (%eax),%eax
    126d:	0f b6 d0             	movzbl %al,%edx
    1270:	8b 45 0c             	mov    0xc(%ebp),%eax
    1273:	0f b6 00             	movzbl (%eax),%eax
    1276:	0f b6 c0             	movzbl %al,%eax
    1279:	89 d1                	mov    %edx,%ecx
    127b:	29 c1                	sub    %eax,%ecx
    127d:	89 c8                	mov    %ecx,%eax
}
    127f:	5d                   	pop    %ebp
    1280:	c3                   	ret    

00001281 <strlen>:

uint
strlen(char *s)
{
    1281:	55                   	push   %ebp
    1282:	89 e5                	mov    %esp,%ebp
    1284:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1287:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    128e:	eb 04                	jmp    1294 <strlen+0x13>
    1290:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1294:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1297:	03 45 08             	add    0x8(%ebp),%eax
    129a:	0f b6 00             	movzbl (%eax),%eax
    129d:	84 c0                	test   %al,%al
    129f:	75 ef                	jne    1290 <strlen+0xf>
    ;
  return n;
    12a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12a4:	c9                   	leave  
    12a5:	c3                   	ret    

000012a6 <memset>:

void*
memset(void *dst, int c, uint n)
{
    12a6:	55                   	push   %ebp
    12a7:	89 e5                	mov    %esp,%ebp
    12a9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    12ac:	8b 45 10             	mov    0x10(%ebp),%eax
    12af:	89 44 24 08          	mov    %eax,0x8(%esp)
    12b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    12b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ba:	8b 45 08             	mov    0x8(%ebp),%eax
    12bd:	89 04 24             	mov    %eax,(%esp)
    12c0:	e8 23 ff ff ff       	call   11e8 <stosb>
  return dst;
    12c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12c8:	c9                   	leave  
    12c9:	c3                   	ret    

000012ca <strchr>:

char*
strchr(const char *s, char c)
{
    12ca:	55                   	push   %ebp
    12cb:	89 e5                	mov    %esp,%ebp
    12cd:	83 ec 04             	sub    $0x4,%esp
    12d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    12d3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    12d6:	eb 14                	jmp    12ec <strchr+0x22>
    if(*s == c)
    12d8:	8b 45 08             	mov    0x8(%ebp),%eax
    12db:	0f b6 00             	movzbl (%eax),%eax
    12de:	3a 45 fc             	cmp    -0x4(%ebp),%al
    12e1:	75 05                	jne    12e8 <strchr+0x1e>
      return (char*)s;
    12e3:	8b 45 08             	mov    0x8(%ebp),%eax
    12e6:	eb 13                	jmp    12fb <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    12e8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12ec:	8b 45 08             	mov    0x8(%ebp),%eax
    12ef:	0f b6 00             	movzbl (%eax),%eax
    12f2:	84 c0                	test   %al,%al
    12f4:	75 e2                	jne    12d8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    12f6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12fb:	c9                   	leave  
    12fc:	c3                   	ret    

000012fd <gets>:

char*
gets(char *buf, int max)
{
    12fd:	55                   	push   %ebp
    12fe:	89 e5                	mov    %esp,%ebp
    1300:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1303:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    130a:	eb 44                	jmp    1350 <gets+0x53>
    cc = read(0, &c, 1);
    130c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1313:	00 
    1314:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1317:	89 44 24 04          	mov    %eax,0x4(%esp)
    131b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1322:	e8 3d 01 00 00       	call   1464 <read>
    1327:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    132a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    132e:	7e 2d                	jle    135d <gets+0x60>
      break;
    buf[i++] = c;
    1330:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1333:	03 45 08             	add    0x8(%ebp),%eax
    1336:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    133a:	88 10                	mov    %dl,(%eax)
    133c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1340:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1344:	3c 0a                	cmp    $0xa,%al
    1346:	74 16                	je     135e <gets+0x61>
    1348:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    134c:	3c 0d                	cmp    $0xd,%al
    134e:	74 0e                	je     135e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1350:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1353:	83 c0 01             	add    $0x1,%eax
    1356:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1359:	7c b1                	jl     130c <gets+0xf>
    135b:	eb 01                	jmp    135e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    135d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    135e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1361:	03 45 08             	add    0x8(%ebp),%eax
    1364:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1367:	8b 45 08             	mov    0x8(%ebp),%eax
}
    136a:	c9                   	leave  
    136b:	c3                   	ret    

0000136c <stat>:

int
stat(char *n, struct stat *st)
{
    136c:	55                   	push   %ebp
    136d:	89 e5                	mov    %esp,%ebp
    136f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1372:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1379:	00 
    137a:	8b 45 08             	mov    0x8(%ebp),%eax
    137d:	89 04 24             	mov    %eax,(%esp)
    1380:	e8 07 01 00 00       	call   148c <open>
    1385:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1388:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    138c:	79 07                	jns    1395 <stat+0x29>
    return -1;
    138e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1393:	eb 23                	jmp    13b8 <stat+0x4c>
  r = fstat(fd, st);
    1395:	8b 45 0c             	mov    0xc(%ebp),%eax
    1398:	89 44 24 04          	mov    %eax,0x4(%esp)
    139c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    139f:	89 04 24             	mov    %eax,(%esp)
    13a2:	e8 fd 00 00 00       	call   14a4 <fstat>
    13a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    13aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13ad:	89 04 24             	mov    %eax,(%esp)
    13b0:	e8 bf 00 00 00       	call   1474 <close>
  return r;
    13b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    13b8:	c9                   	leave  
    13b9:	c3                   	ret    

000013ba <atoi>:

int
atoi(const char *s)
{
    13ba:	55                   	push   %ebp
    13bb:	89 e5                	mov    %esp,%ebp
    13bd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    13c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    13c7:	eb 24                	jmp    13ed <atoi+0x33>
    n = n*10 + *s++ - '0';
    13c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    13cc:	89 d0                	mov    %edx,%eax
    13ce:	c1 e0 02             	shl    $0x2,%eax
    13d1:	01 d0                	add    %edx,%eax
    13d3:	01 c0                	add    %eax,%eax
    13d5:	89 c2                	mov    %eax,%edx
    13d7:	8b 45 08             	mov    0x8(%ebp),%eax
    13da:	0f b6 00             	movzbl (%eax),%eax
    13dd:	0f be c0             	movsbl %al,%eax
    13e0:	8d 04 02             	lea    (%edx,%eax,1),%eax
    13e3:	83 e8 30             	sub    $0x30,%eax
    13e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    13e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13ed:	8b 45 08             	mov    0x8(%ebp),%eax
    13f0:	0f b6 00             	movzbl (%eax),%eax
    13f3:	3c 2f                	cmp    $0x2f,%al
    13f5:	7e 0a                	jle    1401 <atoi+0x47>
    13f7:	8b 45 08             	mov    0x8(%ebp),%eax
    13fa:	0f b6 00             	movzbl (%eax),%eax
    13fd:	3c 39                	cmp    $0x39,%al
    13ff:	7e c8                	jle    13c9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1401:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1404:	c9                   	leave  
    1405:	c3                   	ret    

00001406 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1406:	55                   	push   %ebp
    1407:	89 e5                	mov    %esp,%ebp
    1409:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    140c:	8b 45 08             	mov    0x8(%ebp),%eax
    140f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    1412:	8b 45 0c             	mov    0xc(%ebp),%eax
    1415:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1418:	eb 13                	jmp    142d <memmove+0x27>
    *dst++ = *src++;
    141a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    141d:	0f b6 10             	movzbl (%eax),%edx
    1420:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1423:	88 10                	mov    %dl,(%eax)
    1425:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1429:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    142d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1431:	0f 9f c0             	setg   %al
    1434:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1438:	84 c0                	test   %al,%al
    143a:	75 de                	jne    141a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    143c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    143f:	c9                   	leave  
    1440:	c3                   	ret    
    1441:	90                   	nop
    1442:	90                   	nop
    1443:	90                   	nop

00001444 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1444:	b8 01 00 00 00       	mov    $0x1,%eax
    1449:	cd 40                	int    $0x40
    144b:	c3                   	ret    

0000144c <exit>:
SYSCALL(exit)
    144c:	b8 02 00 00 00       	mov    $0x2,%eax
    1451:	cd 40                	int    $0x40
    1453:	c3                   	ret    

00001454 <wait>:
SYSCALL(wait)
    1454:	b8 03 00 00 00       	mov    $0x3,%eax
    1459:	cd 40                	int    $0x40
    145b:	c3                   	ret    

0000145c <pipe>:
SYSCALL(pipe)
    145c:	b8 04 00 00 00       	mov    $0x4,%eax
    1461:	cd 40                	int    $0x40
    1463:	c3                   	ret    

00001464 <read>:
SYSCALL(read)
    1464:	b8 05 00 00 00       	mov    $0x5,%eax
    1469:	cd 40                	int    $0x40
    146b:	c3                   	ret    

0000146c <write>:
SYSCALL(write)
    146c:	b8 10 00 00 00       	mov    $0x10,%eax
    1471:	cd 40                	int    $0x40
    1473:	c3                   	ret    

00001474 <close>:
SYSCALL(close)
    1474:	b8 15 00 00 00       	mov    $0x15,%eax
    1479:	cd 40                	int    $0x40
    147b:	c3                   	ret    

0000147c <kill>:
SYSCALL(kill)
    147c:	b8 06 00 00 00       	mov    $0x6,%eax
    1481:	cd 40                	int    $0x40
    1483:	c3                   	ret    

00001484 <exec>:
SYSCALL(exec)
    1484:	b8 07 00 00 00       	mov    $0x7,%eax
    1489:	cd 40                	int    $0x40
    148b:	c3                   	ret    

0000148c <open>:
SYSCALL(open)
    148c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1491:	cd 40                	int    $0x40
    1493:	c3                   	ret    

00001494 <mknod>:
SYSCALL(mknod)
    1494:	b8 11 00 00 00       	mov    $0x11,%eax
    1499:	cd 40                	int    $0x40
    149b:	c3                   	ret    

0000149c <unlink>:
SYSCALL(unlink)
    149c:	b8 12 00 00 00       	mov    $0x12,%eax
    14a1:	cd 40                	int    $0x40
    14a3:	c3                   	ret    

000014a4 <fstat>:
SYSCALL(fstat)
    14a4:	b8 08 00 00 00       	mov    $0x8,%eax
    14a9:	cd 40                	int    $0x40
    14ab:	c3                   	ret    

000014ac <link>:
SYSCALL(link)
    14ac:	b8 13 00 00 00       	mov    $0x13,%eax
    14b1:	cd 40                	int    $0x40
    14b3:	c3                   	ret    

000014b4 <mkdir>:
SYSCALL(mkdir)
    14b4:	b8 14 00 00 00       	mov    $0x14,%eax
    14b9:	cd 40                	int    $0x40
    14bb:	c3                   	ret    

000014bc <chdir>:
SYSCALL(chdir)
    14bc:	b8 09 00 00 00       	mov    $0x9,%eax
    14c1:	cd 40                	int    $0x40
    14c3:	c3                   	ret    

000014c4 <dup>:
SYSCALL(dup)
    14c4:	b8 0a 00 00 00       	mov    $0xa,%eax
    14c9:	cd 40                	int    $0x40
    14cb:	c3                   	ret    

000014cc <getpid>:
SYSCALL(getpid)
    14cc:	b8 0b 00 00 00       	mov    $0xb,%eax
    14d1:	cd 40                	int    $0x40
    14d3:	c3                   	ret    

000014d4 <sbrk>:
SYSCALL(sbrk)
    14d4:	b8 0c 00 00 00       	mov    $0xc,%eax
    14d9:	cd 40                	int    $0x40
    14db:	c3                   	ret    

000014dc <sleep>:
SYSCALL(sleep)
    14dc:	b8 0d 00 00 00       	mov    $0xd,%eax
    14e1:	cd 40                	int    $0x40
    14e3:	c3                   	ret    

000014e4 <uptime>:
SYSCALL(uptime)
    14e4:	b8 0e 00 00 00       	mov    $0xe,%eax
    14e9:	cd 40                	int    $0x40
    14eb:	c3                   	ret    

000014ec <clone>:
SYSCALL(clone)
    14ec:	b8 16 00 00 00       	mov    $0x16,%eax
    14f1:	cd 40                	int    $0x40
    14f3:	c3                   	ret    

000014f4 <texit>:
SYSCALL(texit)
    14f4:	b8 17 00 00 00       	mov    $0x17,%eax
    14f9:	cd 40                	int    $0x40
    14fb:	c3                   	ret    

000014fc <tsleep>:
SYSCALL(tsleep)
    14fc:	b8 18 00 00 00       	mov    $0x18,%eax
    1501:	cd 40                	int    $0x40
    1503:	c3                   	ret    

00001504 <twakeup>:
SYSCALL(twakeup)
    1504:	b8 19 00 00 00       	mov    $0x19,%eax
    1509:	cd 40                	int    $0x40
    150b:	c3                   	ret    

0000150c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    150c:	55                   	push   %ebp
    150d:	89 e5                	mov    %esp,%ebp
    150f:	83 ec 28             	sub    $0x28,%esp
    1512:	8b 45 0c             	mov    0xc(%ebp),%eax
    1515:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1518:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    151f:	00 
    1520:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1523:	89 44 24 04          	mov    %eax,0x4(%esp)
    1527:	8b 45 08             	mov    0x8(%ebp),%eax
    152a:	89 04 24             	mov    %eax,(%esp)
    152d:	e8 3a ff ff ff       	call   146c <write>
}
    1532:	c9                   	leave  
    1533:	c3                   	ret    

00001534 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1534:	55                   	push   %ebp
    1535:	89 e5                	mov    %esp,%ebp
    1537:	53                   	push   %ebx
    1538:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    153b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1542:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1546:	74 17                	je     155f <printint+0x2b>
    1548:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    154c:	79 11                	jns    155f <printint+0x2b>
    neg = 1;
    154e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1555:	8b 45 0c             	mov    0xc(%ebp),%eax
    1558:	f7 d8                	neg    %eax
    155a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    155d:	eb 06                	jmp    1565 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    155f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1562:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    1565:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    156c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    156f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1572:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1575:	ba 00 00 00 00       	mov    $0x0,%edx
    157a:	f7 f3                	div    %ebx
    157c:	89 d0                	mov    %edx,%eax
    157e:	0f b6 80 bc 1c 00 00 	movzbl 0x1cbc(%eax),%eax
    1585:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1589:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    158d:	8b 45 10             	mov    0x10(%ebp),%eax
    1590:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1596:	ba 00 00 00 00       	mov    $0x0,%edx
    159b:	f7 75 d4             	divl   -0x2c(%ebp)
    159e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    15a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15a5:	75 c5                	jne    156c <printint+0x38>
  if(neg)
    15a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    15ab:	74 28                	je     15d5 <printint+0xa1>
    buf[i++] = '-';
    15ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15b0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    15b5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    15b9:	eb 1a                	jmp    15d5 <printint+0xa1>
    putc(fd, buf[i]);
    15bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15be:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    15c3:	0f be c0             	movsbl %al,%eax
    15c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ca:	8b 45 08             	mov    0x8(%ebp),%eax
    15cd:	89 04 24             	mov    %eax,(%esp)
    15d0:	e8 37 ff ff ff       	call   150c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    15d5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    15d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    15dd:	79 dc                	jns    15bb <printint+0x87>
    putc(fd, buf[i]);
}
    15df:	83 c4 44             	add    $0x44,%esp
    15e2:	5b                   	pop    %ebx
    15e3:	5d                   	pop    %ebp
    15e4:	c3                   	ret    

000015e5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15e5:	55                   	push   %ebp
    15e6:	89 e5                	mov    %esp,%ebp
    15e8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    15eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    15f2:	8d 45 0c             	lea    0xc(%ebp),%eax
    15f5:	83 c0 04             	add    $0x4,%eax
    15f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    15fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1602:	e9 7e 01 00 00       	jmp    1785 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1607:	8b 55 0c             	mov    0xc(%ebp),%edx
    160a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    160d:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1610:	0f b6 00             	movzbl (%eax),%eax
    1613:	0f be c0             	movsbl %al,%eax
    1616:	25 ff 00 00 00       	and    $0xff,%eax
    161b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    161e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1622:	75 2c                	jne    1650 <printf+0x6b>
      if(c == '%'){
    1624:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1628:	75 0c                	jne    1636 <printf+0x51>
        state = '%';
    162a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1631:	e9 4b 01 00 00       	jmp    1781 <printf+0x19c>
      } else {
        putc(fd, c);
    1636:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1639:	0f be c0             	movsbl %al,%eax
    163c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1640:	8b 45 08             	mov    0x8(%ebp),%eax
    1643:	89 04 24             	mov    %eax,(%esp)
    1646:	e8 c1 fe ff ff       	call   150c <putc>
    164b:	e9 31 01 00 00       	jmp    1781 <printf+0x19c>
      }
    } else if(state == '%'){
    1650:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    1654:	0f 85 27 01 00 00    	jne    1781 <printf+0x19c>
      if(c == 'd'){
    165a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    165e:	75 2d                	jne    168d <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1660:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1663:	8b 00                	mov    (%eax),%eax
    1665:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    166c:	00 
    166d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1674:	00 
    1675:	89 44 24 04          	mov    %eax,0x4(%esp)
    1679:	8b 45 08             	mov    0x8(%ebp),%eax
    167c:	89 04 24             	mov    %eax,(%esp)
    167f:	e8 b0 fe ff ff       	call   1534 <printint>
        ap++;
    1684:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1688:	e9 ed 00 00 00       	jmp    177a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    168d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1691:	74 06                	je     1699 <printf+0xb4>
    1693:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1697:	75 2d                	jne    16c6 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1699:	8b 45 f4             	mov    -0xc(%ebp),%eax
    169c:	8b 00                	mov    (%eax),%eax
    169e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    16a5:	00 
    16a6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    16ad:	00 
    16ae:	89 44 24 04          	mov    %eax,0x4(%esp)
    16b2:	8b 45 08             	mov    0x8(%ebp),%eax
    16b5:	89 04 24             	mov    %eax,(%esp)
    16b8:	e8 77 fe ff ff       	call   1534 <printint>
        ap++;
    16bd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    16c1:	e9 b4 00 00 00       	jmp    177a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16c6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    16ca:	75 46                	jne    1712 <printf+0x12d>
        s = (char*)*ap;
    16cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16cf:	8b 00                	mov    (%eax),%eax
    16d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    16d4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    16d8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    16dc:	75 27                	jne    1705 <printf+0x120>
          s = "(null)";
    16de:	c7 45 e4 86 1c 00 00 	movl   $0x1c86,-0x1c(%ebp)
        while(*s != 0){
    16e5:	eb 1f                	jmp    1706 <printf+0x121>
          putc(fd, *s);
    16e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16ea:	0f b6 00             	movzbl (%eax),%eax
    16ed:	0f be c0             	movsbl %al,%eax
    16f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    16f4:	8b 45 08             	mov    0x8(%ebp),%eax
    16f7:	89 04 24             	mov    %eax,(%esp)
    16fa:	e8 0d fe ff ff       	call   150c <putc>
          s++;
    16ff:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1703:	eb 01                	jmp    1706 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1705:	90                   	nop
    1706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1709:	0f b6 00             	movzbl (%eax),%eax
    170c:	84 c0                	test   %al,%al
    170e:	75 d7                	jne    16e7 <printf+0x102>
    1710:	eb 68                	jmp    177a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1712:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1716:	75 1d                	jne    1735 <printf+0x150>
        putc(fd, *ap);
    1718:	8b 45 f4             	mov    -0xc(%ebp),%eax
    171b:	8b 00                	mov    (%eax),%eax
    171d:	0f be c0             	movsbl %al,%eax
    1720:	89 44 24 04          	mov    %eax,0x4(%esp)
    1724:	8b 45 08             	mov    0x8(%ebp),%eax
    1727:	89 04 24             	mov    %eax,(%esp)
    172a:	e8 dd fd ff ff       	call   150c <putc>
        ap++;
    172f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1733:	eb 45                	jmp    177a <printf+0x195>
      } else if(c == '%'){
    1735:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1739:	75 17                	jne    1752 <printf+0x16d>
        putc(fd, c);
    173b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    173e:	0f be c0             	movsbl %al,%eax
    1741:	89 44 24 04          	mov    %eax,0x4(%esp)
    1745:	8b 45 08             	mov    0x8(%ebp),%eax
    1748:	89 04 24             	mov    %eax,(%esp)
    174b:	e8 bc fd ff ff       	call   150c <putc>
    1750:	eb 28                	jmp    177a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1752:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1759:	00 
    175a:	8b 45 08             	mov    0x8(%ebp),%eax
    175d:	89 04 24             	mov    %eax,(%esp)
    1760:	e8 a7 fd ff ff       	call   150c <putc>
        putc(fd, c);
    1765:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1768:	0f be c0             	movsbl %al,%eax
    176b:	89 44 24 04          	mov    %eax,0x4(%esp)
    176f:	8b 45 08             	mov    0x8(%ebp),%eax
    1772:	89 04 24             	mov    %eax,(%esp)
    1775:	e8 92 fd ff ff       	call   150c <putc>
      }
      state = 0;
    177a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1781:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1785:	8b 55 0c             	mov    0xc(%ebp),%edx
    1788:	8b 45 ec             	mov    -0x14(%ebp),%eax
    178b:	8d 04 02             	lea    (%edx,%eax,1),%eax
    178e:	0f b6 00             	movzbl (%eax),%eax
    1791:	84 c0                	test   %al,%al
    1793:	0f 85 6e fe ff ff    	jne    1607 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1799:	c9                   	leave  
    179a:	c3                   	ret    
    179b:	90                   	nop

0000179c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    179c:	55                   	push   %ebp
    179d:	89 e5                	mov    %esp,%ebp
    179f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    17a2:	8b 45 08             	mov    0x8(%ebp),%eax
    17a5:	83 e8 08             	sub    $0x8,%eax
    17a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17ab:	a1 e8 1c 00 00       	mov    0x1ce8,%eax
    17b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17b3:	eb 24                	jmp    17d9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    17b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b8:	8b 00                	mov    (%eax),%eax
    17ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17bd:	77 12                	ja     17d1 <free+0x35>
    17bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17c5:	77 24                	ja     17eb <free+0x4f>
    17c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17ca:	8b 00                	mov    (%eax),%eax
    17cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17cf:	77 1a                	ja     17eb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17d4:	8b 00                	mov    (%eax),%eax
    17d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17dc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17df:	76 d4                	jbe    17b5 <free+0x19>
    17e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17e4:	8b 00                	mov    (%eax),%eax
    17e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17e9:	76 ca                	jbe    17b5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    17eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ee:	8b 40 04             	mov    0x4(%eax),%eax
    17f1:	c1 e0 03             	shl    $0x3,%eax
    17f4:	89 c2                	mov    %eax,%edx
    17f6:	03 55 f8             	add    -0x8(%ebp),%edx
    17f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17fc:	8b 00                	mov    (%eax),%eax
    17fe:	39 c2                	cmp    %eax,%edx
    1800:	75 24                	jne    1826 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    1802:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1805:	8b 50 04             	mov    0x4(%eax),%edx
    1808:	8b 45 fc             	mov    -0x4(%ebp),%eax
    180b:	8b 00                	mov    (%eax),%eax
    180d:	8b 40 04             	mov    0x4(%eax),%eax
    1810:	01 c2                	add    %eax,%edx
    1812:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1815:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1818:	8b 45 fc             	mov    -0x4(%ebp),%eax
    181b:	8b 00                	mov    (%eax),%eax
    181d:	8b 10                	mov    (%eax),%edx
    181f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1822:	89 10                	mov    %edx,(%eax)
    1824:	eb 0a                	jmp    1830 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1826:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1829:	8b 10                	mov    (%eax),%edx
    182b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    182e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1830:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1833:	8b 40 04             	mov    0x4(%eax),%eax
    1836:	c1 e0 03             	shl    $0x3,%eax
    1839:	03 45 fc             	add    -0x4(%ebp),%eax
    183c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    183f:	75 20                	jne    1861 <free+0xc5>
    p->s.size += bp->s.size;
    1841:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1844:	8b 50 04             	mov    0x4(%eax),%edx
    1847:	8b 45 f8             	mov    -0x8(%ebp),%eax
    184a:	8b 40 04             	mov    0x4(%eax),%eax
    184d:	01 c2                	add    %eax,%edx
    184f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1852:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1855:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1858:	8b 10                	mov    (%eax),%edx
    185a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    185d:	89 10                	mov    %edx,(%eax)
    185f:	eb 08                	jmp    1869 <free+0xcd>
  } else
    p->s.ptr = bp;
    1861:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1864:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1867:	89 10                	mov    %edx,(%eax)
  freep = p;
    1869:	8b 45 fc             	mov    -0x4(%ebp),%eax
    186c:	a3 e8 1c 00 00       	mov    %eax,0x1ce8
}
    1871:	c9                   	leave  
    1872:	c3                   	ret    

00001873 <morecore>:

static Header*
morecore(uint nu)
{
    1873:	55                   	push   %ebp
    1874:	89 e5                	mov    %esp,%ebp
    1876:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1879:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1880:	77 07                	ja     1889 <morecore+0x16>
    nu = 4096;
    1882:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1889:	8b 45 08             	mov    0x8(%ebp),%eax
    188c:	c1 e0 03             	shl    $0x3,%eax
    188f:	89 04 24             	mov    %eax,(%esp)
    1892:	e8 3d fc ff ff       	call   14d4 <sbrk>
    1897:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    189a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    189e:	75 07                	jne    18a7 <morecore+0x34>
    return 0;
    18a0:	b8 00 00 00 00       	mov    $0x0,%eax
    18a5:	eb 22                	jmp    18c9 <morecore+0x56>
  hp = (Header*)p;
    18a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    18ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b0:	8b 55 08             	mov    0x8(%ebp),%edx
    18b3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    18b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b9:	83 c0 08             	add    $0x8,%eax
    18bc:	89 04 24             	mov    %eax,(%esp)
    18bf:	e8 d8 fe ff ff       	call   179c <free>
  return freep;
    18c4:	a1 e8 1c 00 00       	mov    0x1ce8,%eax
}
    18c9:	c9                   	leave  
    18ca:	c3                   	ret    

000018cb <malloc>:

void*
malloc(uint nbytes)
{
    18cb:	55                   	push   %ebp
    18cc:	89 e5                	mov    %esp,%ebp
    18ce:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    18d1:	8b 45 08             	mov    0x8(%ebp),%eax
    18d4:	83 c0 07             	add    $0x7,%eax
    18d7:	c1 e8 03             	shr    $0x3,%eax
    18da:	83 c0 01             	add    $0x1,%eax
    18dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    18e0:	a1 e8 1c 00 00       	mov    0x1ce8,%eax
    18e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18ec:	75 23                	jne    1911 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    18ee:	c7 45 f0 e0 1c 00 00 	movl   $0x1ce0,-0x10(%ebp)
    18f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18f8:	a3 e8 1c 00 00       	mov    %eax,0x1ce8
    18fd:	a1 e8 1c 00 00       	mov    0x1ce8,%eax
    1902:	a3 e0 1c 00 00       	mov    %eax,0x1ce0
    base.s.size = 0;
    1907:	c7 05 e4 1c 00 00 00 	movl   $0x0,0x1ce4
    190e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1911:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1914:	8b 00                	mov    (%eax),%eax
    1916:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1919:	8b 45 ec             	mov    -0x14(%ebp),%eax
    191c:	8b 40 04             	mov    0x4(%eax),%eax
    191f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1922:	72 4d                	jb     1971 <malloc+0xa6>
      if(p->s.size == nunits)
    1924:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1927:	8b 40 04             	mov    0x4(%eax),%eax
    192a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    192d:	75 0c                	jne    193b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    192f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1932:	8b 10                	mov    (%eax),%edx
    1934:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1937:	89 10                	mov    %edx,(%eax)
    1939:	eb 26                	jmp    1961 <malloc+0x96>
      else {
        p->s.size -= nunits;
    193b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    193e:	8b 40 04             	mov    0x4(%eax),%eax
    1941:	89 c2                	mov    %eax,%edx
    1943:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1946:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1949:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    194c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    194f:	8b 40 04             	mov    0x4(%eax),%eax
    1952:	c1 e0 03             	shl    $0x3,%eax
    1955:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1958:	8b 45 ec             	mov    -0x14(%ebp),%eax
    195b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    195e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1961:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1964:	a3 e8 1c 00 00       	mov    %eax,0x1ce8
      return (void*)(p + 1);
    1969:	8b 45 ec             	mov    -0x14(%ebp),%eax
    196c:	83 c0 08             	add    $0x8,%eax
    196f:	eb 38                	jmp    19a9 <malloc+0xde>
    }
    if(p == freep)
    1971:	a1 e8 1c 00 00       	mov    0x1ce8,%eax
    1976:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1979:	75 1b                	jne    1996 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    197b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    197e:	89 04 24             	mov    %eax,(%esp)
    1981:	e8 ed fe ff ff       	call   1873 <morecore>
    1986:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1989:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    198d:	75 07                	jne    1996 <malloc+0xcb>
        return 0;
    198f:	b8 00 00 00 00       	mov    $0x0,%eax
    1994:	eb 13                	jmp    19a9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1996:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1999:	89 45 f0             	mov    %eax,-0x10(%ebp)
    199c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    199f:	8b 00                	mov    (%eax),%eax
    19a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    19a4:	e9 70 ff ff ff       	jmp    1919 <malloc+0x4e>
}
    19a9:	c9                   	leave  
    19aa:	c3                   	ret    
    19ab:	90                   	nop

000019ac <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    19ac:	55                   	push   %ebp
    19ad:	89 e5                	mov    %esp,%ebp
    19af:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    19b2:	8b 55 08             	mov    0x8(%ebp),%edx
    19b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    19b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    19bb:	f0 87 02             	lock xchg %eax,(%edx)
    19be:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    19c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    19c4:	c9                   	leave  
    19c5:	c3                   	ret    

000019c6 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    19c6:	55                   	push   %ebp
    19c7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    19c9:	8b 45 08             	mov    0x8(%ebp),%eax
    19cc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    19d2:	5d                   	pop    %ebp
    19d3:	c3                   	ret    

000019d4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    19d4:	55                   	push   %ebp
    19d5:	89 e5                	mov    %esp,%ebp
    19d7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    19da:	8b 45 08             	mov    0x8(%ebp),%eax
    19dd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    19e4:	00 
    19e5:	89 04 24             	mov    %eax,(%esp)
    19e8:	e8 bf ff ff ff       	call   19ac <xchg>
    19ed:	85 c0                	test   %eax,%eax
    19ef:	75 e9                	jne    19da <lock_acquire+0x6>
}
    19f1:	c9                   	leave  
    19f2:	c3                   	ret    

000019f3 <lock_release>:
void lock_release(lock_t *lock){
    19f3:	55                   	push   %ebp
    19f4:	89 e5                	mov    %esp,%ebp
    19f6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    19f9:	8b 45 08             	mov    0x8(%ebp),%eax
    19fc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a03:	00 
    1a04:	89 04 24             	mov    %eax,(%esp)
    1a07:	e8 a0 ff ff ff       	call   19ac <xchg>
}
    1a0c:	c9                   	leave  
    1a0d:	c3                   	ret    

00001a0e <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1a0e:	55                   	push   %ebp
    1a0f:	89 e5                	mov    %esp,%ebp
    1a11:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1a14:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1a1b:	e8 ab fe ff ff       	call   18cb <malloc>
    1a20:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1a23:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a26:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a2c:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a31:	85 c0                	test   %eax,%eax
    1a33:	74 15                	je     1a4a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1a35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a38:	89 c2                	mov    %eax,%edx
    1a3a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1a40:	b8 00 10 00 00       	mov    $0x1000,%eax
    1a45:	29 d0                	sub    %edx,%eax
    1a47:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1a4a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a4e:	75 1b                	jne    1a6b <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1a50:	c7 44 24 04 8d 1c 00 	movl   $0x1c8d,0x4(%esp)
    1a57:	00 
    1a58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a5f:	e8 81 fb ff ff       	call   15e5 <printf>
        return 0;
    1a64:	b8 00 00 00 00       	mov    $0x0,%eax
    1a69:	eb 6f                	jmp    1ada <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1a6b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1a6e:	8b 55 08             	mov    0x8(%ebp),%edx
    1a71:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a74:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a78:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a7c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1a83:	00 
    1a84:	89 04 24             	mov    %eax,(%esp)
    1a87:	e8 60 fa ff ff       	call   14ec <clone>
    1a8c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1a8f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a93:	79 1b                	jns    1ab0 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1a95:	c7 44 24 04 9b 1c 00 	movl   $0x1c9b,0x4(%esp)
    1a9c:	00 
    1a9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1aa4:	e8 3c fb ff ff       	call   15e5 <printf>
        return 0;
    1aa9:	b8 00 00 00 00       	mov    $0x0,%eax
    1aae:	eb 2a                	jmp    1ada <thread_create+0xcc>
    }
    if(tid > 0){
    1ab0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ab4:	7e 05                	jle    1abb <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ab9:	eb 1f                	jmp    1ada <thread_create+0xcc>
    }
    if(tid == 0){
    1abb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1abf:	75 14                	jne    1ad5 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1ac1:	c7 44 24 04 a8 1c 00 	movl   $0x1ca8,0x4(%esp)
    1ac8:	00 
    1ac9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ad0:	e8 10 fb ff ff       	call   15e5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1ad5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1ada:	c9                   	leave  
    1adb:	c3                   	ret    

00001adc <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1adc:	55                   	push   %ebp
    1add:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1adf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1ae8:	8b 45 08             	mov    0x8(%ebp),%eax
    1aeb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1af2:	8b 45 08             	mov    0x8(%ebp),%eax
    1af5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1afc:	5d                   	pop    %ebp
    1afd:	c3                   	ret    

00001afe <add_q>:

void add_q(struct queue *q, int v){
    1afe:	55                   	push   %ebp
    1aff:	89 e5                	mov    %esp,%ebp
    1b01:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1b04:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1b0b:	e8 bb fd ff ff       	call   18cb <malloc>
    1b10:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b16:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b20:	8b 55 0c             	mov    0xc(%ebp),%edx
    1b23:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1b25:	8b 45 08             	mov    0x8(%ebp),%eax
    1b28:	8b 40 04             	mov    0x4(%eax),%eax
    1b2b:	85 c0                	test   %eax,%eax
    1b2d:	75 0b                	jne    1b3a <add_q+0x3c>
        q->head = n;
    1b2f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b32:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b35:	89 50 04             	mov    %edx,0x4(%eax)
    1b38:	eb 0c                	jmp    1b46 <add_q+0x48>
    }else{
        q->tail->next = n;
    1b3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b3d:	8b 40 08             	mov    0x8(%eax),%eax
    1b40:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b43:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b4c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1b4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b52:	8b 00                	mov    (%eax),%eax
    1b54:	8d 50 01             	lea    0x1(%eax),%edx
    1b57:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5a:	89 10                	mov    %edx,(%eax)
}
    1b5c:	c9                   	leave  
    1b5d:	c3                   	ret    

00001b5e <empty_q>:

int empty_q(struct queue *q){
    1b5e:	55                   	push   %ebp
    1b5f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1b61:	8b 45 08             	mov    0x8(%ebp),%eax
    1b64:	8b 00                	mov    (%eax),%eax
    1b66:	85 c0                	test   %eax,%eax
    1b68:	75 07                	jne    1b71 <empty_q+0x13>
        return 1;
    1b6a:	b8 01 00 00 00       	mov    $0x1,%eax
    1b6f:	eb 05                	jmp    1b76 <empty_q+0x18>
    else
        return 0;
    1b71:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1b76:	5d                   	pop    %ebp
    1b77:	c3                   	ret    

00001b78 <pop_q>:
int pop_q(struct queue *q){
    1b78:	55                   	push   %ebp
    1b79:	89 e5                	mov    %esp,%ebp
    1b7b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1b7e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b81:	89 04 24             	mov    %eax,(%esp)
    1b84:	e8 d5 ff ff ff       	call   1b5e <empty_q>
    1b89:	85 c0                	test   %eax,%eax
    1b8b:	75 5d                	jne    1bea <pop_q+0x72>
       val = q->head->value; 
    1b8d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b90:	8b 40 04             	mov    0x4(%eax),%eax
    1b93:	8b 00                	mov    (%eax),%eax
    1b95:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1b98:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9b:	8b 40 04             	mov    0x4(%eax),%eax
    1b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1ba1:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba4:	8b 40 04             	mov    0x4(%eax),%eax
    1ba7:	8b 50 04             	mov    0x4(%eax),%edx
    1baa:	8b 45 08             	mov    0x8(%ebp),%eax
    1bad:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bb3:	89 04 24             	mov    %eax,(%esp)
    1bb6:	e8 e1 fb ff ff       	call   179c <free>
       q->size--;
    1bbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbe:	8b 00                	mov    (%eax),%eax
    1bc0:	8d 50 ff             	lea    -0x1(%eax),%edx
    1bc3:	8b 45 08             	mov    0x8(%ebp),%eax
    1bc6:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1bc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1bcb:	8b 00                	mov    (%eax),%eax
    1bcd:	85 c0                	test   %eax,%eax
    1bcf:	75 14                	jne    1be5 <pop_q+0x6d>
            q->head = 0;
    1bd1:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1bdb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bde:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1be8:	eb 05                	jmp    1bef <pop_q+0x77>
    }
    return -1;
    1bea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1bef:	c9                   	leave  
    1bf0:	c3                   	ret    
