
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 1){
    1009:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    100d:	7f 19                	jg     1028 <main+0x28>
    printf(2, "usage: kill pid...\n");
    100f:	c7 44 24 04 6d 1a 00 	movl   $0x1a6d,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    101e:	e8 3e 04 00 00       	call   1461 <printf>
    exit();
    1023:	e8 a0 02 00 00       	call   12c8 <exit>
  }
  for(i=1; i<argc; i++)
    1028:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    102f:	00 
    1030:	eb 21                	jmp    1053 <main+0x53>
    kill(atoi(argv[i]));
    1032:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1036:	c1 e0 02             	shl    $0x2,%eax
    1039:	03 45 0c             	add    0xc(%ebp),%eax
    103c:	8b 00                	mov    (%eax),%eax
    103e:	89 04 24             	mov    %eax,(%esp)
    1041:	e8 f0 01 00 00       	call   1236 <atoi>
    1046:	89 04 24             	mov    %eax,(%esp)
    1049:	e8 aa 02 00 00       	call   12f8 <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    104e:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1053:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1057:	3b 45 08             	cmp    0x8(%ebp),%eax
    105a:	7c d6                	jl     1032 <main+0x32>
    kill(atoi(argv[i]));
  exit();
    105c:	e8 67 02 00 00       	call   12c8 <exit>
    1061:	90                   	nop
    1062:	90                   	nop
    1063:	90                   	nop

00001064 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1064:	55                   	push   %ebp
    1065:	89 e5                	mov    %esp,%ebp
    1067:	57                   	push   %edi
    1068:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1069:	8b 4d 08             	mov    0x8(%ebp),%ecx
    106c:	8b 55 10             	mov    0x10(%ebp),%edx
    106f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1072:	89 cb                	mov    %ecx,%ebx
    1074:	89 df                	mov    %ebx,%edi
    1076:	89 d1                	mov    %edx,%ecx
    1078:	fc                   	cld    
    1079:	f3 aa                	rep stos %al,%es:(%edi)
    107b:	89 ca                	mov    %ecx,%edx
    107d:	89 fb                	mov    %edi,%ebx
    107f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1082:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1085:	5b                   	pop    %ebx
    1086:	5f                   	pop    %edi
    1087:	5d                   	pop    %ebp
    1088:	c3                   	ret    

00001089 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1089:	55                   	push   %ebp
    108a:	89 e5                	mov    %esp,%ebp
    108c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    108f:	8b 45 08             	mov    0x8(%ebp),%eax
    1092:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1095:	8b 45 0c             	mov    0xc(%ebp),%eax
    1098:	0f b6 10             	movzbl (%eax),%edx
    109b:	8b 45 08             	mov    0x8(%ebp),%eax
    109e:	88 10                	mov    %dl,(%eax)
    10a0:	8b 45 08             	mov    0x8(%ebp),%eax
    10a3:	0f b6 00             	movzbl (%eax),%eax
    10a6:	84 c0                	test   %al,%al
    10a8:	0f 95 c0             	setne  %al
    10ab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10af:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    10b3:	84 c0                	test   %al,%al
    10b5:	75 de                	jne    1095 <strcpy+0xc>
    ;
  return os;
    10b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10ba:	c9                   	leave  
    10bb:	c3                   	ret    

000010bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10bc:	55                   	push   %ebp
    10bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10bf:	eb 08                	jmp    10c9 <strcmp+0xd>
    p++, q++;
    10c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10c9:	8b 45 08             	mov    0x8(%ebp),%eax
    10cc:	0f b6 00             	movzbl (%eax),%eax
    10cf:	84 c0                	test   %al,%al
    10d1:	74 10                	je     10e3 <strcmp+0x27>
    10d3:	8b 45 08             	mov    0x8(%ebp),%eax
    10d6:	0f b6 10             	movzbl (%eax),%edx
    10d9:	8b 45 0c             	mov    0xc(%ebp),%eax
    10dc:	0f b6 00             	movzbl (%eax),%eax
    10df:	38 c2                	cmp    %al,%dl
    10e1:	74 de                	je     10c1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    10e3:	8b 45 08             	mov    0x8(%ebp),%eax
    10e6:	0f b6 00             	movzbl (%eax),%eax
    10e9:	0f b6 d0             	movzbl %al,%edx
    10ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ef:	0f b6 00             	movzbl (%eax),%eax
    10f2:	0f b6 c0             	movzbl %al,%eax
    10f5:	89 d1                	mov    %edx,%ecx
    10f7:	29 c1                	sub    %eax,%ecx
    10f9:	89 c8                	mov    %ecx,%eax
}
    10fb:	5d                   	pop    %ebp
    10fc:	c3                   	ret    

000010fd <strlen>:

