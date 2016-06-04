
_ln:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
    1009:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    100d:	74 19                	je     1028 <main+0x28>
    printf(2, "Usage: ln old new\n");
    100f:	c7 44 24 04 85 1a 00 	movl   $0x1a85,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    101e:	e8 56 04 00 00       	call   1479 <printf>
    exit();
    1023:	e8 b8 02 00 00       	call   12e0 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
    1028:	8b 45 0c             	mov    0xc(%ebp),%eax
    102b:	83 c0 08             	add    $0x8,%eax
    102e:	8b 10                	mov    (%eax),%edx
    1030:	8b 45 0c             	mov    0xc(%ebp),%eax
    1033:	83 c0 04             	add    $0x4,%eax
    1036:	8b 00                	mov    (%eax),%eax
    1038:	89 54 24 04          	mov    %edx,0x4(%esp)
    103c:	89 04 24             	mov    %eax,(%esp)
    103f:	e8 fc 02 00 00       	call   1340 <link>
    1044:	85 c0                	test   %eax,%eax
    1046:	79 2c                	jns    1074 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
    1048:	8b 45 0c             	mov    0xc(%ebp),%eax
    104b:	83 c0 08             	add    $0x8,%eax
    104e:	8b 10                	mov    (%eax),%edx
    1050:	8b 45 0c             	mov    0xc(%ebp),%eax
    1053:	83 c0 04             	add    $0x4,%eax
    1056:	8b 00                	mov    (%eax),%eax
    1058:	89 54 24 0c          	mov    %edx,0xc(%esp)
    105c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1060:	c7 44 24 04 98 1a 00 	movl   $0x1a98,0x4(%esp)
    1067:	00 
    1068:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    106f:	e8 05 04 00 00       	call   1479 <printf>
  exit();
    1074:	e8 67 02 00 00       	call   12e0 <exit>
    1079:	90                   	nop
    107a:	90                   	nop
    107b:	90                   	nop

0000107c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    107c:	55                   	push   %ebp
    107d:	89 e5                	mov    %esp,%ebp
    107f:	57                   	push   %edi
    1080:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1081:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1084:	8b 55 10             	mov    0x10(%ebp),%edx
    1087:	8b 45 0c             	mov    0xc(%ebp),%eax
    108a:	89 cb                	mov    %ecx,%ebx
    108c:	89 df                	mov    %ebx,%edi
    108e:	89 d1                	mov    %edx,%ecx
    1090:	fc                   	cld    
    1091:	f3 aa                	rep stos %al,%es:(%edi)
    1093:	89 ca                	mov    %ecx,%edx
    1095:	89 fb                	mov    %edi,%ebx
    1097:	89 5d 08             	mov    %ebx,0x8(%ebp)
    109a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    109d:	5b                   	pop    %ebx
    109e:	5f                   	pop    %edi
    109f:	5d                   	pop    %ebp
    10a0:	c3                   	ret    

000010a1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10a1:	55                   	push   %ebp
    10a2:	89 e5                	mov    %esp,%ebp
    10a4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10a7:	8b 45 08             	mov    0x8(%ebp),%eax
    10aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b0:	0f b6 10             	movzbl (%eax),%edx
    10b3:	8b 45 08             	mov    0x8(%ebp),%eax
    10b6:	88 10                	mov    %dl,(%eax)
    10b8:	8b 45 08             	mov    0x8(%ebp),%eax
    10bb:	0f b6 00             	movzbl (%eax),%eax
    10be:	84 c0                	test   %al,%al
    10c0:	0f 95 c0             	setne  %al
    10c3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10c7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    10cb:	84 c0                	test   %al,%al
    10cd:	75 de                	jne    10ad <strcpy+0xc>
    ;
  return os;
    10cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10d2:	c9                   	leave  
    10d3:	c3                   	ret    

000010d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10d4:	55                   	push   %ebp
    10d5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10d7:	eb 08                	jmp    10e1 <strcmp+0xd>
    p++, q++;
    10d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10dd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10e1:	8b 45 08             	mov    0x8(%ebp),%eax
    10e4:	0f b6 00             	movzbl (%eax),%eax
    10e7:	84 c0                	test   %al,%al
    10e9:	74 10                	je     10fb <strcmp+0x27>
    10eb:	8b 45 08             	mov    0x8(%ebp),%eax
    10ee:	0f b6 10             	movzbl (%eax),%edx
    10f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f4:	0f b6 00             	movzbl (%eax),%eax
    10f7:	38 c2                	cmp    %al,%dl
    10f9:	74 de                	je     10d9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10fb:	8b 45 08             	mov    0x8(%ebp),%eax
    10fe:	0f b6 00             	movzbl (%eax),%eax
    1101:	0f b6 d0             	movzbl %al,%edx
    1104:	8b 45 0c             	mov    0xc(%ebp),%eax
    1107:	0f b6 00             	movzbl (%eax),%eax
    110a:	0f b6 c0             	movzbl %al,%eax
    110d:	89 d1                	mov    %edx,%ecx
    110f:	29 c1                	sub    %eax,%ecx
    1111:	89 c8                	mov    %ecx,%eax
}
    1113:	5d                   	pop    %ebp
    1114:	c3                   	ret    

