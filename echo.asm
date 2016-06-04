
_echo:     file format elf32-i386


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
    1006:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
    1009:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    1010:	00 
    1011:	eb 45                	jmp    1058 <main+0x58>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    1013:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1017:	83 c0 01             	add    $0x1,%eax
    101a:	3b 45 08             	cmp    0x8(%ebp),%eax
    101d:	7d 07                	jge    1026 <main+0x26>
    101f:	b8 71 1a 00 00       	mov    $0x1a71,%eax
    1024:	eb 05                	jmp    102b <main+0x2b>
    1026:	b8 73 1a 00 00       	mov    $0x1a73,%eax
    102b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    102f:	c1 e2 02             	shl    $0x2,%edx
    1032:	03 55 0c             	add    0xc(%ebp),%edx
    1035:	8b 12                	mov    (%edx),%edx
    1037:	89 44 24 0c          	mov    %eax,0xc(%esp)
    103b:	89 54 24 08          	mov    %edx,0x8(%esp)
    103f:	c7 44 24 04 75 1a 00 	movl   $0x1a75,0x4(%esp)
    1046:	00 
    1047:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    104e:	e8 12 04 00 00       	call   1465 <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
    1053:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1058:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    105c:	3b 45 08             	cmp    0x8(%ebp),%eax
    105f:	7c b2                	jl     1013 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
    1061:	e8 66 02 00 00       	call   12cc <exit>
    1066:	90                   	nop
    1067:	90                   	nop

00001068 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1068:	55                   	push   %ebp
    1069:	89 e5                	mov    %esp,%ebp
    106b:	57                   	push   %edi
    106c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    106d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1070:	8b 55 10             	mov    0x10(%ebp),%edx
    1073:	8b 45 0c             	mov    0xc(%ebp),%eax
    1076:	89 cb                	mov    %ecx,%ebx
    1078:	89 df                	mov    %ebx,%edi
    107a:	89 d1                	mov    %edx,%ecx
    107c:	fc                   	cld    
    107d:	f3 aa                	rep stos %al,%es:(%edi)
    107f:	89 ca                	mov    %ecx,%edx
    1081:	89 fb                	mov    %edi,%ebx
    1083:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1086:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1089:	5b                   	pop    %ebx
    108a:	5f                   	pop    %edi
    108b:	5d                   	pop    %ebp
    108c:	c3                   	ret    

0000108d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    108d:	55                   	push   %ebp
    108e:	89 e5                	mov    %esp,%ebp
    1090:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1093:	8b 45 08             	mov    0x8(%ebp),%eax
    1096:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1099:	8b 45 0c             	mov    0xc(%ebp),%eax
    109c:	0f b6 10             	movzbl (%eax),%edx
    109f:	8b 45 08             	mov    0x8(%ebp),%eax
    10a2:	88 10                	mov    %dl,(%eax)
    10a4:	8b 45 08             	mov    0x8(%ebp),%eax
    10a7:	0f b6 00             	movzbl (%eax),%eax
    10aa:	84 c0                	test   %al,%al
    10ac:	0f 95 c0             	setne  %al
    10af:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10b3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    10b7:	84 c0                	test   %al,%al
    10b9:	75 de                	jne    1099 <strcpy+0xc>
    ;
  return os;
    10bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10be:	c9                   	leave  
    10bf:	c3                   	ret    

000010c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10c3:	eb 08                	jmp    10cd <strcmp+0xd>
    p++, q++;
    10c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10c9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10cd:	8b 45 08             	mov    0x8(%ebp),%eax
    10d0:	0f b6 00             	movzbl (%eax),%eax
    10d3:	84 c0                	test   %al,%al
    10d5:	74 10                	je     10e7 <strcmp+0x27>
    10d7:	8b 45 08             	mov    0x8(%ebp),%eax
    10da:	0f b6 10             	movzbl (%eax),%edx
    10dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    10e0:	0f b6 00             	movzbl (%eax),%eax
    10e3:	38 c2                	cmp    %al,%dl
    10e5:	74 de                	je     10c5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10e7:	8b 45 08             	mov    0x8(%ebp),%eax
    10ea:	0f b6 00             	movzbl (%eax),%eax
    10ed:	0f b6 d0             	movzbl %al,%edx
    10f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f3:	0f b6 00             	movzbl (%eax),%eax
    10f6:	0f b6 c0             	movzbl %al,%eax
    10f9:	89 d1                	mov    %edx,%ecx
    10fb:	29 c1                	sub    %eax,%ecx
    10fd:	89 c8                	mov    %ecx,%eax
}
    10ff:	5d                   	pop    %ebp
    1100:	c3                   	ret    

00001101 <strlen>:

