
_cat:     file format elf32-i386


Disassembly of section .text:

00001000 <cat>:

char buf[512];

void
cat(int fd)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    1006:	eb 1b                	jmp    1023 <cat+0x23>
    write(1, buf, n);
    1008:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100b:	89 44 24 08          	mov    %eax,0x8(%esp)
    100f:	c7 44 24 04 c0 1b 00 	movl   $0x1bc0,0x4(%esp)
    1016:	00 
    1017:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    101e:	e8 71 03 00 00       	call   1394 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    1023:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    102a:	00 
    102b:	c7 44 24 04 c0 1b 00 	movl   $0x1bc0,0x4(%esp)
    1032:	00 
    1033:	8b 45 08             	mov    0x8(%ebp),%eax
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	e8 4e 03 00 00       	call   138c <read>
    103e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1041:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1045:	7f c1                	jg     1008 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
    1047:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    104b:	79 19                	jns    1066 <cat+0x66>
    printf(1, "cat: read error\n");
    104d:	c7 44 24 04 19 1b 00 	movl   $0x1b19,0x4(%esp)
    1054:	00 
    1055:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    105c:	e8 ac 04 00 00       	call   150d <printf>
    exit();
    1061:	e8 0e 03 00 00       	call   1374 <exit>
  }
}
    1066:	c9                   	leave  
    1067:	c3                   	ret    

00001068 <main>:

int
main(int argc, char *argv[])
{
    1068:	55                   	push   %ebp
    1069:	89 e5                	mov    %esp,%ebp
    106b:	83 e4 f0             	and    $0xfffffff0,%esp
    106e:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
    1071:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1075:	7f 11                	jg     1088 <main+0x20>
    cat(0);
    1077:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    107e:	e8 7d ff ff ff       	call   1000 <cat>
    exit();
    1083:	e8 ec 02 00 00       	call   1374 <exit>
  }

  for(i = 1; i < argc; i++){
    1088:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    108f:	00 
    1090:	eb 6d                	jmp    10ff <main+0x97>
    if((fd = open(argv[i], 0)) < 0){
    1092:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1096:	c1 e0 02             	shl    $0x2,%eax
    1099:	03 45 0c             	add    0xc(%ebp),%eax
    109c:	8b 00                	mov    (%eax),%eax
    109e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10a5:	00 
    10a6:	89 04 24             	mov    %eax,(%esp)
    10a9:	e8 06 03 00 00       	call   13b4 <open>
    10ae:	89 44 24 18          	mov    %eax,0x18(%esp)
    10b2:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    10b7:	79 29                	jns    10e2 <main+0x7a>
      printf(1, "cat: cannot open %s\n", argv[i]);
    10b9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    10bd:	c1 e0 02             	shl    $0x2,%eax
    10c0:	03 45 0c             	add    0xc(%ebp),%eax
    10c3:	8b 00                	mov    (%eax),%eax
    10c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    10c9:	c7 44 24 04 2a 1b 00 	movl   $0x1b2a,0x4(%esp)
    10d0:	00 
    10d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10d8:	e8 30 04 00 00       	call   150d <printf>
      exit();
    10dd:	e8 92 02 00 00       	call   1374 <exit>
    }
    cat(fd);
    10e2:	8b 44 24 18          	mov    0x18(%esp),%eax
    10e6:	89 04 24             	mov    %eax,(%esp)
    10e9:	e8 12 ff ff ff       	call   1000 <cat>
    close(fd);
    10ee:	8b 44 24 18          	mov    0x18(%esp),%eax
    10f2:	89 04 24             	mov    %eax,(%esp)
    10f5:	e8 a2 02 00 00       	call   139c <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    10fa:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    10ff:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1103:	3b 45 08             	cmp    0x8(%ebp),%eax
    1106:	7c 8a                	jl     1092 <main+0x2a>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
    1108:	e8 67 02 00 00       	call   1374 <exit>
    110d:	90                   	nop
    110e:	90                   	nop
    110f:	90                   	nop

00001110 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	57                   	push   %edi
    1114:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1115:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1118:	8b 55 10             	mov    0x10(%ebp),%edx
    111b:	8b 45 0c             	mov    0xc(%ebp),%eax
    111e:	89 cb                	mov    %ecx,%ebx
    1120:	89 df                	mov    %ebx,%edi
    1122:	89 d1                	mov    %edx,%ecx
    1124:	fc                   	cld    
    1125:	f3 aa                	rep stos %al,%es:(%edi)
    1127:	89 ca                	mov    %ecx,%edx
    1129:	89 fb                	mov    %edi,%ebx
    112b:	89 5d 08             	mov    %ebx,0x8(%ebp)
    112e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1131:	5b                   	pop    %ebx
    1132:	5f                   	pop    %edi
    1133:	5d                   	pop    %ebp
    1134:	c3                   	ret    

00001135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1135:	55                   	push   %ebp
    1136:	89 e5                	mov    %esp,%ebp
    1138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    113b:	8b 45 08             	mov    0x8(%ebp),%eax
    113e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1141:	8b 45 0c             	mov    0xc(%ebp),%eax
    1144:	0f b6 10             	movzbl (%eax),%edx
    1147:	8b 45 08             	mov    0x8(%ebp),%eax
    114a:	88 10                	mov    %dl,(%eax)
    114c:	8b 45 08             	mov    0x8(%ebp),%eax
    114f:	0f b6 00             	movzbl (%eax),%eax
    1152:	84 c0                	test   %al,%al
    1154:	0f 95 c0             	setne  %al
    1157:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    115b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    115f:	84 c0                	test   %al,%al
    1161:	75 de                	jne    1141 <strcpy+0xc>
    ;
  return os;
    1163:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1166:	c9                   	leave  
    1167:	c3                   	ret    

00001168 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1168:	55                   	push   %ebp
    1169:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    116b:	eb 08                	jmp    1175 <strcmp+0xd>
    p++, q++;
    116d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1171:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1175:	8b 45 08             	mov    0x8(%ebp),%eax
    1178:	0f b6 00             	movzbl (%eax),%eax
    117b:	84 c0                	test   %al,%al
    117d:	74 10                	je     118f <strcmp+0x27>
    117f:	8b 45 08             	mov    0x8(%ebp),%eax
    1182:	0f b6 10             	movzbl (%eax),%edx
    1185:	8b 45 0c             	mov    0xc(%ebp),%eax
    1188:	0f b6 00             	movzbl (%eax),%eax
    118b:	38 c2                	cmp    %al,%dl
    118d:	74 de                	je     116d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    118f:	8b 45 08             	mov    0x8(%ebp),%eax
    1192:	0f b6 00             	movzbl (%eax),%eax
    1195:	0f b6 d0             	movzbl %al,%edx
    1198:	8b 45 0c             	mov    0xc(%ebp),%eax
    119b:	0f b6 00             	movzbl (%eax),%eax
    119e:	0f b6 c0             	movzbl %al,%eax
    11a1:	89 d1                	mov    %edx,%ecx
    11a3:	29 c1                	sub    %eax,%ecx
    11a5:	89 c8                	mov    %ecx,%eax
}
    11a7:	5d                   	pop    %ebp
    11a8:	c3                   	ret    