uint
strlen(char *s)
{
    10fd:	55                   	push   %ebp
    10fe:	89 e5                	mov    %esp,%ebp
    1100:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1103:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    110a:	eb 04                	jmp    1110 <strlen+0x13>
    110c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1110:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1113:	03 45 08             	add    0x8(%ebp),%eax
    1116:	0f b6 00             	movzbl (%eax),%eax
    1119:	84 c0                	test   %al,%al
    111b:	75 ef                	jne    110c <strlen+0xf>
    ;
  return n;
    111d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1120:	c9                   	leave  
    1121:	c3                   	ret    

00001122 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1122:	55                   	push   %ebp
    1123:	89 e5                	mov    %esp,%ebp
    1125:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1128:	8b 45 10             	mov    0x10(%ebp),%eax
    112b:	89 44 24 08          	mov    %eax,0x8(%esp)
    112f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1132:	89 44 24 04          	mov    %eax,0x4(%esp)
    1136:	8b 45 08             	mov    0x8(%ebp),%eax
    1139:	89 04 24             	mov    %eax,(%esp)
    113c:	e8 23 ff ff ff       	call   1064 <stosb>
  return dst;
    1141:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1144:	c9                   	leave  
    1145:	c3                   	ret    

00001146 <strchr>:

char*
strchr(const char *s, char c)
{
    1146:	55                   	push   %ebp
    1147:	89 e5                	mov    %esp,%ebp
    1149:	83 ec 04             	sub    $0x4,%esp
    114c:	8b 45 0c             	mov    0xc(%ebp),%eax
    114f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1152:	eb 14                	jmp    1168 <strchr+0x22>
    if(*s == c)
    1154:	8b 45 08             	mov    0x8(%ebp),%eax
    1157:	0f b6 00             	movzbl (%eax),%eax
    115a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    115d:	75 05                	jne    1164 <strchr+0x1e>
      return (char*)s;
    115f:	8b 45 08             	mov    0x8(%ebp),%eax
    1162:	eb 13                	jmp    1177 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1168:	8b 45 08             	mov    0x8(%ebp),%eax
    116b:	0f b6 00             	movzbl (%eax),%eax
    116e:	84 c0                	test   %al,%al
    1170:	75 e2                	jne    1154 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1172:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1177:	c9                   	leave  
    1178:	c3                   	ret    

00001179 <gets>:

char*
gets(char *buf, int max)
{
    1179:	55                   	push   %ebp
    117a:	89 e5                	mov    %esp,%ebp
    117c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    117f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1186:	eb 44                	jmp    11cc <gets+0x53>
    cc = read(0, &c, 1);
    1188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    118f:	00 
    1190:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1193:	89 44 24 04          	mov    %eax,0x4(%esp)
    1197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    119e:	e8 3d 01 00 00       	call   12e0 <read>
    11a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    11a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11aa:	7e 2d                	jle    11d9 <gets+0x60>
      break;
    buf[i++] = c;
    11ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11af:	03 45 08             	add    0x8(%ebp),%eax
    11b2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    11b6:	88 10                	mov    %dl,(%eax)
    11b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    11bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11c0:	3c 0a                	cmp    $0xa,%al
    11c2:	74 16                	je     11da <gets+0x61>
    11c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11c8:	3c 0d                	cmp    $0xd,%al
    11ca:	74 0e                	je     11da <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11cf:	83 c0 01             	add    $0x1,%eax
    11d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11d5:	7c b1                	jl     1188 <gets+0xf>
    11d7:	eb 01                	jmp    11da <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    11d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11da:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11dd:	03 45 08             	add    0x8(%ebp),%eax
    11e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11e6:	c9                   	leave  
    11e7:	c3                   	ret    

000011e8 <stat>:

int
stat(char *n, struct stat *st)
{
    11e8:	55                   	push   %ebp
    11e9:	89 e5                	mov    %esp,%ebp
    11eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11f5:	00 
    11f6:	8b 45 08             	mov    0x8(%ebp),%eax
    11f9:	89 04 24             	mov    %eax,(%esp)
    11fc:	e8 07 01 00 00       	call   1308 <open>
    1201:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1204:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1208:	79 07                	jns    1211 <stat+0x29>
    return -1;
    120a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    120f:	eb 23                	jmp    1234 <stat+0x4c>
  r = fstat(fd, st);
    1211:	8b 45 0c             	mov    0xc(%ebp),%eax
    1214:	89 44 24 04          	mov    %eax,0x4(%esp)
    1218:	8b 45 f0             	mov    -0x10(%ebp),%eax
    121b:	89 04 24             	mov    %eax,(%esp)
    121e:	e8 fd 00 00 00       	call   1320 <fstat>
    1223:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1226:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1229:	89 04 24             	mov    %eax,(%esp)
    122c:	e8 bf 00 00 00       	call   12f0 <close>
  return r;
    1231:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1234:	c9                   	leave  
    1235:	c3                   	ret    

00001236 <atoi>:

int
atoi(const char *s)
{
    1236:	55                   	push   %ebp
    1237:	89 e5                	mov    %esp,%ebp
    1239:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    123c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1243:	eb 24                	jmp    1269 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1245:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1248:	89 d0                	mov    %edx,%eax
    124a:	c1 e0 02             	shl    $0x2,%eax
    124d:	01 d0                	add    %edx,%eax
    124f:	01 c0                	add    %eax,%eax
    1251:	89 c2                	mov    %eax,%edx
    1253:	8b 45 08             	mov    0x8(%ebp),%eax
    1256:	0f b6 00             	movzbl (%eax),%eax
    1259:	0f be c0             	movsbl %al,%eax
    125c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    125f:	83 e8 30             	sub    $0x30,%eax
    1262:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1265:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1269:	8b 45 08             	mov    0x8(%ebp),%eax
    126c:	0f b6 00             	movzbl (%eax),%eax
    126f:	3c 2f                	cmp    $0x2f,%al
    1271:	7e 0a                	jle    127d <atoi+0x47>
    1273:	8b 45 08             	mov    0x8(%ebp),%eax
    1276:	0f b6 00             	movzbl (%eax),%eax
    1279:	3c 39                	cmp    $0x39,%al
    127b:	7e c8                	jle    1245 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    127d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1280:	c9                   	leave  
    1281:	c3                   	ret    

00001282 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1282:	55                   	push   %ebp
    1283:	89 e5                	mov    %esp,%ebp
    1285:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    128e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1291:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1294:	eb 13                	jmp    12a9 <memmove+0x27>
    *dst++ = *src++;
    1296:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1299:	0f b6 10             	movzbl (%eax),%edx
    129c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    129f:	88 10                	mov    %dl,(%eax)
    12a1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    12a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    12ad:	0f 9f c0             	setg   %al
    12b0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    12b4:	84 c0                	test   %al,%al
    12b6:	75 de                	jne    1296 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12bb:	c9                   	leave  
    12bc:	c3                   	ret    
    12bd:	90                   	nop
    12be:	90                   	nop
    12bf:	90                   	nop

000012c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12c0:	b8 01 00 00 00       	mov    $0x1,%eax
    12c5:	cd 40                	int    $0x40
    12c7:	c3                   	ret    

000012c8 <exit>:
SYSCALL(exit)
    12c8:	b8 02 00 00 00       	mov    $0x2,%eax
    12cd:	cd 40                	int    $0x40
    12cf:	c3                   	ret    

000012d0 <wait>:
SYSCALL(wait)
    12d0:	b8 03 00 00 00       	mov    $0x3,%eax
    12d5:	cd 40                	int    $0x40
    12d7:	c3                   	ret    

000012d8 <pipe>:
SYSCALL(pipe)
    12d8:	b8 04 00 00 00       	mov    $0x4,%eax
    12dd:	cd 40                	int    $0x40
    12df:	c3                   	ret    

000012e0 <read>:
SYSCALL(read)
    12e0:	b8 05 00 00 00       	mov    $0x5,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <write>:
SYSCALL(write)
    12e8:	b8 10 00 00 00       	mov    $0x10,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <close>:
SYSCALL(close)
    12f0:	b8 15 00 00 00       	mov    $0x15,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <kill>:
SYSCALL(kill)
    12f8:	b8 06 00 00 00       	mov    $0x6,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <exec>:
SYSCALL(exec)
    1300:	b8 07 00 00 00       	mov    $0x7,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <open>:
SYSCALL(open)
    1308:	b8 0f 00 00 00       	mov    $0xf,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <mknod>:
SYSCALL(mknod)
    1310:	b8 11 00 00 00       	mov    $0x11,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <unlink>:
SYSCALL(unlink)
    1318:	b8 12 00 00 00       	mov    $0x12,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <fstat>:
SYSCALL(fstat)
    1320:	b8 08 00 00 00       	mov    $0x8,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <link>:
SYSCALL(link)
    1328:	b8 13 00 00 00       	mov    $0x13,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <mkdir>:
SYSCALL(mkdir)
    1330:	b8 14 00 00 00       	mov    $0x14,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <chdir>:
SYSCALL(chdir)
    1338:	b8 09 00 00 00       	mov    $0x9,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <dup>:
SYSCALL(dup)
    1340:	b8 0a 00 00 00       	mov    $0xa,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <getpid>:
SYSCALL(getpid)
    1348:	b8 0b 00 00 00       	mov    $0xb,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <sbrk>:
SYSCALL(sbrk)
    1350:	b8 0c 00 00 00       	mov    $0xc,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <sleep>:
SYSCALL(sleep)
    1358:	b8 0d 00 00 00       	mov    $0xd,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <uptime>:
SYSCALL(uptime)
    1360:	b8 0e 00 00 00       	mov    $0xe,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <clone>:
SYSCALL(clone)
    1368:	b8 16 00 00 00       	mov    $0x16,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <texit>:
SYSCALL(texit)
    1370:	b8 17 00 00 00       	mov    $0x17,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <tsleep>:
SYSCALL(tsleep)
    1378:	b8 18 00 00 00       	mov    $0x18,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <twakeup>:
SYSCALL(twakeup)
    1380:	b8 19 00 00 00       	mov    $0x19,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1388:	55                   	push   %ebp
    1389:	89 e5                	mov    %esp,%ebp
    138b:	83 ec 28             	sub    $0x28,%esp
    138e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1391:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1394:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    139b:	00 
    139c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    139f:	89 44 24 04          	mov    %eax,0x4(%esp)
    13a3:	8b 45 08             	mov    0x8(%ebp),%eax
    13a6:	89 04 24             	mov    %eax,(%esp)
    13a9:	e8 3a ff ff ff       	call   12e8 <write>
}
    13ae:	c9                   	leave  
    13af:	c3                   	ret    

000013b0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13b0:	55                   	push   %ebp
    13b1:	89 e5                	mov    %esp,%ebp
    13b3:	53                   	push   %ebx
    13b4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13b7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13be:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13c2:	74 17                	je     13db <printint+0x2b>
    13c4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13c8:	79 11                	jns    13db <printint+0x2b>
    neg = 1;
    13ca:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13d1:	8b 45 0c             	mov    0xc(%ebp),%eax
    13d4:	f7 d8                	neg    %eax
    13d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13d9:	eb 06                	jmp    13e1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13db:	8b 45 0c             	mov    0xc(%ebp),%eax
    13de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    13e1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    13e8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    13eb:	8b 5d 10             	mov    0x10(%ebp),%ebx
    13ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13f1:	ba 00 00 00 00       	mov    $0x0,%edx
    13f6:	f7 f3                	div    %ebx
    13f8:	89 d0                	mov    %edx,%eax
    13fa:	0f b6 80 b4 1a 00 00 	movzbl 0x1ab4(%eax),%eax
    1401:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1405:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1409:	8b 45 10             	mov    0x10(%ebp),%eax
    140c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    140f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1412:	ba 00 00 00 00       	mov    $0x0,%edx
    1417:	f7 75 d4             	divl   -0x2c(%ebp)
    141a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    141d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1421:	75 c5                	jne    13e8 <printint+0x38>
  if(neg)
    1423:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1427:	74 28                	je     1451 <printint+0xa1>
    buf[i++] = '-';
    1429:	8b 45 ec             	mov    -0x14(%ebp),%eax
    142c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1431:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1435:	eb 1a                	jmp    1451 <printint+0xa1>
    putc(fd, buf[i]);
    1437:	8b 45 ec             	mov    -0x14(%ebp),%eax
    143a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    143f:	0f be c0             	movsbl %al,%eax
    1442:	89 44 24 04          	mov    %eax,0x4(%esp)
    1446:	8b 45 08             	mov    0x8(%ebp),%eax
    1449:	89 04 24             	mov    %eax,(%esp)
    144c:	e8 37 ff ff ff       	call   1388 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1451:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1455:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1459:	79 dc                	jns    1437 <printint+0x87>
    putc(fd, buf[i]);
}
    145b:	83 c4 44             	add    $0x44,%esp
    145e:	5b                   	pop    %ebx
    145f:	5d                   	pop    %ebp
    1460:	c3                   	ret    

00001461 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1461:	55                   	push   %ebp
    1462:	89 e5                	mov    %esp,%ebp
    1464:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1467:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    146e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1471:	83 c0 04             	add    $0x4,%eax
    1474:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1477:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    147e:	e9 7e 01 00 00       	jmp    1601 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1483:	8b 55 0c             	mov    0xc(%ebp),%edx
    1486:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1489:	8d 04 02             	lea    (%edx,%eax,1),%eax
    148c:	0f b6 00             	movzbl (%eax),%eax
    148f:	0f be c0             	movsbl %al,%eax
    1492:	25 ff 00 00 00       	and    $0xff,%eax
    1497:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    149a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    149e:	75 2c                	jne    14cc <printf+0x6b>
      if(c == '%'){
    14a0:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    14a4:	75 0c                	jne    14b2 <printf+0x51>
        state = '%';
    14a6:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    14ad:	e9 4b 01 00 00       	jmp    15fd <printf+0x19c>
      } else {
        putc(fd, c);
    14b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14b5:	0f be c0             	movsbl %al,%eax
    14b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14bc:	8b 45 08             	mov    0x8(%ebp),%eax
    14bf:	89 04 24             	mov    %eax,(%esp)
    14c2:	e8 c1 fe ff ff       	call   1388 <putc>
    14c7:	e9 31 01 00 00       	jmp    15fd <printf+0x19c>
      }
    } else if(state == '%'){
    14cc:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    14d0:	0f 85 27 01 00 00    	jne    15fd <printf+0x19c>
      if(c == 'd'){
    14d6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    14da:	75 2d                	jne    1509 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    14dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14df:	8b 00                	mov    (%eax),%eax
    14e1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    14e8:	00 
    14e9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    14f0:	00 
    14f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f5:	8b 45 08             	mov    0x8(%ebp),%eax
    14f8:	89 04 24             	mov    %eax,(%esp)
    14fb:	e8 b0 fe ff ff       	call   13b0 <printint>
        ap++;
    1500:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1504:	e9 ed 00 00 00       	jmp    15f6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1509:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    150d:	74 06                	je     1515 <printf+0xb4>
    150f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1513:	75 2d                	jne    1542 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1515:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1518:	8b 00                	mov    (%eax),%eax
    151a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1521:	00 
    1522:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1529:	00 
    152a:	89 44 24 04          	mov    %eax,0x4(%esp)
    152e:	8b 45 08             	mov    0x8(%ebp),%eax
    1531:	89 04 24             	mov    %eax,(%esp)
    1534:	e8 77 fe ff ff       	call   13b0 <printint>
        ap++;
    1539:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    153d:	e9 b4 00 00 00       	jmp    15f6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1542:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1546:	75 46                	jne    158e <printf+0x12d>
        s = (char*)*ap;
    1548:	8b 45 f4             	mov    -0xc(%ebp),%eax
    154b:	8b 00                	mov    (%eax),%eax
    154d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1550:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1554:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1558:	75 27                	jne    1581 <printf+0x120>
          s = "(null)";
    155a:	c7 45 e4 81 1a 00 00 	movl   $0x1a81,-0x1c(%ebp)
        while(*s != 0){
    1561:	eb 1f                	jmp    1582 <printf+0x121>
          putc(fd, *s);
    1563:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1566:	0f b6 00             	movzbl (%eax),%eax
    1569:	0f be c0             	movsbl %al,%eax
    156c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1570:	8b 45 08             	mov    0x8(%ebp),%eax
    1573:	89 04 24             	mov    %eax,(%esp)
    1576:	e8 0d fe ff ff       	call   1388 <putc>
          s++;
    157b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    157f:	eb 01                	jmp    1582 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1581:	90                   	nop
    1582:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1585:	0f b6 00             	movzbl (%eax),%eax
    1588:	84 c0                	test   %al,%al
    158a:	75 d7                	jne    1563 <printf+0x102>
    158c:	eb 68                	jmp    15f6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    158e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1592:	75 1d                	jne    15b1 <printf+0x150>
        putc(fd, *ap);
    1594:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1597:	8b 00                	mov    (%eax),%eax
    1599:	0f be c0             	movsbl %al,%eax
    159c:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a0:	8b 45 08             	mov    0x8(%ebp),%eax
    15a3:	89 04 24             	mov    %eax,(%esp)
    15a6:	e8 dd fd ff ff       	call   1388 <putc>
        ap++;
    15ab:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    15af:	eb 45                	jmp    15f6 <printf+0x195>
      } else if(c == '%'){
    15b1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    15b5:	75 17                	jne    15ce <printf+0x16d>
        putc(fd, c);
    15b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15ba:	0f be c0             	movsbl %al,%eax
    15bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c1:	8b 45 08             	mov    0x8(%ebp),%eax
    15c4:	89 04 24             	mov    %eax,(%esp)
    15c7:	e8 bc fd ff ff       	call   1388 <putc>
    15cc:	eb 28                	jmp    15f6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15ce:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15d5:	00 
    15d6:	8b 45 08             	mov    0x8(%ebp),%eax
    15d9:	89 04 24             	mov    %eax,(%esp)
    15dc:	e8 a7 fd ff ff       	call   1388 <putc>
        putc(fd, c);
    15e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15e4:	0f be c0             	movsbl %al,%eax
    15e7:	89 44 24 04          	mov    %eax,0x4(%esp)
    15eb:	8b 45 08             	mov    0x8(%ebp),%eax
    15ee:	89 04 24             	mov    %eax,(%esp)
    15f1:	e8 92 fd ff ff       	call   1388 <putc>
      }
      state = 0;
    15f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    15fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1601:	8b 55 0c             	mov    0xc(%ebp),%edx
    1604:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1607:	8d 04 02             	lea    (%edx,%eax,1),%eax
    160a:	0f b6 00             	movzbl (%eax),%eax
    160d:	84 c0                	test   %al,%al
    160f:	0f 85 6e fe ff ff    	jne    1483 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1615:	c9                   	leave  
    1616:	c3                   	ret    
    1617:	90                   	nop

00001618 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1618:	55                   	push   %ebp
    1619:	89 e5                	mov    %esp,%ebp
    161b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    161e:	8b 45 08             	mov    0x8(%ebp),%eax
    1621:	83 e8 08             	sub    $0x8,%eax
    1624:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1627:	a1 d0 1a 00 00       	mov    0x1ad0,%eax
    162c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    162f:	eb 24                	jmp    1655 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1631:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1634:	8b 00                	mov    (%eax),%eax
    1636:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1639:	77 12                	ja     164d <free+0x35>
    163b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    163e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1641:	77 24                	ja     1667 <free+0x4f>
    1643:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1646:	8b 00                	mov    (%eax),%eax
    1648:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    164b:	77 1a                	ja     1667 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    164d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1650:	8b 00                	mov    (%eax),%eax
    1652:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1655:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1658:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    165b:	76 d4                	jbe    1631 <free+0x19>
    165d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1660:	8b 00                	mov    (%eax),%eax
    1662:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1665:	76 ca                	jbe    1631 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1667:	8b 45 f8             	mov    -0x8(%ebp),%eax
    166a:	8b 40 04             	mov    0x4(%eax),%eax
    166d:	c1 e0 03             	shl    $0x3,%eax
    1670:	89 c2                	mov    %eax,%edx
    1672:	03 55 f8             	add    -0x8(%ebp),%edx
    1675:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1678:	8b 00                	mov    (%eax),%eax
    167a:	39 c2                	cmp    %eax,%edx
    167c:	75 24                	jne    16a2 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    167e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1681:	8b 50 04             	mov    0x4(%eax),%edx
    1684:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1687:	8b 00                	mov    (%eax),%eax
    1689:	8b 40 04             	mov    0x4(%eax),%eax
    168c:	01 c2                	add    %eax,%edx
    168e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1691:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1694:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1697:	8b 00                	mov    (%eax),%eax
    1699:	8b 10                	mov    (%eax),%edx
    169b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    169e:	89 10                	mov    %edx,(%eax)
    16a0:	eb 0a                	jmp    16ac <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    16a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a5:	8b 10                	mov    (%eax),%edx
    16a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16aa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16af:	8b 40 04             	mov    0x4(%eax),%eax
    16b2:	c1 e0 03             	shl    $0x3,%eax
    16b5:	03 45 fc             	add    -0x4(%ebp),%eax
    16b8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16bb:	75 20                	jne    16dd <free+0xc5>
    p->s.size += bp->s.size;
    16bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c0:	8b 50 04             	mov    0x4(%eax),%edx
    16c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16c6:	8b 40 04             	mov    0x4(%eax),%eax
    16c9:	01 c2                	add    %eax,%edx
    16cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ce:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16d4:	8b 10                	mov    (%eax),%edx
    16d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16d9:	89 10                	mov    %edx,(%eax)
    16db:	eb 08                	jmp    16e5 <free+0xcd>
  } else
    p->s.ptr = bp;
    16dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    16e3:	89 10                	mov    %edx,(%eax)
  freep = p;
    16e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e8:	a3 d0 1a 00 00       	mov    %eax,0x1ad0
}
    16ed:	c9                   	leave  
    16ee:	c3                   	ret    

000016ef <morecore>:

static Header*
morecore(uint nu)
{
    16ef:	55                   	push   %ebp
    16f0:	89 e5                	mov    %esp,%ebp
    16f2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    16f5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    16fc:	77 07                	ja     1705 <morecore+0x16>
    nu = 4096;
    16fe:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1705:	8b 45 08             	mov    0x8(%ebp),%eax
    1708:	c1 e0 03             	shl    $0x3,%eax
    170b:	89 04 24             	mov    %eax,(%esp)
    170e:	e8 3d fc ff ff       	call   1350 <sbrk>
    1713:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1716:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    171a:	75 07                	jne    1723 <morecore+0x34>
    return 0;
    171c:	b8 00 00 00 00       	mov    $0x0,%eax
    1721:	eb 22                	jmp    1745 <morecore+0x56>
  hp = (Header*)p;
    1723:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1726:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1729:	8b 45 f4             	mov    -0xc(%ebp),%eax
    172c:	8b 55 08             	mov    0x8(%ebp),%edx
    172f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1732:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1735:	83 c0 08             	add    $0x8,%eax
    1738:	89 04 24             	mov    %eax,(%esp)
    173b:	e8 d8 fe ff ff       	call   1618 <free>
  return freep;
    1740:	a1 d0 1a 00 00       	mov    0x1ad0,%eax
}
    1745:	c9                   	leave  
    1746:	c3                   	ret    

00001747 <malloc>:

void*
malloc(uint nbytes)
{
    1747:	55                   	push   %ebp
    1748:	89 e5                	mov    %esp,%ebp
    174a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    174d:	8b 45 08             	mov    0x8(%ebp),%eax
    1750:	83 c0 07             	add    $0x7,%eax
    1753:	c1 e8 03             	shr    $0x3,%eax
    1756:	83 c0 01             	add    $0x1,%eax
    1759:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    175c:	a1 d0 1a 00 00       	mov    0x1ad0,%eax
    1761:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1764:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1768:	75 23                	jne    178d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    176a:	c7 45 f0 c8 1a 00 00 	movl   $0x1ac8,-0x10(%ebp)
    1771:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1774:	a3 d0 1a 00 00       	mov    %eax,0x1ad0
    1779:	a1 d0 1a 00 00       	mov    0x1ad0,%eax
    177e:	a3 c8 1a 00 00       	mov    %eax,0x1ac8
    base.s.size = 0;
    1783:	c7 05 cc 1a 00 00 00 	movl   $0x0,0x1acc
    178a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    178d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1790:	8b 00                	mov    (%eax),%eax
    1792:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1795:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1798:	8b 40 04             	mov    0x4(%eax),%eax
    179b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    179e:	72 4d                	jb     17ed <malloc+0xa6>
      if(p->s.size == nunits)
    17a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17a3:	8b 40 04             	mov    0x4(%eax),%eax
    17a6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17a9:	75 0c                	jne    17b7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ae:	8b 10                	mov    (%eax),%edx
    17b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b3:	89 10                	mov    %edx,(%eax)
    17b5:	eb 26                	jmp    17dd <malloc+0x96>
      else {
        p->s.size -= nunits;
    17b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ba:	8b 40 04             	mov    0x4(%eax),%eax
    17bd:	89 c2                	mov    %eax,%edx
    17bf:	2b 55 f4             	sub    -0xc(%ebp),%edx
    17c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17c5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17cb:	8b 40 04             	mov    0x4(%eax),%eax
    17ce:	c1 e0 03             	shl    $0x3,%eax
    17d1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    17d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    17da:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17e0:	a3 d0 1a 00 00       	mov    %eax,0x1ad0
      return (void*)(p + 1);
    17e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17e8:	83 c0 08             	add    $0x8,%eax
    17eb:	eb 38                	jmp    1825 <malloc+0xde>
    }
    if(p == freep)
    17ed:	a1 d0 1a 00 00       	mov    0x1ad0,%eax
    17f2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    17f5:	75 1b                	jne    1812 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    17f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17fa:	89 04 24             	mov    %eax,(%esp)
    17fd:	e8 ed fe ff ff       	call   16ef <morecore>
    1802:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1805:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1809:	75 07                	jne    1812 <malloc+0xcb>
        return 0;
    180b:	b8 00 00 00 00       	mov    $0x0,%eax
    1810:	eb 13                	jmp    1825 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1812:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1815:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1818:	8b 45 ec             	mov    -0x14(%ebp),%eax
    181b:	8b 00                	mov    (%eax),%eax
    181d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1820:	e9 70 ff ff ff       	jmp    1795 <malloc+0x4e>
}
    1825:	c9                   	leave  
    1826:	c3                   	ret    
    1827:	90                   	nop

00001828 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1828:	55                   	push   %ebp
    1829:	89 e5                	mov    %esp,%ebp
    182b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    182e:	8b 55 08             	mov    0x8(%ebp),%edx
    1831:	8b 45 0c             	mov    0xc(%ebp),%eax
    1834:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1837:	f0 87 02             	lock xchg %eax,(%edx)
    183a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    183d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1840:	c9                   	leave  
    1841:	c3                   	ret    

00001842 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1842:	55                   	push   %ebp
    1843:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1845:	8b 45 08             	mov    0x8(%ebp),%eax
    1848:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    184e:	5d                   	pop    %ebp
    184f:	c3                   	ret    

00001850 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1850:	55                   	push   %ebp
    1851:	89 e5                	mov    %esp,%ebp
    1853:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1856:	8b 45 08             	mov    0x8(%ebp),%eax
    1859:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1860:	00 
    1861:	89 04 24             	mov    %eax,(%esp)
    1864:	e8 bf ff ff ff       	call   1828 <xchg>
    1869:	85 c0                	test   %eax,%eax
    186b:	75 e9                	jne    1856 <lock_acquire+0x6>
}
    186d:	c9                   	leave  
    186e:	c3                   	ret    

0000186f <lock_release>:
void lock_release(lock_t *lock){
    186f:	55                   	push   %ebp
    1870:	89 e5                	mov    %esp,%ebp
    1872:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1875:	8b 45 08             	mov    0x8(%ebp),%eax
    1878:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    187f:	00 
    1880:	89 04 24             	mov    %eax,(%esp)
    1883:	e8 a0 ff ff ff       	call   1828 <xchg>
}
    1888:	c9                   	leave  
    1889:	c3                   	ret    

0000188a <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    188a:	55                   	push   %ebp
    188b:	89 e5                	mov    %esp,%ebp
    188d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1890:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1897:	e8 ab fe ff ff       	call   1747 <malloc>
    189c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    189f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18a8:	25 ff 0f 00 00       	and    $0xfff,%eax
    18ad:	85 c0                	test   %eax,%eax
    18af:	74 15                	je     18c6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    18b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18b4:	89 c2                	mov    %eax,%edx
    18b6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    18bc:	b8 00 10 00 00       	mov    $0x1000,%eax
    18c1:	29 d0                	sub    %edx,%eax
    18c3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    18c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18ca:	75 1b                	jne    18e7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    18cc:	c7 44 24 04 88 1a 00 	movl   $0x1a88,0x4(%esp)
    18d3:	00 
    18d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18db:	e8 81 fb ff ff       	call   1461 <printf>
        return 0;
    18e0:	b8 00 00 00 00       	mov    $0x0,%eax
    18e5:	eb 6f                	jmp    1956 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    18e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    18ea:	8b 55 08             	mov    0x8(%ebp),%edx
    18ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18f0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    18f4:	89 54 24 08          	mov    %edx,0x8(%esp)
    18f8:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    18ff:	00 
    1900:	89 04 24             	mov    %eax,(%esp)
    1903:	e8 60 fa ff ff       	call   1368 <clone>
    1908:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    190b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    190f:	79 1b                	jns    192c <thread_create+0xa2>
        printf(1,"clone fails\n");
    1911:	c7 44 24 04 96 1a 00 	movl   $0x1a96,0x4(%esp)
    1918:	00 
    1919:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1920:	e8 3c fb ff ff       	call   1461 <printf>
        return 0;
    1925:	b8 00 00 00 00       	mov    $0x0,%eax
    192a:	eb 2a                	jmp    1956 <thread_create+0xcc>
    }
    if(tid > 0){
    192c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1930:	7e 05                	jle    1937 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1932:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1935:	eb 1f                	jmp    1956 <thread_create+0xcc>
    }
    if(tid == 0){
    1937:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    193b:	75 14                	jne    1951 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    193d:	c7 44 24 04 a3 1a 00 	movl   $0x1aa3,0x4(%esp)
    1944:	00 
    1945:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    194c:	e8 10 fb ff ff       	call   1461 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1951:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1956:	c9                   	leave  
    1957:	c3                   	ret    

00001958 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1958:	55                   	push   %ebp
    1959:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    195b:	8b 45 08             	mov    0x8(%ebp),%eax
    195e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1964:	8b 45 08             	mov    0x8(%ebp),%eax
    1967:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    196e:	8b 45 08             	mov    0x8(%ebp),%eax
    1971:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1978:	5d                   	pop    %ebp
    1979:	c3                   	ret    

0000197a <add_q>:

void add_q(struct queue *q, int v){
    197a:	55                   	push   %ebp
    197b:	89 e5                	mov    %esp,%ebp
    197d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1980:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1987:	e8 bb fd ff ff       	call   1747 <malloc>
    198c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    198f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1992:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1999:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199c:	8b 55 0c             	mov    0xc(%ebp),%edx
    199f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19a1:	8b 45 08             	mov    0x8(%ebp),%eax
    19a4:	8b 40 04             	mov    0x4(%eax),%eax
    19a7:	85 c0                	test   %eax,%eax
    19a9:	75 0b                	jne    19b6 <add_q+0x3c>
        q->head = n;
    19ab:	8b 45 08             	mov    0x8(%ebp),%eax
    19ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19b1:	89 50 04             	mov    %edx,0x4(%eax)
    19b4:	eb 0c                	jmp    19c2 <add_q+0x48>
    }else{
        q->tail->next = n;
    19b6:	8b 45 08             	mov    0x8(%ebp),%eax
    19b9:	8b 40 08             	mov    0x8(%eax),%eax
    19bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19bf:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    19c2:	8b 45 08             	mov    0x8(%ebp),%eax
    19c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19c8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    19cb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ce:	8b 00                	mov    (%eax),%eax
    19d0:	8d 50 01             	lea    0x1(%eax),%edx
    19d3:	8b 45 08             	mov    0x8(%ebp),%eax
    19d6:	89 10                	mov    %edx,(%eax)
}
    19d8:	c9                   	leave  
    19d9:	c3                   	ret    

000019da <empty_q>:

int empty_q(struct queue *q){
    19da:	55                   	push   %ebp
    19db:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    19dd:	8b 45 08             	mov    0x8(%ebp),%eax
    19e0:	8b 00                	mov    (%eax),%eax
    19e2:	85 c0                	test   %eax,%eax
    19e4:	75 07                	jne    19ed <empty_q+0x13>
        return 1;
    19e6:	b8 01 00 00 00       	mov    $0x1,%eax
    19eb:	eb 05                	jmp    19f2 <empty_q+0x18>
    else
        return 0;
    19ed:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    19f2:	5d                   	pop    %ebp
    19f3:	c3                   	ret    

000019f4 <pop_q>:
int pop_q(struct queue *q){
    19f4:	55                   	push   %ebp
    19f5:	89 e5                	mov    %esp,%ebp
    19f7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    19fa:	8b 45 08             	mov    0x8(%ebp),%eax
    19fd:	89 04 24             	mov    %eax,(%esp)
    1a00:	e8 d5 ff ff ff       	call   19da <empty_q>
    1a05:	85 c0                	test   %eax,%eax
    1a07:	75 5d                	jne    1a66 <pop_q+0x72>
       val = q->head->value; 
    1a09:	8b 45 08             	mov    0x8(%ebp),%eax
    1a0c:	8b 40 04             	mov    0x4(%eax),%eax
    1a0f:	8b 00                	mov    (%eax),%eax
    1a11:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1a14:	8b 45 08             	mov    0x8(%ebp),%eax
    1a17:	8b 40 04             	mov    0x4(%eax),%eax
    1a1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a20:	8b 40 04             	mov    0x4(%eax),%eax
    1a23:	8b 50 04             	mov    0x4(%eax),%edx
    1a26:	8b 45 08             	mov    0x8(%ebp),%eax
    1a29:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a2f:	89 04 24             	mov    %eax,(%esp)
    1a32:	e8 e1 fb ff ff       	call   1618 <free>
       q->size--;
    1a37:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3a:	8b 00                	mov    (%eax),%eax
    1a3c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a3f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a42:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a44:	8b 45 08             	mov    0x8(%ebp),%eax
    1a47:	8b 00                	mov    (%eax),%eax
    1a49:	85 c0                	test   %eax,%eax
    1a4b:	75 14                	jne    1a61 <pop_q+0x6d>
            q->head = 0;
    1a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a50:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a61:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a64:	eb 05                	jmp    1a6b <pop_q+0x77>
    }
    return -1;
    1a66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a6b:	c9                   	leave  
    1a6c:	c3                   	ret    