uint
strlen(char *s)
{
    1101:	55                   	push   %ebp
    1102:	89 e5                	mov    %esp,%ebp
    1104:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1107:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    110e:	eb 04                	jmp    1114 <strlen+0x13>
    1110:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1114:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1117:	03 45 08             	add    0x8(%ebp),%eax
    111a:	0f b6 00             	movzbl (%eax),%eax
    111d:	84 c0                	test   %al,%al
    111f:	75 ef                	jne    1110 <strlen+0xf>
    ;
  return n;
    1121:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1124:	c9                   	leave  
    1125:	c3                   	ret    

00001126 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1126:	55                   	push   %ebp
    1127:	89 e5                	mov    %esp,%ebp
    1129:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    112c:	8b 45 10             	mov    0x10(%ebp),%eax
    112f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1133:	8b 45 0c             	mov    0xc(%ebp),%eax
    1136:	89 44 24 04          	mov    %eax,0x4(%esp)
    113a:	8b 45 08             	mov    0x8(%ebp),%eax
    113d:	89 04 24             	mov    %eax,(%esp)
    1140:	e8 23 ff ff ff       	call   1068 <stosb>
  return dst;
    1145:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1148:	c9                   	leave  
    1149:	c3                   	ret    

0000114a <strchr>:

char*
strchr(const char *s, char c)
{
    114a:	55                   	push   %ebp
    114b:	89 e5                	mov    %esp,%ebp
    114d:	83 ec 04             	sub    $0x4,%esp
    1150:	8b 45 0c             	mov    0xc(%ebp),%eax
    1153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1156:	eb 14                	jmp    116c <strchr+0x22>
    if(*s == c)
    1158:	8b 45 08             	mov    0x8(%ebp),%eax
    115b:	0f b6 00             	movzbl (%eax),%eax
    115e:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1161:	75 05                	jne    1168 <strchr+0x1e>
      return (char*)s;
    1163:	8b 45 08             	mov    0x8(%ebp),%eax
    1166:	eb 13                	jmp    117b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    116c:	8b 45 08             	mov    0x8(%ebp),%eax
    116f:	0f b6 00             	movzbl (%eax),%eax
    1172:	84 c0                	test   %al,%al
    1174:	75 e2                	jne    1158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1176:	b8 00 00 00 00       	mov    $0x0,%eax
}
    117b:	c9                   	leave  
    117c:	c3                   	ret    

0000117d <gets>:

char*
gets(char *buf, int max)
{
    117d:	55                   	push   %ebp
    117e:	89 e5                	mov    %esp,%ebp
    1180:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1183:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    118a:	eb 44                	jmp    11d0 <gets+0x53>
    cc = read(0, &c, 1);
    118c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1193:	00 
    1194:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1197:	89 44 24 04          	mov    %eax,0x4(%esp)
    119b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11a2:	e8 3d 01 00 00       	call   12e4 <read>
    11a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    11aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11ae:	7e 2d                	jle    11dd <gets+0x60>
      break;
    buf[i++] = c;
    11b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11b3:	03 45 08             	add    0x8(%ebp),%eax
    11b6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    11ba:	88 10                	mov    %dl,(%eax)
    11bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    11c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11c4:	3c 0a                	cmp    $0xa,%al
    11c6:	74 16                	je     11de <gets+0x61>
    11c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11cc:	3c 0d                	cmp    $0xd,%al
    11ce:	74 0e                	je     11de <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11d3:	83 c0 01             	add    $0x1,%eax
    11d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11d9:	7c b1                	jl     118c <gets+0xf>
    11db:	eb 01                	jmp    11de <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    11dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11e1:	03 45 08             	add    0x8(%ebp),%eax
    11e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11ea:	c9                   	leave  
    11eb:	c3                   	ret    

000011ec <stat>:

int
stat(char *n, struct stat *st)
{
    11ec:	55                   	push   %ebp
    11ed:	89 e5                	mov    %esp,%ebp
    11ef:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11f9:	00 
    11fa:	8b 45 08             	mov    0x8(%ebp),%eax
    11fd:	89 04 24             	mov    %eax,(%esp)
    1200:	e8 07 01 00 00       	call   130c <open>
    1205:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1208:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    120c:	79 07                	jns    1215 <stat+0x29>
    return -1;
    120e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1213:	eb 23                	jmp    1238 <stat+0x4c>
  r = fstat(fd, st);
    1215:	8b 45 0c             	mov    0xc(%ebp),%eax
    1218:	89 44 24 04          	mov    %eax,0x4(%esp)
    121c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    121f:	89 04 24             	mov    %eax,(%esp)
    1222:	e8 fd 00 00 00       	call   1324 <fstat>
    1227:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    122a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    122d:	89 04 24             	mov    %eax,(%esp)
    1230:	e8 bf 00 00 00       	call   12f4 <close>
  return r;
    1235:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1238:	c9                   	leave  
    1239:	c3                   	ret    

0000123a <atoi>:

int
atoi(const char *s)
{
    123a:	55                   	push   %ebp
    123b:	89 e5                	mov    %esp,%ebp
    123d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1240:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1247:	eb 24                	jmp    126d <atoi+0x33>
    n = n*10 + *s++ - '0';
    1249:	8b 55 fc             	mov    -0x4(%ebp),%edx
    124c:	89 d0                	mov    %edx,%eax
    124e:	c1 e0 02             	shl    $0x2,%eax
    1251:	01 d0                	add    %edx,%eax
    1253:	01 c0                	add    %eax,%eax
    1255:	89 c2                	mov    %eax,%edx
    1257:	8b 45 08             	mov    0x8(%ebp),%eax
    125a:	0f b6 00             	movzbl (%eax),%eax
    125d:	0f be c0             	movsbl %al,%eax
    1260:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1263:	83 e8 30             	sub    $0x30,%eax
    1266:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1269:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    126d:	8b 45 08             	mov    0x8(%ebp),%eax
    1270:	0f b6 00             	movzbl (%eax),%eax
    1273:	3c 2f                	cmp    $0x2f,%al
    1275:	7e 0a                	jle    1281 <atoi+0x47>
    1277:	8b 45 08             	mov    0x8(%ebp),%eax
    127a:	0f b6 00             	movzbl (%eax),%eax
    127d:	3c 39                	cmp    $0x39,%al
    127f:	7e c8                	jle    1249 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1284:	c9                   	leave  
    1285:	c3                   	ret    

00001286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1286:	55                   	push   %ebp
    1287:	89 e5                	mov    %esp,%ebp
    1289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    128c:	8b 45 08             	mov    0x8(%ebp),%eax
    128f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    1292:	8b 45 0c             	mov    0xc(%ebp),%eax
    1295:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1298:	eb 13                	jmp    12ad <memmove+0x27>
    *dst++ = *src++;
    129a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    129d:	0f b6 10             	movzbl (%eax),%edx
    12a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12a3:	88 10                	mov    %dl,(%eax)
    12a5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    12a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    12b1:	0f 9f c0             	setg   %al
    12b4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    12b8:	84 c0                	test   %al,%al
    12ba:	75 de                	jne    129a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12bf:	c9                   	leave  
    12c0:	c3                   	ret    
    12c1:	90                   	nop
    12c2:	90                   	nop
    12c3:	90                   	nop

000012c4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12c4:	b8 01 00 00 00       	mov    $0x1,%eax
    12c9:	cd 40                	int    $0x40
    12cb:	c3                   	ret    

000012cc <exit>:
SYSCALL(exit)
    12cc:	b8 02 00 00 00       	mov    $0x2,%eax
    12d1:	cd 40                	int    $0x40
    12d3:	c3                   	ret    

000012d4 <wait>:
SYSCALL(wait)
    12d4:	b8 03 00 00 00       	mov    $0x3,%eax
    12d9:	cd 40                	int    $0x40
    12db:	c3                   	ret    

000012dc <pipe>:
SYSCALL(pipe)
    12dc:	b8 04 00 00 00       	mov    $0x4,%eax
    12e1:	cd 40                	int    $0x40
    12e3:	c3                   	ret    

000012e4 <read>:
SYSCALL(read)
    12e4:	b8 05 00 00 00       	mov    $0x5,%eax
    12e9:	cd 40                	int    $0x40
    12eb:	c3                   	ret    

000012ec <write>:
SYSCALL(write)
    12ec:	b8 10 00 00 00       	mov    $0x10,%eax
    12f1:	cd 40                	int    $0x40
    12f3:	c3                   	ret    

000012f4 <close>:
SYSCALL(close)
    12f4:	b8 15 00 00 00       	mov    $0x15,%eax
    12f9:	cd 40                	int    $0x40
    12fb:	c3                   	ret    

000012fc <kill>:
SYSCALL(kill)
    12fc:	b8 06 00 00 00       	mov    $0x6,%eax
    1301:	cd 40                	int    $0x40
    1303:	c3                   	ret    

00001304 <exec>:
SYSCALL(exec)
    1304:	b8 07 00 00 00       	mov    $0x7,%eax
    1309:	cd 40                	int    $0x40
    130b:	c3                   	ret    

0000130c <open>:
SYSCALL(open)
    130c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1311:	cd 40                	int    $0x40
    1313:	c3                   	ret    

00001314 <mknod>:
SYSCALL(mknod)
    1314:	b8 11 00 00 00       	mov    $0x11,%eax
    1319:	cd 40                	int    $0x40
    131b:	c3                   	ret    

0000131c <unlink>:
SYSCALL(unlink)
    131c:	b8 12 00 00 00       	mov    $0x12,%eax
    1321:	cd 40                	int    $0x40
    1323:	c3                   	ret    

00001324 <fstat>:
SYSCALL(fstat)
    1324:	b8 08 00 00 00       	mov    $0x8,%eax
    1329:	cd 40                	int    $0x40
    132b:	c3                   	ret    

0000132c <link>:
SYSCALL(link)
    132c:	b8 13 00 00 00       	mov    $0x13,%eax
    1331:	cd 40                	int    $0x40
    1333:	c3                   	ret    

00001334 <mkdir>:
SYSCALL(mkdir)
    1334:	b8 14 00 00 00       	mov    $0x14,%eax
    1339:	cd 40                	int    $0x40
    133b:	c3                   	ret    

0000133c <chdir>:
SYSCALL(chdir)
    133c:	b8 09 00 00 00       	mov    $0x9,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <dup>:
SYSCALL(dup)
    1344:	b8 0a 00 00 00       	mov    $0xa,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <getpid>:
SYSCALL(getpid)
    134c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <sbrk>:
SYSCALL(sbrk)
    1354:	b8 0c 00 00 00       	mov    $0xc,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <sleep>:
SYSCALL(sleep)
    135c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <uptime>:
SYSCALL(uptime)
    1364:	b8 0e 00 00 00       	mov    $0xe,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <clone>:
SYSCALL(clone)
    136c:	b8 16 00 00 00       	mov    $0x16,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <texit>:
SYSCALL(texit)
    1374:	b8 17 00 00 00       	mov    $0x17,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <tsleep>:
SYSCALL(tsleep)
    137c:	b8 18 00 00 00       	mov    $0x18,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <twakeup>:
SYSCALL(twakeup)
    1384:	b8 19 00 00 00       	mov    $0x19,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    138c:	55                   	push   %ebp
    138d:	89 e5                	mov    %esp,%ebp
    138f:	83 ec 28             	sub    $0x28,%esp
    1392:	8b 45 0c             	mov    0xc(%ebp),%eax
    1395:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1398:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    139f:	00 
    13a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    13a7:	8b 45 08             	mov    0x8(%ebp),%eax
    13aa:	89 04 24             	mov    %eax,(%esp)
    13ad:	e8 3a ff ff ff       	call   12ec <write>
}
    13b2:	c9                   	leave  
    13b3:	c3                   	ret    

000013b4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13b4:	55                   	push   %ebp
    13b5:	89 e5                	mov    %esp,%ebp
    13b7:	53                   	push   %ebx
    13b8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13c6:	74 17                	je     13df <printint+0x2b>
    13c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13cc:	79 11                	jns    13df <printint+0x2b>
    neg = 1;
    13ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    13d8:	f7 d8                	neg    %eax
    13da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13dd:	eb 06                	jmp    13e5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13df:	8b 45 0c             	mov    0xc(%ebp),%eax
    13e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    13e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    13ec:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    13ef:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13f5:	ba 00 00 00 00       	mov    $0x0,%edx
    13fa:	f7 f3                	div    %ebx
    13fc:	89 d0                	mov    %edx,%eax
    13fe:	0f b6 80 b0 1a 00 00 	movzbl 0x1ab0(%eax),%eax
    1405:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1409:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    140d:	8b 45 10             	mov    0x10(%ebp),%eax
    1410:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1413:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1416:	ba 00 00 00 00       	mov    $0x0,%edx
    141b:	f7 75 d4             	divl   -0x2c(%ebp)
    141e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1421:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1425:	75 c5                	jne    13ec <printint+0x38>
  if(neg)
    1427:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    142b:	74 28                	je     1455 <printint+0xa1>
    buf[i++] = '-';
    142d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1430:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1435:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1439:	eb 1a                	jmp    1455 <printint+0xa1>
    putc(fd, buf[i]);
    143b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    143e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    1443:	0f be c0             	movsbl %al,%eax
    1446:	89 44 24 04          	mov    %eax,0x4(%esp)
    144a:	8b 45 08             	mov    0x8(%ebp),%eax
    144d:	89 04 24             	mov    %eax,(%esp)
    1450:	e8 37 ff ff ff       	call   138c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1455:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1459:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    145d:	79 dc                	jns    143b <printint+0x87>
    putc(fd, buf[i]);
}
    145f:	83 c4 44             	add    $0x44,%esp
    1462:	5b                   	pop    %ebx
    1463:	5d                   	pop    %ebp
    1464:	c3                   	ret    

00001465 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1465:	55                   	push   %ebp
    1466:	89 e5                	mov    %esp,%ebp
    1468:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    146b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1472:	8d 45 0c             	lea    0xc(%ebp),%eax
    1475:	83 c0 04             	add    $0x4,%eax
    1478:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    147b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1482:	e9 7e 01 00 00       	jmp    1605 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1487:	8b 55 0c             	mov    0xc(%ebp),%edx
    148a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    148d:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1490:	0f b6 00             	movzbl (%eax),%eax
    1493:	0f be c0             	movsbl %al,%eax
    1496:	25 ff 00 00 00       	and    $0xff,%eax
    149b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    149e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14a2:	75 2c                	jne    14d0 <printf+0x6b>
      if(c == '%'){
    14a4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    14a8:	75 0c                	jne    14b6 <printf+0x51>
        state = '%';
    14aa:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    14b1:	e9 4b 01 00 00       	jmp    1601 <printf+0x19c>
      } else {
        putc(fd, c);
    14b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14b9:	0f be c0             	movsbl %al,%eax
    14bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    14c0:	8b 45 08             	mov    0x8(%ebp),%eax
    14c3:	89 04 24             	mov    %eax,(%esp)
    14c6:	e8 c1 fe ff ff       	call   138c <putc>
    14cb:	e9 31 01 00 00       	jmp    1601 <printf+0x19c>
      }
    } else if(state == '%'){
    14d0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    14d4:	0f 85 27 01 00 00    	jne    1601 <printf+0x19c>
      if(c == 'd'){
    14da:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    14de:	75 2d                	jne    150d <printf+0xa8>
        printint(fd, *ap, 10, 1);
    14e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e3:	8b 00                	mov    (%eax),%eax
    14e5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14ec:	00 
    14ed:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    14f4:	00 
    14f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f9:	8b 45 08             	mov    0x8(%ebp),%eax
    14fc:	89 04 24             	mov    %eax,(%esp)
    14ff:	e8 b0 fe ff ff       	call   13b4 <printint>
        ap++;
    1504:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1508:	e9 ed 00 00 00       	jmp    15fa <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    150d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1511:	74 06                	je     1519 <printf+0xb4>
    1513:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1517:	75 2d                	jne    1546 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1519:	8b 45 f4             	mov    -0xc(%ebp),%eax
    151c:	8b 00                	mov    (%eax),%eax
    151e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1525:	00 
    1526:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    152d:	00 
    152e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1532:	8b 45 08             	mov    0x8(%ebp),%eax
    1535:	89 04 24             	mov    %eax,(%esp)
    1538:	e8 77 fe ff ff       	call   13b4 <printint>
        ap++;
    153d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1541:	e9 b4 00 00 00       	jmp    15fa <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1546:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    154a:	75 46                	jne    1592 <printf+0x12d>
        s = (char*)*ap;
    154c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154f:	8b 00                	mov    (%eax),%eax
    1551:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1554:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1558:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    155c:	75 27                	jne    1585 <printf+0x120>
          s = "(null)";
    155e:	c7 45 e4 7a 1a 00 00 	movl   $0x1a7a,-0x1c(%ebp)
        while(*s != 0){
    1565:	eb 1f                	jmp    1586 <printf+0x121>
          putc(fd, *s);
    1567:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    156a:	0f b6 00             	movzbl (%eax),%eax
    156d:	0f be c0             	movsbl %al,%eax
    1570:	89 44 24 04          	mov    %eax,0x4(%esp)
    1574:	8b 45 08             	mov    0x8(%ebp),%eax
    1577:	89 04 24             	mov    %eax,(%esp)
    157a:	e8 0d fe ff ff       	call   138c <putc>
          s++;
    157f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1583:	eb 01                	jmp    1586 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1585:	90                   	nop
    1586:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1589:	0f b6 00             	movzbl (%eax),%eax
    158c:	84 c0                	test   %al,%al
    158e:	75 d7                	jne    1567 <printf+0x102>
    1590:	eb 68                	jmp    15fa <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1592:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1596:	75 1d                	jne    15b5 <printf+0x150>
        putc(fd, *ap);
    1598:	8b 45 f4             	mov    -0xc(%ebp),%eax
    159b:	8b 00                	mov    (%eax),%eax
    159d:	0f be c0             	movsbl %al,%eax
    15a0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
    15a7:	89 04 24             	mov    %eax,(%esp)
    15aa:	e8 dd fd ff ff       	call   138c <putc>
        ap++;
    15af:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    15b3:	eb 45                	jmp    15fa <printf+0x195>
      } else if(c == '%'){
    15b5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    15b9:	75 17                	jne    15d2 <printf+0x16d>
        putc(fd, c);
    15bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15be:	0f be c0             	movsbl %al,%eax
    15c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c5:	8b 45 08             	mov    0x8(%ebp),%eax
    15c8:	89 04 24             	mov    %eax,(%esp)
    15cb:	e8 bc fd ff ff       	call   138c <putc>
    15d0:	eb 28                	jmp    15fa <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15d2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15d9:	00 
    15da:	8b 45 08             	mov    0x8(%ebp),%eax
    15dd:	89 04 24             	mov    %eax,(%esp)
    15e0:	e8 a7 fd ff ff       	call   138c <putc>
        putc(fd, c);
    15e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15e8:	0f be c0             	movsbl %al,%eax
    15eb:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ef:	8b 45 08             	mov    0x8(%ebp),%eax
    15f2:	89 04 24             	mov    %eax,(%esp)
    15f5:	e8 92 fd ff ff       	call   138c <putc>
      }
      state = 0;
    15fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1601:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1605:	8b 55 0c             	mov    0xc(%ebp),%edx
    1608:	8b 45 ec             	mov    -0x14(%ebp),%eax
    160b:	8d 04 02             	lea    (%edx,%eax,1),%eax
    160e:	0f b6 00             	movzbl (%eax),%eax
    1611:	84 c0                	test   %al,%al
    1613:	0f 85 6e fe ff ff    	jne    1487 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1619:	c9                   	leave  
    161a:	c3                   	ret    
    161b:	90                   	nop

0000161c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    161c:	55                   	push   %ebp
    161d:	89 e5                	mov    %esp,%ebp
    161f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1622:	8b 45 08             	mov    0x8(%ebp),%eax
    1625:	83 e8 08             	sub    $0x8,%eax
    1628:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    162b:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    1630:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1633:	eb 24                	jmp    1659 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1635:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1638:	8b 00                	mov    (%eax),%eax
    163a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    163d:	77 12                	ja     1651 <free+0x35>
    163f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1642:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1645:	77 24                	ja     166b <free+0x4f>
    1647:	8b 45 fc             	mov    -0x4(%ebp),%eax
    164a:	8b 00                	mov    (%eax),%eax
    164c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    164f:	77 1a                	ja     166b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1651:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1654:	8b 00                	mov    (%eax),%eax
    1656:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1659:	8b 45 f8             	mov    -0x8(%ebp),%eax
    165c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    165f:	76 d4                	jbe    1635 <free+0x19>
    1661:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1664:	8b 00                	mov    (%eax),%eax
    1666:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1669:	76 ca                	jbe    1635 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    166b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166e:	8b 40 04             	mov    0x4(%eax),%eax
    1671:	c1 e0 03             	shl    $0x3,%eax
    1674:	89 c2                	mov    %eax,%edx
    1676:	03 55 f8             	add    -0x8(%ebp),%edx
    1679:	8b 45 fc             	mov    -0x4(%ebp),%eax
    167c:	8b 00                	mov    (%eax),%eax
    167e:	39 c2                	cmp    %eax,%edx
    1680:	75 24                	jne    16a6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    1682:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1685:	8b 50 04             	mov    0x4(%eax),%edx
    1688:	8b 45 fc             	mov    -0x4(%ebp),%eax
    168b:	8b 00                	mov    (%eax),%eax
    168d:	8b 40 04             	mov    0x4(%eax),%eax
    1690:	01 c2                	add    %eax,%edx
    1692:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1695:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1698:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169b:	8b 00                	mov    (%eax),%eax
    169d:	8b 10                	mov    (%eax),%edx
    169f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a2:	89 10                	mov    %edx,(%eax)
    16a4:	eb 0a                	jmp    16b0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    16a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a9:	8b 10                	mov    (%eax),%edx
    16ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ae:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b3:	8b 40 04             	mov    0x4(%eax),%eax
    16b6:	c1 e0 03             	shl    $0x3,%eax
    16b9:	03 45 fc             	add    -0x4(%ebp),%eax
    16bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16bf:	75 20                	jne    16e1 <free+0xc5>
    p->s.size += bp->s.size;
    16c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c4:	8b 50 04             	mov    0x4(%eax),%edx
    16c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ca:	8b 40 04             	mov    0x4(%eax),%eax
    16cd:	01 c2                	add    %eax,%edx
    16cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16d8:	8b 10                	mov    (%eax),%edx
    16da:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16dd:	89 10                	mov    %edx,(%eax)
    16df:	eb 08                	jmp    16e9 <free+0xcd>
  } else
    p->s.ptr = bp;
    16e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16e7:	89 10                	mov    %edx,(%eax)
  freep = p;
    16e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ec:	a3 cc 1a 00 00       	mov    %eax,0x1acc
}
    16f1:	c9                   	leave  
    16f2:	c3                   	ret    

000016f3 <morecore>:

static Header*
morecore(uint nu)
{
    16f3:	55                   	push   %ebp
    16f4:	89 e5                	mov    %esp,%ebp
    16f6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    16f9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1700:	77 07                	ja     1709 <morecore+0x16>
    nu = 4096;
    1702:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1709:	8b 45 08             	mov    0x8(%ebp),%eax
    170c:	c1 e0 03             	shl    $0x3,%eax
    170f:	89 04 24             	mov    %eax,(%esp)
    1712:	e8 3d fc ff ff       	call   1354 <sbrk>
    1717:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    171a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    171e:	75 07                	jne    1727 <morecore+0x34>
    return 0;
    1720:	b8 00 00 00 00       	mov    $0x0,%eax
    1725:	eb 22                	jmp    1749 <morecore+0x56>
  hp = (Header*)p;
    1727:	8b 45 f0             	mov    -0x10(%ebp),%eax
    172a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    172d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1730:	8b 55 08             	mov    0x8(%ebp),%edx
    1733:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1736:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1739:	83 c0 08             	add    $0x8,%eax
    173c:	89 04 24             	mov    %eax,(%esp)
    173f:	e8 d8 fe ff ff       	call   161c <free>
  return freep;
    1744:	a1 cc 1a 00 00       	mov    0x1acc,%eax
}
    1749:	c9                   	leave  
    174a:	c3                   	ret    

0000174b <malloc>:

void*
malloc(uint nbytes)
{
    174b:	55                   	push   %ebp
    174c:	89 e5                	mov    %esp,%ebp
    174e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1751:	8b 45 08             	mov    0x8(%ebp),%eax
    1754:	83 c0 07             	add    $0x7,%eax
    1757:	c1 e8 03             	shr    $0x3,%eax
    175a:	83 c0 01             	add    $0x1,%eax
    175d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1760:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    1765:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1768:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    176c:	75 23                	jne    1791 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    176e:	c7 45 f0 c4 1a 00 00 	movl   $0x1ac4,-0x10(%ebp)
    1775:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1778:	a3 cc 1a 00 00       	mov    %eax,0x1acc
    177d:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    1782:	a3 c4 1a 00 00       	mov    %eax,0x1ac4
    base.s.size = 0;
    1787:	c7 05 c8 1a 00 00 00 	movl   $0x0,0x1ac8
    178e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1791:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1794:	8b 00                	mov    (%eax),%eax
    1796:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1799:	8b 45 ec             	mov    -0x14(%ebp),%eax
    179c:	8b 40 04             	mov    0x4(%eax),%eax
    179f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17a2:	72 4d                	jb     17f1 <malloc+0xa6>
      if(p->s.size == nunits)
    17a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17a7:	8b 40 04             	mov    0x4(%eax),%eax
    17aa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17ad:	75 0c                	jne    17bb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17af:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17b2:	8b 10                	mov    (%eax),%edx
    17b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b7:	89 10                	mov    %edx,(%eax)
    17b9:	eb 26                	jmp    17e1 <malloc+0x96>
      else {
        p->s.size -= nunits;
    17bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17be:	8b 40 04             	mov    0x4(%eax),%eax
    17c1:	89 c2                	mov    %eax,%edx
    17c3:	2b 55 f4             	sub    -0xc(%ebp),%edx
    17c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17c9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17cf:	8b 40 04             	mov    0x4(%eax),%eax
    17d2:	c1 e0 03             	shl    $0x3,%eax
    17d5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    17d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17db:	8b 55 f4             	mov    -0xc(%ebp),%edx
    17de:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17e4:	a3 cc 1a 00 00       	mov    %eax,0x1acc
      return (void*)(p + 1);
    17e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ec:	83 c0 08             	add    $0x8,%eax
    17ef:	eb 38                	jmp    1829 <malloc+0xde>
    }
    if(p == freep)
    17f1:	a1 cc 1a 00 00       	mov    0x1acc,%eax
    17f6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    17f9:	75 1b                	jne    1816 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    17fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17fe:	89 04 24             	mov    %eax,(%esp)
    1801:	e8 ed fe ff ff       	call   16f3 <morecore>
    1806:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1809:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    180d:	75 07                	jne    1816 <malloc+0xcb>
        return 0;
    180f:	b8 00 00 00 00       	mov    $0x0,%eax
    1814:	eb 13                	jmp    1829 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1816:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1819:	89 45 f0             	mov    %eax,-0x10(%ebp)
    181c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    181f:	8b 00                	mov    (%eax),%eax
    1821:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1824:	e9 70 ff ff ff       	jmp    1799 <malloc+0x4e>
}
    1829:	c9                   	leave  
    182a:	c3                   	ret    
    182b:	90                   	nop

0000182c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    182c:	55                   	push   %ebp
    182d:	89 e5                	mov    %esp,%ebp
    182f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1832:	8b 55 08             	mov    0x8(%ebp),%edx
    1835:	8b 45 0c             	mov    0xc(%ebp),%eax
    1838:	8b 4d 08             	mov    0x8(%ebp),%ecx
    183b:	f0 87 02             	lock xchg %eax,(%edx)
    183e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1841:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1844:	c9                   	leave  
    1845:	c3                   	ret    

00001846 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1846:	55                   	push   %ebp
    1847:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1849:	8b 45 08             	mov    0x8(%ebp),%eax
    184c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1852:	5d                   	pop    %ebp
    1853:	c3                   	ret    

00001854 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1854:	55                   	push   %ebp
    1855:	89 e5                	mov    %esp,%ebp
    1857:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    185a:	8b 45 08             	mov    0x8(%ebp),%eax
    185d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1864:	00 
    1865:	89 04 24             	mov    %eax,(%esp)
    1868:	e8 bf ff ff ff       	call   182c <xchg>
    186d:	85 c0                	test   %eax,%eax
    186f:	75 e9                	jne    185a <lock_acquire+0x6>
}
    1871:	c9                   	leave  
    1872:	c3                   	ret    

