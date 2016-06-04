
_stressfs:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
    100c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
    1013:	73 74 72 65 
    1017:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
    101e:	73 73 66 73 
    1022:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
    1029:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
    102c:	c7 44 24 04 c1 1b 00 	movl   $0x1bc1,0x4(%esp)
    1033:	00 
    1034:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    103b:	e8 75 05 00 00       	call   15b5 <printf>
  memset(data, 'a', sizeof(data));
    1040:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1047:	00 
    1048:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
    104f:	00 
    1050:	8d 44 24 1e          	lea    0x1e(%esp),%eax
    1054:	89 04 24             	mov    %eax,(%esp)
    1057:	e8 1a 02 00 00       	call   1276 <memset>

  for(i = 0; i < 4; i++)
    105c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
    1063:	00 00 00 00 
    1067:	eb 11                	jmp    107a <main+0x7a>
    if(fork() > 0)
    1069:	e8 a6 03 00 00       	call   1414 <fork>
    106e:	85 c0                	test   %eax,%eax
    1070:	7f 14                	jg     1086 <main+0x86>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    1072:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
    1079:	01 
    107a:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
    1081:	03 
    1082:	7e e5                	jle    1069 <main+0x69>
    1084:	eb 01                	jmp    1087 <main+0x87>
    if(fork() > 0)
      break;
    1086:	90                   	nop

  printf(1, "write %d\n", i);
    1087:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
    108e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1092:	c7 44 24 04 d4 1b 00 	movl   $0x1bd4,0x4(%esp)
    1099:	00 
    109a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10a1:	e8 0f 05 00 00       	call   15b5 <printf>

  path[8] += i;
    10a6:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
    10ad:	00 
    10ae:	89 c2                	mov    %eax,%edx
    10b0:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
    10b7:	8d 04 02             	lea    (%edx,%eax,1),%eax
    10ba:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
    10c1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    10c8:	00 
    10c9:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
    10d0:	89 04 24             	mov    %eax,(%esp)
    10d3:	e8 84 03 00 00       	call   145c <open>
    10d8:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
    10df:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
    10e6:	00 00 00 00 
    10ea:	eb 27                	jmp    1113 <main+0x113>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
    10ec:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    10f3:	00 
    10f4:	8d 44 24 1e          	lea    0x1e(%esp),%eax
    10f8:	89 44 24 04          	mov    %eax,0x4(%esp)
    10fc:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    1103:	89 04 24             	mov    %eax,(%esp)
    1106:	e8 31 03 00 00       	call   143c <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
    110b:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
    1112:	01 
    1113:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
    111a:	13 
    111b:	7e cf                	jle    10ec <main+0xec>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
    111d:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    1124:	89 04 24             	mov    %eax,(%esp)
    1127:	e8 18 03 00 00       	call   1444 <close>

  printf(1, "read\n");
    112c:	c7 44 24 04 de 1b 00 	movl   $0x1bde,0x4(%esp)
    1133:	00 
    1134:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    113b:	e8 75 04 00 00       	call   15b5 <printf>

  fd = open(path, O_RDONLY);
    1140:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1147:	00 
    1148:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
    114f:	89 04 24             	mov    %eax,(%esp)
    1152:	e8 05 03 00 00       	call   145c <open>
    1157:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
    115e:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
    1165:	00 00 00 00 
    1169:	eb 27                	jmp    1192 <main+0x192>
    read(fd, data, sizeof(data));
    116b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1172:	00 
    1173:	8d 44 24 1e          	lea    0x1e(%esp),%eax
    1177:	89 44 24 04          	mov    %eax,0x4(%esp)
    117b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    1182:	89 04 24             	mov    %eax,(%esp)
    1185:	e8 aa 02 00 00       	call   1434 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
    118a:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
    1191:	01 
    1192:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
    1199:	13 
    119a:	7e cf                	jle    116b <main+0x16b>
    read(fd, data, sizeof(data));
  close(fd);
    119c:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
    11a3:	89 04 24             	mov    %eax,(%esp)
    11a6:	e8 99 02 00 00       	call   1444 <close>

  wait();
    11ab:	e8 74 02 00 00       	call   1424 <wait>
  
  exit();
    11b0:	e8 67 02 00 00       	call   141c <exit>
    11b5:	90                   	nop
    11b6:	90                   	nop
    11b7:	90                   	nop

000011b8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    11b8:	55                   	push   %ebp
    11b9:	89 e5                	mov    %esp,%ebp
    11bb:	57                   	push   %edi
    11bc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    11bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11c0:	8b 55 10             	mov    0x10(%ebp),%edx
    11c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c6:	89 cb                	mov    %ecx,%ebx
    11c8:	89 df                	mov    %ebx,%edi
    11ca:	89 d1                	mov    %edx,%ecx
    11cc:	fc                   	cld    
    11cd:	f3 aa                	rep stos %al,%es:(%edi)
    11cf:	89 ca                	mov    %ecx,%edx
    11d1:	89 fb                	mov    %edi,%ebx
    11d3:	89 5d 08             	mov    %ebx,0x8(%ebp)
    11d6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    11d9:	5b                   	pop    %ebx
    11da:	5f                   	pop    %edi
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    

000011dd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    11dd:	55                   	push   %ebp
    11de:	89 e5                	mov    %esp,%ebp
    11e0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    11e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ec:	0f b6 10             	movzbl (%eax),%edx
    11ef:	8b 45 08             	mov    0x8(%ebp),%eax
    11f2:	88 10                	mov    %dl,(%eax)
    11f4:	8b 45 08             	mov    0x8(%ebp),%eax
    11f7:	0f b6 00             	movzbl (%eax),%eax
    11fa:	84 c0                	test   %al,%al
    11fc:	0f 95 c0             	setne  %al
    11ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1203:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1207:	84 c0                	test   %al,%al
    1209:	75 de                	jne    11e9 <strcpy+0xc>
    ;
  return os;
    120b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    120e:	c9                   	leave  
    120f:	c3                   	ret    

