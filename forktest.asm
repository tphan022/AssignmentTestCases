
_forktest:     file format elf32-i386


Disassembly of section .text:

00001000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
    1006:	8b 45 0c             	mov    0xc(%ebp),%eax
    1009:	89 04 24             	mov    %eax,(%esp)
    100c:	e8 9c 01 00 00       	call   11ad <strlen>
    1011:	89 44 24 08          	mov    %eax,0x8(%esp)
    1015:	8b 45 0c             	mov    0xc(%ebp),%eax
    1018:	89 44 24 04          	mov    %eax,0x4(%esp)
    101c:	8b 45 08             	mov    0x8(%ebp),%eax
    101f:	89 04 24             	mov    %eax,(%esp)
    1022:	e8 71 03 00 00       	call   1398 <write>
}
    1027:	c9                   	leave  
    1028:	c3                   	ret    

00001029 <forktest>:

void
forktest(void)
{
    1029:	55                   	push   %ebp
    102a:	89 e5                	mov    %esp,%ebp
    102c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    102f:	c7 44 24 04 38 14 00 	movl   $0x1438,0x4(%esp)
    1036:	00 
    1037:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    103e:	e8 bd ff ff ff       	call   1000 <printf>

  for(n=0; n<N; n++){
    1043:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    104a:	eb 1d                	jmp    1069 <forktest+0x40>
    pid = fork();
    104c:	e8 1f 03 00 00       	call   1370 <fork>
    1051:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0)
    1054:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1058:	78 1a                	js     1074 <forktest+0x4b>
      break;
    if(pid == 0)
    105a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    105e:	75 05                	jne    1065 <forktest+0x3c>
      exit();
    1060:	e8 13 03 00 00       	call   1378 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
    1065:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1069:	81 7d f0 e7 03 00 00 	cmpl   $0x3e7,-0x10(%ebp)
    1070:	7e da                	jle    104c <forktest+0x23>
    1072:	eb 01                	jmp    1075 <forktest+0x4c>
    pid = fork();
    if(pid < 0)
      break;
    1074:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == N){
    1075:	81 7d f0 e8 03 00 00 	cmpl   $0x3e8,-0x10(%ebp)
    107c:	75 47                	jne    10c5 <forktest+0x9c>
    printf(1, "fork claimed to work N times!\n", N);
    107e:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
    1085:	00 
    1086:	c7 44 24 04 44 14 00 	movl   $0x1444,0x4(%esp)
    108d:	00 
    108e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1095:	e8 66 ff ff ff       	call   1000 <printf>
    exit();
    109a:	e8 d9 02 00 00       	call   1378 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    109f:	e8 dc 02 00 00       	call   1380 <wait>
    10a4:	85 c0                	test   %eax,%eax
    10a6:	79 19                	jns    10c1 <forktest+0x98>
      printf(1, "wait stopped early\n");
    10a8:	c7 44 24 04 63 14 00 	movl   $0x1463,0x4(%esp)
    10af:	00 
    10b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b7:	e8 44 ff ff ff       	call   1000 <printf>
      exit();
    10bc:	e8 b7 02 00 00       	call   1378 <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
    10c1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    10c5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10c9:	7f d4                	jg     109f <forktest+0x76>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    10cb:	e8 b0 02 00 00       	call   1380 <wait>
    10d0:	83 f8 ff             	cmp    $0xffffffff,%eax
    10d3:	74 19                	je     10ee <forktest+0xc5>
    printf(1, "wait got too many\n");
    10d5:	c7 44 24 04 77 14 00 	movl   $0x1477,0x4(%esp)
    10dc:	00 
    10dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10e4:	e8 17 ff ff ff       	call   1000 <printf>
    exit();
    10e9:	e8 8a 02 00 00       	call   1378 <exit>
  }
  
  printf(1, "fork test OK\n");
    10ee:	c7 44 24 04 8a 14 00 	movl   $0x148a,0x4(%esp)
    10f5:	00 
    10f6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10fd:	e8 fe fe ff ff       	call   1000 <printf>
}
    1102:	c9                   	leave  
    1103:	c3                   	ret    

