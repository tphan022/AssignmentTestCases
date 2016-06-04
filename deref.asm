
_deref:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main()
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
	int * a = 0;
    1009:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1010:	00 
	int b = *a;
    1011:	8b 44 24 18          	mov    0x18(%esp),%eax
    1015:	8b 00                	mov    (%eax),%eax
    1017:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	
	printf(1, "%d\n", b);
    101b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    101f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1023:	c7 44 24 04 45 1a 00 	movl   $0x1a45,0x4(%esp)
    102a:	00 
    102b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1032:	e8 02 04 00 00       	call   1439 <printf>

	exit();
    1037:	e8 64 02 00 00       	call   12a0 <exit>

0000103c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    103c:	55                   	push   %ebp
    103d:	89 e5                	mov    %esp,%ebp
    103f:	57                   	push   %edi
    1040:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1041:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1044:	8b 55 10             	mov    0x10(%ebp),%edx
    1047:	8b 45 0c             	mov    0xc(%ebp),%eax
    104a:	89 cb                	mov    %ecx,%ebx
    104c:	89 df                	mov    %ebx,%edi
    104e:	89 d1                	mov    %edx,%ecx
    1050:	fc                   	cld    
    1051:	f3 aa                	rep stos %al,%es:(%edi)
    1053:	89 ca                	mov    %ecx,%edx
    1055:	89 fb                	mov    %edi,%ebx
    1057:	89 5d 08             	mov    %ebx,0x8(%ebp)
    105a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    105d:	5b                   	pop    %ebx
    105e:	5f                   	pop    %edi
    105f:	5d                   	pop    %ebp
    1060:	c3                   	ret    

00001061 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1061:	55                   	push   %ebp
    1062:	89 e5                	mov    %esp,%ebp
    1064:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1067:	8b 45 08             	mov    0x8(%ebp),%eax
    106a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    106d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1070:	0f b6 10             	movzbl (%eax),%edx
    1073:	8b 45 08             	mov    0x8(%ebp),%eax
    1076:	88 10                	mov    %dl,(%eax)
    1078:	8b 45 08             	mov    0x8(%ebp),%eax
    107b:	0f b6 00             	movzbl (%eax),%eax
    107e:	84 c0                	test   %al,%al
    1080:	0f 95 c0             	setne  %al
    1083:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1087:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    108b:	84 c0                	test   %al,%al
    108d:	75 de                	jne    106d <strcpy+0xc>
    ;
  return os;
    108f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1092:	c9                   	leave  
    1093:	c3                   	ret    

00001094 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1094:	55                   	push   %ebp
    1095:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1097:	eb 08                	jmp    10a1 <strcmp+0xd>
    p++, q++;
    1099:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    109d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10a1:	8b 45 08             	mov    0x8(%ebp),%eax
    10a4:	0f b6 00             	movzbl (%eax),%eax
    10a7:	84 c0                	test   %al,%al
    10a9:	74 10                	je     10bb <strcmp+0x27>
    10ab:	8b 45 08             	mov    0x8(%ebp),%eax
    10ae:	0f b6 10             	movzbl (%eax),%edx
    10b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b4:	0f b6 00             	movzbl (%eax),%eax
    10b7:	38 c2                	cmp    %al,%dl
    10b9:	74 de                	je     1099 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10bb:	8b 45 08             	mov    0x8(%ebp),%eax
    10be:	0f b6 00             	movzbl (%eax),%eax
    10c1:	0f b6 d0             	movzbl %al,%edx
    10c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    10c7:	0f b6 00             	movzbl (%eax),%eax
    10ca:	0f b6 c0             	movzbl %al,%eax
    10cd:	89 d1                	mov    %edx,%ecx
    10cf:	29 c1                	sub    %eax,%ecx
    10d1:	89 c8                	mov    %ecx,%eax
}
    10d3:	5d                   	pop    %ebp
    10d4:	c3                   	ret    

000010d5 <strlen>:

uint
strlen(char *s)
{
    10d5:	55                   	push   %ebp
    10d6:	89 e5                	mov    %esp,%ebp
    10d8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    10db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    10e2:	eb 04                	jmp    10e8 <strlen+0x13>
    10e4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    10e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10eb:	03 45 08             	add    0x8(%ebp),%eax
    10ee:	0f b6 00             	movzbl (%eax),%eax
    10f1:	84 c0                	test   %al,%al
    10f3:	75 ef                	jne    10e4 <strlen+0xf>
    ;
  return n;
    10f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10f8:	c9                   	leave  
    10f9:	c3                   	ret    

000010fa <memset>:

void*
memset(void *dst, int c, uint n)
{
    10fa:	55                   	push   %ebp
    10fb:	89 e5                	mov    %esp,%ebp
    10fd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1100:	8b 45 10             	mov    0x10(%ebp),%eax
    1103:	89 44 24 08          	mov    %eax,0x8(%esp)
    1107:	8b 45 0c             	mov    0xc(%ebp),%eax
    110a:	89 44 24 04          	mov    %eax,0x4(%esp)
    110e:	8b 45 08             	mov    0x8(%ebp),%eax
    1111:	89 04 24             	mov    %eax,(%esp)
    1114:	e8 23 ff ff ff       	call   103c <stosb>
  return dst;
    1119:	8b 45 08             	mov    0x8(%ebp),%eax
}
    111c:	c9                   	leave  
    111d:	c3                   	ret    

0000111e <strchr>:

char*
strchr(const char *s, char c)
{
    111e:	55                   	push   %ebp
    111f:	89 e5                	mov    %esp,%ebp
    1121:	83 ec 04             	sub    $0x4,%esp
    1124:	8b 45 0c             	mov    0xc(%ebp),%eax
    1127:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    112a:	eb 14                	jmp    1140 <strchr+0x22>
    if(*s == c)
    112c:	8b 45 08             	mov    0x8(%ebp),%eax
    112f:	0f b6 00             	movzbl (%eax),%eax
    1132:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1135:	75 05                	jne    113c <strchr+0x1e>
      return (char*)s;
    1137:	8b 45 08             	mov    0x8(%ebp),%eax
    113a:	eb 13                	jmp    114f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    113c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1140:	8b 45 08             	mov    0x8(%ebp),%eax
    1143:	0f b6 00             	movzbl (%eax),%eax
    1146:	84 c0                	test   %al,%al
    1148:	75 e2                	jne    112c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    114a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    114f:	c9                   	leave  
    1150:	c3                   	ret    

00001151 <gets>:

char*
gets(char *buf, int max)
{
    1151:	55                   	push   %ebp
    1152:	89 e5                	mov    %esp,%ebp
    1154:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1157:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    115e:	eb 44                	jmp    11a4 <gets+0x53>
    cc = read(0, &c, 1);
    1160:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1167:	00 
    1168:	8d 45 ef             	lea    -0x11(%ebp),%eax
    116b:	89 44 24 04          	mov    %eax,0x4(%esp)
    116f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1176:	e8 3d 01 00 00       	call   12b8 <read>
    117b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    117e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1182:	7e 2d                	jle    11b1 <gets+0x60>
      break;
    buf[i++] = c;
    1184:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1187:	03 45 08             	add    0x8(%ebp),%eax
    118a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    118e:	88 10                	mov    %dl,(%eax)
    1190:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1194:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1198:	3c 0a                	cmp    $0xa,%al
    119a:	74 16                	je     11b2 <gets+0x61>
    119c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11a0:	3c 0d                	cmp    $0xd,%al
    11a2:	74 0e                	je     11b2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11a7:	83 c0 01             	add    $0x1,%eax
    11aa:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11ad:	7c b1                	jl     1160 <gets+0xf>
    11af:	eb 01                	jmp    11b2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    11b1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11b5:	03 45 08             	add    0x8(%ebp),%eax
    11b8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11be:	c9                   	leave  
    11bf:	c3                   	ret    

000011c0 <stat>:

int
stat(char *n, struct stat *st)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11cd:	00 
    11ce:	8b 45 08             	mov    0x8(%ebp),%eax
    11d1:	89 04 24             	mov    %eax,(%esp)
    11d4:	e8 07 01 00 00       	call   12e0 <open>
    11d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    11dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11e0:	79 07                	jns    11e9 <stat+0x29>
    return -1;
    11e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11e7:	eb 23                	jmp    120c <stat+0x4c>
  r = fstat(fd, st);
    11e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    11f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11f3:	89 04 24             	mov    %eax,(%esp)
    11f6:	e8 fd 00 00 00       	call   12f8 <fstat>
    11fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    11fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1201:	89 04 24             	mov    %eax,(%esp)
    1204:	e8 bf 00 00 00       	call   12c8 <close>
  return r;
    1209:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    120c:	c9                   	leave  
    120d:	c3                   	ret    

0000120e <atoi>:

int
atoi(const char *s)
{
    120e:	55                   	push   %ebp
    120f:	89 e5                	mov    %esp,%ebp
    1211:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1214:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    121b:	eb 24                	jmp    1241 <atoi+0x33>
    n = n*10 + *s++ - '0';
    121d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1220:	89 d0                	mov    %edx,%eax
    1222:	c1 e0 02             	shl    $0x2,%eax
    1225:	01 d0                	add    %edx,%eax
    1227:	01 c0                	add    %eax,%eax
    1229:	89 c2                	mov    %eax,%edx
    122b:	8b 45 08             	mov    0x8(%ebp),%eax
    122e:	0f b6 00             	movzbl (%eax),%eax
    1231:	0f be c0             	movsbl %al,%eax
    1234:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1237:	83 e8 30             	sub    $0x30,%eax
    123a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    123d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1241:	8b 45 08             	mov    0x8(%ebp),%eax
    1244:	0f b6 00             	movzbl (%eax),%eax
    1247:	3c 2f                	cmp    $0x2f,%al
    1249:	7e 0a                	jle    1255 <atoi+0x47>
    124b:	8b 45 08             	mov    0x8(%ebp),%eax
    124e:	0f b6 00             	movzbl (%eax),%eax
    1251:	3c 39                	cmp    $0x39,%al
    1253:	7e c8                	jle    121d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1255:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1258:	c9                   	leave  
    1259:	c3                   	ret    

0000125a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    125a:	55                   	push   %ebp
    125b:	89 e5                	mov    %esp,%ebp
    125d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1260:	8b 45 08             	mov    0x8(%ebp),%eax
    1263:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    1266:	8b 45 0c             	mov    0xc(%ebp),%eax
    1269:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    126c:	eb 13                	jmp    1281 <memmove+0x27>
    *dst++ = *src++;
    126e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1271:	0f b6 10             	movzbl (%eax),%edx
    1274:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1277:	88 10                	mov    %dl,(%eax)
    1279:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    127d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1281:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1285:	0f 9f c0             	setg   %al
    1288:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    128c:	84 c0                	test   %al,%al
    128e:	75 de                	jne    126e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1290:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1293:	c9                   	leave  
    1294:	c3                   	ret    
    1295:	90                   	nop
    1296:	90                   	nop
    1297:	90                   	nop

00001298 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1298:	b8 01 00 00 00       	mov    $0x1,%eax
    129d:	cd 40                	int    $0x40
    129f:	c3                   	ret    

000012a0 <exit>:
SYSCALL(exit)
    12a0:	b8 02 00 00 00       	mov    $0x2,%eax
    12a5:	cd 40                	int    $0x40
    12a7:	c3                   	ret    

000012a8 <wait>:
SYSCALL(wait)
    12a8:	b8 03 00 00 00       	mov    $0x3,%eax
    12ad:	cd 40                	int    $0x40
    12af:	c3                   	ret    

000012b0 <pipe>:
SYSCALL(pipe)
    12b0:	b8 04 00 00 00       	mov    $0x4,%eax
    12b5:	cd 40                	int    $0x40
    12b7:	c3                   	ret    

000012b8 <read>:
SYSCALL(read)
    12b8:	b8 05 00 00 00       	mov    $0x5,%eax
    12bd:	cd 40                	int    $0x40
    12bf:	c3                   	ret    

000012c0 <write>:
SYSCALL(write)
    12c0:	b8 10 00 00 00       	mov    $0x10,%eax
    12c5:	cd 40                	int    $0x40
    12c7:	c3                   	ret    

000012c8 <close>:
SYSCALL(close)
    12c8:	b8 15 00 00 00       	mov    $0x15,%eax
    12cd:	cd 40                	int    $0x40
    12cf:	c3                   	ret    

000012d0 <kill>:
SYSCALL(kill)
    12d0:	b8 06 00 00 00       	mov    $0x6,%eax
    12d5:	cd 40                	int    $0x40
    12d7:	c3                   	ret    

000012d8 <exec>:
SYSCALL(exec)
    12d8:	b8 07 00 00 00       	mov    $0x7,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <open>:
SYSCALL(open)
    12e0:	b8 0f 00 00 00       	mov    $0xf,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <mknod>:
SYSCALL(mknod)
    12e8:	b8 11 00 00 00       	mov    $0x11,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <unlink>:
SYSCALL(unlink)
    12f0:	b8 12 00 00 00       	mov    $0x12,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <fstat>:
SYSCALL(fstat)
    12f8:	b8 08 00 00 00       	mov    $0x8,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <link>:
SYSCALL(link)
    1300:	b8 13 00 00 00       	mov    $0x13,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <mkdir>:
SYSCALL(mkdir)
    1308:	b8 14 00 00 00       	mov    $0x14,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <chdir>:
SYSCALL(chdir)
    1310:	b8 09 00 00 00       	mov    $0x9,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <dup>:
SYSCALL(dup)
    1318:	b8 0a 00 00 00       	mov    $0xa,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <getpid>:
SYSCALL(getpid)
    1320:	b8 0b 00 00 00       	mov    $0xb,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <sbrk>:
SYSCALL(sbrk)
    1328:	b8 0c 00 00 00       	mov    $0xc,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <sleep>:
SYSCALL(sleep)
    1330:	b8 0d 00 00 00       	mov    $0xd,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <uptime>:
SYSCALL(uptime)
    1338:	b8 0e 00 00 00       	mov    $0xe,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <clone>:
SYSCALL(clone)
    1340:	b8 16 00 00 00       	mov    $0x16,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <texit>:
SYSCALL(texit)
    1348:	b8 17 00 00 00       	mov    $0x17,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <tsleep>:
SYSCALL(tsleep)
    1350:	b8 18 00 00 00       	mov    $0x18,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <twakeup>:
SYSCALL(twakeup)
    1358:	b8 19 00 00 00       	mov    $0x19,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	83 ec 28             	sub    $0x28,%esp
    1366:	8b 45 0c             	mov    0xc(%ebp),%eax
    1369:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    136c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1373:	00 
    1374:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1377:	89 44 24 04          	mov    %eax,0x4(%esp)
    137b:	8b 45 08             	mov    0x8(%ebp),%eax
    137e:	89 04 24             	mov    %eax,(%esp)
    1381:	e8 3a ff ff ff       	call   12c0 <write>
}
    1386:	c9                   	leave  
    1387:	c3                   	ret    

00001388 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1388:	55                   	push   %ebp
    1389:	89 e5                	mov    %esp,%ebp
    138b:	53                   	push   %ebx
    138c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    138f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    1396:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    139a:	74 17                	je     13b3 <printint+0x2b>
    139c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13a0:	79 11                	jns    13b3 <printint+0x2b>
    neg = 1;
    13a2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13a9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ac:	f7 d8                	neg    %eax
    13ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13b1:	eb 06                	jmp    13b9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    13b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    13b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    13c0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    13c3:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c9:	ba 00 00 00 00       	mov    $0x0,%edx
    13ce:	f7 f3                	div    %ebx
    13d0:	89 d0                	mov    %edx,%eax
    13d2:	0f b6 80 7c 1a 00 00 	movzbl 0x1a7c(%eax),%eax
    13d9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    13dd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    13e1:	8b 45 10             	mov    0x10(%ebp),%eax
    13e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    13e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ea:	ba 00 00 00 00       	mov    $0x0,%edx
    13ef:	f7 75 d4             	divl   -0x2c(%ebp)
    13f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    13f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13f9:	75 c5                	jne    13c0 <printint+0x38>
  if(neg)
    13fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    13ff:	74 28                	je     1429 <printint+0xa1>
    buf[i++] = '-';
    1401:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1404:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1409:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    140d:	eb 1a                	jmp    1429 <printint+0xa1>
    putc(fd, buf[i]);
    140f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1412:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    1417:	0f be c0             	movsbl %al,%eax
    141a:	89 44 24 04          	mov    %eax,0x4(%esp)
    141e:	8b 45 08             	mov    0x8(%ebp),%eax
    1421:	89 04 24             	mov    %eax,(%esp)
    1424:	e8 37 ff ff ff       	call   1360 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1429:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    142d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1431:	79 dc                	jns    140f <printint+0x87>
    putc(fd, buf[i]);
}
    1433:	83 c4 44             	add    $0x44,%esp
    1436:	5b                   	pop    %ebx
    1437:	5d                   	pop    %ebp
    1438:	c3                   	ret    

00001439 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1439:	55                   	push   %ebp
    143a:	89 e5                	mov    %esp,%ebp
    143c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    143f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1446:	8d 45 0c             	lea    0xc(%ebp),%eax
    1449:	83 c0 04             	add    $0x4,%eax
    144c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    144f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1456:	e9 7e 01 00 00       	jmp    15d9 <printf+0x1a0>
    c = fmt[i] & 0xff;
    145b:	8b 55 0c             	mov    0xc(%ebp),%edx
    145e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1461:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1464:	0f b6 00             	movzbl (%eax),%eax
    1467:	0f be c0             	movsbl %al,%eax
    146a:	25 ff 00 00 00       	and    $0xff,%eax
    146f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    1472:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1476:	75 2c                	jne    14a4 <printf+0x6b>
      if(c == '%'){
    1478:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    147c:	75 0c                	jne    148a <printf+0x51>
        state = '%';
    147e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1485:	e9 4b 01 00 00       	jmp    15d5 <printf+0x19c>
      } else {
        putc(fd, c);
    148a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    148d:	0f be c0             	movsbl %al,%eax
    1490:	89 44 24 04          	mov    %eax,0x4(%esp)
    1494:	8b 45 08             	mov    0x8(%ebp),%eax
    1497:	89 04 24             	mov    %eax,(%esp)
    149a:	e8 c1 fe ff ff       	call   1360 <putc>
    149f:	e9 31 01 00 00       	jmp    15d5 <printf+0x19c>
      }
    } else if(state == '%'){
    14a4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    14a8:	0f 85 27 01 00 00    	jne    15d5 <printf+0x19c>
      if(c == 'd'){
    14ae:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    14b2:	75 2d                	jne    14e1 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    14b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14b7:	8b 00                	mov    (%eax),%eax
    14b9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14c0:	00 
    14c1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    14c8:	00 
    14c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    14cd:	8b 45 08             	mov    0x8(%ebp),%eax
    14d0:	89 04 24             	mov    %eax,(%esp)
    14d3:	e8 b0 fe ff ff       	call   1388 <printint>
        ap++;
    14d8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    14dc:	e9 ed 00 00 00       	jmp    15ce <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    14e1:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    14e5:	74 06                	je     14ed <printf+0xb4>
    14e7:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    14eb:	75 2d                	jne    151a <printf+0xe1>
        printint(fd, *ap, 16, 0);
    14ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14f0:	8b 00                	mov    (%eax),%eax
    14f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    14f9:	00 
    14fa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1501:	00 
    1502:	89 44 24 04          	mov    %eax,0x4(%esp)
    1506:	8b 45 08             	mov    0x8(%ebp),%eax
    1509:	89 04 24             	mov    %eax,(%esp)
    150c:	e8 77 fe ff ff       	call   1388 <printint>
        ap++;
    1511:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1515:	e9 b4 00 00 00       	jmp    15ce <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    151a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    151e:	75 46                	jne    1566 <printf+0x12d>
        s = (char*)*ap;
    1520:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1523:	8b 00                	mov    (%eax),%eax
    1525:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1528:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    152c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1530:	75 27                	jne    1559 <printf+0x120>
          s = "(null)";
    1532:	c7 45 e4 49 1a 00 00 	movl   $0x1a49,-0x1c(%ebp)
        while(*s != 0){
    1539:	eb 1f                	jmp    155a <printf+0x121>
          putc(fd, *s);
    153b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    153e:	0f b6 00             	movzbl (%eax),%eax
    1541:	0f be c0             	movsbl %al,%eax
    1544:	89 44 24 04          	mov    %eax,0x4(%esp)
    1548:	8b 45 08             	mov    0x8(%ebp),%eax
    154b:	89 04 24             	mov    %eax,(%esp)
    154e:	e8 0d fe ff ff       	call   1360 <putc>
          s++;
    1553:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1557:	eb 01                	jmp    155a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1559:	90                   	nop
    155a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    155d:	0f b6 00             	movzbl (%eax),%eax
    1560:	84 c0                	test   %al,%al
    1562:	75 d7                	jne    153b <printf+0x102>
    1564:	eb 68                	jmp    15ce <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1566:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    156a:	75 1d                	jne    1589 <printf+0x150>
        putc(fd, *ap);
    156c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    156f:	8b 00                	mov    (%eax),%eax
    1571:	0f be c0             	movsbl %al,%eax
    1574:	89 44 24 04          	mov    %eax,0x4(%esp)
    1578:	8b 45 08             	mov    0x8(%ebp),%eax
    157b:	89 04 24             	mov    %eax,(%esp)
    157e:	e8 dd fd ff ff       	call   1360 <putc>
        ap++;
    1583:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1587:	eb 45                	jmp    15ce <printf+0x195>
      } else if(c == '%'){
    1589:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    158d:	75 17                	jne    15a6 <printf+0x16d>
        putc(fd, c);
    158f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1592:	0f be c0             	movsbl %al,%eax
    1595:	89 44 24 04          	mov    %eax,0x4(%esp)
    1599:	8b 45 08             	mov    0x8(%ebp),%eax
    159c:	89 04 24             	mov    %eax,(%esp)
    159f:	e8 bc fd ff ff       	call   1360 <putc>
    15a4:	eb 28                	jmp    15ce <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15a6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15ad:	00 
    15ae:	8b 45 08             	mov    0x8(%ebp),%eax
    15b1:	89 04 24             	mov    %eax,(%esp)
    15b4:	e8 a7 fd ff ff       	call   1360 <putc>
        putc(fd, c);
    15b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15bc:	0f be c0             	movsbl %al,%eax
    15bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c3:	8b 45 08             	mov    0x8(%ebp),%eax
    15c6:	89 04 24             	mov    %eax,(%esp)
    15c9:	e8 92 fd ff ff       	call   1360 <putc>
      }
      state = 0;
    15ce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15d5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    15d9:	8b 55 0c             	mov    0xc(%ebp),%edx
    15dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15df:	8d 04 02             	lea    (%edx,%eax,1),%eax
    15e2:	0f b6 00             	movzbl (%eax),%eax
    15e5:	84 c0                	test   %al,%al
    15e7:	0f 85 6e fe ff ff    	jne    145b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15ed:	c9                   	leave  
    15ee:	c3                   	ret    
    15ef:	90                   	nop

000015f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15f0:	55                   	push   %ebp
    15f1:	89 e5                	mov    %esp,%ebp
    15f3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15f6:	8b 45 08             	mov    0x8(%ebp),%eax
    15f9:	83 e8 08             	sub    $0x8,%eax
    15fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15ff:	a1 98 1a 00 00       	mov    0x1a98,%eax
    1604:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1607:	eb 24                	jmp    162d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1609:	8b 45 fc             	mov    -0x4(%ebp),%eax
    160c:	8b 00                	mov    (%eax),%eax
    160e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1611:	77 12                	ja     1625 <free+0x35>
    1613:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1616:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1619:	77 24                	ja     163f <free+0x4f>
    161b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    161e:	8b 00                	mov    (%eax),%eax
    1620:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1623:	77 1a                	ja     163f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1625:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1628:	8b 00                	mov    (%eax),%eax
    162a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    162d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1630:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1633:	76 d4                	jbe    1609 <free+0x19>
    1635:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1638:	8b 00                	mov    (%eax),%eax
    163a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    163d:	76 ca                	jbe    1609 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    163f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1642:	8b 40 04             	mov    0x4(%eax),%eax
    1645:	c1 e0 03             	shl    $0x3,%eax
    1648:	89 c2                	mov    %eax,%edx
    164a:	03 55 f8             	add    -0x8(%ebp),%edx
    164d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1650:	8b 00                	mov    (%eax),%eax
    1652:	39 c2                	cmp    %eax,%edx
    1654:	75 24                	jne    167a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    1656:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1659:	8b 50 04             	mov    0x4(%eax),%edx
    165c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    165f:	8b 00                	mov    (%eax),%eax
    1661:	8b 40 04             	mov    0x4(%eax),%eax
    1664:	01 c2                	add    %eax,%edx
    1666:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1669:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    166c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    166f:	8b 00                	mov    (%eax),%eax
    1671:	8b 10                	mov    (%eax),%edx
    1673:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1676:	89 10                	mov    %edx,(%eax)
    1678:	eb 0a                	jmp    1684 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    167a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    167d:	8b 10                	mov    (%eax),%edx
    167f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1682:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1684:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1687:	8b 40 04             	mov    0x4(%eax),%eax
    168a:	c1 e0 03             	shl    $0x3,%eax
    168d:	03 45 fc             	add    -0x4(%ebp),%eax
    1690:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1693:	75 20                	jne    16b5 <free+0xc5>
    p->s.size += bp->s.size;
    1695:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1698:	8b 50 04             	mov    0x4(%eax),%edx
    169b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    169e:	8b 40 04             	mov    0x4(%eax),%eax
    16a1:	01 c2                	add    %eax,%edx
    16a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ac:	8b 10                	mov    (%eax),%edx
    16ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b1:	89 10                	mov    %edx,(%eax)
    16b3:	eb 08                	jmp    16bd <free+0xcd>
  } else
    p->s.ptr = bp;
    16b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b8:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16bb:	89 10                	mov    %edx,(%eax)
  freep = p;
    16bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c0:	a3 98 1a 00 00       	mov    %eax,0x1a98
}
    16c5:	c9                   	leave  
    16c6:	c3                   	ret    

000016c7 <morecore>:

static Header*
morecore(uint nu)
{
    16c7:	55                   	push   %ebp
    16c8:	89 e5                	mov    %esp,%ebp
    16ca:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    16cd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    16d4:	77 07                	ja     16dd <morecore+0x16>
    nu = 4096;
    16d6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    16dd:	8b 45 08             	mov    0x8(%ebp),%eax
    16e0:	c1 e0 03             	shl    $0x3,%eax
    16e3:	89 04 24             	mov    %eax,(%esp)
    16e6:	e8 3d fc ff ff       	call   1328 <sbrk>
    16eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    16ee:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    16f2:	75 07                	jne    16fb <morecore+0x34>
    return 0;
    16f4:	b8 00 00 00 00       	mov    $0x0,%eax
    16f9:	eb 22                	jmp    171d <morecore+0x56>
  hp = (Header*)p;
    16fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1701:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1704:	8b 55 08             	mov    0x8(%ebp),%edx
    1707:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    170a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    170d:	83 c0 08             	add    $0x8,%eax
    1710:	89 04 24             	mov    %eax,(%esp)
    1713:	e8 d8 fe ff ff       	call   15f0 <free>
  return freep;
    1718:	a1 98 1a 00 00       	mov    0x1a98,%eax
}
    171d:	c9                   	leave  
    171e:	c3                   	ret    

0000171f <malloc>:

void*
malloc(uint nbytes)
{
    171f:	55                   	push   %ebp
    1720:	89 e5                	mov    %esp,%ebp
    1722:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1725:	8b 45 08             	mov    0x8(%ebp),%eax
    1728:	83 c0 07             	add    $0x7,%eax
    172b:	c1 e8 03             	shr    $0x3,%eax
    172e:	83 c0 01             	add    $0x1,%eax
    1731:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1734:	a1 98 1a 00 00       	mov    0x1a98,%eax
    1739:	89 45 f0             	mov    %eax,-0x10(%ebp)
    173c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1740:	75 23                	jne    1765 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1742:	c7 45 f0 90 1a 00 00 	movl   $0x1a90,-0x10(%ebp)
    1749:	8b 45 f0             	mov    -0x10(%ebp),%eax
    174c:	a3 98 1a 00 00       	mov    %eax,0x1a98
    1751:	a1 98 1a 00 00       	mov    0x1a98,%eax
    1756:	a3 90 1a 00 00       	mov    %eax,0x1a90
    base.s.size = 0;
    175b:	c7 05 94 1a 00 00 00 	movl   $0x0,0x1a94
    1762:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1765:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1768:	8b 00                	mov    (%eax),%eax
    176a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    176d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1770:	8b 40 04             	mov    0x4(%eax),%eax
    1773:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1776:	72 4d                	jb     17c5 <malloc+0xa6>
      if(p->s.size == nunits)
    1778:	8b 45 ec             	mov    -0x14(%ebp),%eax
    177b:	8b 40 04             	mov    0x4(%eax),%eax
    177e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1781:	75 0c                	jne    178f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1783:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1786:	8b 10                	mov    (%eax),%edx
    1788:	8b 45 f0             	mov    -0x10(%ebp),%eax
    178b:	89 10                	mov    %edx,(%eax)
    178d:	eb 26                	jmp    17b5 <malloc+0x96>
      else {
        p->s.size -= nunits;
    178f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1792:	8b 40 04             	mov    0x4(%eax),%eax
    1795:	89 c2                	mov    %eax,%edx
    1797:	2b 55 f4             	sub    -0xc(%ebp),%edx
    179a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    179d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17a3:	8b 40 04             	mov    0x4(%eax),%eax
    17a6:	c1 e0 03             	shl    $0x3,%eax
    17a9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    17ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17af:	8b 55 f4             	mov    -0xc(%ebp),%edx
    17b2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b8:	a3 98 1a 00 00       	mov    %eax,0x1a98
      return (void*)(p + 1);
    17bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17c0:	83 c0 08             	add    $0x8,%eax
    17c3:	eb 38                	jmp    17fd <malloc+0xde>
    }
    if(p == freep)
    17c5:	a1 98 1a 00 00       	mov    0x1a98,%eax
    17ca:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    17cd:	75 1b                	jne    17ea <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    17cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d2:	89 04 24             	mov    %eax,(%esp)
    17d5:	e8 ed fe ff ff       	call   16c7 <morecore>
    17da:	89 45 ec             	mov    %eax,-0x14(%ebp)
    17dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    17e1:	75 07                	jne    17ea <malloc+0xcb>
        return 0;
    17e3:	b8 00 00 00 00       	mov    $0x0,%eax
    17e8:	eb 13                	jmp    17fd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17f3:	8b 00                	mov    (%eax),%eax
    17f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    17f8:	e9 70 ff ff ff       	jmp    176d <malloc+0x4e>
}
    17fd:	c9                   	leave  
    17fe:	c3                   	ret    
    17ff:	90                   	nop

00001800 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1800:	55                   	push   %ebp
    1801:	89 e5                	mov    %esp,%ebp
    1803:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1806:	8b 55 08             	mov    0x8(%ebp),%edx
    1809:	8b 45 0c             	mov    0xc(%ebp),%eax
    180c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    180f:	f0 87 02             	lock xchg %eax,(%edx)
    1812:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1815:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1818:	c9                   	leave  
    1819:	c3                   	ret    

0000181a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    181a:	55                   	push   %ebp
    181b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    181d:	8b 45 08             	mov    0x8(%ebp),%eax
    1820:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1826:	5d                   	pop    %ebp
    1827:	c3                   	ret    

00001828 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1828:	55                   	push   %ebp
    1829:	89 e5                	mov    %esp,%ebp
    182b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    182e:	8b 45 08             	mov    0x8(%ebp),%eax
    1831:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1838:	00 
    1839:	89 04 24             	mov    %eax,(%esp)
    183c:	e8 bf ff ff ff       	call   1800 <xchg>
    1841:	85 c0                	test   %eax,%eax
    1843:	75 e9                	jne    182e <lock_acquire+0x6>
}
    1845:	c9                   	leave  
    1846:	c3                   	ret    