00001873 <lock_release>:
void lock_release(lock_t *lock){
    1873:	55                   	push   %ebp
    1874:	89 e5                	mov    %esp,%ebp
    1876:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1879:	8b 45 08             	mov    0x8(%ebp),%eax
    187c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1883:	00 
    1884:	89 04 24             	mov    %eax,(%esp)
    1887:	e8 a0 ff ff ff       	call   182c <xchg>
}
    188c:	c9                   	leave  
    188d:	c3                   	ret    

0000188e <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    188e:	55                   	push   %ebp
    188f:	89 e5                	mov    %esp,%ebp
    1891:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1894:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    189b:	e8 ab fe ff ff       	call   174b <malloc>
    18a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    18a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18ac:	25 ff 0f 00 00       	and    $0xfff,%eax
    18b1:	85 c0                	test   %eax,%eax
    18b3:	74 15                	je     18ca <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    18b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18b8:	89 c2                	mov    %eax,%edx
    18ba:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    18c0:	b8 00 10 00 00       	mov    $0x1000,%eax
    18c5:	29 d0                	sub    %edx,%eax
    18c7:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    18ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18ce:	75 1b                	jne    18eb <thread_create+0x5d>

        printf(1,"malloc fail \n");
    18d0:	c7 44 24 04 81 1a 00 	movl   $0x1a81,0x4(%esp)
    18d7:	00 
    18d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18df:	e8 81 fb ff ff       	call   1465 <printf>
        return 0;
    18e4:	b8 00 00 00 00       	mov    $0x0,%eax
    18e9:	eb 6f                	jmp    195a <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18eb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    18ee:	8b 55 08             	mov    0x8(%ebp),%edx
    18f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18f4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    18f8:	89 54 24 08          	mov    %edx,0x8(%esp)
    18fc:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1903:	00 
    1904:	89 04 24             	mov    %eax,(%esp)
    1907:	e8 60 fa ff ff       	call   136c <clone>
    190c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    190f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1913:	79 1b                	jns    1930 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1915:	c7 44 24 04 8f 1a 00 	movl   $0x1a8f,0x4(%esp)
    191c:	00 
    191d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1924:	e8 3c fb ff ff       	call   1465 <printf>
        return 0;
    1929:	b8 00 00 00 00       	mov    $0x0,%eax
    192e:	eb 2a                	jmp    195a <thread_create+0xcc>
    }
    if(tid > 0){
    1930:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1934:	7e 05                	jle    193b <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1936:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1939:	eb 1f                	jmp    195a <thread_create+0xcc>
    }
    if(tid == 0){
    193b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    193f:	75 14                	jne    1955 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1941:	c7 44 24 04 9c 1a 00 	movl   $0x1a9c,0x4(%esp)
    1948:	00 
    1949:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1950:	e8 10 fb ff ff       	call   1465 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1955:	b8 00 00 00 00       	mov    $0x0,%eax
}
    195a:	c9                   	leave  
    195b:	c3                   	ret    

