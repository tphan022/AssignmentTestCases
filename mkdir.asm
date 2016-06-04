
_mkdir:     file format elf32-i386


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

  if(argc < 2){
    1009:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    100d:	7f 19                	jg     1028 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
    100f:	c7 44 24 04 8d 1a 00 	movl   $0x1a8d,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    101e:	e8 5e 04 00 00       	call   1481 <printf>
    exit();
    1023:	e8 c0 02 00 00       	call   12e8 <exit>
  }

  for(i = 1; i < argc; i++){
    1028:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    102f:	00 
    1030:	eb 43                	jmp    1075 <main+0x75>
    if(mkdir(argv[i]) < 0){
    1032:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1036:	c1 e0 02             	shl    $0x2,%eax
    1039:	03 45 0c             	add    0xc(%ebp),%eax
    103c:	8b 00                	mov    (%eax),%eax
    103e:	89 04 24             	mov    %eax,(%esp)
    1041:	e8 0a 03 00 00       	call   1350 <mkdir>
    1046:	85 c0                	test   %eax,%eax
    1048:	79 26                	jns    1070 <main+0x70>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
    104a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    104e:	c1 e0 02             	shl    $0x2,%eax
    1051:	03 45 0c             	add    0xc(%ebp),%eax
    1054:	8b 00                	mov    (%eax),%eax
    1056:	89 44 24 08          	mov    %eax,0x8(%esp)
    105a:	c7 44 24 04 a4 1a 00 	movl   $0x1aa4,0x4(%esp)
    1061:	00 
    1062:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1069:	e8 13 04 00 00       	call   1481 <printf>
      break;
    106e:	eb 0e                	jmp    107e <main+0x7e>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    1070:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1075:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1079:	3b 45 08             	cmp    0x8(%ebp),%eax
    107c:	7c b4                	jl     1032 <main+0x32>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
    107e:	e8 65 02 00 00       	call   12e8 <exit>
    1083:	90                   	nop

00001084 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1084:	55                   	push   %ebp
    1085:	89 e5                	mov    %esp,%ebp
    1087:	57                   	push   %edi
    1088:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1089:	8b 4d 08             	mov    0x8(%ebp),%ecx
    108c:	8b 55 10             	mov    0x10(%ebp),%edx
    108f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1092:	89 cb                	mov    %ecx,%ebx
    1094:	89 df                	mov    %ebx,%edi
    1096:	89 d1                	mov    %edx,%ecx
    1098:	fc                   	cld    
    1099:	f3 aa                	rep stos %al,%es:(%edi)
    109b:	89 ca                	mov    %ecx,%edx
    109d:	89 fb                	mov    %edi,%ebx
    109f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10a2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    10a5:	5b                   	pop    %ebx
    10a6:	5f                   	pop    %edi
    10a7:	5d                   	pop    %ebp
    10a8:	c3                   	ret    

000010a9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10a9:	55                   	push   %ebp
    10aa:	89 e5                	mov    %esp,%ebp
    10ac:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    10af:	8b 45 08             	mov    0x8(%ebp),%eax
    10b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    10b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b8:	0f b6 10             	movzbl (%eax),%edx
    10bb:	8b 45 08             	mov    0x8(%ebp),%eax
    10be:	88 10                	mov    %dl,(%eax)
    10c0:	8b 45 08             	mov    0x8(%ebp),%eax
    10c3:	0f b6 00             	movzbl (%eax),%eax
    10c6:	84 c0                	test   %al,%al
    10c8:	0f 95 c0             	setne  %al
    10cb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10cf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    10d3:	84 c0                	test   %al,%al
    10d5:	75 de                	jne    10b5 <strcpy+0xc>
    ;
  return os;
    10d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    10da:	c9                   	leave  
    10db:	c3                   	ret    

000010dc <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10dc:	55                   	push   %ebp
    10dd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    10df:	eb 08                	jmp    10e9 <strcmp+0xd>
    p++, q++;
    10e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    10e5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10e9:	8b 45 08             	mov    0x8(%ebp),%eax
    10ec:	0f b6 00             	movzbl (%eax),%eax
    10ef:	84 c0                	test   %al,%al
    10f1:	74 10                	je     1103 <strcmp+0x27>
    10f3:	8b 45 08             	mov    0x8(%ebp),%eax
    10f6:	0f b6 10             	movzbl (%eax),%edx
    10f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    10fc:	0f b6 00             	movzbl (%eax),%eax
    10ff:	38 c2                	cmp    %al,%dl
    1101:	74 de                	je     10e1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1103:	8b 45 08             	mov    0x8(%ebp),%eax
    1106:	0f b6 00             	movzbl (%eax),%eax
    1109:	0f b6 d0             	movzbl %al,%edx
    110c:	8b 45 0c             	mov    0xc(%ebp),%eax
    110f:	0f b6 00             	movzbl (%eax),%eax
    1112:	0f b6 c0             	movzbl %al,%eax
    1115:	89 d1                	mov    %edx,%ecx
    1117:	29 c1                	sub    %eax,%ecx
    1119:	89 c8                	mov    %ecx,%eax
}
    111b:	5d                   	pop    %ebp
    111c:	c3                   	ret    

0000111d <strlen>:

uint
strlen(char *s)
{
    111d:	55                   	push   %ebp
    111e:	89 e5                	mov    %esp,%ebp
    1120:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1123:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    112a:	eb 04                	jmp    1130 <strlen+0x13>
    112c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1130:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1133:	03 45 08             	add    0x8(%ebp),%eax
    1136:	0f b6 00             	movzbl (%eax),%eax
    1139:	84 c0                	test   %al,%al
    113b:	75 ef                	jne    112c <strlen+0xf>
    ;
  return n;
    113d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1140:	c9                   	leave  
    1141:	c3                   	ret    

00001142 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1142:	55                   	push   %ebp
    1143:	89 e5                	mov    %esp,%ebp
    1145:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1148:	8b 45 10             	mov    0x10(%ebp),%eax
    114b:	89 44 24 08          	mov    %eax,0x8(%esp)
    114f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1152:	89 44 24 04          	mov    %eax,0x4(%esp)
    1156:	8b 45 08             	mov    0x8(%ebp),%eax
    1159:	89 04 24             	mov    %eax,(%esp)
    115c:	e8 23 ff ff ff       	call   1084 <stosb>
  return dst;
    1161:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1164:	c9                   	leave  
    1165:	c3                   	ret    

00001166 <strchr>:

char*
strchr(const char *s, char c)
{
    1166:	55                   	push   %ebp
    1167:	89 e5                	mov    %esp,%ebp
    1169:	83 ec 04             	sub    $0x4,%esp
    116c:	8b 45 0c             	mov    0xc(%ebp),%eax
    116f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1172:	eb 14                	jmp    1188 <strchr+0x22>
    if(*s == c)
    1174:	8b 45 08             	mov    0x8(%ebp),%eax
    1177:	0f b6 00             	movzbl (%eax),%eax
    117a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    117d:	75 05                	jne    1184 <strchr+0x1e>
      return (char*)s;
    117f:	8b 45 08             	mov    0x8(%ebp),%eax
    1182:	eb 13                	jmp    1197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1188:	8b 45 08             	mov    0x8(%ebp),%eax
    118b:	0f b6 00             	movzbl (%eax),%eax
    118e:	84 c0                	test   %al,%al
    1190:	75 e2                	jne    1174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1192:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1197:	c9                   	leave  
    1198:	c3                   	ret    

00001199 <gets>:

char*
gets(char *buf, int max)
{
    1199:	55                   	push   %ebp
    119a:	89 e5                	mov    %esp,%ebp
    119c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    119f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    11a6:	eb 44                	jmp    11ec <gets+0x53>
    cc = read(0, &c, 1);
    11a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11af:	00 
    11b0:	8d 45 ef             	lea    -0x11(%ebp),%eax
    11b3:	89 44 24 04          	mov    %eax,0x4(%esp)
    11b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11be:	e8 3d 01 00 00       	call   1300 <read>
    11c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    11c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11ca:	7e 2d                	jle    11f9 <gets+0x60>
      break;
    buf[i++] = c;
    11cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11cf:	03 45 08             	add    0x8(%ebp),%eax
    11d2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    11d6:	88 10                	mov    %dl,(%eax)
    11d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    11dc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11e0:	3c 0a                	cmp    $0xa,%al
    11e2:	74 16                	je     11fa <gets+0x61>
    11e4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    11e8:	3c 0d                	cmp    $0xd,%al
    11ea:	74 0e                	je     11fa <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11ef:	83 c0 01             	add    $0x1,%eax
    11f2:	3b 45 0c             	cmp    0xc(%ebp),%eax
    11f5:	7c b1                	jl     11a8 <gets+0xf>
    11f7:	eb 01                	jmp    11fa <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    11f9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    11fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11fd:	03 45 08             	add    0x8(%ebp),%eax
    1200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1203:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1206:	c9                   	leave  
    1207:	c3                   	ret    

00001208 <stat>:

int
stat(char *n, struct stat *st)
{
    1208:	55                   	push   %ebp
    1209:	89 e5                	mov    %esp,%ebp
    120b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    120e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1215:	00 
    1216:	8b 45 08             	mov    0x8(%ebp),%eax
    1219:	89 04 24             	mov    %eax,(%esp)
    121c:	e8 07 01 00 00       	call   1328 <open>
    1221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1224:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1228:	79 07                	jns    1231 <stat+0x29>
    return -1;
    122a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    122f:	eb 23                	jmp    1254 <stat+0x4c>
  r = fstat(fd, st);
    1231:	8b 45 0c             	mov    0xc(%ebp),%eax
    1234:	89 44 24 04          	mov    %eax,0x4(%esp)
    1238:	8b 45 f0             	mov    -0x10(%ebp),%eax
    123b:	89 04 24             	mov    %eax,(%esp)
    123e:	e8 fd 00 00 00       	call   1340 <fstat>
    1243:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1246:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1249:	89 04 24             	mov    %eax,(%esp)
    124c:	e8 bf 00 00 00       	call   1310 <close>
  return r;
    1251:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1254:	c9                   	leave  
    1255:	c3                   	ret    

00001256 <atoi>:

int
atoi(const char *s)
{
    1256:	55                   	push   %ebp
    1257:	89 e5                	mov    %esp,%ebp
    1259:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    125c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1263:	eb 24                	jmp    1289 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1265:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1268:	89 d0                	mov    %edx,%eax
    126a:	c1 e0 02             	shl    $0x2,%eax
    126d:	01 d0                	add    %edx,%eax
    126f:	01 c0                	add    %eax,%eax
    1271:	89 c2                	mov    %eax,%edx
    1273:	8b 45 08             	mov    0x8(%ebp),%eax
    1276:	0f b6 00             	movzbl (%eax),%eax
    1279:	0f be c0             	movsbl %al,%eax
    127c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    127f:	83 e8 30             	sub    $0x30,%eax
    1282:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1285:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1289:	8b 45 08             	mov    0x8(%ebp),%eax
    128c:	0f b6 00             	movzbl (%eax),%eax
    128f:	3c 2f                	cmp    $0x2f,%al
    1291:	7e 0a                	jle    129d <atoi+0x47>
    1293:	8b 45 08             	mov    0x8(%ebp),%eax
    1296:	0f b6 00             	movzbl (%eax),%eax
    1299:	3c 39                	cmp    $0x39,%al
    129b:	7e c8                	jle    1265 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    129d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12a0:	c9                   	leave  
    12a1:	c3                   	ret    

000012a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12a2:	55                   	push   %ebp
    12a3:	89 e5                	mov    %esp,%ebp
    12a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    12a8:	8b 45 08             	mov    0x8(%ebp),%eax
    12ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    12ae:	8b 45 0c             	mov    0xc(%ebp),%eax
    12b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    12b4:	eb 13                	jmp    12c9 <memmove+0x27>
    *dst++ = *src++;
    12b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12b9:	0f b6 10             	movzbl (%eax),%edx
    12bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12bf:	88 10                	mov    %dl,(%eax)
    12c1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    12c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12c9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    12cd:	0f 9f c0             	setg   %al
    12d0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    12d4:	84 c0                	test   %al,%al
    12d6:	75 de                	jne    12b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    12d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12db:	c9                   	leave  
    12dc:	c3                   	ret    
    12dd:	90                   	nop
    12de:	90                   	nop
    12df:	90                   	nop

000012e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12e0:	b8 01 00 00 00       	mov    $0x1,%eax
    12e5:	cd 40                	int    $0x40
    12e7:	c3                   	ret    

000012e8 <exit>:
SYSCALL(exit)
    12e8:	b8 02 00 00 00       	mov    $0x2,%eax
    12ed:	cd 40                	int    $0x40
    12ef:	c3                   	ret    

000012f0 <wait>:
SYSCALL(wait)
    12f0:	b8 03 00 00 00       	mov    $0x3,%eax
    12f5:	cd 40                	int    $0x40
    12f7:	c3                   	ret    

000012f8 <pipe>:
SYSCALL(pipe)
    12f8:	b8 04 00 00 00       	mov    $0x4,%eax
    12fd:	cd 40                	int    $0x40
    12ff:	c3                   	ret    

00001300 <read>:
SYSCALL(read)
    1300:	b8 05 00 00 00       	mov    $0x5,%eax
    1305:	cd 40                	int    $0x40
    1307:	c3                   	ret    

00001308 <write>:
SYSCALL(write)
    1308:	b8 10 00 00 00       	mov    $0x10,%eax
    130d:	cd 40                	int    $0x40
    130f:	c3                   	ret    

00001310 <close>:
SYSCALL(close)
    1310:	b8 15 00 00 00       	mov    $0x15,%eax
    1315:	cd 40                	int    $0x40
    1317:	c3                   	ret    

00001318 <kill>:
SYSCALL(kill)
    1318:	b8 06 00 00 00       	mov    $0x6,%eax
    131d:	cd 40                	int    $0x40
    131f:	c3                   	ret    

00001320 <exec>:
SYSCALL(exec)
    1320:	b8 07 00 00 00       	mov    $0x7,%eax
    1325:	cd 40                	int    $0x40
    1327:	c3                   	ret    

00001328 <open>:
SYSCALL(open)
    1328:	b8 0f 00 00 00       	mov    $0xf,%eax
    132d:	cd 40                	int    $0x40
    132f:	c3                   	ret    

00001330 <mknod>:
SYSCALL(mknod)
    1330:	b8 11 00 00 00       	mov    $0x11,%eax
    1335:	cd 40                	int    $0x40
    1337:	c3                   	ret    

00001338 <unlink>:
SYSCALL(unlink)
    1338:	b8 12 00 00 00       	mov    $0x12,%eax
    133d:	cd 40                	int    $0x40
    133f:	c3                   	ret    

00001340 <fstat>:
SYSCALL(fstat)
    1340:	b8 08 00 00 00       	mov    $0x8,%eax
    1345:	cd 40                	int    $0x40
    1347:	c3                   	ret    

00001348 <link>:
SYSCALL(link)
    1348:	b8 13 00 00 00       	mov    $0x13,%eax
    134d:	cd 40                	int    $0x40
    134f:	c3                   	ret    

00001350 <mkdir>:
SYSCALL(mkdir)
    1350:	b8 14 00 00 00       	mov    $0x14,%eax
    1355:	cd 40                	int    $0x40
    1357:	c3                   	ret    

00001358 <chdir>:
SYSCALL(chdir)
    1358:	b8 09 00 00 00       	mov    $0x9,%eax
    135d:	cd 40                	int    $0x40
    135f:	c3                   	ret    

00001360 <dup>:
SYSCALL(dup)
    1360:	b8 0a 00 00 00       	mov    $0xa,%eax
    1365:	cd 40                	int    $0x40
    1367:	c3                   	ret    

00001368 <getpid>:
SYSCALL(getpid)
    1368:	b8 0b 00 00 00       	mov    $0xb,%eax
    136d:	cd 40                	int    $0x40
    136f:	c3                   	ret    

00001370 <sbrk>:
SYSCALL(sbrk)
    1370:	b8 0c 00 00 00       	mov    $0xc,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <sleep>:
SYSCALL(sleep)
    1378:	b8 0d 00 00 00       	mov    $0xd,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <uptime>:
SYSCALL(uptime)
    1380:	b8 0e 00 00 00       	mov    $0xe,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <clone>:
SYSCALL(clone)
    1388:	b8 16 00 00 00       	mov    $0x16,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <texit>:
SYSCALL(texit)
    1390:	b8 17 00 00 00       	mov    $0x17,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <tsleep>:
SYSCALL(tsleep)
    1398:	b8 18 00 00 00       	mov    $0x18,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <twakeup>:
SYSCALL(twakeup)
    13a0:	b8 19 00 00 00       	mov    $0x19,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    13a8:	55                   	push   %ebp
    13a9:	89 e5                	mov    %esp,%ebp
    13ab:	83 ec 28             	sub    $0x28,%esp
    13ae:	8b 45 0c             	mov    0xc(%ebp),%eax
    13b1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    13b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13bb:	00 
    13bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
    13bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    13c3:	8b 45 08             	mov    0x8(%ebp),%eax
    13c6:	89 04 24             	mov    %eax,(%esp)
    13c9:	e8 3a ff ff ff       	call   1308 <write>
}
    13ce:	c9                   	leave  
    13cf:	c3                   	ret    

000013d0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    13d0:	55                   	push   %ebp
    13d1:	89 e5                	mov    %esp,%ebp
    13d3:	53                   	push   %ebx
    13d4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    13d7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    13de:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    13e2:	74 17                	je     13fb <printint+0x2b>
    13e4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    13e8:	79 11                	jns    13fb <printint+0x2b>
    neg = 1;
    13ea:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    13f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    13f4:	f7 d8                	neg    %eax
    13f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    13f9:	eb 06                	jmp    1401 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    13fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    13fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    1401:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1408:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    140b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    140e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1411:	ba 00 00 00 00       	mov    $0x0,%edx
    1416:	f7 f3                	div    %ebx
    1418:	89 d0                	mov    %edx,%eax
    141a:	0f b6 80 f4 1a 00 00 	movzbl 0x1af4(%eax),%eax
    1421:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1425:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1429:	8b 45 10             	mov    0x10(%ebp),%eax
    142c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    142f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1432:	ba 00 00 00 00       	mov    $0x0,%edx
    1437:	f7 75 d4             	divl   -0x2c(%ebp)
    143a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    143d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1441:	75 c5                	jne    1408 <printint+0x38>
  if(neg)
    1443:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1447:	74 28                	je     1471 <printint+0xa1>
    buf[i++] = '-';
    1449:	8b 45 ec             	mov    -0x14(%ebp),%eax
    144c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1451:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1455:	eb 1a                	jmp    1471 <printint+0xa1>
    putc(fd, buf[i]);
    1457:	8b 45 ec             	mov    -0x14(%ebp),%eax
    145a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    145f:	0f be c0             	movsbl %al,%eax
    1462:	89 44 24 04          	mov    %eax,0x4(%esp)
    1466:	8b 45 08             	mov    0x8(%ebp),%eax
    1469:	89 04 24             	mov    %eax,(%esp)
    146c:	e8 37 ff ff ff       	call   13a8 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1471:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1475:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1479:	79 dc                	jns    1457 <printint+0x87>
    putc(fd, buf[i]);
}
    147b:	83 c4 44             	add    $0x44,%esp
    147e:	5b                   	pop    %ebx
    147f:	5d                   	pop    %ebp
    1480:	c3                   	ret    

00001481 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1481:	55                   	push   %ebp
    1482:	89 e5                	mov    %esp,%ebp
    1484:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1487:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    148e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1491:	83 c0 04             	add    $0x4,%eax
    1494:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1497:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    149e:	e9 7e 01 00 00       	jmp    1621 <printf+0x1a0>
    c = fmt[i] & 0xff;
    14a3:	8b 55 0c             	mov    0xc(%ebp),%edx
    14a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a9:	8d 04 02             	lea    (%edx,%eax,1),%eax
    14ac:	0f b6 00             	movzbl (%eax),%eax
    14af:	0f be c0             	movsbl %al,%eax
    14b2:	25 ff 00 00 00       	and    $0xff,%eax
    14b7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    14ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14be:	75 2c                	jne    14ec <printf+0x6b>
      if(c == '%'){
    14c0:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    14c4:	75 0c                	jne    14d2 <printf+0x51>
        state = '%';
    14c6:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    14cd:	e9 4b 01 00 00       	jmp    161d <printf+0x19c>
      } else {
        putc(fd, c);
    14d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    14d5:	0f be c0             	movsbl %al,%eax
    14d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    14dc:	8b 45 08             	mov    0x8(%ebp),%eax
    14df:	89 04 24             	mov    %eax,(%esp)
    14e2:	e8 c1 fe ff ff       	call   13a8 <putc>
    14e7:	e9 31 01 00 00       	jmp    161d <printf+0x19c>
      }
    } else if(state == '%'){
    14ec:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    14f0:	0f 85 27 01 00 00    	jne    161d <printf+0x19c>
      if(c == 'd'){
    14f6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    14fa:	75 2d                	jne    1529 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    14fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ff:	8b 00                	mov    (%eax),%eax
    1501:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1508:	00 
    1509:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1510:	00 
    1511:	89 44 24 04          	mov    %eax,0x4(%esp)
    1515:	8b 45 08             	mov    0x8(%ebp),%eax
    1518:	89 04 24             	mov    %eax,(%esp)
    151b:	e8 b0 fe ff ff       	call   13d0 <printint>
        ap++;
    1520:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1524:	e9 ed 00 00 00       	jmp    1616 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1529:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    152d:	74 06                	je     1535 <printf+0xb4>
    152f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1533:	75 2d                	jne    1562 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1535:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1538:	8b 00                	mov    (%eax),%eax
    153a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1541:	00 
    1542:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1549:	00 
    154a:	89 44 24 04          	mov    %eax,0x4(%esp)
    154e:	8b 45 08             	mov    0x8(%ebp),%eax
    1551:	89 04 24             	mov    %eax,(%esp)
    1554:	e8 77 fe ff ff       	call   13d0 <printint>
        ap++;
    1559:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    155d:	e9 b4 00 00 00       	jmp    1616 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1562:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1566:	75 46                	jne    15ae <printf+0x12d>
        s = (char*)*ap;
    1568:	8b 45 f4             	mov    -0xc(%ebp),%eax
    156b:	8b 00                	mov    (%eax),%eax
    156d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1570:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1574:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1578:	75 27                	jne    15a1 <printf+0x120>
          s = "(null)";
    157a:	c7 45 e4 c0 1a 00 00 	movl   $0x1ac0,-0x1c(%ebp)
        while(*s != 0){
    1581:	eb 1f                	jmp    15a2 <printf+0x121>
          putc(fd, *s);
    1583:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1586:	0f b6 00             	movzbl (%eax),%eax
    1589:	0f be c0             	movsbl %al,%eax
    158c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1590:	8b 45 08             	mov    0x8(%ebp),%eax
    1593:	89 04 24             	mov    %eax,(%esp)
    1596:	e8 0d fe ff ff       	call   13a8 <putc>
          s++;
    159b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    159f:	eb 01                	jmp    15a2 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15a1:	90                   	nop
    15a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15a5:	0f b6 00             	movzbl (%eax),%eax
    15a8:	84 c0                	test   %al,%al
    15aa:	75 d7                	jne    1583 <printf+0x102>
    15ac:	eb 68                	jmp    1616 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15ae:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    15b2:	75 1d                	jne    15d1 <printf+0x150>
        putc(fd, *ap);
    15b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b7:	8b 00                	mov    (%eax),%eax
    15b9:	0f be c0             	movsbl %al,%eax
    15bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    15c0:	8b 45 08             	mov    0x8(%ebp),%eax
    15c3:	89 04 24             	mov    %eax,(%esp)
    15c6:	e8 dd fd ff ff       	call   13a8 <putc>
        ap++;
    15cb:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    15cf:	eb 45                	jmp    1616 <printf+0x195>
      } else if(c == '%'){
    15d1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    15d5:	75 17                	jne    15ee <printf+0x16d>
        putc(fd, c);
    15d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15da:	0f be c0             	movsbl %al,%eax
    15dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    15e1:	8b 45 08             	mov    0x8(%ebp),%eax
    15e4:	89 04 24             	mov    %eax,(%esp)
    15e7:	e8 bc fd ff ff       	call   13a8 <putc>
    15ec:	eb 28                	jmp    1616 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15ee:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    15f5:	00 
    15f6:	8b 45 08             	mov    0x8(%ebp),%eax
    15f9:	89 04 24             	mov    %eax,(%esp)
    15fc:	e8 a7 fd ff ff       	call   13a8 <putc>
        putc(fd, c);
    1601:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1604:	0f be c0             	movsbl %al,%eax
    1607:	89 44 24 04          	mov    %eax,0x4(%esp)
    160b:	8b 45 08             	mov    0x8(%ebp),%eax
    160e:	89 04 24             	mov    %eax,(%esp)
    1611:	e8 92 fd ff ff       	call   13a8 <putc>
      }
      state = 0;
    1616:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    161d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1621:	8b 55 0c             	mov    0xc(%ebp),%edx
    1624:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1627:	8d 04 02             	lea    (%edx,%eax,1),%eax
    162a:	0f b6 00             	movzbl (%eax),%eax
    162d:	84 c0                	test   %al,%al
    162f:	0f 85 6e fe ff ff    	jne    14a3 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1635:	c9                   	leave  
    1636:	c3                   	ret    
    1637:	90                   	nop

00001638 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1638:	55                   	push   %ebp
    1639:	89 e5                	mov    %esp,%ebp
    163b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    163e:	8b 45 08             	mov    0x8(%ebp),%eax
    1641:	83 e8 08             	sub    $0x8,%eax
    1644:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1647:	a1 10 1b 00 00       	mov    0x1b10,%eax
    164c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    164f:	eb 24                	jmp    1675 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1651:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1654:	8b 00                	mov    (%eax),%eax
    1656:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1659:	77 12                	ja     166d <free+0x35>
    165b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    165e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1661:	77 24                	ja     1687 <free+0x4f>
    1663:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1666:	8b 00                	mov    (%eax),%eax
    1668:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    166b:	77 1a                	ja     1687 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    166d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1670:	8b 00                	mov    (%eax),%eax
    1672:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1675:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1678:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    167b:	76 d4                	jbe    1651 <free+0x19>
    167d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1680:	8b 00                	mov    (%eax),%eax
    1682:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1685:	76 ca                	jbe    1651 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1687:	8b 45 f8             	mov    -0x8(%ebp),%eax
    168a:	8b 40 04             	mov    0x4(%eax),%eax
    168d:	c1 e0 03             	shl    $0x3,%eax
    1690:	89 c2                	mov    %eax,%edx
    1692:	03 55 f8             	add    -0x8(%ebp),%edx
    1695:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1698:	8b 00                	mov    (%eax),%eax
    169a:	39 c2                	cmp    %eax,%edx
    169c:	75 24                	jne    16c2 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    169e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a1:	8b 50 04             	mov    0x4(%eax),%edx
    16a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16a7:	8b 00                	mov    (%eax),%eax
    16a9:	8b 40 04             	mov    0x4(%eax),%eax
    16ac:	01 c2                	add    %eax,%edx
    16ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16b1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    16b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b7:	8b 00                	mov    (%eax),%eax
    16b9:	8b 10                	mov    (%eax),%edx
    16bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16be:	89 10                	mov    %edx,(%eax)
    16c0:	eb 0a                	jmp    16cc <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    16c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c5:	8b 10                	mov    (%eax),%edx
    16c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ca:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    16cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16cf:	8b 40 04             	mov    0x4(%eax),%eax
    16d2:	c1 e0 03             	shl    $0x3,%eax
    16d5:	03 45 fc             	add    -0x4(%ebp),%eax
    16d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16db:	75 20                	jne    16fd <free+0xc5>
    p->s.size += bp->s.size;
    16dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e0:	8b 50 04             	mov    0x4(%eax),%edx
    16e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16e6:	8b 40 04             	mov    0x4(%eax),%eax
    16e9:	01 c2                	add    %eax,%edx
    16eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    16f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16f4:	8b 10                	mov    (%eax),%edx
    16f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f9:	89 10                	mov    %edx,(%eax)
    16fb:	eb 08                	jmp    1705 <free+0xcd>
  } else
    p->s.ptr = bp;
    16fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1700:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1703:	89 10                	mov    %edx,(%eax)
  freep = p;
    1705:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1708:	a3 10 1b 00 00       	mov    %eax,0x1b10
}
    170d:	c9                   	leave  
    170e:	c3                   	ret    

0000170f <morecore>:

static Header*
morecore(uint nu)
{
    170f:	55                   	push   %ebp
    1710:	89 e5                	mov    %esp,%ebp
    1712:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1715:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    171c:	77 07                	ja     1725 <morecore+0x16>
    nu = 4096;
    171e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1725:	8b 45 08             	mov    0x8(%ebp),%eax
    1728:	c1 e0 03             	shl    $0x3,%eax
    172b:	89 04 24             	mov    %eax,(%esp)
    172e:	e8 3d fc ff ff       	call   1370 <sbrk>
    1733:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1736:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    173a:	75 07                	jne    1743 <morecore+0x34>
    return 0;
    173c:	b8 00 00 00 00       	mov    $0x0,%eax
    1741:	eb 22                	jmp    1765 <morecore+0x56>
  hp = (Header*)p;
    1743:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1746:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1749:	8b 45 f4             	mov    -0xc(%ebp),%eax
    174c:	8b 55 08             	mov    0x8(%ebp),%edx
    174f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1752:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1755:	83 c0 08             	add    $0x8,%eax
    1758:	89 04 24             	mov    %eax,(%esp)
    175b:	e8 d8 fe ff ff       	call   1638 <free>
  return freep;
    1760:	a1 10 1b 00 00       	mov    0x1b10,%eax
}
    1765:	c9                   	leave  
    1766:	c3                   	ret    

00001767 <malloc>:

void*
malloc(uint nbytes)
{
    1767:	55                   	push   %ebp
    1768:	89 e5                	mov    %esp,%ebp
    176a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    176d:	8b 45 08             	mov    0x8(%ebp),%eax
    1770:	83 c0 07             	add    $0x7,%eax
    1773:	c1 e8 03             	shr    $0x3,%eax
    1776:	83 c0 01             	add    $0x1,%eax
    1779:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    177c:	a1 10 1b 00 00       	mov    0x1b10,%eax
    1781:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1784:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1788:	75 23                	jne    17ad <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    178a:	c7 45 f0 08 1b 00 00 	movl   $0x1b08,-0x10(%ebp)
    1791:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1794:	a3 10 1b 00 00       	mov    %eax,0x1b10
    1799:	a1 10 1b 00 00       	mov    0x1b10,%eax
    179e:	a3 08 1b 00 00       	mov    %eax,0x1b08
    base.s.size = 0;
    17a3:	c7 05 0c 1b 00 00 00 	movl   $0x0,0x1b0c
    17aa:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17b0:	8b 00                	mov    (%eax),%eax
    17b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    17b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17b8:	8b 40 04             	mov    0x4(%eax),%eax
    17bb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17be:	72 4d                	jb     180d <malloc+0xa6>
      if(p->s.size == nunits)
    17c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17c3:	8b 40 04             	mov    0x4(%eax),%eax
    17c6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    17c9:	75 0c                	jne    17d7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    17cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ce:	8b 10                	mov    (%eax),%edx
    17d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17d3:	89 10                	mov    %edx,(%eax)
    17d5:	eb 26                	jmp    17fd <malloc+0x96>
      else {
        p->s.size -= nunits;
    17d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17da:	8b 40 04             	mov    0x4(%eax),%eax
    17dd:	89 c2                	mov    %eax,%edx
    17df:	2b 55 f4             	sub    -0xc(%ebp),%edx
    17e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17e5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    17e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17eb:	8b 40 04             	mov    0x4(%eax),%eax
    17ee:	c1 e0 03             	shl    $0x3,%eax
    17f1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    17f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    17fa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    17fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1800:	a3 10 1b 00 00       	mov    %eax,0x1b10
      return (void*)(p + 1);
    1805:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1808:	83 c0 08             	add    $0x8,%eax
    180b:	eb 38                	jmp    1845 <malloc+0xde>
    }
    if(p == freep)
    180d:	a1 10 1b 00 00       	mov    0x1b10,%eax
    1812:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1815:	75 1b                	jne    1832 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1817:	8b 45 f4             	mov    -0xc(%ebp),%eax
    181a:	89 04 24             	mov    %eax,(%esp)
    181d:	e8 ed fe ff ff       	call   170f <morecore>
    1822:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1825:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1829:	75 07                	jne    1832 <malloc+0xcb>
        return 0;
    182b:	b8 00 00 00 00       	mov    $0x0,%eax
    1830:	eb 13                	jmp    1845 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1832:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1835:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1838:	8b 45 ec             	mov    -0x14(%ebp),%eax
    183b:	8b 00                	mov    (%eax),%eax
    183d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1840:	e9 70 ff ff ff       	jmp    17b5 <malloc+0x4e>
}
    1845:	c9                   	leave  
    1846:	c3                   	ret    
    1847:	90                   	nop

00001848 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1848:	55                   	push   %ebp
    1849:	89 e5                	mov    %esp,%ebp
    184b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    184e:	8b 55 08             	mov    0x8(%ebp),%edx
    1851:	8b 45 0c             	mov    0xc(%ebp),%eax
    1854:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1857:	f0 87 02             	lock xchg %eax,(%edx)
    185a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    185d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1860:	c9                   	leave  
    1861:	c3                   	ret    

00001862 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1862:	55                   	push   %ebp
    1863:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1865:	8b 45 08             	mov    0x8(%ebp),%eax
    1868:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    186e:	5d                   	pop    %ebp
    186f:	c3                   	ret    

00001870 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1870:	55                   	push   %ebp
    1871:	89 e5                	mov    %esp,%ebp
    1873:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1876:	8b 45 08             	mov    0x8(%ebp),%eax
    1879:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1880:	00 
    1881:	89 04 24             	mov    %eax,(%esp)
    1884:	e8 bf ff ff ff       	call   1848 <xchg>
    1889:	85 c0                	test   %eax,%eax
    188b:	75 e9                	jne    1876 <lock_acquire+0x6>
}
    188d:	c9                   	leave  
    188e:	c3                   	ret    

0000188f <lock_release>:
void lock_release(lock_t *lock){
    188f:	55                   	push   %ebp
    1890:	89 e5                	mov    %esp,%ebp
    1892:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1895:	8b 45 08             	mov    0x8(%ebp),%eax
    1898:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    189f:	00 
    18a0:	89 04 24             	mov    %eax,(%esp)
    18a3:	e8 a0 ff ff ff       	call   1848 <xchg>
}
    18a8:	c9                   	leave  
    18a9:	c3                   	ret    

000018aa <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    18aa:	55                   	push   %ebp
    18ab:	89 e5                	mov    %esp,%ebp
    18ad:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    18b0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    18b7:	e8 ab fe ff ff       	call   1767 <malloc>
    18bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    18bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    18c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18c8:	25 ff 0f 00 00       	and    $0xfff,%eax
    18cd:	85 c0                	test   %eax,%eax
    18cf:	74 15                	je     18e6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    18d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18d4:	89 c2                	mov    %eax,%edx
    18d6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    18dc:	b8 00 10 00 00       	mov    $0x1000,%eax
    18e1:	29 d0                	sub    %edx,%eax
    18e3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    18e6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18ea:	75 1b                	jne    1907 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    18ec:	c7 44 24 04 c7 1a 00 	movl   $0x1ac7,0x4(%esp)
    18f3:	00 
    18f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18fb:	e8 81 fb ff ff       	call   1481 <printf>
        return 0;
    1900:	b8 00 00 00 00       	mov    $0x0,%eax
    1905:	eb 6f                	jmp    1976 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1907:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    190a:	8b 55 08             	mov    0x8(%ebp),%edx
    190d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1910:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1914:	89 54 24 08          	mov    %edx,0x8(%esp)
    1918:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    191f:	00 
    1920:	89 04 24             	mov    %eax,(%esp)
    1923:	e8 60 fa ff ff       	call   1388 <clone>
    1928:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    192b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    192f:	79 1b                	jns    194c <thread_create+0xa2>
        printf(1,"clone fails\n");
    1931:	c7 44 24 04 d5 1a 00 	movl   $0x1ad5,0x4(%esp)
    1938:	00 
    1939:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1940:	e8 3c fb ff ff       	call   1481 <printf>
        return 0;
    1945:	b8 00 00 00 00       	mov    $0x0,%eax
    194a:	eb 2a                	jmp    1976 <thread_create+0xcc>
    }
    if(tid > 0){
    194c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1950:	7e 05                	jle    1957 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1952:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1955:	eb 1f                	jmp    1976 <thread_create+0xcc>
    }
    if(tid == 0){
    1957:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    195b:	75 14                	jne    1971 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    195d:	c7 44 24 04 e2 1a 00 	movl   $0x1ae2,0x4(%esp)
    1964:	00 
    1965:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196c:	e8 10 fb ff ff       	call   1481 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1971:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1976:	c9                   	leave  
    1977:	c3                   	ret    

00001978 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1978:	55                   	push   %ebp
    1979:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    197b:	8b 45 08             	mov    0x8(%ebp),%eax
    197e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1984:	8b 45 08             	mov    0x8(%ebp),%eax
    1987:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    198e:	8b 45 08             	mov    0x8(%ebp),%eax
    1991:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1998:	5d                   	pop    %ebp
    1999:	c3                   	ret    

0000199a <add_q>:

void add_q(struct queue *q, int v){
    199a:	55                   	push   %ebp
    199b:	89 e5                	mov    %esp,%ebp
    199d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19a0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    19a7:	e8 bb fd ff ff       	call   1767 <malloc>
    19ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    19af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19b2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    19b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19bc:	8b 55 0c             	mov    0xc(%ebp),%edx
    19bf:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    19c1:	8b 45 08             	mov    0x8(%ebp),%eax
    19c4:	8b 40 04             	mov    0x4(%eax),%eax
    19c7:	85 c0                	test   %eax,%eax
    19c9:	75 0b                	jne    19d6 <add_q+0x3c>
        q->head = n;
    19cb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19d1:	89 50 04             	mov    %edx,0x4(%eax)
    19d4:	eb 0c                	jmp    19e2 <add_q+0x48>
    }else{
        q->tail->next = n;
    19d6:	8b 45 08             	mov    0x8(%ebp),%eax
    19d9:	8b 40 08             	mov    0x8(%eax),%eax
    19dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19df:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    19e2:	8b 45 08             	mov    0x8(%ebp),%eax
    19e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    19e8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    19eb:	8b 45 08             	mov    0x8(%ebp),%eax
    19ee:	8b 00                	mov    (%eax),%eax
    19f0:	8d 50 01             	lea    0x1(%eax),%edx
    19f3:	8b 45 08             	mov    0x8(%ebp),%eax
    19f6:	89 10                	mov    %edx,(%eax)
}
    19f8:	c9                   	leave  
    19f9:	c3                   	ret    

000019fa <empty_q>:

int empty_q(struct queue *q){
    19fa:	55                   	push   %ebp
    19fb:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    19fd:	8b 45 08             	mov    0x8(%ebp),%eax
    1a00:	8b 00                	mov    (%eax),%eax
    1a02:	85 c0                	test   %eax,%eax
    1a04:	75 07                	jne    1a0d <empty_q+0x13>
        return 1;
    1a06:	b8 01 00 00 00       	mov    $0x1,%eax
    1a0b:	eb 05                	jmp    1a12 <empty_q+0x18>
    else
        return 0;
    1a0d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a12:	5d                   	pop    %ebp
    1a13:	c3                   	ret    

00001a14 <pop_q>:
int pop_q(struct queue *q){
    1a14:	55                   	push   %ebp
    1a15:	89 e5                	mov    %esp,%ebp
    1a17:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1d:	89 04 24             	mov    %eax,(%esp)
    1a20:	e8 d5 ff ff ff       	call   19fa <empty_q>
    1a25:	85 c0                	test   %eax,%eax
    1a27:	75 5d                	jne    1a86 <pop_q+0x72>
       val = q->head->value; 
    1a29:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2c:	8b 40 04             	mov    0x4(%eax),%eax
    1a2f:	8b 00                	mov    (%eax),%eax
    1a31:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1a34:	8b 45 08             	mov    0x8(%ebp),%eax
    1a37:	8b 40 04             	mov    0x4(%eax),%eax
    1a3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1a3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a40:	8b 40 04             	mov    0x4(%eax),%eax
    1a43:	8b 50 04             	mov    0x4(%eax),%edx
    1a46:	8b 45 08             	mov    0x8(%ebp),%eax
    1a49:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1a4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a4f:	89 04 24             	mov    %eax,(%esp)
    1a52:	e8 e1 fb ff ff       	call   1638 <free>
       q->size--;
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	8b 00                	mov    (%eax),%eax
    1a5c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1a5f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a62:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1a64:	8b 45 08             	mov    0x8(%ebp),%eax
    1a67:	8b 00                	mov    (%eax),%eax
    1a69:	85 c0                	test   %eax,%eax
    1a6b:	75 14                	jne    1a81 <pop_q+0x6d>
            q->head = 0;
    1a6d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a70:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1a77:	8b 45 08             	mov    0x8(%ebp),%eax
    1a7a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a84:	eb 05                	jmp    1a8b <pop_q+0x77>
    }
    return -1;
    1a86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1a8b:	c9                   	leave  
    1a8c:	c3                   	ret    