00001847 <lock_release>:
void lock_release(lock_t *lock){
    1847:	55                   	push   %ebp
    1848:	89 e5                	mov    %esp,%ebp
    184a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    184d:	8b 45 08             	mov    0x8(%ebp),%eax
    1850:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1857:	00 
    1858:	89 04 24             	mov    %eax,(%esp)
    185b:	e8 a0 ff ff ff       	call   1800 <xchg>
}
    1860:	c9                   	leave  
    1861:	c3                   	ret    

00001862 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1862:	55                   	push   %ebp
    1863:	89 e5                	mov    %esp,%ebp
    1865:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1868:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    186f:	e8 ab fe ff ff       	call   171f <malloc>
    1874:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1877:	8b 45 f0             	mov    -0x10(%ebp),%eax
    187a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    187d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1880:	25 ff 0f 00 00       	and    $0xfff,%eax
    1885:	85 c0                	test   %eax,%eax
    1887:	74 15                	je     189e <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1889:	8b 45 f0             	mov    -0x10(%ebp),%eax
    188c:	89 c2                	mov    %eax,%edx
    188e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1894:	b8 00 10 00 00       	mov    $0x1000,%eax
    1899:	29 d0                	sub    %edx,%eax
    189b:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    189e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18a2:	75 1b                	jne    18bf <thread_create+0x5d>

        printf(1,"malloc fail \n");
    18a4:	c7 44 24 04 50 1a 00 	movl   $0x1a50,0x4(%esp)
    18ab:	00 
    18ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18b3:	e8 81 fb ff ff       	call   1439 <printf>
        return 0;
    18b8:	b8 00 00 00 00       	mov    $0x0,%eax
    18bd:	eb 6f                	jmp    192e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    18c2:	8b 55 08             	mov    0x8(%ebp),%edx
    18c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18c8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    18cc:	89 54 24 08          	mov    %edx,0x8(%esp)
    18d0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    18d7:	00 
    18d8:	89 04 24             	mov    %eax,(%esp)
    18db:	e8 60 fa ff ff       	call   1340 <clone>
    18e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    18e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18e7:	79 1b                	jns    1904 <thread_create+0xa2>
        printf(1,"clone fails\n");
    18e9:	c7 44 24 04 5e 1a 00 	movl   $0x1a5e,0x4(%esp)
    18f0:	00 
    18f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f8:	e8 3c fb ff ff       	call   1439 <printf>
        return 0;
    18fd:	b8 00 00 00 00       	mov    $0x0,%eax
    1902:	eb 2a                	jmp    192e <thread_create+0xcc>
    }
    if(tid > 0){
    1904:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1908:	7e 05                	jle    190f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    190a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    190d:	eb 1f                	jmp    192e <thread_create+0xcc>
    }
    if(tid == 0){
    190f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1913:	75 14                	jne    1929 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1915:	c7 44 24 04 6b 1a 00 	movl   $0x1a6b,0x4(%esp)
    191c:	00 
    191d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1924:	e8 10 fb ff ff       	call   1439 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1929:	b8 00 00 00 00       	mov    $0x0,%eax
}
    192e:	c9                   	leave  
    192f:	c3                   	ret    