00001210 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1213:	eb 08                	jmp    121d <strcmp+0xd>
    p++, q++;
    1215:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1219:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    121d:	8b 45 08             	mov    0x8(%ebp),%eax
    1220:	0f b6 00             	movzbl (%eax),%eax
    1223:	84 c0                	test   %al,%al
    1225:	74 10                	je     1237 <strcmp+0x27>
    1227:	8b 45 08             	mov    0x8(%ebp),%eax
    122a:	0f b6 10             	movzbl (%eax),%edx
    122d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1230:	0f b6 00             	movzbl (%eax),%eax
    1233:	38 c2                	cmp    %al,%dl
    1235:	74 de                	je     1215 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1237:	8b 45 08             	mov    0x8(%ebp),%eax
    123a:	0f b6 00             	movzbl (%eax),%eax
    123d:	0f b6 d0             	movzbl %al,%edx
    1240:	8b 45 0c             	mov    0xc(%ebp),%eax
    1243:	0f b6 00             	movzbl (%eax),%eax
    1246:	0f b6 c0             	movzbl %al,%eax
    1249:	89 d1                	mov    %edx,%ecx
    124b:	29 c1                	sub    %eax,%ecx
    124d:	89 c8                	mov    %ecx,%eax
}
    124f:	5d                   	pop    %ebp
    1250:	c3                   	ret    

00001251 <strlen>:

uint
strlen(char *s)
{
    1251:	55                   	push   %ebp
    1252:	89 e5                	mov    %esp,%ebp
    1254:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1257:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    125e:	eb 04                	jmp    1264 <strlen+0x13>
    1260:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1264:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1267:	03 45 08             	add    0x8(%ebp),%eax
    126a:	0f b6 00             	movzbl (%eax),%eax
    126d:	84 c0                	test   %al,%al
    126f:	75 ef                	jne    1260 <strlen+0xf>
    ;
  return n;
    1271:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1274:	c9                   	leave  
    1275:	c3                   	ret    

00001276 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1276:	55                   	push   %ebp
    1277:	89 e5                	mov    %esp,%ebp
    1279:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    127c:	8b 45 10             	mov    0x10(%ebp),%eax
    127f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1283:	8b 45 0c             	mov    0xc(%ebp),%eax
    1286:	89 44 24 04          	mov    %eax,0x4(%esp)
    128a:	8b 45 08             	mov    0x8(%ebp),%eax
    128d:	89 04 24             	mov    %eax,(%esp)
    1290:	e8 23 ff ff ff       	call   11b8 <stosb>
  return dst;
    1295:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1298:	c9                   	leave  
    1299:	c3                   	ret    

0000129a <strchr>:

char*
strchr(const char *s, char c)
{
    129a:	55                   	push   %ebp
    129b:	89 e5                	mov    %esp,%ebp
    129d:	83 ec 04             	sub    $0x4,%esp
    12a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    12a6:	eb 14                	jmp    12bc <strchr+0x22>
    if(*s == c)
    12a8:	8b 45 08             	mov    0x8(%ebp),%eax
    12ab:	0f b6 00             	movzbl (%eax),%eax
    12ae:	3a 45 fc             	cmp    -0x4(%ebp),%al
    12b1:	75 05                	jne    12b8 <strchr+0x1e>
      return (char*)s;
    12b3:	8b 45 08             	mov    0x8(%ebp),%eax
    12b6:	eb 13                	jmp    12cb <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    12b8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12bc:	8b 45 08             	mov    0x8(%ebp),%eax
    12bf:	0f b6 00             	movzbl (%eax),%eax
    12c2:	84 c0                	test   %al,%al
    12c4:	75 e2                	jne    12a8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    12c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12cb:	c9                   	leave  
    12cc:	c3                   	ret    

000012cd <gets>:

char*
gets(char *buf, int max)
{
    12cd:	55                   	push   %ebp
    12ce:	89 e5                	mov    %esp,%ebp
    12d0:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    12da:	eb 44                	jmp    1320 <gets+0x53>
    cc = read(0, &c, 1);
    12dc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12e3:	00 
    12e4:	8d 45 ef             	lea    -0x11(%ebp),%eax
    12e7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12f2:	e8 3d 01 00 00       	call   1434 <read>
    12f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    12fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12fe:	7e 2d                	jle    132d <gets+0x60>
      break;
    buf[i++] = c;
    1300:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1303:	03 45 08             	add    0x8(%ebp),%eax
    1306:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    130a:	88 10                	mov    %dl,(%eax)
    130c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1314:	3c 0a                	cmp    $0xa,%al
    1316:	74 16                	je     132e <gets+0x61>
    1318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    131c:	3c 0d                	cmp    $0xd,%al
    131e:	74 0e                	je     132e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1320:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1323:	83 c0 01             	add    $0x1,%eax
    1326:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1329:	7c b1                	jl     12dc <gets+0xf>
    132b:	eb 01                	jmp    132e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    132d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    132e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1331:	03 45 08             	add    0x8(%ebp),%eax
    1334:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1337:	8b 45 08             	mov    0x8(%ebp),%eax
}
    133a:	c9                   	leave  
    133b:	c3                   	ret    

0000133c <stat>:

int
stat(char *n, struct stat *st)
{
    133c:	55                   	push   %ebp
    133d:	89 e5                	mov    %esp,%ebp
    133f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1342:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1349:	00 
    134a:	8b 45 08             	mov    0x8(%ebp),%eax
    134d:	89 04 24             	mov    %eax,(%esp)
    1350:	e8 07 01 00 00       	call   145c <open>
    1355:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1358:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    135c:	79 07                	jns    1365 <stat+0x29>
    return -1;
    135e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1363:	eb 23                	jmp    1388 <stat+0x4c>
  r = fstat(fd, st);
    1365:	8b 45 0c             	mov    0xc(%ebp),%eax
    1368:	89 44 24 04          	mov    %eax,0x4(%esp)
    136c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    136f:	89 04 24             	mov    %eax,(%esp)
    1372:	e8 fd 00 00 00       	call   1474 <fstat>
    1377:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    137a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    137d:	89 04 24             	mov    %eax,(%esp)
    1380:	e8 bf 00 00 00       	call   1444 <close>
  return r;
    1385:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1388:	c9                   	leave  
    1389:	c3                   	ret    

0000138a <atoi>:

int
atoi(const char *s)
{
    138a:	55                   	push   %ebp
    138b:	89 e5                	mov    %esp,%ebp
    138d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1390:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1397:	eb 24                	jmp    13bd <atoi+0x33>
    n = n*10 + *s++ - '0';
    1399:	8b 55 fc             	mov    -0x4(%ebp),%edx
    139c:	89 d0                	mov    %edx,%eax
    139e:	c1 e0 02             	shl    $0x2,%eax
    13a1:	01 d0                	add    %edx,%eax
    13a3:	01 c0                	add    %eax,%eax
    13a5:	89 c2                	mov    %eax,%edx
    13a7:	8b 45 08             	mov    0x8(%ebp),%eax
    13aa:	0f b6 00             	movzbl (%eax),%eax
    13ad:	0f be c0             	movsbl %al,%eax
    13b0:	8d 04 02             	lea    (%edx,%eax,1),%eax
    13b3:	83 e8 30             	sub    $0x30,%eax
    13b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    13b9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13bd:	8b 45 08             	mov    0x8(%ebp),%eax
    13c0:	0f b6 00             	movzbl (%eax),%eax
    13c3:	3c 2f                	cmp    $0x2f,%al
    13c5:	7e 0a                	jle    13d1 <atoi+0x47>
    13c7:	8b 45 08             	mov    0x8(%ebp),%eax
    13ca:	0f b6 00             	movzbl (%eax),%eax
    13cd:	3c 39                	cmp    $0x39,%al
    13cf:	7e c8                	jle    1399 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    13d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13d4:	c9                   	leave  
    13d5:	c3                   	ret    

000013d6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    13d6:	55                   	push   %ebp
    13d7:	89 e5                	mov    %esp,%ebp
    13d9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    13dc:	8b 45 08             	mov    0x8(%ebp),%eax
    13df:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    13e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    13e8:	eb 13                	jmp    13fd <memmove+0x27>
    *dst++ = *src++;
    13ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13ed:	0f b6 10             	movzbl (%eax),%edx
    13f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13f3:	88 10                	mov    %dl,(%eax)
    13f5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    13f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13fd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1401:	0f 9f c0             	setg   %al
    1404:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1408:	84 c0                	test   %al,%al
    140a:	75 de                	jne    13ea <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    140c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    140f:	c9                   	leave  
    1410:	c3                   	ret    
    1411:	90                   	nop
    1412:	90                   	nop
    1413:	90                   	nop

00001414 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1414:	b8 01 00 00 00       	mov    $0x1,%eax
    1419:	cd 40                	int    $0x40
    141b:	c3                   	ret    

0000141c <exit>:
SYSCALL(exit)
    141c:	b8 02 00 00 00       	mov    $0x2,%eax
    1421:	cd 40                	int    $0x40
    1423:	c3                   	ret    

00001424 <wait>:
SYSCALL(wait)
    1424:	b8 03 00 00 00       	mov    $0x3,%eax
    1429:	cd 40                	int    $0x40
    142b:	c3                   	ret    

0000142c <pipe>:
SYSCALL(pipe)
    142c:	b8 04 00 00 00       	mov    $0x4,%eax
    1431:	cd 40                	int    $0x40
    1433:	c3                   	ret    

00001434 <read>:
SYSCALL(read)
    1434:	b8 05 00 00 00       	mov    $0x5,%eax
    1439:	cd 40                	int    $0x40
    143b:	c3                   	ret    

0000143c <write>:
SYSCALL(write)
    143c:	b8 10 00 00 00       	mov    $0x10,%eax
    1441:	cd 40                	int    $0x40
    1443:	c3                   	ret    

00001444 <close>:
SYSCALL(close)
    1444:	b8 15 00 00 00       	mov    $0x15,%eax
    1449:	cd 40                	int    $0x40
    144b:	c3                   	ret    

0000144c <kill>:
SYSCALL(kill)
    144c:	b8 06 00 00 00       	mov    $0x6,%eax
    1451:	cd 40                	int    $0x40
    1453:	c3                   	ret    

00001454 <exec>:
SYSCALL(exec)
    1454:	b8 07 00 00 00       	mov    $0x7,%eax
    1459:	cd 40                	int    $0x40
    145b:	c3                   	ret    

0000145c <open>:
SYSCALL(open)
    145c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1461:	cd 40                	int    $0x40
    1463:	c3                   	ret    

00001464 <mknod>:
SYSCALL(mknod)
    1464:	b8 11 00 00 00       	mov    $0x11,%eax
    1469:	cd 40                	int    $0x40
    146b:	c3                   	ret    

0000146c <unlink>:
SYSCALL(unlink)
    146c:	b8 12 00 00 00       	mov    $0x12,%eax
    1471:	cd 40                	int    $0x40
    1473:	c3                   	ret    

00001474 <fstat>:
SYSCALL(fstat)
    1474:	b8 08 00 00 00       	mov    $0x8,%eax
    1479:	cd 40                	int    $0x40
    147b:	c3                   	ret    

0000147c <link>:
SYSCALL(link)
    147c:	b8 13 00 00 00       	mov    $0x13,%eax
    1481:	cd 40                	int    $0x40
    1483:	c3                   	ret    

00001484 <mkdir>:
SYSCALL(mkdir)
    1484:	b8 14 00 00 00       	mov    $0x14,%eax
    1489:	cd 40                	int    $0x40
    148b:	c3                   	ret    

0000148c <chdir>:
SYSCALL(chdir)
    148c:	b8 09 00 00 00       	mov    $0x9,%eax
    1491:	cd 40                	int    $0x40
    1493:	c3                   	ret    

00001494 <dup>:
SYSCALL(dup)
    1494:	b8 0a 00 00 00       	mov    $0xa,%eax
    1499:	cd 40                	int    $0x40
    149b:	c3                   	ret    

0000149c <getpid>:
SYSCALL(getpid)
    149c:	b8 0b 00 00 00       	mov    $0xb,%eax
    14a1:	cd 40                	int    $0x40
    14a3:	c3                   	ret    

000014a4 <sbrk>:
SYSCALL(sbrk)
    14a4:	b8 0c 00 00 00       	mov    $0xc,%eax
    14a9:	cd 40                	int    $0x40
    14ab:	c3                   	ret    

000014ac <sleep>:
SYSCALL(sleep)
    14ac:	b8 0d 00 00 00       	mov    $0xd,%eax
    14b1:	cd 40                	int    $0x40
    14b3:	c3                   	ret    

000014b4 <uptime>:
SYSCALL(uptime)
    14b4:	b8 0e 00 00 00       	mov    $0xe,%eax
    14b9:	cd 40                	int    $0x40
    14bb:	c3                   	ret    

000014bc <clone>:
SYSCALL(clone)
    14bc:	b8 16 00 00 00       	mov    $0x16,%eax
    14c1:	cd 40                	int    $0x40
    14c3:	c3                   	ret    

000014c4 <texit>:
SYSCALL(texit)
    14c4:	b8 17 00 00 00       	mov    $0x17,%eax
    14c9:	cd 40                	int    $0x40
    14cb:	c3                   	ret    

000014cc <tsleep>:
SYSCALL(tsleep)
    14cc:	b8 18 00 00 00       	mov    $0x18,%eax
    14d1:	cd 40                	int    $0x40
    14d3:	c3                   	ret    

000014d4 <twakeup>:
SYSCALL(twakeup)
    14d4:	b8 19 00 00 00       	mov    $0x19,%eax
    14d9:	cd 40                	int    $0x40
    14db:	c3                   	ret    

000014dc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    14dc:	55                   	push   %ebp
    14dd:	89 e5                	mov    %esp,%ebp
    14df:	83 ec 28             	sub    $0x28,%esp
    14e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    14e5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    14e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14ef:	00 
    14f0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    14f3:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f7:	8b 45 08             	mov    0x8(%ebp),%eax
    14fa:	89 04 24             	mov    %eax,(%esp)
    14fd:	e8 3a ff ff ff       	call   143c <write>
}
    1502:	c9                   	leave  
    1503:	c3                   	ret    

00001504 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1504:	55                   	push   %ebp
    1505:	89 e5                	mov    %esp,%ebp
    1507:	53                   	push   %ebx
    1508:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    150b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1512:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1516:	74 17                	je     152f <printint+0x2b>
    1518:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    151c:	79 11                	jns    152f <printint+0x2b>
    neg = 1;
    151e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1525:	8b 45 0c             	mov    0xc(%ebp),%eax
    1528:	f7 d8                	neg    %eax
    152a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    152d:	eb 06                	jmp    1535 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    152f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1532:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    1535:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    153c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    153f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1542:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1545:	ba 00 00 00 00       	mov    $0x0,%edx
    154a:	f7 f3                	div    %ebx
    154c:	89 d0                	mov    %edx,%eax
    154e:	0f b6 80 18 1c 00 00 	movzbl 0x1c18(%eax),%eax
    1555:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1559:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    155d:	8b 45 10             	mov    0x10(%ebp),%eax
    1560:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1563:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1566:	ba 00 00 00 00       	mov    $0x0,%edx
    156b:	f7 75 d4             	divl   -0x2c(%ebp)
    156e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1571:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1575:	75 c5                	jne    153c <printint+0x38>
  if(neg)
    1577:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    157b:	74 28                	je     15a5 <printint+0xa1>
    buf[i++] = '-';
    157d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1580:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1585:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1589:	eb 1a                	jmp    15a5 <printint+0xa1>
    putc(fd, buf[i]);
    158b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    158e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    1593:	0f be c0             	movsbl %al,%eax
    1596:	89 44 24 04          	mov    %eax,0x4(%esp)
    159a:	8b 45 08             	mov    0x8(%ebp),%eax
    159d:	89 04 24             	mov    %eax,(%esp)
    15a0:	e8 37 ff ff ff       	call   14dc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    15a5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    15a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    15ad:	79 dc                	jns    158b <printint+0x87>
    putc(fd, buf[i]);
}
    15af:	83 c4 44             	add    $0x44,%esp
    15b2:	5b                   	pop    %ebx
    15b3:	5d                   	pop    %ebp
    15b4:	c3                   	ret    

000015b5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15b5:	55                   	push   %ebp
    15b6:	89 e5                	mov    %esp,%ebp
    15b8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    15bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    15c2:	8d 45 0c             	lea    0xc(%ebp),%eax
    15c5:	83 c0 04             	add    $0x4,%eax
    15c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    15cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    15d2:	e9 7e 01 00 00       	jmp    1755 <printf+0x1a0>
    c = fmt[i] & 0xff;
    15d7:	8b 55 0c             	mov    0xc(%ebp),%edx
    15da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15dd:	8d 04 02             	lea    (%edx,%eax,1),%eax
    15e0:	0f b6 00             	movzbl (%eax),%eax
    15e3:	0f be c0             	movsbl %al,%eax
    15e6:	25 ff 00 00 00       	and    $0xff,%eax
    15eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    15ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    15f2:	75 2c                	jne    1620 <printf+0x6b>
      if(c == '%'){
    15f4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    15f8:	75 0c                	jne    1606 <printf+0x51>
        state = '%';
    15fa:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1601:	e9 4b 01 00 00       	jmp    1751 <printf+0x19c>
      } else {
        putc(fd, c);
    1606:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1609:	0f be c0             	movsbl %al,%eax
    160c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1610:	8b 45 08             	mov    0x8(%ebp),%eax
    1613:	89 04 24             	mov    %eax,(%esp)
    1616:	e8 c1 fe ff ff       	call   14dc <putc>
    161b:	e9 31 01 00 00       	jmp    1751 <printf+0x19c>
      }
    } else if(state == '%'){
    1620:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    1624:	0f 85 27 01 00 00    	jne    1751 <printf+0x19c>
      if(c == 'd'){
    162a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    162e:	75 2d                	jne    165d <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1630:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1633:	8b 00                	mov    (%eax),%eax
    1635:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    163c:	00 
    163d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1644:	00 
    1645:	89 44 24 04          	mov    %eax,0x4(%esp)
    1649:	8b 45 08             	mov    0x8(%ebp),%eax
    164c:	89 04 24             	mov    %eax,(%esp)
    164f:	e8 b0 fe ff ff       	call   1504 <printint>
        ap++;
    1654:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1658:	e9 ed 00 00 00       	jmp    174a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    165d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1661:	74 06                	je     1669 <printf+0xb4>
    1663:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1667:	75 2d                	jne    1696 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1669:	8b 45 f4             	mov    -0xc(%ebp),%eax
    166c:	8b 00                	mov    (%eax),%eax
    166e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1675:	00 
    1676:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    167d:	00 
    167e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1682:	8b 45 08             	mov    0x8(%ebp),%eax
    1685:	89 04 24             	mov    %eax,(%esp)
    1688:	e8 77 fe ff ff       	call   1504 <printint>
        ap++;
    168d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1691:	e9 b4 00 00 00       	jmp    174a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1696:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    169a:	75 46                	jne    16e2 <printf+0x12d>
        s = (char*)*ap;
    169c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    169f:	8b 00                	mov    (%eax),%eax
    16a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    16a4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    16a8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    16ac:	75 27                	jne    16d5 <printf+0x120>
          s = "(null)";
    16ae:	c7 45 e4 e4 1b 00 00 	movl   $0x1be4,-0x1c(%ebp)
        while(*s != 0){
    16b5:	eb 1f                	jmp    16d6 <printf+0x121>
          putc(fd, *s);
    16b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16ba:	0f b6 00             	movzbl (%eax),%eax
    16bd:	0f be c0             	movsbl %al,%eax
    16c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    16c4:	8b 45 08             	mov    0x8(%ebp),%eax
    16c7:	89 04 24             	mov    %eax,(%esp)
    16ca:	e8 0d fe ff ff       	call   14dc <putc>
          s++;
    16cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    16d3:	eb 01                	jmp    16d6 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    16d5:	90                   	nop
    16d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16d9:	0f b6 00             	movzbl (%eax),%eax
    16dc:	84 c0                	test   %al,%al
    16de:	75 d7                	jne    16b7 <printf+0x102>
    16e0:	eb 68                	jmp    174a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16e2:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    16e6:	75 1d                	jne    1705 <printf+0x150>
        putc(fd, *ap);
    16e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16eb:	8b 00                	mov    (%eax),%eax
    16ed:	0f be c0             	movsbl %al,%eax
    16f0:	89 44 24 04          	mov    %eax,0x4(%esp)
    16f4:	8b 45 08             	mov    0x8(%ebp),%eax
    16f7:	89 04 24             	mov    %eax,(%esp)
    16fa:	e8 dd fd ff ff       	call   14dc <putc>
        ap++;
    16ff:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1703:	eb 45                	jmp    174a <printf+0x195>
      } else if(c == '%'){
    1705:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1709:	75 17                	jne    1722 <printf+0x16d>
        putc(fd, c);
    170b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    170e:	0f be c0             	movsbl %al,%eax
    1711:	89 44 24 04          	mov    %eax,0x4(%esp)
    1715:	8b 45 08             	mov    0x8(%ebp),%eax
    1718:	89 04 24             	mov    %eax,(%esp)
    171b:	e8 bc fd ff ff       	call   14dc <putc>
    1720:	eb 28                	jmp    174a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1722:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1729:	00 
    172a:	8b 45 08             	mov    0x8(%ebp),%eax
    172d:	89 04 24             	mov    %eax,(%esp)
    1730:	e8 a7 fd ff ff       	call   14dc <putc>
        putc(fd, c);
    1735:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1738:	0f be c0             	movsbl %al,%eax
    173b:	89 44 24 04          	mov    %eax,0x4(%esp)
    173f:	8b 45 08             	mov    0x8(%ebp),%eax
    1742:	89 04 24             	mov    %eax,(%esp)
    1745:	e8 92 fd ff ff       	call   14dc <putc>
      }
      state = 0;
    174a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1751:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1755:	8b 55 0c             	mov    0xc(%ebp),%edx
    1758:	8b 45 ec             	mov    -0x14(%ebp),%eax
    175b:	8d 04 02             	lea    (%edx,%eax,1),%eax
    175e:	0f b6 00             	movzbl (%eax),%eax
    1761:	84 c0                	test   %al,%al
    1763:	0f 85 6e fe ff ff    	jne    15d7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1769:	c9                   	leave  
    176a:	c3                   	ret    
    176b:	90                   	nop

0000176c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    176c:	55                   	push   %ebp
    176d:	89 e5                	mov    %esp,%ebp
    176f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1772:	8b 45 08             	mov    0x8(%ebp),%eax
    1775:	83 e8 08             	sub    $0x8,%eax
    1778:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    177b:	a1 34 1c 00 00       	mov    0x1c34,%eax
    1780:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1783:	eb 24                	jmp    17a9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1785:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1788:	8b 00                	mov    (%eax),%eax
    178a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    178d:	77 12                	ja     17a1 <free+0x35>
    178f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1792:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1795:	77 24                	ja     17bb <free+0x4f>
    1797:	8b 45 fc             	mov    -0x4(%ebp),%eax
    179a:	8b 00                	mov    (%eax),%eax
    179c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    179f:	77 1a                	ja     17bb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17a4:	8b 00                	mov    (%eax),%eax
    17a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17af:	76 d4                	jbe    1785 <free+0x19>
    17b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b4:	8b 00                	mov    (%eax),%eax
    17b6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17b9:	76 ca                	jbe    1785 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    17bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17be:	8b 40 04             	mov    0x4(%eax),%eax
    17c1:	c1 e0 03             	shl    $0x3,%eax
    17c4:	89 c2                	mov    %eax,%edx
    17c6:	03 55 f8             	add    -0x8(%ebp),%edx
    17c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17cc:	8b 00                	mov    (%eax),%eax
    17ce:	39 c2                	cmp    %eax,%edx
    17d0:	75 24                	jne    17f6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    17d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17d5:	8b 50 04             	mov    0x4(%eax),%edx
    17d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17db:	8b 00                	mov    (%eax),%eax
    17dd:	8b 40 04             	mov    0x4(%eax),%eax
    17e0:	01 c2                	add    %eax,%edx
    17e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17e5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    17e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17eb:	8b 00                	mov    (%eax),%eax
    17ed:	8b 10                	mov    (%eax),%edx
    17ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17f2:	89 10                	mov    %edx,(%eax)
    17f4:	eb 0a                	jmp    1800 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    17f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17f9:	8b 10                	mov    (%eax),%edx
    17fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17fe:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1800:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1803:	8b 40 04             	mov    0x4(%eax),%eax
    1806:	c1 e0 03             	shl    $0x3,%eax
    1809:	03 45 fc             	add    -0x4(%ebp),%eax
    180c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    180f:	75 20                	jne    1831 <free+0xc5>
    p->s.size += bp->s.size;
    1811:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1814:	8b 50 04             	mov    0x4(%eax),%edx
    1817:	8b 45 f8             	mov    -0x8(%ebp),%eax
    181a:	8b 40 04             	mov    0x4(%eax),%eax
    181d:	01 c2                	add    %eax,%edx
    181f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1822:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1825:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1828:	8b 10                	mov    (%eax),%edx
    182a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    182d:	89 10                	mov    %edx,(%eax)
    182f:	eb 08                	jmp    1839 <free+0xcd>
  } else
    p->s.ptr = bp;
    1831:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1834:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1837:	89 10                	mov    %edx,(%eax)
  freep = p;
    1839:	8b 45 fc             	mov    -0x4(%ebp),%eax
    183c:	a3 34 1c 00 00       	mov    %eax,0x1c34
}
    1841:	c9                   	leave  
    1842:	c3                   	ret    

00001843 <morecore>:

static Header*
morecore(uint nu)
{
    1843:	55                   	push   %ebp
    1844:	89 e5                	mov    %esp,%ebp
    1846:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1849:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1850:	77 07                	ja     1859 <morecore+0x16>
    nu = 4096;
    1852:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1859:	8b 45 08             	mov    0x8(%ebp),%eax
    185c:	c1 e0 03             	shl    $0x3,%eax
    185f:	89 04 24             	mov    %eax,(%esp)
    1862:	e8 3d fc ff ff       	call   14a4 <sbrk>
    1867:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    186a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    186e:	75 07                	jne    1877 <morecore+0x34>
    return 0;
    1870:	b8 00 00 00 00       	mov    $0x0,%eax
    1875:	eb 22                	jmp    1899 <morecore+0x56>
  hp = (Header*)p;
    1877:	8b 45 f0             	mov    -0x10(%ebp),%eax
    187a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    187d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1880:	8b 55 08             	mov    0x8(%ebp),%edx
    1883:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1886:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1889:	83 c0 08             	add    $0x8,%eax
    188c:	89 04 24             	mov    %eax,(%esp)
    188f:	e8 d8 fe ff ff       	call   176c <free>
  return freep;
    1894:	a1 34 1c 00 00       	mov    0x1c34,%eax
}
    1899:	c9                   	leave  
    189a:	c3                   	ret    

0000189b <malloc>:

void*
malloc(uint nbytes)
{
    189b:	55                   	push   %ebp
    189c:	89 e5                	mov    %esp,%ebp
    189e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    18a1:	8b 45 08             	mov    0x8(%ebp),%eax
    18a4:	83 c0 07             	add    $0x7,%eax
    18a7:	c1 e8 03             	shr    $0x3,%eax
    18aa:	83 c0 01             	add    $0x1,%eax
    18ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    18b0:	a1 34 1c 00 00       	mov    0x1c34,%eax
    18b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18bc:	75 23                	jne    18e1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    18be:	c7 45 f0 2c 1c 00 00 	movl   $0x1c2c,-0x10(%ebp)
    18c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18c8:	a3 34 1c 00 00       	mov    %eax,0x1c34
    18cd:	a1 34 1c 00 00       	mov    0x1c34,%eax
    18d2:	a3 2c 1c 00 00       	mov    %eax,0x1c2c
    base.s.size = 0;
    18d7:	c7 05 30 1c 00 00 00 	movl   $0x0,0x1c30
    18de:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18e4:	8b 00                	mov    (%eax),%eax
    18e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    18e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18ec:	8b 40 04             	mov    0x4(%eax),%eax
    18ef:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    18f2:	72 4d                	jb     1941 <malloc+0xa6>
      if(p->s.size == nunits)
    18f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18f7:	8b 40 04             	mov    0x4(%eax),%eax
    18fa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    18fd:	75 0c                	jne    190b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    18ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1902:	8b 10                	mov    (%eax),%edx
    1904:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1907:	89 10                	mov    %edx,(%eax)
    1909:	eb 26                	jmp    1931 <malloc+0x96>
      else {
        p->s.size -= nunits;
    190b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    190e:	8b 40 04             	mov    0x4(%eax),%eax
    1911:	89 c2                	mov    %eax,%edx
    1913:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1916:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1919:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    191c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    191f:	8b 40 04             	mov    0x4(%eax),%eax
    1922:	c1 e0 03             	shl    $0x3,%eax
    1925:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1928:	8b 45 ec             	mov    -0x14(%ebp),%eax
    192b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    192e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1931:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1934:	a3 34 1c 00 00       	mov    %eax,0x1c34
      return (void*)(p + 1);
    1939:	8b 45 ec             	mov    -0x14(%ebp),%eax
    193c:	83 c0 08             	add    $0x8,%eax
    193f:	eb 38                	jmp    1979 <malloc+0xde>
    }
    if(p == freep)
    1941:	a1 34 1c 00 00       	mov    0x1c34,%eax
    1946:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1949:	75 1b                	jne    1966 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    194b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    194e:	89 04 24             	mov    %eax,(%esp)
    1951:	e8 ed fe ff ff       	call   1843 <morecore>
    1956:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1959:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    195d:	75 07                	jne    1966 <malloc+0xcb>
        return 0;
    195f:	b8 00 00 00 00       	mov    $0x0,%eax
    1964:	eb 13                	jmp    1979 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1966:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1969:	89 45 f0             	mov    %eax,-0x10(%ebp)
    196c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    196f:	8b 00                	mov    (%eax),%eax
    1971:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1974:	e9 70 ff ff ff       	jmp    18e9 <malloc+0x4e>
}
    1979:	c9                   	leave  
    197a:	c3                   	ret    
    197b:	90                   	nop

0000197c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    197c:	55                   	push   %ebp
    197d:	89 e5                	mov    %esp,%ebp
    197f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1982:	8b 55 08             	mov    0x8(%ebp),%edx
    1985:	8b 45 0c             	mov    0xc(%ebp),%eax
    1988:	8b 4d 08             	mov    0x8(%ebp),%ecx
    198b:	f0 87 02             	lock xchg %eax,(%edx)
    198e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1991:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1994:	c9                   	leave  
    1995:	c3                   	ret    

00001996 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1996:	55                   	push   %ebp
    1997:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1999:	8b 45 08             	mov    0x8(%ebp),%eax
    199c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    19a2:	5d                   	pop    %ebp
    19a3:	c3                   	ret    

000019a4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    19a4:	55                   	push   %ebp
    19a5:	89 e5                	mov    %esp,%ebp
    19a7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    19aa:	8b 45 08             	mov    0x8(%ebp),%eax
    19ad:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    19b4:	00 
    19b5:	89 04 24             	mov    %eax,(%esp)
    19b8:	e8 bf ff ff ff       	call   197c <xchg>
    19bd:	85 c0                	test   %eax,%eax
    19bf:	75 e9                	jne    19aa <lock_acquire+0x6>
}
    19c1:	c9                   	leave  
    19c2:	c3                   	ret    