00001115 <strlen>:

uint
strlen(char *s)
{
    1115:	55                   	push   %ebp
    1116:	89 e5                	mov    %esp,%ebp
    1118:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    111b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1122:	eb 04                	jmp    1128 <strlen+0x13>
    1124:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1128:	8b 45 fc             	mov    -0x4(%ebp),%eax
    112b:	03 45 08             	add    0x8(%ebp),%eax
    112e:	0f b6 00             	movzbl (%eax),%eax
    1131:	84 c0                	test   %al,%al
    1133:	75 ef                	jne    1124 <strlen+0xf>
    ;
  return n;
    1135:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1138:	c9                   	leave  
    1139:	c3                   	ret    

0000113a <memset>:

void*
memset(void *dst, int c, uint n)
{
    113a:	55                   	push   %ebp
    113b:	89 e5                	mov    %esp,%ebp
    113d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1140:	8b 45 10             	mov    0x10(%ebp),%eax
    1143:	89 44 24 08          	mov    %eax,0x8(%esp)
    1147:	8b 45 0c             	mov    0xc(%ebp),%eax
    114a:	89 44 24 04          	mov    %eax,0x4(%esp)
    114e:	8b 45 08             	mov    0x8(%ebp),%eax
    1151:	89 04 24             	mov    %eax,(%esp)
    1154:	e8 23 ff ff ff       	call   107c <stosb>
  return dst;
    1159:	8b 45 08             	mov    0x8(%ebp),%eax
}
    115c:	c9                   	leave  
    115d:	c3                   	ret    

0000115e <strchr>:

char*
strchr(const char *s, char c)
{
    115e:	55                   	push   %ebp
    115f:	89 e5                	mov    %esp,%ebp
    1161:	83 ec 04             	sub    $0x4,%esp
    1164:	8b 45 0c             	mov    0xc(%ebp),%eax
    1167:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    116a:	eb 14                	jmp    1180 <strchr+0x22>
    if(*s == c)
    116c:	8b 45 08             	mov    0x8(%ebp),%eax
    116f:	0f b6 00             	movzbl (%eax),%eax
    1172:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1175:	75 05                	jne    117c <strchr+0x1e>
      return (char*)s;
    1177:	8b 45 08             	mov    0x8(%ebp),%eax
    117a:	eb 13                	jmp    118f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    117c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1180:	8b 45 08             	mov    0x8(%ebp),%eax
    1183:	0f b6 00             	movzbl (%eax),%eax
    1186:	84 c0                	test   %al,%al
    1188:	75 e2                	jne    116c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    118a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    118f:	c9                   	leave  
    1190:	c3                   	ret    

00001191 <gets>:

char*
gets(char *buf, int max)
{
    1191:	55                   	push   %ebp
    1192:	89 e5                	mov    %esp,%ebp
    1194:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1197:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    119e:	eb 44                	jmp    11e4 <gets+0x53>
    cc = read(0, &c, 1);
    11a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11a7:	00 
    11a8:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    11af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11b6:	e8 3d 01 00 00       	call   12f8 <read>
    11bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    11be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11c2:	7e 2d                	jle    11f1 <gets+0x60>
      break;
    buf[i++] = c;
    11c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11c7:	03 45 08             	add    0x8(%ebp),%eax
    11ca:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    11ce:	88 10                	mov    %dl,(%eax)
    11d0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    11d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11d8:	3c 0a                	cmp    $0xa,%al
    11da:	74 16                	je     11f2 <gets+0x61>
    11dc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11e0:	3c 0d                	cmp    $0xd,%al
    11e2:	74 0e                	je     11f2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e7:	83 c0 01             	add    $0x1,%eax
    11ea:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11ed:	7c b1                	jl     11a0 <gets+0xf>
    11ef:	eb 01                	jmp    11f2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    11f1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11f5:	03 45 08             	add    0x8(%ebp),%eax
    11f8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11fb:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11fe:	c9                   	leave  
    11ff:	c3                   	ret    

00001200 <stat>:

int
stat(char *n, struct stat *st)
{
    1200:	55                   	push   %ebp
    1201:	89 e5                	mov    %esp,%ebp
    1203:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1206:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    120d:	00 
    120e:	8b 45 08             	mov    0x8(%ebp),%eax
    1211:	89 04 24             	mov    %eax,(%esp)
    1214:	e8 07 01 00 00       	call   1320 <open>
    1219:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    121c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1220:	79 07                	jns    1229 <stat+0x29>
    return -1;
    1222:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1227:	eb 23                	jmp    124c <stat+0x4c>
  r = fstat(fd, st);
    1229:	8b 45 0c             	mov    0xc(%ebp),%eax
    122c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1230:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1233:	89 04 24             	mov    %eax,(%esp)
    1236:	e8 fd 00 00 00       	call   1338 <fstat>
    123b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    123e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1241:	89 04 24             	mov    %eax,(%esp)
    1244:	e8 bf 00 00 00       	call   1308 <close>
  return r;
    1249:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    124c:	c9                   	leave  
    124d:	c3                   	ret    

0000124e <atoi>:

int
atoi(const char *s)
{
    124e:	55                   	push   %ebp
    124f:	89 e5                	mov    %esp,%ebp
    1251:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1254:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    125b:	eb 24                	jmp    1281 <atoi+0x33>
    n = n*10 + *s++ - '0';
    125d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1260:	89 d0                	mov    %edx,%eax
    1262:	c1 e0 02             	shl    $0x2,%eax
    1265:	01 d0                	add    %edx,%eax
    1267:	01 c0                	add    %eax,%eax
    1269:	89 c2                	mov    %eax,%edx
    126b:	8b 45 08             	mov    0x8(%ebp),%eax
    126e:	0f b6 00             	movzbl (%eax),%eax
    1271:	0f be c0             	movsbl %al,%eax
    1274:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1277:	83 e8 30             	sub    $0x30,%eax
    127a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    127d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1281:	8b 45 08             	mov    0x8(%ebp),%eax
    1284:	0f b6 00             	movzbl (%eax),%eax
    1287:	3c 2f                	cmp    $0x2f,%al
    1289:	7e 0a                	jle    1295 <atoi+0x47>
    128b:	8b 45 08             	mov    0x8(%ebp),%eax
    128e:	0f b6 00             	movzbl (%eax),%eax
    1291:	3c 39                	cmp    $0x39,%al
    1293:	7e c8                	jle    125d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1295:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1298:	c9                   	leave  
    1299:	c3                   	ret    

0000129a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    129a:	55                   	push   %ebp
    129b:	89 e5                	mov    %esp,%ebp
    129d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12a0:	8b 45 08             	mov    0x8(%ebp),%eax
    12a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    12a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    12ac:	eb 13                	jmp    12c1 <memmove+0x27>
    *dst++ = *src++;
    12ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12b1:	0f b6 10             	movzbl (%eax),%edx
    12b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12b7:	88 10                	mov    %dl,(%eax)
    12b9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    12bd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12c1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    12c5:	0f 9f c0             	setg   %al
    12c8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    12cc:	84 c0                	test   %al,%al
    12ce:	75 de                	jne    12ae <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12d0:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12d3:	c9                   	leave  
    12d4:	c3                   	ret    
    12d5:	90                   	nop
    12d6:	90                   	nop
    12d7:	90                   	nop

000012d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12d8:	b8 01 00 00 00       	mov    $0x1,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <exit>:
SYSCALL(exit)
    12e0:	b8 02 00 00 00       	mov    $0x2,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <wait>:
SYSCALL(wait)
    12e8:	b8 03 00 00 00       	mov    $0x3,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <pipe>:
SYSCALL(pipe)
    12f0:	b8 04 00 00 00       	mov    $0x4,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <read>:
SYSCALL(read)
    12f8:	b8 05 00 00 00       	mov    $0x5,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <write>:
SYSCALL(write)
    1300:	b8 10 00 00 00       	mov    $0x10,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <close>:
SYSCALL(close)
    1308:	b8 15 00 00 00       	mov    $0x15,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <kill>:
SYSCALL(kill)
    1310:	b8 06 00 00 00       	mov    $0x6,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <exec>:
SYSCALL(exec)
    1318:	b8 07 00 00 00       	mov    $0x7,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <open>:
SYSCALL(open)
    1320:	b8 0f 00 00 00       	mov    $0xf,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <mknod>:
SYSCALL(mknod)
    1328:	b8 11 00 00 00       	mov    $0x11,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <unlink>:
SYSCALL(unlink)
    1330:	b8 12 00 00 00       	mov    $0x12,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <fstat>:
SYSCALL(fstat)
    1338:	b8 08 00 00 00       	mov    $0x8,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <link>:
SYSCALL(link)
    1340:	b8 13 00 00 00       	mov    $0x13,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <mkdir>:
SYSCALL(mkdir)
    1348:	b8 14 00 00 00       	mov    $0x14,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <chdir>:
SYSCALL(chdir)
    1350:	b8 09 00 00 00       	mov    $0x9,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <dup>:
SYSCALL(dup)
    1358:	b8 0a 00 00 00       	mov    $0xa,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <getpid>:
SYSCALL(getpid)
    1360:	b8 0b 00 00 00       	mov    $0xb,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <sbrk>:
SYSCALL(sbrk)
    1368:	b8 0c 00 00 00       	mov    $0xc,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <sleep>:
SYSCALL(sleep)
    1370:	b8 0d 00 00 00       	mov    $0xd,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <uptime>:
SYSCALL(uptime)
    1378:	b8 0e 00 00 00       	mov    $0xe,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <clone>:
SYSCALL(clone)
    1380:	b8 16 00 00 00       	mov    $0x16,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <texit>:
SYSCALL(texit)
    1388:	b8 17 00 00 00       	mov    $0x17,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <tsleep>:
SYSCALL(tsleep)
    1390:	b8 18 00 00 00       	mov    $0x18,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <twakeup>:
SYSCALL(twakeup)
    1398:	b8 19 00 00 00       	mov    $0x19,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13a0:	55                   	push   %ebp
    13a1:	89 e5                	mov    %esp,%ebp
    13a3:	83 ec 28             	sub    $0x28,%esp
    13a6:	8b 45 0c             	mov    0xc(%ebp),%eax
    13a9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13ac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13b3:	00 
    13b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    13bb:	8b 45 08             	mov    0x8(%ebp),%eax
    13be:	89 04 24             	mov    %eax,(%esp)
    13c1:	e8 3a ff ff ff       	call   1300 <write>
}
    13c6:	c9                   	leave  
    13c7:	c3                   	ret    

000013c8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13c8:	55                   	push   %ebp
    13c9:	89 e5                	mov    %esp,%ebp
    13cb:	53                   	push   %ebx
    13cc:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13d6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13da:	74 17                	je     13f3 <printint+0x2b>
    13dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13e0:	79 11                	jns    13f3 <printint+0x2b>
    neg = 1;
    13e2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ec:	f7 d8                	neg    %eax
    13ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13f1:	eb 06                	jmp    13f9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    13f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    13f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1400:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1403:	8b 5d 10             	mov    0x10(%ebp),%ebx
    1406:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1409:	ba 00 00 00 00       	mov    $0x0,%edx
    140e:	f7 f3                	div    %ebx
    1410:	89 d0                	mov    %edx,%eax
    1412:	0f b6 80 e0 1a 00 00 	movzbl 0x1ae0(%eax),%eax
    1419:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    141d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1421:	8b 45 10             	mov    0x10(%ebp),%eax
    1424:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1427:	8b 45 f4             	mov    -0xc(%ebp),%eax
    142a:	ba 00 00 00 00       	mov    $0x0,%edx
    142f:	f7 75 d4             	divl   -0x2c(%ebp)
    1432:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1435:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1439:	75 c5                	jne    1400 <printint+0x38>
  if(neg)
    143b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    143f:	74 28                	je     1469 <printint+0xa1>
    buf[i++] = '-';
    1441:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1444:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1449:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    144d:	eb 1a                	jmp    1469 <printint+0xa1>
    putc(fd, buf[i]);
    144f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1452:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    1457:	0f be c0             	movsbl %al,%eax
    145a:	89 44 24 04          	mov    %eax,0x4(%esp)
    145e:	8b 45 08             	mov    0x8(%ebp),%eax
    1461:	89 04 24             	mov    %eax,(%esp)
    1464:	e8 37 ff ff ff       	call   13a0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1469:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    146d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1471:	79 dc                	jns    144f <printint+0x87>
    putc(fd, buf[i]);
}
    1473:	83 c4 44             	add    $0x44,%esp
    1476:	5b                   	pop    %ebx
    1477:	5d                   	pop    %ebp
    1478:	c3                   	ret    

00001479 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1479:	55                   	push   %ebp
    147a:	89 e5                	mov    %esp,%ebp
    147c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    147f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1486:	8d 45 0c             	lea    0xc(%ebp),%eax
    1489:	83 c0 04             	add    $0x4,%eax
    148c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    148f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1496:	e9 7e 01 00 00       	jmp    1619 <printf+0x1a0>
    c = fmt[i] & 0xff;
    149b:	8b 55 0c             	mov    0xc(%ebp),%edx
    149e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a1:	8d 04 02             	lea    (%edx,%eax,1),%eax
    14a4:	0f b6 00             	movzbl (%eax),%eax
    14a7:	0f be c0             	movsbl %al,%eax
    14aa:	25 ff 00 00 00       	and    $0xff,%eax
    14af:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    14b2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14b6:	75 2c                	jne    14e4 <printf+0x6b>
      if(c == '%'){
    14b8:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    14bc:	75 0c                	jne    14ca <printf+0x51>
        state = '%';
    14be:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    14c5:	e9 4b 01 00 00       	jmp    1615 <printf+0x19c>
      } else {
        putc(fd, c);
    14ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14cd:	0f be c0             	movsbl %al,%eax
    14d0:	89 44 24 04          	mov    %eax,0x4(%esp)
    14d4:	8b 45 08             	mov    0x8(%ebp),%eax
    14d7:	89 04 24             	mov    %eax,(%esp)
    14da:	e8 c1 fe ff ff       	call   13a0 <putc>
    14df:	e9 31 01 00 00       	jmp    1615 <printf+0x19c>
      }
    } else if(state == '%'){
    14e4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    14e8:	0f 85 27 01 00 00    	jne    1615 <printf+0x19c>
      if(c == 'd'){
    14ee:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    14f2:	75 2d                	jne    1521 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    14f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14f7:	8b 00                	mov    (%eax),%eax
    14f9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1500:	00 
    1501:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1508:	00 
    1509:	89 44 24 04          	mov    %eax,0x4(%esp)
    150d:	8b 45 08             	mov    0x8(%ebp),%eax
    1510:	89 04 24             	mov    %eax,(%esp)
    1513:	e8 b0 fe ff ff       	call   13c8 <printint>
        ap++;
    1518:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    151c:	e9 ed 00 00 00       	jmp    160e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1521:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1525:	74 06                	je     152d <printf+0xb4>
    1527:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    152b:	75 2d                	jne    155a <printf+0xe1>
        printint(fd, *ap, 16, 0);
    152d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1530:	8b 00                	mov    (%eax),%eax
    1532:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1539:	00 
    153a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1541:	00 
    1542:	89 44 24 04          	mov    %eax,0x4(%esp)
    1546:	8b 45 08             	mov    0x8(%ebp),%eax
    1549:	89 04 24             	mov    %eax,(%esp)
    154c:	e8 77 fe ff ff       	call   13c8 <printint>
        ap++;
    1551:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1555:	e9 b4 00 00 00       	jmp    160e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    155a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    155e:	75 46                	jne    15a6 <printf+0x12d>
        s = (char*)*ap;
    1560:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1563:	8b 00                	mov    (%eax),%eax
    1565:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1568:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    156c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1570:	75 27                	jne    1599 <printf+0x120>
          s = "(null)";
    1572:	c7 45 e4 ac 1a 00 00 	movl   $0x1aac,-0x1c(%ebp)
        while(*s != 0){
    1579:	eb 1f                	jmp    159a <printf+0x121>
          putc(fd, *s);
    157b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    157e:	0f b6 00             	movzbl (%eax),%eax
    1581:	0f be c0             	movsbl %al,%eax
    1584:	89 44 24 04          	mov    %eax,0x4(%esp)
    1588:	8b 45 08             	mov    0x8(%ebp),%eax
    158b:	89 04 24             	mov    %eax,(%esp)
    158e:	e8 0d fe ff ff       	call   13a0 <putc>
          s++;
    1593:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1597:	eb 01                	jmp    159a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1599:	90                   	nop
    159a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    159d:	0f b6 00             	movzbl (%eax),%eax
    15a0:	84 c0                	test   %al,%al
    15a2:	75 d7                	jne    157b <printf+0x102>
    15a4:	eb 68                	jmp    160e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15a6:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    15aa:	75 1d                	jne    15c9 <printf+0x150>
        putc(fd, *ap);
    15ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15af:	8b 00                	mov    (%eax),%eax
    15b1:	0f be c0             	movsbl %al,%eax
    15b4:	89 44 24 04          	mov    %eax,0x4(%esp)
    15b8:	8b 45 08             	mov    0x8(%ebp),%eax
    15bb:	89 04 24             	mov    %eax,(%esp)
    15be:	e8 dd fd ff ff       	call   13a0 <putc>
        ap++;
    15c3:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    15c7:	eb 45                	jmp    160e <printf+0x195>
      } else if(c == '%'){
    15c9:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    15cd:	75 17                	jne    15e6 <printf+0x16d>
        putc(fd, c);
    15cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d2:	0f be c0             	movsbl %al,%eax
    15d5:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d9:	8b 45 08             	mov    0x8(%ebp),%eax
    15dc:	89 04 24             	mov    %eax,(%esp)
    15df:	e8 bc fd ff ff       	call   13a0 <putc>
    15e4:	eb 28                	jmp    160e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15e6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15ed:	00 
    15ee:	8b 45 08             	mov    0x8(%ebp),%eax
    15f1:	89 04 24             	mov    %eax,(%esp)
    15f4:	e8 a7 fd ff ff       	call   13a0 <putc>
        putc(fd, c);
    15f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15fc:	0f be c0             	movsbl %al,%eax
    15ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1603:	8b 45 08             	mov    0x8(%ebp),%eax
    1606:	89 04 24             	mov    %eax,(%esp)
    1609:	e8 92 fd ff ff       	call   13a0 <putc>
      }
      state = 0;
    160e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1615:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1619:	8b 55 0c             	mov    0xc(%ebp),%edx
    161c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    161f:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1622:	0f b6 00             	movzbl (%eax),%eax
    1625:	84 c0                	test   %al,%al
    1627:	0f 85 6e fe ff ff    	jne    149b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    162d:	c9                   	leave  
    162e:	c3                   	ret    
    162f:	90                   	nop

00001630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1630:	55                   	push   %ebp
    1631:	89 e5                	mov    %esp,%ebp
    1633:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1636:	8b 45 08             	mov    0x8(%ebp),%eax
    1639:	83 e8 08             	sub    $0x8,%eax
    163c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    163f:	a1 fc 1a 00 00       	mov    0x1afc,%eax
    1644:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1647:	eb 24                	jmp    166d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1649:	8b 45 fc             	mov    -0x4(%ebp),%eax
    164c:	8b 00                	mov    (%eax),%eax
    164e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1651:	77 12                	ja     1665 <free+0x35>
    1653:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1656:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1659:	77 24                	ja     167f <free+0x4f>
    165b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    165e:	8b 00                	mov    (%eax),%eax
    1660:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1663:	77 1a                	ja     167f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1665:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1668:	8b 00                	mov    (%eax),%eax
    166a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    166d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1670:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1673:	76 d4                	jbe    1649 <free+0x19>
    1675:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1678:	8b 00                	mov    (%eax),%eax
    167a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    167d:	76 ca                	jbe    1649 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    167f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1682:	8b 40 04             	mov    0x4(%eax),%eax
    1685:	c1 e0 03             	shl    $0x3,%eax
    1688:	89 c2                	mov    %eax,%edx
    168a:	03 55 f8             	add    -0x8(%ebp),%edx
    168d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1690:	8b 00                	mov    (%eax),%eax
    1692:	39 c2                	cmp    %eax,%edx
    1694:	75 24                	jne    16ba <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    1696:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1699:	8b 50 04             	mov    0x4(%eax),%edx
    169c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169f:	8b 00                	mov    (%eax),%eax
    16a1:	8b 40 04             	mov    0x4(%eax),%eax
    16a4:	01 c2                	add    %eax,%edx
    16a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16af:	8b 00                	mov    (%eax),%eax
    16b1:	8b 10                	mov    (%eax),%edx
    16b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b6:	89 10                	mov    %edx,(%eax)
    16b8:	eb 0a                	jmp    16c4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    16ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16bd:	8b 10                	mov    (%eax),%edx
    16bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c7:	8b 40 04             	mov    0x4(%eax),%eax
    16ca:	c1 e0 03             	shl    $0x3,%eax
    16cd:	03 45 fc             	add    -0x4(%ebp),%eax
    16d0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16d3:	75 20                	jne    16f5 <free+0xc5>
    p->s.size += bp->s.size;
    16d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d8:	8b 50 04             	mov    0x4(%eax),%edx
    16db:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16de:	8b 40 04             	mov    0x4(%eax),%eax
    16e1:	01 c2                	add    %eax,%edx
    16e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ec:	8b 10                	mov    (%eax),%edx
    16ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f1:	89 10                	mov    %edx,(%eax)
    16f3:	eb 08                	jmp    16fd <free+0xcd>
  } else
    p->s.ptr = bp;
    16f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f8:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16fb:	89 10                	mov    %edx,(%eax)
  freep = p;
    16fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1700:	a3 fc 1a 00 00       	mov    %eax,0x1afc
}
    1705:	c9                   	leave  
    1706:	c3                   	ret    

00001707 <morecore>:

static Header*
morecore(uint nu)
{
    1707:	55                   	push   %ebp
    1708:	89 e5                	mov    %esp,%ebp
    170a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    170d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1714:	77 07                	ja     171d <morecore+0x16>
    nu = 4096;
    1716:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    171d:	8b 45 08             	mov    0x8(%ebp),%eax
    1720:	c1 e0 03             	shl    $0x3,%eax
    1723:	89 04 24             	mov    %eax,(%esp)
    1726:	e8 3d fc ff ff       	call   1368 <sbrk>
    172b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    172e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1732:	75 07                	jne    173b <morecore+0x34>
    return 0;
    1734:	b8 00 00 00 00       	mov    $0x0,%eax
    1739:	eb 22                	jmp    175d <morecore+0x56>
  hp = (Header*)p;
    173b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    173e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1741:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1744:	8b 55 08             	mov    0x8(%ebp),%edx
    1747:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    174a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    174d:	83 c0 08             	add    $0x8,%eax
    1750:	89 04 24             	mov    %eax,(%esp)
    1753:	e8 d8 fe ff ff       	call   1630 <free>
  return freep;
    1758:	a1 fc 1a 00 00       	mov    0x1afc,%eax
}
    175d:	c9                   	leave  
    175e:	c3                   	ret    

0000175f <malloc>:

void*
malloc(uint nbytes)
{
    175f:	55                   	push   %ebp
    1760:	89 e5                	mov    %esp,%ebp
    1762:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1765:	8b 45 08             	mov    0x8(%ebp),%eax
    1768:	83 c0 07             	add    $0x7,%eax
    176b:	c1 e8 03             	shr    $0x3,%eax
    176e:	83 c0 01             	add    $0x1,%eax
    1771:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1774:	a1 fc 1a 00 00       	mov    0x1afc,%eax
    1779:	89 45 f0             	mov    %eax,-0x10(%ebp)
    177c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1780:	75 23                	jne    17a5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1782:	c7 45 f0 f4 1a 00 00 	movl   $0x1af4,-0x10(%ebp)
    1789:	8b 45 f0             	mov    -0x10(%ebp),%eax
    178c:	a3 fc 1a 00 00       	mov    %eax,0x1afc
    1791:	a1 fc 1a 00 00       	mov    0x1afc,%eax
    1796:	a3 f4 1a 00 00       	mov    %eax,0x1af4
    base.s.size = 0;
    179b:	c7 05 f8 1a 00 00 00 	movl   $0x0,0x1af8
    17a2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17a8:	8b 00                	mov    (%eax),%eax
    17aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    17ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17b0:	8b 40 04             	mov    0x4(%eax),%eax
    17b3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17b6:	72 4d                	jb     1805 <malloc+0xa6>
      if(p->s.size == nunits)
    17b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17bb:	8b 40 04             	mov    0x4(%eax),%eax
    17be:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17c1:	75 0c                	jne    17cf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17c6:	8b 10                	mov    (%eax),%edx
    17c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17cb:	89 10                	mov    %edx,(%eax)
    17cd:	eb 26                	jmp    17f5 <malloc+0x96>
      else {
        p->s.size -= nunits;
    17cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17d2:	8b 40 04             	mov    0x4(%eax),%eax
    17d5:	89 c2                	mov    %eax,%edx
    17d7:	2b 55 f4             	sub    -0xc(%ebp),%edx
    17da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17dd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17e3:	8b 40 04             	mov    0x4(%eax),%eax
    17e6:	c1 e0 03             	shl    $0x3,%eax
    17e9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    17ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
    17f2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f8:	a3 fc 1a 00 00       	mov    %eax,0x1afc
      return (void*)(p + 1);
    17fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1800:	83 c0 08             	add    $0x8,%eax
    1803:	eb 38                	jmp    183d <malloc+0xde>
    }
    if(p == freep)
    1805:	a1 fc 1a 00 00       	mov    0x1afc,%eax
    180a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    180d:	75 1b                	jne    182a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    180f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1812:	89 04 24             	mov    %eax,(%esp)
    1815:	e8 ed fe ff ff       	call   1707 <morecore>
    181a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    181d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1821:	75 07                	jne    182a <malloc+0xcb>
        return 0;
    1823:	b8 00 00 00 00       	mov    $0x0,%eax
    1828:	eb 13                	jmp    183d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    182a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    182d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1830:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1833:	8b 00                	mov    (%eax),%eax
    1835:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1838:	e9 70 ff ff ff       	jmp    17ad <malloc+0x4e>
}
    183d:	c9                   	leave  
    183e:	c3                   	ret    
    183f:	90                   	nop

00001840 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1840:	55                   	push   %ebp
    1841:	89 e5                	mov    %esp,%ebp
    1843:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1846:	8b 55 08             	mov    0x8(%ebp),%edx
    1849:	8b 45 0c             	mov    0xc(%ebp),%eax
    184c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    184f:	f0 87 02             	lock xchg %eax,(%edx)
    1852:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1855:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1858:	c9                   	leave  
    1859:	c3                   	ret    

0000185a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    185a:	55                   	push   %ebp
    185b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    185d:	8b 45 08             	mov    0x8(%ebp),%eax
    1860:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1866:	5d                   	pop    %ebp
    1867:	c3                   	ret    

00001868 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1868:	55                   	push   %ebp
    1869:	89 e5                	mov    %esp,%ebp
    186b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    186e:	8b 45 08             	mov    0x8(%ebp),%eax
    1871:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1878:	00 
    1879:	89 04 24             	mov    %eax,(%esp)
    187c:	e8 bf ff ff ff       	call   1840 <xchg>
    1881:	85 c0                	test   %eax,%eax
    1883:	75 e9                	jne    186e <lock_acquire+0x6>
}
    1885:	c9                   	leave  
    1886:	c3                   	ret    

00001887 <lock_release>:
void lock_release(lock_t *lock){
    1887:	55                   	push   %ebp
    1888:	89 e5                	mov    %esp,%ebp
    188a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    188d:	8b 45 08             	mov    0x8(%ebp),%eax
    1890:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1897:	00 
    1898:	89 04 24             	mov    %eax,(%esp)
    189b:	e8 a0 ff ff ff       	call   1840 <xchg>
}
    18a0:	c9                   	leave  
    18a1:	c3                   	ret    

000018a2 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    18a2:	55                   	push   %ebp
    18a3:	89 e5                	mov    %esp,%ebp
    18a5:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18a8:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18af:	e8 ab fe ff ff       	call   175f <malloc>
    18b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    18b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18c0:	25 ff 0f 00 00       	and    $0xfff,%eax
    18c5:	85 c0                	test   %eax,%eax
    18c7:	74 15                	je     18de <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    18c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18cc:	89 c2                	mov    %eax,%edx
    18ce:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    18d4:	b8 00 10 00 00       	mov    $0x1000,%eax
    18d9:	29 d0                	sub    %edx,%eax
    18db:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    18de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18e2:	75 1b                	jne    18ff <thread_create+0x5d>

        printf(1,"malloc fail \n");
    18e4:	c7 44 24 04 b3 1a 00 	movl   $0x1ab3,0x4(%esp)
    18eb:	00 
    18ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f3:	e8 81 fb ff ff       	call   1479 <printf>
        return 0;
    18f8:	b8 00 00 00 00       	mov    $0x0,%eax
    18fd:	eb 6f                	jmp    196e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18ff:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1902:	8b 55 08             	mov    0x8(%ebp),%edx
    1905:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1908:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    190c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1910:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1917:	00 
    1918:	89 04 24             	mov    %eax,(%esp)
    191b:	e8 60 fa ff ff       	call   1380 <clone>
    1920:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1923:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1927:	79 1b                	jns    1944 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1929:	c7 44 24 04 c1 1a 00 	movl   $0x1ac1,0x4(%esp)
    1930:	00 
    1931:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1938:	e8 3c fb ff ff       	call   1479 <printf>
        return 0;
    193d:	b8 00 00 00 00       	mov    $0x0,%eax
    1942:	eb 2a                	jmp    196e <thread_create+0xcc>
    }
    if(tid > 0){
    1944:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1948:	7e 05                	jle    194f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    194a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    194d:	eb 1f                	jmp    196e <thread_create+0xcc>
    }
    if(tid == 0){
    194f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1953:	75 14                	jne    1969 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1955:	c7 44 24 04 ce 1a 00 	movl   $0x1ace,0x4(%esp)
    195c:	00 
    195d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1964:	e8 10 fb ff ff       	call   1479 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1969:	b8 00 00 00 00       	mov    $0x0,%eax
}
    196e:	c9                   	leave  
    196f:	c3                   	ret    

