
_zombie:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
    1009:	e8 72 02 00 00       	call   1280 <fork>
    100e:	85 c0                	test   %eax,%eax
    1010:	7e 0c                	jle    101e <main+0x1e>
    sleep(5);  // Let child exit before parent.
    1012:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1019:	e8 fa 02 00 00       	call   1318 <sleep>
  exit();
    101e:	e8 65 02 00 00       	call   1288 <exit>
    1023:	90                   	nop

00001024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1024:	55                   	push   %ebp
    1025:	89 e5                	mov    %esp,%ebp
    1027:	57                   	push   %edi
    1028:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1029:	8b 4d 08             	mov    0x8(%ebp),%ecx
    102c:	8b 55 10             	mov    0x10(%ebp),%edx
    102f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1032:	89 cb                	mov    %ecx,%ebx
    1034:	89 df                	mov    %ebx,%edi
    1036:	89 d1                	mov    %edx,%ecx
    1038:	fc                   	cld    
    1039:	f3 aa                	rep stos %al,%es:(%edi)
    103b:	89 ca                	mov    %ecx,%edx
    103d:	89 fb                	mov    %edi,%ebx
    103f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1042:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1045:	5b                   	pop    %ebx
    1046:	5f                   	pop    %edi
    1047:	5d                   	pop    %ebp
    1048:	c3                   	ret    

00001049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1049:	55                   	push   %ebp
    104a:	89 e5                	mov    %esp,%ebp
    104c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    104f:	8b 45 08             	mov    0x8(%ebp),%eax
    1052:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1055:	8b 45 0c             	mov    0xc(%ebp),%eax
    1058:	0f b6 10             	movzbl (%eax),%edx
    105b:	8b 45 08             	mov    0x8(%ebp),%eax
    105e:	88 10                	mov    %dl,(%eax)
    1060:	8b 45 08             	mov    0x8(%ebp),%eax
    1063:	0f b6 00             	movzbl (%eax),%eax
    1066:	84 c0                	test   %al,%al
    1068:	0f 95 c0             	setne  %al
    106b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    106f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1073:	84 c0                	test   %al,%al
    1075:	75 de                	jne    1055 <strcpy+0xc>
    ;
  return os;
    1077:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    107a:	c9                   	leave  
    107b:	c3                   	ret    

0000107c <strcmp>:

int
strcmp(const char *p, const char *q)
{
    107c:	55                   	push   %ebp
    107d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    107f:	eb 08                	jmp    1089 <strcmp+0xd>
    p++, q++;
    1081:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1085:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1089:	8b 45 08             	mov    0x8(%ebp),%eax
    108c:	0f b6 00             	movzbl (%eax),%eax
    108f:	84 c0                	test   %al,%al
    1091:	74 10                	je     10a3 <strcmp+0x27>
    1093:	8b 45 08             	mov    0x8(%ebp),%eax
    1096:	0f b6 10             	movzbl (%eax),%edx
    1099:	8b 45 0c             	mov    0xc(%ebp),%eax
    109c:	0f b6 00             	movzbl (%eax),%eax
    109f:	38 c2                	cmp    %al,%dl
    10a1:	74 de                	je     1081 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10a3:	8b 45 08             	mov    0x8(%ebp),%eax
    10a6:	0f b6 00             	movzbl (%eax),%eax
    10a9:	0f b6 d0             	movzbl %al,%edx
    10ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    10af:	0f b6 00             	movzbl (%eax),%eax
    10b2:	0f b6 c0             	movzbl %al,%eax
    10b5:	89 d1                	mov    %edx,%ecx
    10b7:	29 c1                	sub    %eax,%ecx
    10b9:	89 c8                	mov    %ecx,%eax
}
    10bb:	5d                   	pop    %ebp
    10bc:	c3                   	ret    

000010bd <strlen>:

uint
strlen(char *s)
{
    10bd:	55                   	push   %ebp
    10be:	89 e5                	mov    %esp,%ebp
    10c0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    10c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    10ca:	eb 04                	jmp    10d0 <strlen+0x13>
    10cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    10d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10d3:	03 45 08             	add    0x8(%ebp),%eax
    10d6:	0f b6 00             	movzbl (%eax),%eax
    10d9:	84 c0                	test   %al,%al
    10db:	75 ef                	jne    10cc <strlen+0xf>
    ;
  return n;
    10dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10e0:	c9                   	leave  
    10e1:	c3                   	ret    

000010e2 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e2:	55                   	push   %ebp
    10e3:	89 e5                	mov    %esp,%ebp
    10e5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    10e8:	8b 45 10             	mov    0x10(%ebp),%eax
    10eb:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    10f6:	8b 45 08             	mov    0x8(%ebp),%eax
    10f9:	89 04 24             	mov    %eax,(%esp)
    10fc:	e8 23 ff ff ff       	call   1024 <stosb>
  return dst;
    1101:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1104:	c9                   	leave  
    1105:	c3                   	ret    

00001106 <strchr>:

char*
strchr(const char *s, char c)
{
    1106:	55                   	push   %ebp
    1107:	89 e5                	mov    %esp,%ebp
    1109:	83 ec 04             	sub    $0x4,%esp
    110c:	8b 45 0c             	mov    0xc(%ebp),%eax
    110f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1112:	eb 14                	jmp    1128 <strchr+0x22>
    if(*s == c)
    1114:	8b 45 08             	mov    0x8(%ebp),%eax
    1117:	0f b6 00             	movzbl (%eax),%eax
    111a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    111d:	75 05                	jne    1124 <strchr+0x1e>
      return (char*)s;
    111f:	8b 45 08             	mov    0x8(%ebp),%eax
    1122:	eb 13                	jmp    1137 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1124:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1128:	8b 45 08             	mov    0x8(%ebp),%eax
    112b:	0f b6 00             	movzbl (%eax),%eax
    112e:	84 c0                	test   %al,%al
    1130:	75 e2                	jne    1114 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1132:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1137:	c9                   	leave  
    1138:	c3                   	ret    

00001139 <gets>:

char*
gets(char *buf, int max)
{
    1139:	55                   	push   %ebp
    113a:	89 e5                	mov    %esp,%ebp
    113c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    113f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1146:	eb 44                	jmp    118c <gets+0x53>
    cc = read(0, &c, 1);
    1148:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    114f:	00 
    1150:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1153:	89 44 24 04          	mov    %eax,0x4(%esp)
    1157:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    115e:	e8 3d 01 00 00       	call   12a0 <read>
    1163:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1166:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    116a:	7e 2d                	jle    1199 <gets+0x60>
      break;
    buf[i++] = c;
    116c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    116f:	03 45 08             	add    0x8(%ebp),%eax
    1172:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1176:	88 10                	mov    %dl,(%eax)
    1178:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    117c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1180:	3c 0a                	cmp    $0xa,%al
    1182:	74 16                	je     119a <gets+0x61>
    1184:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1188:	3c 0d                	cmp    $0xd,%al
    118a:	74 0e                	je     119a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    118c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    118f:	83 c0 01             	add    $0x1,%eax
    1192:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1195:	7c b1                	jl     1148 <gets+0xf>
    1197:	eb 01                	jmp    119a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1199:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    119a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    119d:	03 45 08             	add    0x8(%ebp),%eax
    11a0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11a6:	c9                   	leave  
    11a7:	c3                   	ret    

000011a8 <stat>:

int
stat(char *n, struct stat *st)
{
    11a8:	55                   	push   %ebp
    11a9:	89 e5                	mov    %esp,%ebp
    11ab:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b5:	00 
    11b6:	8b 45 08             	mov    0x8(%ebp),%eax
    11b9:	89 04 24             	mov    %eax,(%esp)
    11bc:	e8 07 01 00 00       	call   12c8 <open>
    11c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    11c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11c8:	79 07                	jns    11d1 <stat+0x29>
    return -1;
    11ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11cf:	eb 23                	jmp    11f4 <stat+0x4c>
  r = fstat(fd, st);
    11d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    11d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11db:	89 04 24             	mov    %eax,(%esp)
    11de:	e8 fd 00 00 00       	call   12e0 <fstat>
    11e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    11e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e9:	89 04 24             	mov    %eax,(%esp)
    11ec:	e8 bf 00 00 00       	call   12b0 <close>
  return r;
    11f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    11f4:	c9                   	leave  
    11f5:	c3                   	ret    

000011f6 <atoi>:

int
atoi(const char *s)
{
    11f6:	55                   	push   %ebp
    11f7:	89 e5                	mov    %esp,%ebp
    11f9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    11fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1203:	eb 24                	jmp    1229 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1205:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1208:	89 d0                	mov    %edx,%eax
    120a:	c1 e0 02             	shl    $0x2,%eax
    120d:	01 d0                	add    %edx,%eax
    120f:	01 c0                	add    %eax,%eax
    1211:	89 c2                	mov    %eax,%edx
    1213:	8b 45 08             	mov    0x8(%ebp),%eax
    1216:	0f b6 00             	movzbl (%eax),%eax
    1219:	0f be c0             	movsbl %al,%eax
    121c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    121f:	83 e8 30             	sub    $0x30,%eax
    1222:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1225:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1229:	8b 45 08             	mov    0x8(%ebp),%eax
    122c:	0f b6 00             	movzbl (%eax),%eax
    122f:	3c 2f                	cmp    $0x2f,%al
    1231:	7e 0a                	jle    123d <atoi+0x47>
    1233:	8b 45 08             	mov    0x8(%ebp),%eax
    1236:	0f b6 00             	movzbl (%eax),%eax
    1239:	3c 39                	cmp    $0x39,%al
    123b:	7e c8                	jle    1205 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    123d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1240:	c9                   	leave  
    1241:	c3                   	ret    

00001242 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1242:	55                   	push   %ebp
    1243:	89 e5                	mov    %esp,%ebp
    1245:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1248:	8b 45 08             	mov    0x8(%ebp),%eax
    124b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    124e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1251:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1254:	eb 13                	jmp    1269 <memmove+0x27>
    *dst++ = *src++;
    1256:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1259:	0f b6 10             	movzbl (%eax),%edx
    125c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    125f:	88 10                	mov    %dl,(%eax)
    1261:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1265:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1269:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    126d:	0f 9f c0             	setg   %al
    1270:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1274:	84 c0                	test   %al,%al
    1276:	75 de                	jne    1256 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1278:	8b 45 08             	mov    0x8(%ebp),%eax
}
    127b:	c9                   	leave  
    127c:	c3                   	ret    
    127d:	90                   	nop
    127e:	90                   	nop
    127f:	90                   	nop

00001280 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1280:	b8 01 00 00 00       	mov    $0x1,%eax
    1285:	cd 40                	int    $0x40
    1287:	c3                   	ret    

00001288 <exit>:
SYSCALL(exit)
    1288:	b8 02 00 00 00       	mov    $0x2,%eax
    128d:	cd 40                	int    $0x40
    128f:	c3                   	ret    

00001290 <wait>:
SYSCALL(wait)
    1290:	b8 03 00 00 00       	mov    $0x3,%eax
    1295:	cd 40                	int    $0x40
    1297:	c3                   	ret    

00001298 <pipe>:
SYSCALL(pipe)
    1298:	b8 04 00 00 00       	mov    $0x4,%eax
    129d:	cd 40                	int    $0x40
    129f:	c3                   	ret    

000012a0 <read>:
SYSCALL(read)
    12a0:	b8 05 00 00 00       	mov    $0x5,%eax
    12a5:	cd 40                	int    $0x40
    12a7:	c3                   	ret    

000012a8 <write>:
SYSCALL(write)
    12a8:	b8 10 00 00 00       	mov    $0x10,%eax
    12ad:	cd 40                	int    $0x40
    12af:	c3                   	ret    

000012b0 <close>:
SYSCALL(close)
    12b0:	b8 15 00 00 00       	mov    $0x15,%eax
    12b5:	cd 40                	int    $0x40
    12b7:	c3                   	ret    

000012b8 <kill>:
SYSCALL(kill)
    12b8:	b8 06 00 00 00       	mov    $0x6,%eax
    12bd:	cd 40                	int    $0x40
    12bf:	c3                   	ret    

000012c0 <exec>:
SYSCALL(exec)
    12c0:	b8 07 00 00 00       	mov    $0x7,%eax
    12c5:	cd 40                	int    $0x40
    12c7:	c3                   	ret    

000012c8 <open>:
SYSCALL(open)
    12c8:	b8 0f 00 00 00       	mov    $0xf,%eax
    12cd:	cd 40                	int    $0x40
    12cf:	c3                   	ret    

000012d0 <mknod>:
SYSCALL(mknod)
    12d0:	b8 11 00 00 00       	mov    $0x11,%eax
    12d5:	cd 40                	int    $0x40
    12d7:	c3                   	ret    

000012d8 <unlink>:
SYSCALL(unlink)
    12d8:	b8 12 00 00 00       	mov    $0x12,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <fstat>:
SYSCALL(fstat)
    12e0:	b8 08 00 00 00       	mov    $0x8,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <link>:
SYSCALL(link)
    12e8:	b8 13 00 00 00       	mov    $0x13,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <mkdir>:
SYSCALL(mkdir)
    12f0:	b8 14 00 00 00       	mov    $0x14,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <chdir>:
SYSCALL(chdir)
    12f8:	b8 09 00 00 00       	mov    $0x9,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <dup>:
SYSCALL(dup)
    1300:	b8 0a 00 00 00       	mov    $0xa,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <getpid>:
SYSCALL(getpid)
    1308:	b8 0b 00 00 00       	mov    $0xb,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <sbrk>:
SYSCALL(sbrk)
    1310:	b8 0c 00 00 00       	mov    $0xc,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <sleep>:
SYSCALL(sleep)
    1318:	b8 0d 00 00 00       	mov    $0xd,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <uptime>:
SYSCALL(uptime)
    1320:	b8 0e 00 00 00       	mov    $0xe,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <clone>:
SYSCALL(clone)
    1328:	b8 16 00 00 00       	mov    $0x16,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <texit>:
SYSCALL(texit)
    1330:	b8 17 00 00 00       	mov    $0x17,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <tsleep>:
SYSCALL(tsleep)
    1338:	b8 18 00 00 00       	mov    $0x18,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <twakeup>:
SYSCALL(twakeup)
    1340:	b8 19 00 00 00       	mov    $0x19,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1348:	55                   	push   %ebp
    1349:	89 e5                	mov    %esp,%ebp
    134b:	83 ec 28             	sub    $0x28,%esp
    134e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1351:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1354:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    135b:	00 
    135c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    135f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1363:	8b 45 08             	mov    0x8(%ebp),%eax
    1366:	89 04 24             	mov    %eax,(%esp)
    1369:	e8 3a ff ff ff       	call   12a8 <write>
}
    136e:	c9                   	leave  
    136f:	c3                   	ret    

00001370 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	53                   	push   %ebx
    1374:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1377:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    137e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1382:	74 17                	je     139b <printint+0x2b>
    1384:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1388:	79 11                	jns    139b <printint+0x2b>
    neg = 1;
    138a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1391:	8b 45 0c             	mov    0xc(%ebp),%eax
    1394:	f7 d8                	neg    %eax
    1396:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1399:	eb 06                	jmp    13a1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    139b:	8b 45 0c             	mov    0xc(%ebp),%eax
    139e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    13a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    13a8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    13ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13b1:	ba 00 00 00 00       	mov    $0x0,%edx
    13b6:	f7 f3                	div    %ebx
    13b8:	89 d0                	mov    %edx,%eax
    13ba:	0f b6 80 60 1a 00 00 	movzbl 0x1a60(%eax),%eax
    13c1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    13c5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    13c9:	8b 45 10             	mov    0x10(%ebp),%eax
    13cc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    13cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13d2:	ba 00 00 00 00       	mov    $0x0,%edx
    13d7:	f7 75 d4             	divl   -0x2c(%ebp)
    13da:	89 45 f4             	mov    %eax,-0xc(%ebp)
    13dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13e1:	75 c5                	jne    13a8 <printint+0x38>
  if(neg)
    13e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    13e7:	74 28                	je     1411 <printint+0xa1>
    buf[i++] = '-';
    13e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13ec:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    13f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    13f5:	eb 1a                	jmp    1411 <printint+0xa1>
    putc(fd, buf[i]);
    13f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    13fa:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    13ff:	0f be c0             	movsbl %al,%eax
    1402:	89 44 24 04          	mov    %eax,0x4(%esp)
    1406:	8b 45 08             	mov    0x8(%ebp),%eax
    1409:	89 04 24             	mov    %eax,(%esp)
    140c:	e8 37 ff ff ff       	call   1348 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1411:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1415:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1419:	79 dc                	jns    13f7 <printint+0x87>
    putc(fd, buf[i]);
}
    141b:	83 c4 44             	add    $0x44,%esp
    141e:	5b                   	pop    %ebx
    141f:	5d                   	pop    %ebp
    1420:	c3                   	ret    

00001421 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1421:	55                   	push   %ebp
    1422:	89 e5                	mov    %esp,%ebp
    1424:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1427:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    142e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1431:	83 c0 04             	add    $0x4,%eax
    1434:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1437:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    143e:	e9 7e 01 00 00       	jmp    15c1 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1443:	8b 55 0c             	mov    0xc(%ebp),%edx
    1446:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1449:	8d 04 02             	lea    (%edx,%eax,1),%eax
    144c:	0f b6 00             	movzbl (%eax),%eax
    144f:	0f be c0             	movsbl %al,%eax
    1452:	25 ff 00 00 00       	and    $0xff,%eax
    1457:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    145a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    145e:	75 2c                	jne    148c <printf+0x6b>
      if(c == '%'){
    1460:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1464:	75 0c                	jne    1472 <printf+0x51>
        state = '%';
    1466:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    146d:	e9 4b 01 00 00       	jmp    15bd <printf+0x19c>
      } else {
        putc(fd, c);
    1472:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1475:	0f be c0             	movsbl %al,%eax
    1478:	89 44 24 04          	mov    %eax,0x4(%esp)
    147c:	8b 45 08             	mov    0x8(%ebp),%eax
    147f:	89 04 24             	mov    %eax,(%esp)
    1482:	e8 c1 fe ff ff       	call   1348 <putc>
    1487:	e9 31 01 00 00       	jmp    15bd <printf+0x19c>
      }
    } else if(state == '%'){
    148c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    1490:	0f 85 27 01 00 00    	jne    15bd <printf+0x19c>
      if(c == 'd'){
    1496:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    149a:	75 2d                	jne    14c9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    149c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    149f:	8b 00                	mov    (%eax),%eax
    14a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14a8:	00 
    14a9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    14b0:	00 
    14b1:	89 44 24 04          	mov    %eax,0x4(%esp)
    14b5:	8b 45 08             	mov    0x8(%ebp),%eax
    14b8:	89 04 24             	mov    %eax,(%esp)
    14bb:	e8 b0 fe ff ff       	call   1370 <printint>
        ap++;
    14c0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    14c4:	e9 ed 00 00 00       	jmp    15b6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    14c9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    14cd:	74 06                	je     14d5 <printf+0xb4>
    14cf:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    14d3:	75 2d                	jne    1502 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    14d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14d8:	8b 00                	mov    (%eax),%eax
    14da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    14e1:	00 
    14e2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    14e9:	00 
    14ea:	89 44 24 04          	mov    %eax,0x4(%esp)
    14ee:	8b 45 08             	mov    0x8(%ebp),%eax
    14f1:	89 04 24             	mov    %eax,(%esp)
    14f4:	e8 77 fe ff ff       	call   1370 <printint>
        ap++;
    14f9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14fd:	e9 b4 00 00 00       	jmp    15b6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1502:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1506:	75 46                	jne    154e <printf+0x12d>
        s = (char*)*ap;
    1508:	8b 45 f4             	mov    -0xc(%ebp),%eax
    150b:	8b 00                	mov    (%eax),%eax
    150d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1510:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1514:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1518:	75 27                	jne    1541 <printf+0x120>
          s = "(null)";
    151a:	c7 45 e4 2d 1a 00 00 	movl   $0x1a2d,-0x1c(%ebp)
        while(*s != 0){
    1521:	eb 1f                	jmp    1542 <printf+0x121>
          putc(fd, *s);
    1523:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1526:	0f b6 00             	movzbl (%eax),%eax
    1529:	0f be c0             	movsbl %al,%eax
    152c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1530:	8b 45 08             	mov    0x8(%ebp),%eax
    1533:	89 04 24             	mov    %eax,(%esp)
    1536:	e8 0d fe ff ff       	call   1348 <putc>
          s++;
    153b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    153f:	eb 01                	jmp    1542 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1541:	90                   	nop
    1542:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1545:	0f b6 00             	movzbl (%eax),%eax
    1548:	84 c0                	test   %al,%al
    154a:	75 d7                	jne    1523 <printf+0x102>
    154c:	eb 68                	jmp    15b6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    154e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1552:	75 1d                	jne    1571 <printf+0x150>
        putc(fd, *ap);
    1554:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1557:	8b 00                	mov    (%eax),%eax
    1559:	0f be c0             	movsbl %al,%eax
    155c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1560:	8b 45 08             	mov    0x8(%ebp),%eax
    1563:	89 04 24             	mov    %eax,(%esp)
    1566:	e8 dd fd ff ff       	call   1348 <putc>
        ap++;
    156b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    156f:	eb 45                	jmp    15b6 <printf+0x195>
      } else if(c == '%'){
    1571:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1575:	75 17                	jne    158e <printf+0x16d>
        putc(fd, c);
    1577:	8b 45 e8             	mov    -0x18(%ebp),%eax
    157a:	0f be c0             	movsbl %al,%eax
    157d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1581:	8b 45 08             	mov    0x8(%ebp),%eax
    1584:	89 04 24             	mov    %eax,(%esp)
    1587:	e8 bc fd ff ff       	call   1348 <putc>
    158c:	eb 28                	jmp    15b6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    158e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1595:	00 
    1596:	8b 45 08             	mov    0x8(%ebp),%eax
    1599:	89 04 24             	mov    %eax,(%esp)
    159c:	e8 a7 fd ff ff       	call   1348 <putc>
        putc(fd, c);
    15a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a4:	0f be c0             	movsbl %al,%eax
    15a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ab:	8b 45 08             	mov    0x8(%ebp),%eax
    15ae:	89 04 24             	mov    %eax,(%esp)
    15b1:	e8 92 fd ff ff       	call   1348 <putc>
      }
      state = 0;
    15b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    15c1:	8b 55 0c             	mov    0xc(%ebp),%edx
    15c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15c7:	8d 04 02             	lea    (%edx,%eax,1),%eax
    15ca:	0f b6 00             	movzbl (%eax),%eax
    15cd:	84 c0                	test   %al,%al
    15cf:	0f 85 6e fe ff ff    	jne    1443 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    15d5:	c9                   	leave  
    15d6:	c3                   	ret    
    15d7:	90                   	nop

000015d8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15d8:	55                   	push   %ebp
    15d9:	89 e5                	mov    %esp,%ebp
    15db:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15de:	8b 45 08             	mov    0x8(%ebp),%eax
    15e1:	83 e8 08             	sub    $0x8,%eax
    15e4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e7:	a1 7c 1a 00 00       	mov    0x1a7c,%eax
    15ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
    15ef:	eb 24                	jmp    1615 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    15f4:	8b 00                	mov    (%eax),%eax
    15f6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    15f9:	77 12                	ja     160d <free+0x35>
    15fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    15fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1601:	77 24                	ja     1627 <free+0x4f>
    1603:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1606:	8b 00                	mov    (%eax),%eax
    1608:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    160b:	77 1a                	ja     1627 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    160d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1610:	8b 00                	mov    (%eax),%eax
    1612:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1615:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1618:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    161b:	76 d4                	jbe    15f1 <free+0x19>
    161d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1620:	8b 00                	mov    (%eax),%eax
    1622:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1625:	76 ca                	jbe    15f1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1627:	8b 45 f8             	mov    -0x8(%ebp),%eax
    162a:	8b 40 04             	mov    0x4(%eax),%eax
    162d:	c1 e0 03             	shl    $0x3,%eax
    1630:	89 c2                	mov    %eax,%edx
    1632:	03 55 f8             	add    -0x8(%ebp),%edx
    1635:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1638:	8b 00                	mov    (%eax),%eax
    163a:	39 c2                	cmp    %eax,%edx
    163c:	75 24                	jne    1662 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    163e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1641:	8b 50 04             	mov    0x4(%eax),%edx
    1644:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1647:	8b 00                	mov    (%eax),%eax
    1649:	8b 40 04             	mov    0x4(%eax),%eax
    164c:	01 c2                	add    %eax,%edx
    164e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1651:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1654:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1657:	8b 00                	mov    (%eax),%eax
    1659:	8b 10                	mov    (%eax),%edx
    165b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    165e:	89 10                	mov    %edx,(%eax)
    1660:	eb 0a                	jmp    166c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1662:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1665:	8b 10                	mov    (%eax),%edx
    1667:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    166c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    166f:	8b 40 04             	mov    0x4(%eax),%eax
    1672:	c1 e0 03             	shl    $0x3,%eax
    1675:	03 45 fc             	add    -0x4(%ebp),%eax
    1678:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    167b:	75 20                	jne    169d <free+0xc5>
    p->s.size += bp->s.size;
    167d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1680:	8b 50 04             	mov    0x4(%eax),%edx
    1683:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1686:	8b 40 04             	mov    0x4(%eax),%eax
    1689:	01 c2                	add    %eax,%edx
    168b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    168e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1691:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1694:	8b 10                	mov    (%eax),%edx
    1696:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1699:	89 10                	mov    %edx,(%eax)
    169b:	eb 08                	jmp    16a5 <free+0xcd>
  } else
    p->s.ptr = bp;
    169d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16a3:	89 10                	mov    %edx,(%eax)
  freep = p;
    16a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a8:	a3 7c 1a 00 00       	mov    %eax,0x1a7c
}
    16ad:	c9                   	leave  
    16ae:	c3                   	ret    

000016af <morecore>:

static Header*
morecore(uint nu)
{
    16af:	55                   	push   %ebp
    16b0:	89 e5                	mov    %esp,%ebp
    16b2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    16b5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    16bc:	77 07                	ja     16c5 <morecore+0x16>
    nu = 4096;
    16be:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    16c5:	8b 45 08             	mov    0x8(%ebp),%eax
    16c8:	c1 e0 03             	shl    $0x3,%eax
    16cb:	89 04 24             	mov    %eax,(%esp)
    16ce:	e8 3d fc ff ff       	call   1310 <sbrk>
    16d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    16d6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    16da:	75 07                	jne    16e3 <morecore+0x34>
    return 0;
    16dc:	b8 00 00 00 00       	mov    $0x0,%eax
    16e1:	eb 22                	jmp    1705 <morecore+0x56>
  hp = (Header*)p;
    16e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    16e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16ec:	8b 55 08             	mov    0x8(%ebp),%edx
    16ef:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    16f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16f5:	83 c0 08             	add    $0x8,%eax
    16f8:	89 04 24             	mov    %eax,(%esp)
    16fb:	e8 d8 fe ff ff       	call   15d8 <free>
  return freep;
    1700:	a1 7c 1a 00 00       	mov    0x1a7c,%eax
}
    1705:	c9                   	leave  
    1706:	c3                   	ret    

00001707 <malloc>:

void*
malloc(uint nbytes)
{
    1707:	55                   	push   %ebp
    1708:	89 e5                	mov    %esp,%ebp
    170a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    170d:	8b 45 08             	mov    0x8(%ebp),%eax
    1710:	83 c0 07             	add    $0x7,%eax
    1713:	c1 e8 03             	shr    $0x3,%eax
    1716:	83 c0 01             	add    $0x1,%eax
    1719:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    171c:	a1 7c 1a 00 00       	mov    0x1a7c,%eax
    1721:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1724:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1728:	75 23                	jne    174d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    172a:	c7 45 f0 74 1a 00 00 	movl   $0x1a74,-0x10(%ebp)
    1731:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1734:	a3 7c 1a 00 00       	mov    %eax,0x1a7c
    1739:	a1 7c 1a 00 00       	mov    0x1a7c,%eax
    173e:	a3 74 1a 00 00       	mov    %eax,0x1a74
    base.s.size = 0;
    1743:	c7 05 78 1a 00 00 00 	movl   $0x0,0x1a78
    174a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    174d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1750:	8b 00                	mov    (%eax),%eax
    1752:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1755:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1758:	8b 40 04             	mov    0x4(%eax),%eax
    175b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    175e:	72 4d                	jb     17ad <malloc+0xa6>
      if(p->s.size == nunits)
    1760:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1763:	8b 40 04             	mov    0x4(%eax),%eax
    1766:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1769:	75 0c                	jne    1777 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    176b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    176e:	8b 10                	mov    (%eax),%edx
    1770:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1773:	89 10                	mov    %edx,(%eax)
    1775:	eb 26                	jmp    179d <malloc+0x96>
      else {
        p->s.size -= nunits;
    1777:	8b 45 ec             	mov    -0x14(%ebp),%eax
    177a:	8b 40 04             	mov    0x4(%eax),%eax
    177d:	89 c2                	mov    %eax,%edx
    177f:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1782:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1785:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1788:	8b 45 ec             	mov    -0x14(%ebp),%eax
    178b:	8b 40 04             	mov    0x4(%eax),%eax
    178e:	c1 e0 03             	shl    $0x3,%eax
    1791:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1794:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1797:	8b 55 f4             	mov    -0xc(%ebp),%edx
    179a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    179d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17a0:	a3 7c 1a 00 00       	mov    %eax,0x1a7c
      return (void*)(p + 1);
    17a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17a8:	83 c0 08             	add    $0x8,%eax
    17ab:	eb 38                	jmp    17e5 <malloc+0xde>
    }
    if(p == freep)
    17ad:	a1 7c 1a 00 00       	mov    0x1a7c,%eax
    17b2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    17b5:	75 1b                	jne    17d2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    17b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17ba:	89 04 24             	mov    %eax,(%esp)
    17bd:	e8 ed fe ff ff       	call   16af <morecore>
    17c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    17c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    17c9:	75 07                	jne    17d2 <malloc+0xcb>
        return 0;
    17cb:	b8 00 00 00 00       	mov    $0x0,%eax
    17d0:	eb 13                	jmp    17e5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17db:	8b 00                	mov    (%eax),%eax
    17dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    17e0:	e9 70 ff ff ff       	jmp    1755 <malloc+0x4e>
}
    17e5:	c9                   	leave  
    17e6:	c3                   	ret    
    17e7:	90                   	nop

000017e8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    17e8:	55                   	push   %ebp
    17e9:	89 e5                	mov    %esp,%ebp
    17eb:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17ee:	8b 55 08             	mov    0x8(%ebp),%edx
    17f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    17f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
    17f7:	f0 87 02             	lock xchg %eax,(%edx)
    17fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    17fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1800:	c9                   	leave  
    1801:	c3                   	ret    

00001802 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1802:	55                   	push   %ebp
    1803:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1805:	8b 45 08             	mov    0x8(%ebp),%eax
    1808:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    180e:	5d                   	pop    %ebp
    180f:	c3                   	ret    

00001810 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1810:	55                   	push   %ebp
    1811:	89 e5                	mov    %esp,%ebp
    1813:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1816:	8b 45 08             	mov    0x8(%ebp),%eax
    1819:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1820:	00 
    1821:	89 04 24             	mov    %eax,(%esp)
    1824:	e8 bf ff ff ff       	call   17e8 <xchg>
    1829:	85 c0                	test   %eax,%eax
    182b:	75 e9                	jne    1816 <lock_acquire+0x6>
}
    182d:	c9                   	leave  
    182e:	c3                   	ret    