00001930 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1930:	55                   	push   %ebp
    1931:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1933:	8b 45 08             	mov    0x8(%ebp),%eax
    1936:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    193c:	8b 45 08             	mov    0x8(%ebp),%eax
    193f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1946:	8b 45 08             	mov    0x8(%ebp),%eax
    1949:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1950:	5d                   	pop    %ebp
    1951:	c3                   	ret    

00001952 <add_q>:

void add_q(struct queue *q, int v){
    1952:	55                   	push   %ebp
    1953:	89 e5                	mov    %esp,%ebp
    1955:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1958:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    195f:	e8 bb fd ff ff       	call   171f <malloc>
    1964:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1967:	8b 45 f4             	mov    -0xc(%ebp),%eax
    196a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1971:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1974:	8b 55 0c             	mov    0xc(%ebp),%edx
    1977:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1979:	8b 45 08             	mov    0x8(%ebp),%eax
    197c:	8b 40 04             	mov    0x4(%eax),%eax
    197f:	85 c0                	test   %eax,%eax
    1981:	75 0b                	jne    198e <add_q+0x3c>
        q->head = n;
    1983:	8b 45 08             	mov    0x8(%ebp),%eax
    1986:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1989:	89 50 04             	mov    %edx,0x4(%eax)
    198c:	eb 0c                	jmp    199a <add_q+0x48>
    }else{
        q->tail->next = n;
    198e:	8b 45 08             	mov    0x8(%ebp),%eax
    1991:	8b 40 08             	mov    0x8(%eax),%eax
    1994:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1997:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    199a:	8b 45 08             	mov    0x8(%ebp),%eax
    199d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19a0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    19a3:	8b 45 08             	mov    0x8(%ebp),%eax
    19a6:	8b 00                	mov    (%eax),%eax
    19a8:	8d 50 01             	lea    0x1(%eax),%edx
    19ab:	8b 45 08             	mov    0x8(%ebp),%eax
    19ae:	89 10                	mov    %edx,(%eax)
}
    19b0:	c9                   	leave  
    19b1:	c3                   	ret    