00001970 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1970:	55                   	push   %ebp
    1971:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1973:	8b 45 08             	mov    0x8(%ebp),%eax
    1976:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    197c:	8b 45 08             	mov    0x8(%ebp),%eax
    197f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1986:	8b 45 08             	mov    0x8(%ebp),%eax
    1989:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1990:	5d                   	pop    %ebp
    1991:	c3                   	ret    

00001992 <add_q>:

void add_q(struct queue *q, int v){
    1992:	55                   	push   %ebp
    1993:	89 e5                	mov    %esp,%ebp
    1995:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1998:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    199f:	e8 bb fd ff ff       	call   175f <malloc>
    19a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19aa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    19b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19b4:	8b 55 0c             	mov    0xc(%ebp),%edx
    19b7:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19b9:	8b 45 08             	mov    0x8(%ebp),%eax
    19bc:	8b 40 04             	mov    0x4(%eax),%eax
    19bf:	85 c0                	test   %eax,%eax
    19c1:	75 0b                	jne    19ce <add_q+0x3c>
        q->head = n;
    19c3:	8b 45 08             	mov    0x8(%ebp),%eax
    19c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19c9:	89 50 04             	mov    %edx,0x4(%eax)
    19cc:	eb 0c                	jmp    19da <add_q+0x48>
    }else{
        q->tail->next = n;
    19ce:	8b 45 08             	mov    0x8(%ebp),%eax
    19d1:	8b 40 08             	mov    0x8(%eax),%eax
    19d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19d7:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    19da:	8b 45 08             	mov    0x8(%ebp),%eax
    19dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19e0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    19e3:	8b 45 08             	mov    0x8(%ebp),%eax
    19e6:	8b 00                	mov    (%eax),%eax
    19e8:	8d 50 01             	lea    0x1(%eax),%edx
    19eb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ee:	89 10                	mov    %edx,(%eax)
}
    19f0:	c9                   	leave  
    19f1:	c3                   	ret    