0000182f <lock_release>:
void lock_release(lock_t *lock){
    182f:	55                   	push   %ebp
    1830:	89 e5                	mov    %esp,%ebp
    1832:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1835:	8b 45 08             	mov    0x8(%ebp),%eax
    1838:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    183f:	00 
    1840:	89 04 24             	mov    %eax,(%esp)
    1843:	e8 a0 ff ff ff       	call   17e8 <xchg>
}
    1848:	c9                   	leave  
    1849:	c3                   	ret    

0000184a <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    184a:	55                   	push   %ebp
    184b:	89 e5                	mov    %esp,%ebp
    184d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1850:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1857:	e8 ab fe ff ff       	call   1707 <malloc>
    185c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    185f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1862:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1865:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1868:	25 ff 0f 00 00       	and    $0xfff,%eax
    186d:	85 c0                	test   %eax,%eax
    186f:	74 15                	je     1886 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1871:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1874:	89 c2                	mov    %eax,%edx
    1876:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    187c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1881:	29 d0                	sub    %edx,%eax
    1883:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1886:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    188a:	75 1b                	jne    18a7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    188c:	c7 44 24 04 34 1a 00 	movl   $0x1a34,0x4(%esp)
    1893:	00 
    1894:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    189b:	e8 81 fb ff ff       	call   1421 <printf>
        return 0;
    18a0:	b8 00 00 00 00       	mov    $0x0,%eax
    18a5:	eb 6f                	jmp    1916 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    18aa:	8b 55 08             	mov    0x8(%ebp),%edx
    18ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    18b4:	89 54 24 08          	mov    %edx,0x8(%esp)
    18b8:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    18bf:	00 
    18c0:	89 04 24             	mov    %eax,(%esp)
    18c3:	e8 60 fa ff ff       	call   1328 <clone>
    18c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    18cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18cf:	79 1b                	jns    18ec <thread_create+0xa2>
        printf(1,"clone fails\n");
    18d1:	c7 44 24 04 42 1a 00 	movl   $0x1a42,0x4(%esp)
    18d8:	00 
    18d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18e0:	e8 3c fb ff ff       	call   1421 <printf>
        return 0;
    18e5:	b8 00 00 00 00       	mov    $0x0,%eax
    18ea:	eb 2a                	jmp    1916 <thread_create+0xcc>
    }
    if(tid > 0){
    18ec:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18f0:	7e 05                	jle    18f7 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    18f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18f5:	eb 1f                	jmp    1916 <thread_create+0xcc>
    }
    if(tid == 0){
    18f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18fb:	75 14                	jne    1911 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    18fd:	c7 44 24 04 4f 1a 00 	movl   $0x1a4f,0x4(%esp)
    1904:	00 
    1905:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    190c:	e8 10 fb ff ff       	call   1421 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1911:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1916:	c9                   	leave  
    1917:	c3                   	ret    

00001918 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1918:	55                   	push   %ebp
    1919:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    191b:	8b 45 08             	mov    0x8(%ebp),%eax
    191e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1924:	8b 45 08             	mov    0x8(%ebp),%eax
    1927:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    192e:	8b 45 08             	mov    0x8(%ebp),%eax
    1931:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1938:	5d                   	pop    %ebp
    1939:	c3                   	ret    

0000193a <add_q>:

void add_q(struct queue *q, int v){
    193a:	55                   	push   %ebp
    193b:	89 e5                	mov    %esp,%ebp
    193d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1940:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1947:	e8 bb fd ff ff       	call   1707 <malloc>
    194c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    194f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1952:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1959:	8b 45 f4             	mov    -0xc(%ebp),%eax
    195c:	8b 55 0c             	mov    0xc(%ebp),%edx
    195f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1961:	8b 45 08             	mov    0x8(%ebp),%eax
    1964:	8b 40 04             	mov    0x4(%eax),%eax
    1967:	85 c0                	test   %eax,%eax
    1969:	75 0b                	jne    1976 <add_q+0x3c>
        q->head = n;
    196b:	8b 45 08             	mov    0x8(%ebp),%eax
    196e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1971:	89 50 04             	mov    %edx,0x4(%eax)
    1974:	eb 0c                	jmp    1982 <add_q+0x48>
    }else{
        q->tail->next = n;
    1976:	8b 45 08             	mov    0x8(%ebp),%eax
    1979:	8b 40 08             	mov    0x8(%eax),%eax
    197c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    197f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1982:	8b 45 08             	mov    0x8(%ebp),%eax
    1985:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1988:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    198b:	8b 45 08             	mov    0x8(%ebp),%eax
    198e:	8b 00                	mov    (%eax),%eax
    1990:	8d 50 01             	lea    0x1(%eax),%edx
    1993:	8b 45 08             	mov    0x8(%ebp),%eax
    1996:	89 10                	mov    %edx,(%eax)
}
    1998:	c9                   	leave  
    1999:	c3                   	ret    

0000199a <empty_q>:

int empty_q(struct queue *q){
    199a:	55                   	push   %ebp
    199b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    199d:	8b 45 08             	mov    0x8(%ebp),%eax
    19a0:	8b 00                	mov    (%eax),%eax
    19a2:	85 c0                	test   %eax,%eax
    19a4:	75 07                	jne    19ad <empty_q+0x13>
        return 1;
    19a6:	b8 01 00 00 00       	mov    $0x1,%eax
    19ab:	eb 05                	jmp    19b2 <empty_q+0x18>
    else
        return 0;
    19ad:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    19b2:	5d                   	pop    %ebp
    19b3:	c3                   	ret    

000019b4 <pop_q>:
int pop_q(struct queue *q){
    19b4:	55                   	push   %ebp
    19b5:	89 e5                	mov    %esp,%ebp
    19b7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    19ba:	8b 45 08             	mov    0x8(%ebp),%eax
    19bd:	89 04 24             	mov    %eax,(%esp)
    19c0:	e8 d5 ff ff ff       	call   199a <empty_q>
    19c5:	85 c0                	test   %eax,%eax
    19c7:	75 5d                	jne    1a26 <pop_q+0x72>
       val = q->head->value; 
    19c9:	8b 45 08             	mov    0x8(%ebp),%eax
    19cc:	8b 40 04             	mov    0x4(%eax),%eax
    19cf:	8b 00                	mov    (%eax),%eax
    19d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    19d4:	8b 45 08             	mov    0x8(%ebp),%eax
    19d7:	8b 40 04             	mov    0x4(%eax),%eax
    19da:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    19dd:	8b 45 08             	mov    0x8(%ebp),%eax
    19e0:	8b 40 04             	mov    0x4(%eax),%eax
    19e3:	8b 50 04             	mov    0x4(%eax),%edx
    19e6:	8b 45 08             	mov    0x8(%ebp),%eax
    19e9:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    19ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ef:	89 04 24             	mov    %eax,(%esp)
    19f2:	e8 e1 fb ff ff       	call   15d8 <free>
       q->size--;
    19f7:	8b 45 08             	mov    0x8(%ebp),%eax
    19fa:	8b 00                	mov    (%eax),%eax
    19fc:	8d 50 ff             	lea    -0x1(%eax),%edx
    19ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1a02:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a04:	8b 45 08             	mov    0x8(%ebp),%eax
    1a07:	8b 00                	mov    (%eax),%eax
    1a09:	85 c0                	test   %eax,%eax
    1a0b:	75 14                	jne    1a21 <pop_q+0x6d>
            q->head = 0;
    1a0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a10:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a17:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a21:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a24:	eb 05                	jmp    1a2b <pop_q+0x77>
    }
    return -1;
    1a26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a2b:	c9                   	leave  
    1a2c:	c3                   	ret    