0000195c <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    195c:	55                   	push   %ebp
    195d:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    195f:	8b 45 08             	mov    0x8(%ebp),%eax
    1962:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1968:	8b 45 08             	mov    0x8(%ebp),%eax
    196b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1972:	8b 45 08             	mov    0x8(%ebp),%eax
    1975:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    197c:	5d                   	pop    %ebp
    197d:	c3                   	ret    

0000197e <add_q>:

void add_q(struct queue *q, int v){
    197e:	55                   	push   %ebp
    197f:	89 e5                	mov    %esp,%ebp
    1981:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1984:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    198b:	e8 bb fd ff ff       	call   174b <malloc>
    1990:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1993:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1996:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    199d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19a0:	8b 55 0c             	mov    0xc(%ebp),%edx
    19a3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19a5:	8b 45 08             	mov    0x8(%ebp),%eax
    19a8:	8b 40 04             	mov    0x4(%eax),%eax
    19ab:	85 c0                	test   %eax,%eax
    19ad:	75 0b                	jne    19ba <add_q+0x3c>
        q->head = n;
    19af:	8b 45 08             	mov    0x8(%ebp),%eax
    19b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19b5:	89 50 04             	mov    %edx,0x4(%eax)
    19b8:	eb 0c                	jmp    19c6 <add_q+0x48>
    }else{
        q->tail->next = n;
    19ba:	8b 45 08             	mov    0x8(%ebp),%eax
    19bd:	8b 40 08             	mov    0x8(%eax),%eax
    19c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19c3:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    19c6:	8b 45 08             	mov    0x8(%ebp),%eax
    19c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19cc:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    19cf:	8b 45 08             	mov    0x8(%ebp),%eax
    19d2:	8b 00                	mov    (%eax),%eax
    19d4:	8d 50 01             	lea    0x1(%eax),%edx
    19d7:	8b 45 08             	mov    0x8(%ebp),%eax
    19da:	89 10                	mov    %edx,(%eax)
}
    19dc:	c9                   	leave  
    19dd:	c3                   	ret    