000019f2 <empty_q>:

int empty_q(struct queue *q){
    19f2:	55                   	push   %ebp
    19f3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    19f5:	8b 45 08             	mov    0x8(%ebp),%eax
    19f8:	8b 00                	mov    (%eax),%eax
    19fa:	85 c0                	test   %eax,%eax
    19fc:	75 07                	jne    1a05 <empty_q+0x13>
        return 1;
    19fe:	b8 01 00 00 00       	mov    $0x1,%eax
    1a03:	eb 05                	jmp    1a0a <empty_q+0x18>
    else
        return 0;
    1a05:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a0a:	5d                   	pop    %ebp
    1a0b:	c3                   	ret    

00001a0c <pop_q>:
int pop_q(struct queue *q){
    1a0c:	55                   	push   %ebp
    1a0d:	89 e5                	mov    %esp,%ebp
    1a0f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a12:	8b 45 08             	mov    0x8(%ebp),%eax
    1a15:	89 04 24             	mov    %eax,(%esp)
    1a18:	e8 d5 ff ff ff       	call   19f2 <empty_q>
    1a1d:	85 c0                	test   %eax,%eax
    1a1f:	75 5d                	jne    1a7e <pop_q+0x72>
       val = q->head->value; 
    1a21:	8b 45 08             	mov    0x8(%ebp),%eax
    1a24:	8b 40 04             	mov    0x4(%eax),%eax
    1a27:	8b 00                	mov    (%eax),%eax
    1a29:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1a2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2f:	8b 40 04             	mov    0x4(%eax),%eax
    1a32:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1a35:	8b 45 08             	mov    0x8(%ebp),%eax
    1a38:	8b 40 04             	mov    0x4(%eax),%eax
    1a3b:	8b 50 04             	mov    0x4(%eax),%edx
    1a3e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a41:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a44:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a47:	89 04 24             	mov    %eax,(%esp)
    1a4a:	e8 e1 fb ff ff       	call   1630 <free>
       q->size--;
    1a4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a52:	8b 00                	mov    (%eax),%eax
    1a54:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5f:	8b 00                	mov    (%eax),%eax
    1a61:	85 c0                	test   %eax,%eax
    1a63:	75 14                	jne    1a79 <pop_q+0x6d>
            q->head = 0;
    1a65:	8b 45 08             	mov    0x8(%ebp),%eax
    1a68:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a6f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a72:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a7c:	eb 05                	jmp    1a83 <pop_q+0x77>
    }
    return -1;
    1a7e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a83:	c9                   	leave  
    1a84:	c3                   	ret    