000019b2 <empty_q>:

int empty_q(struct queue *q){
    19b2:	55                   	push   %ebp
    19b3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    19b5:	8b 45 08             	mov    0x8(%ebp),%eax
    19b8:	8b 00                	mov    (%eax),%eax
    19ba:	85 c0                	test   %eax,%eax
    19bc:	75 07                	jne    19c5 <empty_q+0x13>
        return 1;
    19be:	b8 01 00 00 00       	mov    $0x1,%eax
    19c3:	eb 05                	jmp    19ca <empty_q+0x18>
    else
        return 0;
    19c5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    19ca:	5d                   	pop    %ebp
    19cb:	c3                   	ret    

000019cc <pop_q>:
int pop_q(struct queue *q){
    19cc:	55                   	push   %ebp
    19cd:	89 e5                	mov    %esp,%ebp
    19cf:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    19d2:	8b 45 08             	mov    0x8(%ebp),%eax
    19d5:	89 04 24             	mov    %eax,(%esp)
    19d8:	e8 d5 ff ff ff       	call   19b2 <empty_q>
    19dd:	85 c0                	test   %eax,%eax
    19df:	75 5d                	jne    1a3e <pop_q+0x72>
       val = q->head->value; 
    19e1:	8b 45 08             	mov    0x8(%ebp),%eax
    19e4:	8b 40 04             	mov    0x4(%eax),%eax
    19e7:	8b 00                	mov    (%eax),%eax
    19e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    19ec:	8b 45 08             	mov    0x8(%ebp),%eax
    19ef:	8b 40 04             	mov    0x4(%eax),%eax
    19f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    19f5:	8b 45 08             	mov    0x8(%ebp),%eax
    19f8:	8b 40 04             	mov    0x4(%eax),%eax
    19fb:	8b 50 04             	mov    0x4(%eax),%edx
    19fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1a01:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a07:	89 04 24             	mov    %eax,(%esp)
    1a0a:	e8 e1 fb ff ff       	call   15f0 <free>
       q->size--;
    1a0f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a12:	8b 00                	mov    (%eax),%eax
    1a14:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a17:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a1c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1f:	8b 00                	mov    (%eax),%eax
    1a21:	85 c0                	test   %eax,%eax
    1a23:	75 14                	jne    1a39 <pop_q+0x6d>
            q->head = 0;
    1a25:	8b 45 08             	mov    0x8(%ebp),%eax
    1a28:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a2f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a32:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a3c:	eb 05                	jmp    1a43 <pop_q+0x77>
    }
    return -1;
    1a3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a43:	c9                   	leave  
    1a44:	c3                   	ret    