000019de <empty_q>:

int empty_q(struct queue *q){
    19de:	55                   	push   %ebp
    19df:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    19e1:	8b 45 08             	mov    0x8(%ebp),%eax
    19e4:	8b 00                	mov    (%eax),%eax
    19e6:	85 c0                	test   %eax,%eax
    19e8:	75 07                	jne    19f1 <empty_q+0x13>
        return 1;
    19ea:	b8 01 00 00 00       	mov    $0x1,%eax
    19ef:	eb 05                	jmp    19f6 <empty_q+0x18>
    else
        return 0;
    19f1:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    19f6:	5d                   	pop    %ebp
    19f7:	c3                   	ret    

000019f8 <pop_q>:
int pop_q(struct queue *q){
    19f8:	55                   	push   %ebp
    19f9:	89 e5                	mov    %esp,%ebp
    19fb:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    19fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1a01:	89 04 24             	mov    %eax,(%esp)
    1a04:	e8 d5 ff ff ff       	call   19de <empty_q>
    1a09:	85 c0                	test   %eax,%eax
    1a0b:	75 5d                	jne    1a6a <pop_q+0x72>
       val = q->head->value; 
    1a0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a10:	8b 40 04             	mov    0x4(%eax),%eax
    1a13:	8b 00                	mov    (%eax),%eax
    1a15:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1a18:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1b:	8b 40 04             	mov    0x4(%eax),%eax
    1a1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1a21:	8b 45 08             	mov    0x8(%ebp),%eax
    1a24:	8b 40 04             	mov    0x4(%eax),%eax
    1a27:	8b 50 04             	mov    0x4(%eax),%edx
    1a2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a33:	89 04 24             	mov    %eax,(%esp)
    1a36:	e8 e1 fb ff ff       	call   161c <free>
       q->size--;
    1a3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3e:	8b 00                	mov    (%eax),%eax
    1a40:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a43:	8b 45 08             	mov    0x8(%ebp),%eax
    1a46:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a48:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4b:	8b 00                	mov    (%eax),%eax
    1a4d:	85 c0                	test   %eax,%eax
    1a4f:	75 14                	jne    1a65 <pop_q+0x6d>
            q->head = 0;
    1a51:	8b 45 08             	mov    0x8(%ebp),%eax
    1a54:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a5b:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a65:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a68:	eb 05                	jmp    1a6f <pop_q+0x77>
    }
    return -1;
    1a6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a6f:	c9                   	leave  
    1a70:	c3                   	ret    