00001104 <main>:

int
main(void)
{
    1104:	55                   	push   %ebp
    1105:	89 e5                	mov    %esp,%ebp
    1107:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
    110a:	e8 1a ff ff ff       	call   1029 <forktest>
  exit();
    110f:	e8 64 02 00 00       	call   1378 <exit>

00001114 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1114:	55                   	push   %ebp
    1115:	89 e5                	mov    %esp,%ebp
    1117:	57                   	push   %edi
    1118:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1119:	8b 4d 08             	mov    0x8(%ebp),%ecx
    111c:	8b 55 10             	mov    0x10(%ebp),%edx
    111f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1122:	89 cb                	mov    %ecx,%ebx
    1124:	89 df                	mov    %ebx,%edi
    1126:	89 d1                	mov    %edx,%ecx
    1128:	fc                   	cld    
    1129:	f3 aa                	rep stos %al,%es:(%edi)
    112b:	89 ca                	mov    %ecx,%edx
    112d:	89 fb                	mov    %edi,%ebx
    112f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1132:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1135:	5b                   	pop    %ebx
    1136:	5f                   	pop    %edi
    1137:	5d                   	pop    %ebp
    1138:	c3                   	ret    

00001139 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1139:	55                   	push   %ebp
    113a:	89 e5                	mov    %esp,%ebp
    113c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    113f:	8b 45 08             	mov    0x8(%ebp),%eax
    1142:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1145:	8b 45 0c             	mov    0xc(%ebp),%eax
    1148:	0f b6 10             	movzbl (%eax),%edx
    114b:	8b 45 08             	mov    0x8(%ebp),%eax
    114e:	88 10                	mov    %dl,(%eax)
    1150:	8b 45 08             	mov    0x8(%ebp),%eax
    1153:	0f b6 00             	movzbl (%eax),%eax
    1156:	84 c0                	test   %al,%al
    1158:	0f 95 c0             	setne  %al
    115b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    115f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1163:	84 c0                	test   %al,%al
    1165:	75 de                	jne    1145 <strcpy+0xc>
    ;
  return os;
    1167:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    116a:	c9                   	leave  
    116b:	c3                   	ret    

0000116c <strcmp>:

int
strcmp(const char *p, const char *q)
{
    116c:	55                   	push   %ebp
    116d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    116f:	eb 08                	jmp    1179 <strcmp+0xd>
    p++, q++;
    1171:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1175:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1179:	8b 45 08             	mov    0x8(%ebp),%eax
    117c:	0f b6 00             	movzbl (%eax),%eax
    117f:	84 c0                	test   %al,%al
    1181:	74 10                	je     1193 <strcmp+0x27>
    1183:	8b 45 08             	mov    0x8(%ebp),%eax
    1186:	0f b6 10             	movzbl (%eax),%edx
    1189:	8b 45 0c             	mov    0xc(%ebp),%eax
    118c:	0f b6 00             	movzbl (%eax),%eax
    118f:	38 c2                	cmp    %al,%dl
    1191:	74 de                	je     1171 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1193:	8b 45 08             	mov    0x8(%ebp),%eax
    1196:	0f b6 00             	movzbl (%eax),%eax
    1199:	0f b6 d0             	movzbl %al,%edx
    119c:	8b 45 0c             	mov    0xc(%ebp),%eax
    119f:	0f b6 00             	movzbl (%eax),%eax
    11a2:	0f b6 c0             	movzbl %al,%eax
    11a5:	89 d1                	mov    %edx,%ecx
    11a7:	29 c1                	sub    %eax,%ecx
    11a9:	89 c8                	mov    %ecx,%eax
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    

000011ad <strlen>:

uint
strlen(char *s)
{
    11ad:	55                   	push   %ebp
    11ae:	89 e5                	mov    %esp,%ebp
    11b0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    11b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    11ba:	eb 04                	jmp    11c0 <strlen+0x13>
    11bc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    11c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    11c3:	03 45 08             	add    0x8(%ebp),%eax
    11c6:	0f b6 00             	movzbl (%eax),%eax
    11c9:	84 c0                	test   %al,%al
    11cb:	75 ef                	jne    11bc <strlen+0xf>
    ;
  return n;
    11cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    11d0:	c9                   	leave  
    11d1:	c3                   	ret    

000011d2 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11d2:	55                   	push   %ebp
    11d3:	89 e5                	mov    %esp,%ebp
    11d5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11d8:	8b 45 10             	mov    0x10(%ebp),%eax
    11db:	89 44 24 08          	mov    %eax,0x8(%esp)
    11df:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    11e6:	8b 45 08             	mov    0x8(%ebp),%eax
    11e9:	89 04 24             	mov    %eax,(%esp)
    11ec:	e8 23 ff ff ff       	call   1114 <stosb>
  return dst;
    11f1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11f4:	c9                   	leave  
    11f5:	c3                   	ret    

000011f6 <strchr>:

char*
strchr(const char *s, char c)
{
    11f6:	55                   	push   %ebp
    11f7:	89 e5                	mov    %esp,%ebp
    11f9:	83 ec 04             	sub    $0x4,%esp
    11fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ff:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1202:	eb 14                	jmp    1218 <strchr+0x22>
    if(*s == c)
    1204:	8b 45 08             	mov    0x8(%ebp),%eax
    1207:	0f b6 00             	movzbl (%eax),%eax
    120a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    120d:	75 05                	jne    1214 <strchr+0x1e>
      return (char*)s;
    120f:	8b 45 08             	mov    0x8(%ebp),%eax
    1212:	eb 13                	jmp    1227 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1214:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1218:	8b 45 08             	mov    0x8(%ebp),%eax
    121b:	0f b6 00             	movzbl (%eax),%eax
    121e:	84 c0                	test   %al,%al
    1220:	75 e2                	jne    1204 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1222:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1227:	c9                   	leave  
    1228:	c3                   	ret    

00001229 <gets>:

char*
gets(char *buf, int max)
{
    1229:	55                   	push   %ebp
    122a:	89 e5                	mov    %esp,%ebp
    122c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    122f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1236:	eb 44                	jmp    127c <gets+0x53>
    cc = read(0, &c, 1);
    1238:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    123f:	00 
    1240:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1243:	89 44 24 04          	mov    %eax,0x4(%esp)
    1247:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    124e:	e8 3d 01 00 00       	call   1390 <read>
    1253:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1256:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    125a:	7e 2d                	jle    1289 <gets+0x60>
      break;
    buf[i++] = c;
    125c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    125f:	03 45 08             	add    0x8(%ebp),%eax
    1262:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1266:	88 10                	mov    %dl,(%eax)
    1268:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    126c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1270:	3c 0a                	cmp    $0xa,%al
    1272:	74 16                	je     128a <gets+0x61>
    1274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1278:	3c 0d                	cmp    $0xd,%al
    127a:	74 0e                	je     128a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    127c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    127f:	83 c0 01             	add    $0x1,%eax
    1282:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1285:	7c b1                	jl     1238 <gets+0xf>
    1287:	eb 01                	jmp    128a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1289:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    128a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    128d:	03 45 08             	add    0x8(%ebp),%eax
    1290:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1293:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1296:	c9                   	leave  
    1297:	c3                   	ret    

00001298 <stat>:

int
stat(char *n, struct stat *st)
{
    1298:	55                   	push   %ebp
    1299:	89 e5                	mov    %esp,%ebp
    129b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    129e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12a5:	00 
    12a6:	8b 45 08             	mov    0x8(%ebp),%eax
    12a9:	89 04 24             	mov    %eax,(%esp)
    12ac:	e8 07 01 00 00       	call   13b8 <open>
    12b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    12b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12b8:	79 07                	jns    12c1 <stat+0x29>
    return -1;
    12ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12bf:	eb 23                	jmp    12e4 <stat+0x4c>
  r = fstat(fd, st);
    12c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12cb:	89 04 24             	mov    %eax,(%esp)
    12ce:	e8 fd 00 00 00       	call   13d0 <fstat>
    12d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    12d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12d9:	89 04 24             	mov    %eax,(%esp)
    12dc:	e8 bf 00 00 00       	call   13a0 <close>
  return r;
    12e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    12e4:	c9                   	leave  
    12e5:	c3                   	ret    

000012e6 <atoi>:

int
atoi(const char *s)
{
    12e6:	55                   	push   %ebp
    12e7:	89 e5                	mov    %esp,%ebp
    12e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12f3:	eb 24                	jmp    1319 <atoi+0x33>
    n = n*10 + *s++ - '0';
    12f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12f8:	89 d0                	mov    %edx,%eax
    12fa:	c1 e0 02             	shl    $0x2,%eax
    12fd:	01 d0                	add    %edx,%eax
    12ff:	01 c0                	add    %eax,%eax
    1301:	89 c2                	mov    %eax,%edx
    1303:	8b 45 08             	mov    0x8(%ebp),%eax
    1306:	0f b6 00             	movzbl (%eax),%eax
    1309:	0f be c0             	movsbl %al,%eax
    130c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    130f:	83 e8 30             	sub    $0x30,%eax
    1312:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1315:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1319:	8b 45 08             	mov    0x8(%ebp),%eax
    131c:	0f b6 00             	movzbl (%eax),%eax
    131f:	3c 2f                	cmp    $0x2f,%al
    1321:	7e 0a                	jle    132d <atoi+0x47>
    1323:	8b 45 08             	mov    0x8(%ebp),%eax
    1326:	0f b6 00             	movzbl (%eax),%eax
    1329:	3c 39                	cmp    $0x39,%al
    132b:	7e c8                	jle    12f5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    132d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1330:	c9                   	leave  
    1331:	c3                   	ret    

00001332 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1332:	55                   	push   %ebp
    1333:	89 e5                	mov    %esp,%ebp
    1335:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1338:	8b 45 08             	mov    0x8(%ebp),%eax
    133b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    133e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1341:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1344:	eb 13                	jmp    1359 <memmove+0x27>
    *dst++ = *src++;
    1346:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1349:	0f b6 10             	movzbl (%eax),%edx
    134c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    134f:	88 10                	mov    %dl,(%eax)
    1351:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1355:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1359:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    135d:	0f 9f c0             	setg   %al
    1360:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1364:	84 c0                	test   %al,%al
    1366:	75 de                	jne    1346 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1368:	8b 45 08             	mov    0x8(%ebp),%eax
}
    136b:	c9                   	leave  
    136c:	c3                   	ret    
    136d:	90                   	nop
    136e:	90                   	nop
    136f:	90                   	nop

00001370 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1370:	b8 01 00 00 00       	mov    $0x1,%eax
    1375:	cd 40                	int    $0x40
    1377:	c3                   	ret    

00001378 <exit>:
SYSCALL(exit)
    1378:	b8 02 00 00 00       	mov    $0x2,%eax
    137d:	cd 40                	int    $0x40
    137f:	c3                   	ret    

00001380 <wait>:
SYSCALL(wait)
    1380:	b8 03 00 00 00       	mov    $0x3,%eax
    1385:	cd 40                	int    $0x40
    1387:	c3                   	ret    

00001388 <pipe>:
SYSCALL(pipe)
    1388:	b8 04 00 00 00       	mov    $0x4,%eax
    138d:	cd 40                	int    $0x40
    138f:	c3                   	ret    

00001390 <read>:
SYSCALL(read)
    1390:	b8 05 00 00 00       	mov    $0x5,%eax
    1395:	cd 40                	int    $0x40
    1397:	c3                   	ret    

00001398 <write>:
SYSCALL(write)
    1398:	b8 10 00 00 00       	mov    $0x10,%eax
    139d:	cd 40                	int    $0x40
    139f:	c3                   	ret    

000013a0 <close>:
SYSCALL(close)
    13a0:	b8 15 00 00 00       	mov    $0x15,%eax
    13a5:	cd 40                	int    $0x40
    13a7:	c3                   	ret    

000013a8 <kill>:
SYSCALL(kill)
    13a8:	b8 06 00 00 00       	mov    $0x6,%eax
    13ad:	cd 40                	int    $0x40
    13af:	c3                   	ret    

000013b0 <exec>:
SYSCALL(exec)
    13b0:	b8 07 00 00 00       	mov    $0x7,%eax
    13b5:	cd 40                	int    $0x40
    13b7:	c3                   	ret    

000013b8 <open>:
SYSCALL(open)
    13b8:	b8 0f 00 00 00       	mov    $0xf,%eax
    13bd:	cd 40                	int    $0x40
    13bf:	c3                   	ret    

000013c0 <mknod>:
SYSCALL(mknod)
    13c0:	b8 11 00 00 00       	mov    $0x11,%eax
    13c5:	cd 40                	int    $0x40
    13c7:	c3                   	ret    

000013c8 <unlink>:
SYSCALL(unlink)
    13c8:	b8 12 00 00 00       	mov    $0x12,%eax
    13cd:	cd 40                	int    $0x40
    13cf:	c3                   	ret    

000013d0 <fstat>:
SYSCALL(fstat)
    13d0:	b8 08 00 00 00       	mov    $0x8,%eax
    13d5:	cd 40                	int    $0x40
    13d7:	c3                   	ret    

000013d8 <link>:
SYSCALL(link)
    13d8:	b8 13 00 00 00       	mov    $0x13,%eax
    13dd:	cd 40                	int    $0x40
    13df:	c3                   	ret    

000013e0 <mkdir>:
SYSCALL(mkdir)
    13e0:	b8 14 00 00 00       	mov    $0x14,%eax
    13e5:	cd 40                	int    $0x40
    13e7:	c3                   	ret    

000013e8 <chdir>:
SYSCALL(chdir)
    13e8:	b8 09 00 00 00       	mov    $0x9,%eax
    13ed:	cd 40                	int    $0x40
    13ef:	c3                   	ret    

000013f0 <dup>:
SYSCALL(dup)
    13f0:	b8 0a 00 00 00       	mov    $0xa,%eax
    13f5:	cd 40                	int    $0x40
    13f7:	c3                   	ret    

000013f8 <getpid>:
SYSCALL(getpid)
    13f8:	b8 0b 00 00 00       	mov    $0xb,%eax
    13fd:	cd 40                	int    $0x40
    13ff:	c3                   	ret    

00001400 <sbrk>:
SYSCALL(sbrk)
    1400:	b8 0c 00 00 00       	mov    $0xc,%eax
    1405:	cd 40                	int    $0x40
    1407:	c3                   	ret    

00001408 <sleep>:
SYSCALL(sleep)
    1408:	b8 0d 00 00 00       	mov    $0xd,%eax
    140d:	cd 40                	int    $0x40
    140f:	c3                   	ret    

00001410 <uptime>:
SYSCALL(uptime)
    1410:	b8 0e 00 00 00       	mov    $0xe,%eax
    1415:	cd 40                	int    $0x40
    1417:	c3                   	ret    

00001418 <clone>:
SYSCALL(clone)
    1418:	b8 16 00 00 00       	mov    $0x16,%eax
    141d:	cd 40                	int    $0x40
    141f:	c3                   	ret    

00001420 <texit>:
SYSCALL(texit)
    1420:	b8 17 00 00 00       	mov    $0x17,%eax
    1425:	cd 40                	int    $0x40
    1427:	c3                   	ret    

00001428 <tsleep>:
SYSCALL(tsleep)
    1428:	b8 18 00 00 00       	mov    $0x18,%eax
    142d:	cd 40                	int    $0x40
    142f:	c3                   	ret    

00001430 <twakeup>:
SYSCALL(twakeup)
    1430:	b8 19 00 00 00       	mov    $0x19,%eax
    1435:	cd 40                	int    $0x40
    1437:	c3                   	ret    