000011a9 <strlen>:

uint
strlen(char *s)
{
    11a9:	55                   	push   %ebp
    11aa:	89 e5                	mov    %esp,%ebp
    11ac:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    11af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11b6:	eb 04                	jmp    11bc <strlen+0x13>
    11b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    11bf:	03 45 08             	add    0x8(%ebp),%eax
    11c2:	0f b6 00             	movzbl (%eax),%eax
    11c5:	84 c0                	test   %al,%al
    11c7:	75 ef                	jne    11b8 <strlen+0xf>
    ;
  return n;
    11c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11cc:	c9                   	leave  
    11cd:	c3                   	ret    

000011ce <memset>:

void*
memset(void *dst, int c, uint n)
{
    11ce:	55                   	push   %ebp
    11cf:	89 e5                	mov    %esp,%ebp
    11d1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11d4:	8b 45 10             	mov    0x10(%ebp),%eax
    11d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    11db:	8b 45 0c             	mov    0xc(%ebp),%eax
    11de:	89 44 24 04          	mov    %eax,0x4(%esp)
    11e2:	8b 45 08             	mov    0x8(%ebp),%eax
    11e5:	89 04 24             	mov    %eax,(%esp)
    11e8:	e8 23 ff ff ff       	call   1110 <stosb>
  return dst;
    11ed:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11f0:	c9                   	leave  
    11f1:	c3                   	ret    

000011f2 <strchr>:

char*
strchr(const char *s, char c)
{
    11f2:	55                   	push   %ebp
    11f3:	89 e5                	mov    %esp,%ebp
    11f5:	83 ec 04             	sub    $0x4,%esp
    11f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11fb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    11fe:	eb 14                	jmp    1214 <strchr+0x22>
    if(*s == c)
    1200:	8b 45 08             	mov    0x8(%ebp),%eax
    1203:	0f b6 00             	movzbl (%eax),%eax
    1206:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1209:	75 05                	jne    1210 <strchr+0x1e>
      return (char*)s;
    120b:	8b 45 08             	mov    0x8(%ebp),%eax
    120e:	eb 13                	jmp    1223 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1210:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1214:	8b 45 08             	mov    0x8(%ebp),%eax
    1217:	0f b6 00             	movzbl (%eax),%eax
    121a:	84 c0                	test   %al,%al
    121c:	75 e2                	jne    1200 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    121e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1223:	c9                   	leave  
    1224:	c3                   	ret    

00001225 <gets>:

char*
gets(char *buf, int max)
{
    1225:	55                   	push   %ebp
    1226:	89 e5                	mov    %esp,%ebp
    1228:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    122b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1232:	eb 44                	jmp    1278 <gets+0x53>
    cc = read(0, &c, 1);
    1234:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    123b:	00 
    123c:	8d 45 ef             	lea    -0x11(%ebp),%eax
    123f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1243:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    124a:	e8 3d 01 00 00       	call   138c <read>
    124f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1252:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1256:	7e 2d                	jle    1285 <gets+0x60>
      break;
    buf[i++] = c;
    1258:	8b 45 f0             	mov    -0x10(%ebp),%eax
    125b:	03 45 08             	add    0x8(%ebp),%eax
    125e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1262:	88 10                	mov    %dl,(%eax)
    1264:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1268:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    126c:	3c 0a                	cmp    $0xa,%al
    126e:	74 16                	je     1286 <gets+0x61>
    1270:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1274:	3c 0d                	cmp    $0xd,%al
    1276:	74 0e                	je     1286 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1278:	8b 45 f0             	mov    -0x10(%ebp),%eax
    127b:	83 c0 01             	add    $0x1,%eax
    127e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1281:	7c b1                	jl     1234 <gets+0xf>
    1283:	eb 01                	jmp    1286 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1285:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1286:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1289:	03 45 08             	add    0x8(%ebp),%eax
    128c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    128f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1292:	c9                   	leave  
    1293:	c3                   	ret    

00001294 <stat>:

int
stat(char *n, struct stat *st)
{
    1294:	55                   	push   %ebp
    1295:	89 e5                	mov    %esp,%ebp
    1297:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    129a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12a1:	00 
    12a2:	8b 45 08             	mov    0x8(%ebp),%eax
    12a5:	89 04 24             	mov    %eax,(%esp)
    12a8:	e8 07 01 00 00       	call   13b4 <open>
    12ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    12b0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12b4:	79 07                	jns    12bd <stat+0x29>
    return -1;
    12b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12bb:	eb 23                	jmp    12e0 <stat+0x4c>
  r = fstat(fd, st);
    12bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    12c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12c7:	89 04 24             	mov    %eax,(%esp)
    12ca:	e8 fd 00 00 00       	call   13cc <fstat>
    12cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    12d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12d5:	89 04 24             	mov    %eax,(%esp)
    12d8:	e8 bf 00 00 00       	call   139c <close>
  return r;
    12dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    12e0:	c9                   	leave  
    12e1:	c3                   	ret    

000012e2 <atoi>:

int
atoi(const char *s)
{
    12e2:	55                   	push   %ebp
    12e3:	89 e5                	mov    %esp,%ebp
    12e5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12ef:	eb 24                	jmp    1315 <atoi+0x33>
    n = n*10 + *s++ - '0';
    12f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12f4:	89 d0                	mov    %edx,%eax
    12f6:	c1 e0 02             	shl    $0x2,%eax
    12f9:	01 d0                	add    %edx,%eax
    12fb:	01 c0                	add    %eax,%eax
    12fd:	89 c2                	mov    %eax,%edx
    12ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1302:	0f b6 00             	movzbl (%eax),%eax
    1305:	0f be c0             	movsbl %al,%eax
    1308:	8d 04 02             	lea    (%edx,%eax,1),%eax
    130b:	83 e8 30             	sub    $0x30,%eax
    130e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1311:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1315:	8b 45 08             	mov    0x8(%ebp),%eax
    1318:	0f b6 00             	movzbl (%eax),%eax
    131b:	3c 2f                	cmp    $0x2f,%al
    131d:	7e 0a                	jle    1329 <atoi+0x47>
    131f:	8b 45 08             	mov    0x8(%ebp),%eax
    1322:	0f b6 00             	movzbl (%eax),%eax
    1325:	3c 39                	cmp    $0x39,%al
    1327:	7e c8                	jle    12f1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1329:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    132c:	c9                   	leave  
    132d:	c3                   	ret    

0000132e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    132e:	55                   	push   %ebp
    132f:	89 e5                	mov    %esp,%ebp
    1331:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1334:	8b 45 08             	mov    0x8(%ebp),%eax
    1337:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    133a:	8b 45 0c             	mov    0xc(%ebp),%eax
    133d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1340:	eb 13                	jmp    1355 <memmove+0x27>
    *dst++ = *src++;
    1342:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1345:	0f b6 10             	movzbl (%eax),%edx
    1348:	8b 45 f8             	mov    -0x8(%ebp),%eax
    134b:	88 10                	mov    %dl,(%eax)
    134d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1351:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1355:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1359:	0f 9f c0             	setg   %al
    135c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1360:	84 c0                	test   %al,%al
    1362:	75 de                	jne    1342 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1364:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1367:	c9                   	leave  
    1368:	c3                   	ret    
    1369:	90                   	nop
    136a:	90                   	nop
    136b:	90                   	nop

0000136c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    136c:	b8 01 00 00 00       	mov    $0x1,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <exit>:
SYSCALL(exit)
    1374:	b8 02 00 00 00       	mov    $0x2,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <wait>:
SYSCALL(wait)
    137c:	b8 03 00 00 00       	mov    $0x3,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <pipe>:
SYSCALL(pipe)
    1384:	b8 04 00 00 00       	mov    $0x4,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <read>:
SYSCALL(read)
    138c:	b8 05 00 00 00       	mov    $0x5,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <write>:
SYSCALL(write)
    1394:	b8 10 00 00 00       	mov    $0x10,%eax
    1399:	cd 40                	int    $0x40
    139b:	c3                   	ret    

0000139c <close>:
SYSCALL(close)
    139c:	b8 15 00 00 00       	mov    $0x15,%eax
    13a1:	cd 40                	int    $0x40
    13a3:	c3                   	ret    

000013a4 <kill>:
SYSCALL(kill)
    13a4:	b8 06 00 00 00       	mov    $0x6,%eax
    13a9:	cd 40                	int    $0x40
    13ab:	c3                   	ret    

000013ac <exec>:
SYSCALL(exec)
    13ac:	b8 07 00 00 00       	mov    $0x7,%eax
    13b1:	cd 40                	int    $0x40
    13b3:	c3                   	ret    

000013b4 <open>:
SYSCALL(open)
    13b4:	b8 0f 00 00 00       	mov    $0xf,%eax
    13b9:	cd 40                	int    $0x40
    13bb:	c3                   	ret    

000013bc <mknod>:
SYSCALL(mknod)
    13bc:	b8 11 00 00 00       	mov    $0x11,%eax
    13c1:	cd 40                	int    $0x40
    13c3:	c3                   	ret    

000013c4 <unlink>:
SYSCALL(unlink)
    13c4:	b8 12 00 00 00       	mov    $0x12,%eax
    13c9:	cd 40                	int    $0x40
    13cb:	c3                   	ret    

000013cc <fstat>:
SYSCALL(fstat)
    13cc:	b8 08 00 00 00       	mov    $0x8,%eax
    13d1:	cd 40                	int    $0x40
    13d3:	c3                   	ret    

000013d4 <link>:
SYSCALL(link)
    13d4:	b8 13 00 00 00       	mov    $0x13,%eax
    13d9:	cd 40                	int    $0x40
    13db:	c3                   	ret    

000013dc <mkdir>:
SYSCALL(mkdir)
    13dc:	b8 14 00 00 00       	mov    $0x14,%eax
    13e1:	cd 40                	int    $0x40
    13e3:	c3                   	ret    

000013e4 <chdir>:
SYSCALL(chdir)
    13e4:	b8 09 00 00 00       	mov    $0x9,%eax
    13e9:	cd 40                	int    $0x40
    13eb:	c3                   	ret    

000013ec <dup>:
SYSCALL(dup)
    13ec:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f1:	cd 40                	int    $0x40
    13f3:	c3                   	ret    

000013f4 <getpid>:
SYSCALL(getpid)
    13f4:	b8 0b 00 00 00       	mov    $0xb,%eax
    13f9:	cd 40                	int    $0x40
    13fb:	c3                   	ret    

000013fc <sbrk>:
SYSCALL(sbrk)
    13fc:	b8 0c 00 00 00       	mov    $0xc,%eax
    1401:	cd 40                	int    $0x40
    1403:	c3                   	ret    

00001404 <sleep>:
SYSCALL(sleep)
    1404:	b8 0d 00 00 00       	mov    $0xd,%eax
    1409:	cd 40                	int    $0x40
    140b:	c3                   	ret    

0000140c <uptime>:
SYSCALL(uptime)
    140c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1411:	cd 40                	int    $0x40
    1413:	c3                   	ret    

00001414 <clone>:
SYSCALL(clone)
    1414:	b8 16 00 00 00       	mov    $0x16,%eax
    1419:	cd 40                	int    $0x40
    141b:	c3                   	ret    

0000141c <texit>:
SYSCALL(texit)
    141c:	b8 17 00 00 00       	mov    $0x17,%eax
    1421:	cd 40                	int    $0x40
    1423:	c3                   	ret    

00001424 <tsleep>:
SYSCALL(tsleep)
    1424:	b8 18 00 00 00       	mov    $0x18,%eax
    1429:	cd 40                	int    $0x40
    142b:	c3                   	ret    

0000142c <twakeup>:
SYSCALL(twakeup)
    142c:	b8 19 00 00 00       	mov    $0x19,%eax
    1431:	cd 40                	int    $0x40
    1433:	c3                   	ret    

00001434 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1434:	55                   	push   %ebp
    1435:	89 e5                	mov    %esp,%ebp
    1437:	83 ec 28             	sub    $0x28,%esp
    143a:	8b 45 0c             	mov    0xc(%ebp),%eax
    143d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1440:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1447:	00 
    1448:	8d 45 f4             	lea    -0xc(%ebp),%eax
    144b:	89 44 24 04          	mov    %eax,0x4(%esp)
    144f:	8b 45 08             	mov    0x8(%ebp),%eax
    1452:	89 04 24             	mov    %eax,(%esp)
    1455:	e8 3a ff ff ff       	call   1394 <write>
}
    145a:	c9                   	leave  
    145b:	c3                   	ret    

0000145c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    145c:	55                   	push   %ebp
    145d:	89 e5                	mov    %esp,%ebp
    145f:	53                   	push   %ebx
    1460:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1463:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    146a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    146e:	74 17                	je     1487 <printint+0x2b>
    1470:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1474:	79 11                	jns    1487 <printint+0x2b>
    neg = 1;
    1476:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    147d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1480:	f7 d8                	neg    %eax
    1482:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1485:	eb 06                	jmp    148d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1487:	8b 45 0c             	mov    0xc(%ebp),%eax
    148a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    148d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1494:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1497:	8b 5d 10             	mov    0x10(%ebp),%ebx
    149a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    149d:	ba 00 00 00 00       	mov    $0x0,%edx
    14a2:	f7 f3                	div    %ebx
    14a4:	89 d0                	mov    %edx,%eax
    14a6:	0f b6 80 74 1b 00 00 	movzbl 0x1b74(%eax),%eax
    14ad:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    14b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    14b5:	8b 45 10             	mov    0x10(%ebp),%eax
    14b8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    14bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14be:	ba 00 00 00 00       	mov    $0x0,%edx
    14c3:	f7 75 d4             	divl   -0x2c(%ebp)
    14c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    14c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14cd:	75 c5                	jne    1494 <printint+0x38>
  if(neg)
    14cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14d3:	74 28                	je     14fd <printint+0xa1>
    buf[i++] = '-';
    14d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14d8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    14dd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    14e1:	eb 1a                	jmp    14fd <printint+0xa1>
    putc(fd, buf[i]);
    14e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14e6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    14eb:	0f be c0             	movsbl %al,%eax
    14ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f2:	8b 45 08             	mov    0x8(%ebp),%eax
    14f5:	89 04 24             	mov    %eax,(%esp)
    14f8:	e8 37 ff ff ff       	call   1434 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14fd:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1501:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1505:	79 dc                	jns    14e3 <printint+0x87>
    putc(fd, buf[i]);
}
    1507:	83 c4 44             	add    $0x44,%esp
    150a:	5b                   	pop    %ebx
    150b:	5d                   	pop    %ebp
    150c:	c3                   	ret    

0000150d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    150d:	55                   	push   %ebp
    150e:	89 e5                	mov    %esp,%ebp
    1510:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    151a:	8d 45 0c             	lea    0xc(%ebp),%eax
    151d:	83 c0 04             	add    $0x4,%eax
    1520:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1523:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    152a:	e9 7e 01 00 00       	jmp    16ad <printf+0x1a0>
    c = fmt[i] & 0xff;
    152f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1532:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1535:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1538:	0f b6 00             	movzbl (%eax),%eax
    153b:	0f be c0             	movsbl %al,%eax
    153e:	25 ff 00 00 00       	and    $0xff,%eax
    1543:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    1546:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    154a:	75 2c                	jne    1578 <printf+0x6b>
      if(c == '%'){
    154c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1550:	75 0c                	jne    155e <printf+0x51>
        state = '%';
    1552:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1559:	e9 4b 01 00 00       	jmp    16a9 <printf+0x19c>
      } else {
        putc(fd, c);
    155e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1561:	0f be c0             	movsbl %al,%eax
    1564:	89 44 24 04          	mov    %eax,0x4(%esp)
    1568:	8b 45 08             	mov    0x8(%ebp),%eax
    156b:	89 04 24             	mov    %eax,(%esp)
    156e:	e8 c1 fe ff ff       	call   1434 <putc>
    1573:	e9 31 01 00 00       	jmp    16a9 <printf+0x19c>
      }
    } else if(state == '%'){
    1578:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    157c:	0f 85 27 01 00 00    	jne    16a9 <printf+0x19c>
      if(c == 'd'){
    1582:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    1586:	75 2d                	jne    15b5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1588:	8b 45 f4             	mov    -0xc(%ebp),%eax
    158b:	8b 00                	mov    (%eax),%eax
    158d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1594:	00 
    1595:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    159c:	00 
    159d:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a1:	8b 45 08             	mov    0x8(%ebp),%eax
    15a4:	89 04 24             	mov    %eax,(%esp)
    15a7:	e8 b0 fe ff ff       	call   145c <printint>
        ap++;
    15ac:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    15b0:	e9 ed 00 00 00       	jmp    16a2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    15b5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    15b9:	74 06                	je     15c1 <printf+0xb4>
    15bb:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    15bf:	75 2d                	jne    15ee <printf+0xe1>
        printint(fd, *ap, 16, 0);
    15c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c4:	8b 00                	mov    (%eax),%eax
    15c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    15cd:	00 
    15ce:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    15d5:	00 
    15d6:	89 44 24 04          	mov    %eax,0x4(%esp)
    15da:	8b 45 08             	mov    0x8(%ebp),%eax
    15dd:	89 04 24             	mov    %eax,(%esp)
    15e0:	e8 77 fe ff ff       	call   145c <printint>
        ap++;
    15e5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    15e9:	e9 b4 00 00 00       	jmp    16a2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15ee:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    15f2:	75 46                	jne    163a <printf+0x12d>
        s = (char*)*ap;
    15f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15f7:	8b 00                	mov    (%eax),%eax
    15f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    15fc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1600:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1604:	75 27                	jne    162d <printf+0x120>
          s = "(null)";
    1606:	c7 45 e4 3f 1b 00 00 	movl   $0x1b3f,-0x1c(%ebp)
        while(*s != 0){
    160d:	eb 1f                	jmp    162e <printf+0x121>
          putc(fd, *s);
    160f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1612:	0f b6 00             	movzbl (%eax),%eax
    1615:	0f be c0             	movsbl %al,%eax
    1618:	89 44 24 04          	mov    %eax,0x4(%esp)
    161c:	8b 45 08             	mov    0x8(%ebp),%eax
    161f:	89 04 24             	mov    %eax,(%esp)
    1622:	e8 0d fe ff ff       	call   1434 <putc>
          s++;
    1627:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    162b:	eb 01                	jmp    162e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    162d:	90                   	nop
    162e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1631:	0f b6 00             	movzbl (%eax),%eax
    1634:	84 c0                	test   %al,%al
    1636:	75 d7                	jne    160f <printf+0x102>
    1638:	eb 68                	jmp    16a2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    163a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    163e:	75 1d                	jne    165d <printf+0x150>
        putc(fd, *ap);
    1640:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1643:	8b 00                	mov    (%eax),%eax
    1645:	0f be c0             	movsbl %al,%eax
    1648:	89 44 24 04          	mov    %eax,0x4(%esp)
    164c:	8b 45 08             	mov    0x8(%ebp),%eax
    164f:	89 04 24             	mov    %eax,(%esp)
    1652:	e8 dd fd ff ff       	call   1434 <putc>
        ap++;
    1657:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    165b:	eb 45                	jmp    16a2 <printf+0x195>
      } else if(c == '%'){
    165d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1661:	75 17                	jne    167a <printf+0x16d>
        putc(fd, c);
    1663:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1666:	0f be c0             	movsbl %al,%eax
    1669:	89 44 24 04          	mov    %eax,0x4(%esp)
    166d:	8b 45 08             	mov    0x8(%ebp),%eax
    1670:	89 04 24             	mov    %eax,(%esp)
    1673:	e8 bc fd ff ff       	call   1434 <putc>
    1678:	eb 28                	jmp    16a2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    167a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1681:	00 
    1682:	8b 45 08             	mov    0x8(%ebp),%eax
    1685:	89 04 24             	mov    %eax,(%esp)
    1688:	e8 a7 fd ff ff       	call   1434 <putc>
        putc(fd, c);
    168d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1690:	0f be c0             	movsbl %al,%eax
    1693:	89 44 24 04          	mov    %eax,0x4(%esp)
    1697:	8b 45 08             	mov    0x8(%ebp),%eax
    169a:	89 04 24             	mov    %eax,(%esp)
    169d:	e8 92 fd ff ff       	call   1434 <putc>
      }
      state = 0;
    16a2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    16a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    16ad:	8b 55 0c             	mov    0xc(%ebp),%edx
    16b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16b3:	8d 04 02             	lea    (%edx,%eax,1),%eax
    16b6:	0f b6 00             	movzbl (%eax),%eax
    16b9:	84 c0                	test   %al,%al
    16bb:	0f 85 6e fe ff ff    	jne    152f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    16c1:	c9                   	leave  
    16c2:	c3                   	ret    
    16c3:	90                   	nop

000016c4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16c4:	55                   	push   %ebp
    16c5:	89 e5                	mov    %esp,%ebp
    16c7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16ca:	8b 45 08             	mov    0x8(%ebp),%eax
    16cd:	83 e8 08             	sub    $0x8,%eax
    16d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16d3:	a1 a8 1b 00 00       	mov    0x1ba8,%eax
    16d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16db:	eb 24                	jmp    1701 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16e0:	8b 00                	mov    (%eax),%eax
    16e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16e5:	77 12                	ja     16f9 <free+0x35>
    16e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16ed:	77 24                	ja     1713 <free+0x4f>
    16ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f2:	8b 00                	mov    (%eax),%eax
    16f4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16f7:	77 1a                	ja     1713 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16fc:	8b 00                	mov    (%eax),%eax
    16fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1701:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1704:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1707:	76 d4                	jbe    16dd <free+0x19>
    1709:	8b 45 fc             	mov    -0x4(%ebp),%eax
    170c:	8b 00                	mov    (%eax),%eax
    170e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1711:	76 ca                	jbe    16dd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1713:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1716:	8b 40 04             	mov    0x4(%eax),%eax
    1719:	c1 e0 03             	shl    $0x3,%eax
    171c:	89 c2                	mov    %eax,%edx
    171e:	03 55 f8             	add    -0x8(%ebp),%edx
    1721:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1724:	8b 00                	mov    (%eax),%eax
    1726:	39 c2                	cmp    %eax,%edx
    1728:	75 24                	jne    174e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    172a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    172d:	8b 50 04             	mov    0x4(%eax),%edx
    1730:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1733:	8b 00                	mov    (%eax),%eax
    1735:	8b 40 04             	mov    0x4(%eax),%eax
    1738:	01 c2                	add    %eax,%edx
    173a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    173d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1740:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1743:	8b 00                	mov    (%eax),%eax
    1745:	8b 10                	mov    (%eax),%edx
    1747:	8b 45 f8             	mov    -0x8(%ebp),%eax
    174a:	89 10                	mov    %edx,(%eax)
    174c:	eb 0a                	jmp    1758 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    174e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1751:	8b 10                	mov    (%eax),%edx
    1753:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1756:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1758:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175b:	8b 40 04             	mov    0x4(%eax),%eax
    175e:	c1 e0 03             	shl    $0x3,%eax
    1761:	03 45 fc             	add    -0x4(%ebp),%eax
    1764:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1767:	75 20                	jne    1789 <free+0xc5>
    p->s.size += bp->s.size;
    1769:	8b 45 fc             	mov    -0x4(%ebp),%eax
    176c:	8b 50 04             	mov    0x4(%eax),%edx
    176f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1772:	8b 40 04             	mov    0x4(%eax),%eax
    1775:	01 c2                	add    %eax,%edx
    1777:	8b 45 fc             	mov    -0x4(%ebp),%eax
    177a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    177d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1780:	8b 10                	mov    (%eax),%edx
    1782:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1785:	89 10                	mov    %edx,(%eax)
    1787:	eb 08                	jmp    1791 <free+0xcd>
  } else
    p->s.ptr = bp;
    1789:	8b 45 fc             	mov    -0x4(%ebp),%eax
    178c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    178f:	89 10                	mov    %edx,(%eax)
  freep = p;
    1791:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1794:	a3 a8 1b 00 00       	mov    %eax,0x1ba8
}
    1799:	c9                   	leave  
    179a:	c3                   	ret    

0000179b <morecore>:

static Header*
morecore(uint nu)
{
    179b:	55                   	push   %ebp
    179c:	89 e5                	mov    %esp,%ebp
    179e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    17a1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    17a8:	77 07                	ja     17b1 <morecore+0x16>
    nu = 4096;
    17aa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    17b1:	8b 45 08             	mov    0x8(%ebp),%eax
    17b4:	c1 e0 03             	shl    $0x3,%eax
    17b7:	89 04 24             	mov    %eax,(%esp)
    17ba:	e8 3d fc ff ff       	call   13fc <sbrk>
    17bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    17c2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    17c6:	75 07                	jne    17cf <morecore+0x34>
    return 0;
    17c8:	b8 00 00 00 00       	mov    $0x0,%eax
    17cd:	eb 22                	jmp    17f1 <morecore+0x56>
  hp = (Header*)p;
    17cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    17d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17d8:	8b 55 08             	mov    0x8(%ebp),%edx
    17db:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    17de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17e1:	83 c0 08             	add    $0x8,%eax
    17e4:	89 04 24             	mov    %eax,(%esp)
    17e7:	e8 d8 fe ff ff       	call   16c4 <free>
  return freep;
    17ec:	a1 a8 1b 00 00       	mov    0x1ba8,%eax
}
    17f1:	c9                   	leave  
    17f2:	c3                   	ret    

000017f3 <malloc>:

void*
malloc(uint nbytes)
{
    17f3:	55                   	push   %ebp
    17f4:	89 e5                	mov    %esp,%ebp
    17f6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17f9:	8b 45 08             	mov    0x8(%ebp),%eax
    17fc:	83 c0 07             	add    $0x7,%eax
    17ff:	c1 e8 03             	shr    $0x3,%eax
    1802:	83 c0 01             	add    $0x1,%eax
    1805:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1808:	a1 a8 1b 00 00       	mov    0x1ba8,%eax
    180d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1810:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1814:	75 23                	jne    1839 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1816:	c7 45 f0 a0 1b 00 00 	movl   $0x1ba0,-0x10(%ebp)
    181d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1820:	a3 a8 1b 00 00       	mov    %eax,0x1ba8
    1825:	a1 a8 1b 00 00       	mov    0x1ba8,%eax
    182a:	a3 a0 1b 00 00       	mov    %eax,0x1ba0
    base.s.size = 0;
    182f:	c7 05 a4 1b 00 00 00 	movl   $0x0,0x1ba4
    1836:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1839:	8b 45 f0             	mov    -0x10(%ebp),%eax
    183c:	8b 00                	mov    (%eax),%eax
    183e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1841:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1844:	8b 40 04             	mov    0x4(%eax),%eax
    1847:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    184a:	72 4d                	jb     1899 <malloc+0xa6>
      if(p->s.size == nunits)
    184c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    184f:	8b 40 04             	mov    0x4(%eax),%eax
    1852:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1855:	75 0c                	jne    1863 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1857:	8b 45 ec             	mov    -0x14(%ebp),%eax
    185a:	8b 10                	mov    (%eax),%edx
    185c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    185f:	89 10                	mov    %edx,(%eax)
    1861:	eb 26                	jmp    1889 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1863:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1866:	8b 40 04             	mov    0x4(%eax),%eax
    1869:	89 c2                	mov    %eax,%edx
    186b:	2b 55 f4             	sub    -0xc(%ebp),%edx
    186e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1871:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1874:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1877:	8b 40 04             	mov    0x4(%eax),%eax
    187a:	c1 e0 03             	shl    $0x3,%eax
    187d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1880:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1883:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1886:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1889:	8b 45 f0             	mov    -0x10(%ebp),%eax
    188c:	a3 a8 1b 00 00       	mov    %eax,0x1ba8
      return (void*)(p + 1);
    1891:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1894:	83 c0 08             	add    $0x8,%eax
    1897:	eb 38                	jmp    18d1 <malloc+0xde>
    }
    if(p == freep)
    1899:	a1 a8 1b 00 00       	mov    0x1ba8,%eax
    189e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    18a1:	75 1b                	jne    18be <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    18a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18a6:	89 04 24             	mov    %eax,(%esp)
    18a9:	e8 ed fe ff ff       	call   179b <morecore>
    18ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
    18b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18b5:	75 07                	jne    18be <malloc+0xcb>
        return 0;
    18b7:	b8 00 00 00 00       	mov    $0x0,%eax
    18bc:	eb 13                	jmp    18d1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18c7:	8b 00                	mov    (%eax),%eax
    18c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    18cc:	e9 70 ff ff ff       	jmp    1841 <malloc+0x4e>
}
    18d1:	c9                   	leave  
    18d2:	c3                   	ret    
    18d3:	90                   	nop

000018d4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    18d4:	55                   	push   %ebp
    18d5:	89 e5                	mov    %esp,%ebp
    18d7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18da:	8b 55 08             	mov    0x8(%ebp),%edx
    18dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    18e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    18e3:	f0 87 02             	lock xchg %eax,(%edx)
    18e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    18ec:	c9                   	leave  
    18ed:	c3                   	ret    

000018ee <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    18ee:	55                   	push   %ebp
    18ef:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    18f1:	8b 45 08             	mov    0x8(%ebp),%eax
    18f4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18fa:	5d                   	pop    %ebp
    18fb:	c3                   	ret    

000018fc <lock_acquire>:
void lock_acquire(lock_t *lock){
    18fc:	55                   	push   %ebp
    18fd:	89 e5                	mov    %esp,%ebp
    18ff:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1902:	8b 45 08             	mov    0x8(%ebp),%eax
    1905:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    190c:	00 
    190d:	89 04 24             	mov    %eax,(%esp)
    1910:	e8 bf ff ff ff       	call   18d4 <xchg>
    1915:	85 c0                	test   %eax,%eax
    1917:	75 e9                	jne    1902 <lock_acquire+0x6>
}
    1919:	c9                   	leave  
    191a:	c3                   	ret    

0000191b <lock_release>:
void lock_release(lock_t *lock){
    191b:	55                   	push   %ebp
    191c:	89 e5                	mov    %esp,%ebp
    191e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1921:	8b 45 08             	mov    0x8(%ebp),%eax
    1924:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    192b:	00 
    192c:	89 04 24             	mov    %eax,(%esp)
    192f:	e8 a0 ff ff ff       	call   18d4 <xchg>
}
    1934:	c9                   	leave  
    1935:	c3                   	ret    

00001936 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1936:	55                   	push   %ebp
    1937:	89 e5                	mov    %esp,%ebp
    1939:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    193c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1943:	e8 ab fe ff ff       	call   17f3 <malloc>
    1948:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    194b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    194e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1951:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1954:	25 ff 0f 00 00       	and    $0xfff,%eax
    1959:	85 c0                	test   %eax,%eax
    195b:	74 15                	je     1972 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    195d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1960:	89 c2                	mov    %eax,%edx
    1962:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1968:	b8 00 10 00 00       	mov    $0x1000,%eax
    196d:	29 d0                	sub    %edx,%eax
    196f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1972:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1976:	75 1b                	jne    1993 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1978:	c7 44 24 04 46 1b 00 	movl   $0x1b46,0x4(%esp)
    197f:	00 
    1980:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1987:	e8 81 fb ff ff       	call   150d <printf>
        return 0;
    198c:	b8 00 00 00 00       	mov    $0x0,%eax
    1991:	eb 6f                	jmp    1a02 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1993:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1996:	8b 55 08             	mov    0x8(%ebp),%edx
    1999:	8b 45 f0             	mov    -0x10(%ebp),%eax
    199c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    19a0:	89 54 24 08          	mov    %edx,0x8(%esp)
    19a4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    19ab:	00 
    19ac:	89 04 24             	mov    %eax,(%esp)
    19af:	e8 60 fa ff ff       	call   1414 <clone>
    19b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    19b7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19bb:	79 1b                	jns    19d8 <thread_create+0xa2>
        printf(1,"clone fails\n");
    19bd:	c7 44 24 04 54 1b 00 	movl   $0x1b54,0x4(%esp)
    19c4:	00 
    19c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19cc:	e8 3c fb ff ff       	call   150d <printf>
        return 0;
    19d1:	b8 00 00 00 00       	mov    $0x0,%eax
    19d6:	eb 2a                	jmp    1a02 <thread_create+0xcc>
    }
    if(tid > 0){
    19d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19dc:	7e 05                	jle    19e3 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    19de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19e1:	eb 1f                	jmp    1a02 <thread_create+0xcc>
    }
    if(tid == 0){
    19e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19e7:	75 14                	jne    19fd <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    19e9:	c7 44 24 04 61 1b 00 	movl   $0x1b61,0x4(%esp)
    19f0:	00 
    19f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19f8:	e8 10 fb ff ff       	call   150d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    19fd:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1a02:	c9                   	leave  
    1a03:	c3                   	ret    

00001a04 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1a04:	55                   	push   %ebp
    1a05:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1a07:	8b 45 08             	mov    0x8(%ebp),%eax
    1a0a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1a10:	8b 45 08             	mov    0x8(%ebp),%eax
    1a13:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1a1a:	8b 45 08             	mov    0x8(%ebp),%eax
    1a1d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1a24:	5d                   	pop    %ebp
    1a25:	c3                   	ret    

00001a26 <add_q>:

void add_q(struct queue *q, int v){
    1a26:	55                   	push   %ebp
    1a27:	89 e5                	mov    %esp,%ebp
    1a29:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1a2c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a33:	e8 bb fd ff ff       	call   17f3 <malloc>
    1a38:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a3e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a48:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a4b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a50:	8b 40 04             	mov    0x4(%eax),%eax
    1a53:	85 c0                	test   %eax,%eax
    1a55:	75 0b                	jne    1a62 <add_q+0x3c>
        q->head = n;
    1a57:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a5d:	89 50 04             	mov    %edx,0x4(%eax)
    1a60:	eb 0c                	jmp    1a6e <add_q+0x48>
    }else{
        q->tail->next = n;
    1a62:	8b 45 08             	mov    0x8(%ebp),%eax
    1a65:	8b 40 08             	mov    0x8(%eax),%eax
    1a68:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a6b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a6e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a71:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a74:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a77:	8b 45 08             	mov    0x8(%ebp),%eax
    1a7a:	8b 00                	mov    (%eax),%eax
    1a7c:	8d 50 01             	lea    0x1(%eax),%edx
    1a7f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a82:	89 10                	mov    %edx,(%eax)
}
    1a84:	c9                   	leave  
    1a85:	c3                   	ret    

00001a86 <empty_q>:

int empty_q(struct queue *q){
    1a86:	55                   	push   %ebp
    1a87:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a89:	8b 45 08             	mov    0x8(%ebp),%eax
    1a8c:	8b 00                	mov    (%eax),%eax
    1a8e:	85 c0                	test   %eax,%eax
    1a90:	75 07                	jne    1a99 <empty_q+0x13>
        return 1;
    1a92:	b8 01 00 00 00       	mov    $0x1,%eax
    1a97:	eb 05                	jmp    1a9e <empty_q+0x18>
    else
        return 0;
    1a99:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a9e:	5d                   	pop    %ebp
    1a9f:	c3                   	ret    

00001aa0 <pop_q>:
int pop_q(struct queue *q){
    1aa0:	55                   	push   %ebp
    1aa1:	89 e5                	mov    %esp,%ebp
    1aa3:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1aa6:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa9:	89 04 24             	mov    %eax,(%esp)
    1aac:	e8 d5 ff ff ff       	call   1a86 <empty_q>
    1ab1:	85 c0                	test   %eax,%eax
    1ab3:	75 5d                	jne    1b12 <pop_q+0x72>
       val = q->head->value; 
    1ab5:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab8:	8b 40 04             	mov    0x4(%eax),%eax
    1abb:	8b 00                	mov    (%eax),%eax
    1abd:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1ac0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac3:	8b 40 04             	mov    0x4(%eax),%eax
    1ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1ac9:	8b 45 08             	mov    0x8(%ebp),%eax
    1acc:	8b 40 04             	mov    0x4(%eax),%eax
    1acf:	8b 50 04             	mov    0x4(%eax),%edx
    1ad2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad5:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1adb:	89 04 24             	mov    %eax,(%esp)
    1ade:	e8 e1 fb ff ff       	call   16c4 <free>
       q->size--;
    1ae3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae6:	8b 00                	mov    (%eax),%eax
    1ae8:	8d 50 ff             	lea    -0x1(%eax),%edx
    1aeb:	8b 45 08             	mov    0x8(%ebp),%eax
    1aee:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1af0:	8b 45 08             	mov    0x8(%ebp),%eax
    1af3:	8b 00                	mov    (%eax),%eax
    1af5:	85 c0                	test   %eax,%eax
    1af7:	75 14                	jne    1b0d <pop_q+0x6d>
            q->head = 0;
    1af9:	8b 45 08             	mov    0x8(%ebp),%eax
    1afc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1b03:	8b 45 08             	mov    0x8(%ebp),%eax
    1b06:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b10:	eb 05                	jmp    1b17 <pop_q+0x77>
    }
    return -1;
    1b12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1b17:	c9                   	leave  
    1b18:	c3                   	ret    