000019c3 <lock_release>:
void lock_release(lock_t *lock){
    19c3:	55                   	push   %ebp
    19c4:	89 e5                	mov    %esp,%ebp
    19c6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    19c9:	8b 45 08             	mov    0x8(%ebp),%eax
    19cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19d3:	00 
    19d4:	89 04 24             	mov    %eax,(%esp)
    19d7:	e8 a0 ff ff ff       	call   197c <xchg>
}
    19dc:	c9                   	leave  
    19dd:	c3                   	ret    

000019de <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    19de:	55                   	push   %ebp
    19df:	89 e5                	mov    %esp,%ebp
    19e1:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    19e4:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    19eb:	e8 ab fe ff ff       	call   189b <malloc>
    19f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    19f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    19f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19fc:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a01:	85 c0                	test   %eax,%eax
    1a03:	74 15                	je     1a1a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1a05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a08:	89 c2                	mov    %eax,%edx
    1a0a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1a10:	b8 00 10 00 00       	mov    $0x1000,%eax
    1a15:	29 d0                	sub    %edx,%eax
    1a17:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1a1a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a1e:	75 1b                	jne    1a3b <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1a20:	c7 44 24 04 eb 1b 00 	movl   $0x1beb,0x4(%esp)
    1a27:	00 
    1a28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a2f:	e8 81 fb ff ff       	call   15b5 <printf>
        return 0;
    1a34:	b8 00 00 00 00       	mov    $0x0,%eax
    1a39:	eb 6f                	jmp    1aaa <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1a3b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1a3e:	8b 55 08             	mov    0x8(%ebp),%edx
    1a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a44:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a48:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a4c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1a53:	00 
    1a54:	89 04 24             	mov    %eax,(%esp)
    1a57:	e8 60 fa ff ff       	call   14bc <clone>
    1a5c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1a5f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a63:	79 1b                	jns    1a80 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1a65:	c7 44 24 04 f9 1b 00 	movl   $0x1bf9,0x4(%esp)
    1a6c:	00 
    1a6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a74:	e8 3c fb ff ff       	call   15b5 <printf>
        return 0;
    1a79:	b8 00 00 00 00       	mov    $0x0,%eax
    1a7e:	eb 2a                	jmp    1aaa <thread_create+0xcc>
    }
    if(tid > 0){
    1a80:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a84:	7e 05                	jle    1a8b <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a89:	eb 1f                	jmp    1aaa <thread_create+0xcc>
    }
    if(tid == 0){
    1a8b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a8f:	75 14                	jne    1aa5 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1a91:	c7 44 24 04 06 1c 00 	movl   $0x1c06,0x4(%esp)
    1a98:	00 
    1a99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1aa0:	e8 10 fb ff ff       	call   15b5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1aa5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1aaa:	c9                   	leave  
    1aab:	c3                   	ret    

00001aac <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1aac:	55                   	push   %ebp
    1aad:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1aaf:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1ab8:	8b 45 08             	mov    0x8(%ebp),%eax
    1abb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1ac2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1acc:	5d                   	pop    %ebp
    1acd:	c3                   	ret    

00001ace <add_q>:

void add_q(struct queue *q, int v){
    1ace:	55                   	push   %ebp
    1acf:	89 e5                	mov    %esp,%ebp
    1ad1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1ad4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1adb:	e8 bb fd ff ff       	call   189b <malloc>
    1ae0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ae6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af0:	8b 55 0c             	mov    0xc(%ebp),%edx
    1af3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1af5:	8b 45 08             	mov    0x8(%ebp),%eax
    1af8:	8b 40 04             	mov    0x4(%eax),%eax
    1afb:	85 c0                	test   %eax,%eax
    1afd:	75 0b                	jne    1b0a <add_q+0x3c>
        q->head = n;
    1aff:	8b 45 08             	mov    0x8(%ebp),%eax
    1b02:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b05:	89 50 04             	mov    %edx,0x4(%eax)
    1b08:	eb 0c                	jmp    1b16 <add_q+0x48>
    }else{
        q->tail->next = n;
    1b0a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0d:	8b 40 08             	mov    0x8(%eax),%eax
    1b10:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b13:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1b16:	8b 45 08             	mov    0x8(%ebp),%eax
    1b19:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b1c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1b1f:	8b 45 08             	mov    0x8(%ebp),%eax
    1b22:	8b 00                	mov    (%eax),%eax
    1b24:	8d 50 01             	lea    0x1(%eax),%edx
    1b27:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2a:	89 10                	mov    %edx,(%eax)
}
    1b2c:	c9                   	leave  
    1b2d:	c3                   	ret    

00001b2e <empty_q>:

int empty_q(struct queue *q){
    1b2e:	55                   	push   %ebp
    1b2f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1b31:	8b 45 08             	mov    0x8(%ebp),%eax
    1b34:	8b 00                	mov    (%eax),%eax
    1b36:	85 c0                	test   %eax,%eax
    1b38:	75 07                	jne    1b41 <empty_q+0x13>
        return 1;
    1b3a:	b8 01 00 00 00       	mov    $0x1,%eax
    1b3f:	eb 05                	jmp    1b46 <empty_q+0x18>
    else
        return 0;
    1b41:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1b46:	5d                   	pop    %ebp
    1b47:	c3                   	ret    

00001b48 <pop_q>:
int pop_q(struct queue *q){
    1b48:	55                   	push   %ebp
    1b49:	89 e5                	mov    %esp,%ebp
    1b4b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1b4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1b51:	89 04 24             	mov    %eax,(%esp)
    1b54:	e8 d5 ff ff ff       	call   1b2e <empty_q>
    1b59:	85 c0                	test   %eax,%eax
    1b5b:	75 5d                	jne    1bba <pop_q+0x72>
       val = q->head->value; 
    1b5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b60:	8b 40 04             	mov    0x4(%eax),%eax
    1b63:	8b 00                	mov    (%eax),%eax
    1b65:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1b68:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6b:	8b 40 04             	mov    0x4(%eax),%eax
    1b6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1b71:	8b 45 08             	mov    0x8(%ebp),%eax
    1b74:	8b 40 04             	mov    0x4(%eax),%eax
    1b77:	8b 50 04             	mov    0x4(%eax),%edx
    1b7a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1b80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b83:	89 04 24             	mov    %eax,(%esp)
    1b86:	e8 e1 fb ff ff       	call   176c <free>
       q->size--;
    1b8b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8e:	8b 00                	mov    (%eax),%eax
    1b90:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b93:	8b 45 08             	mov    0x8(%ebp),%eax
    1b96:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1b98:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9b:	8b 00                	mov    (%eax),%eax
    1b9d:	85 c0                	test   %eax,%eax
    1b9f:	75 14                	jne    1bb5 <pop_q+0x6d>
            q->head = 0;
    1ba1:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1bab:	8b 45 08             	mov    0x8(%ebp),%eax
    1bae:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1bb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bb8:	eb 05                	jmp    1bbf <pop_q+0x77>
    }
    return -1;
    1bba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1bbf:	c9                   	leave  
    1bc0:	c3                   	ret    
