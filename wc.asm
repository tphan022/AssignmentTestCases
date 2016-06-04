
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
    1006:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    100d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1010:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1013:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1016:	89 45 e8             	mov    %eax,-0x18(%ebp)
  inword = 0;
    1019:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1020:	eb 66                	jmp    1088 <wc+0x88>
    for(i=0; i<n; i++){
    1022:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1029:	eb 55                	jmp    1080 <wc+0x80>
      c++;
    102b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == '\n')
    102f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1032:	0f b6 80 80 1c 00 00 	movzbl 0x1c80(%eax),%eax
    1039:	3c 0a                	cmp    $0xa,%al
    103b:	75 04                	jne    1041 <wc+0x41>
        l++;
    103d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
    1041:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1044:	0f b6 80 80 1c 00 00 	movzbl 0x1c80(%eax),%eax
    104b:	0f be c0             	movsbl %al,%eax
    104e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1052:	c7 04 24 cd 1b 00 00 	movl   $0x1bcd,(%esp)
    1059:	e8 48 02 00 00       	call   12a6 <strchr>
    105e:	85 c0                	test   %eax,%eax
    1060:	74 09                	je     106b <wc+0x6b>
        inword = 0;
    1062:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1069:	eb 11                	jmp    107c <wc+0x7c>
      else if(!inword){
    106b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    106f:	75 0b                	jne    107c <wc+0x7c>
        w++;
    1071:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
    1075:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
    107c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1080:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1083:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    1086:	7c a3                	jl     102b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1088:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    108f:	00 
    1090:	c7 44 24 04 80 1c 00 	movl   $0x1c80,0x4(%esp)
    1097:	00 
    1098:	8b 45 08             	mov    0x8(%ebp),%eax
    109b:	89 04 24             	mov    %eax,(%esp)
    109e:	e8 9d 03 00 00       	call   1440 <read>
    10a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    10a6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    10aa:	0f 8f 72 ff ff ff    	jg     1022 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
    10b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    10b4:	79 19                	jns    10cf <wc+0xcf>
    printf(1, "wc: read error\n");
    10b6:	c7 44 24 04 d3 1b 00 	movl   $0x1bd3,0x4(%esp)
    10bd:	00 
    10be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10c5:	e8 f7 04 00 00       	call   15c1 <printf>
    exit();
    10ca:	e8 59 03 00 00       	call   1428 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
    10cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    10d2:	89 44 24 14          	mov    %eax,0x14(%esp)
    10d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10d9:	89 44 24 10          	mov    %eax,0x10(%esp)
    10dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    10e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    10e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    10eb:	c7 44 24 04 e3 1b 00 	movl   $0x1be3,0x4(%esp)
    10f2:	00 
    10f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10fa:	e8 c2 04 00 00       	call   15c1 <printf>
}
    10ff:	c9                   	leave  
    1100:	c3                   	ret    

00001101 <main>:

int
main(int argc, char *argv[])
{
    1101:	55                   	push   %ebp
    1102:	89 e5                	mov    %esp,%ebp
    1104:	83 e4 f0             	and    $0xfffffff0,%esp
    1107:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
    110a:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    110e:	7f 19                	jg     1129 <main+0x28>
    wc(0, "");
    1110:	c7 44 24 04 f0 1b 00 	movl   $0x1bf0,0x4(%esp)
    1117:	00 
    1118:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    111f:	e8 dc fe ff ff       	call   1000 <wc>
    exit();
    1124:	e8 ff 02 00 00       	call   1428 <exit>
  }

  for(i = 1; i < argc; i++){
    1129:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    1130:	00 
    1131:	eb 7d                	jmp    11b0 <main+0xaf>
    if((fd = open(argv[i], 0)) < 0){
    1133:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1137:	c1 e0 02             	shl    $0x2,%eax
    113a:	03 45 0c             	add    0xc(%ebp),%eax
    113d:	8b 00                	mov    (%eax),%eax
    113f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1146:	00 
    1147:	89 04 24             	mov    %eax,(%esp)
    114a:	e8 19 03 00 00       	call   1468 <open>
    114f:	89 44 24 18          	mov    %eax,0x18(%esp)
    1153:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    1158:	79 29                	jns    1183 <main+0x82>
      printf(1, "wc: cannot open %s\n", argv[i]);
    115a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    115e:	c1 e0 02             	shl    $0x2,%eax
    1161:	03 45 0c             	add    0xc(%ebp),%eax
    1164:	8b 00                	mov    (%eax),%eax
    1166:	89 44 24 08          	mov    %eax,0x8(%esp)
    116a:	c7 44 24 04 f1 1b 00 	movl   $0x1bf1,0x4(%esp)
    1171:	00 
    1172:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1179:	e8 43 04 00 00       	call   15c1 <printf>
      exit();
    117e:	e8 a5 02 00 00       	call   1428 <exit>
    }
    wc(fd, argv[i]);
    1183:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1187:	c1 e0 02             	shl    $0x2,%eax
    118a:	03 45 0c             	add    0xc(%ebp),%eax
    118d:	8b 00                	mov    (%eax),%eax
    118f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1193:	8b 44 24 18          	mov    0x18(%esp),%eax
    1197:	89 04 24             	mov    %eax,(%esp)
    119a:	e8 61 fe ff ff       	call   1000 <wc>
    close(fd);
    119f:	8b 44 24 18          	mov    0x18(%esp),%eax
    11a3:	89 04 24             	mov    %eax,(%esp)
    11a6:	e8 a5 02 00 00       	call   1450 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    11ab:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    11b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    11b4:	3b 45 08             	cmp    0x8(%ebp),%eax
    11b7:	0f 8c 76 ff ff ff    	jl     1133 <main+0x32>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
    11bd:	e8 66 02 00 00       	call   1428 <exit>
    11c2:	90                   	nop
    11c3:	90                   	nop

000011c4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    11c4:	55                   	push   %ebp
    11c5:	89 e5                	mov    %esp,%ebp
    11c7:	57                   	push   %edi
    11c8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    11c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11cc:	8b 55 10             	mov    0x10(%ebp),%edx
    11cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d2:	89 cb                	mov    %ecx,%ebx
    11d4:	89 df                	mov    %ebx,%edi
    11d6:	89 d1                	mov    %edx,%ecx
    11d8:	fc                   	cld    
    11d9:	f3 aa                	rep stos %al,%es:(%edi)
    11db:	89 ca                	mov    %ecx,%edx
    11dd:	89 fb                	mov    %edi,%ebx
    11df:	89 5d 08             	mov    %ebx,0x8(%ebp)
    11e2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    11e5:	5b                   	pop    %ebx
    11e6:	5f                   	pop    %edi
    11e7:	5d                   	pop    %ebp
    11e8:	c3                   	ret    

000011e9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    11e9:	55                   	push   %ebp
    11ea:	89 e5                	mov    %esp,%ebp
    11ec:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    11ef:	8b 45 08             	mov    0x8(%ebp),%eax
    11f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    11f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    11f8:	0f b6 10             	movzbl (%eax),%edx
    11fb:	8b 45 08             	mov    0x8(%ebp),%eax
    11fe:	88 10                	mov    %dl,(%eax)
    1200:	8b 45 08             	mov    0x8(%ebp),%eax
    1203:	0f b6 00             	movzbl (%eax),%eax
    1206:	84 c0                	test   %al,%al
    1208:	0f 95 c0             	setne  %al
    120b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    120f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1213:	84 c0                	test   %al,%al
    1215:	75 de                	jne    11f5 <strcpy+0xc>
    ;
  return os;
    1217:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    121a:	c9                   	leave  
    121b:	c3                   	ret    

0000121c <strcmp>:

int
strcmp(const char *p, const char *q)
{
    121c:	55                   	push   %ebp
    121d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    121f:	eb 08                	jmp    1229 <strcmp+0xd>
    p++, q++;
    1221:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1225:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1229:	8b 45 08             	mov    0x8(%ebp),%eax
    122c:	0f b6 00             	movzbl (%eax),%eax
    122f:	84 c0                	test   %al,%al
    1231:	74 10                	je     1243 <strcmp+0x27>
    1233:	8b 45 08             	mov    0x8(%ebp),%eax
    1236:	0f b6 10             	movzbl (%eax),%edx
    1239:	8b 45 0c             	mov    0xc(%ebp),%eax
    123c:	0f b6 00             	movzbl (%eax),%eax
    123f:	38 c2                	cmp    %al,%dl
    1241:	74 de                	je     1221 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1243:	8b 45 08             	mov    0x8(%ebp),%eax
    1246:	0f b6 00             	movzbl (%eax),%eax
    1249:	0f b6 d0             	movzbl %al,%edx
    124c:	8b 45 0c             	mov    0xc(%ebp),%eax
    124f:	0f b6 00             	movzbl (%eax),%eax
    1252:	0f b6 c0             	movzbl %al,%eax
    1255:	89 d1                	mov    %edx,%ecx
    1257:	29 c1                	sub    %eax,%ecx
    1259:	89 c8                	mov    %ecx,%eax
}
    125b:	5d                   	pop    %ebp
    125c:	c3                   	ret    

0000125d <strlen>:

uint
strlen(char *s)
{
    125d:	55                   	push   %ebp
    125e:	89 e5                	mov    %esp,%ebp
    1260:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1263:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    126a:	eb 04                	jmp    1270 <strlen+0x13>
    126c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1270:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1273:	03 45 08             	add    0x8(%ebp),%eax
    1276:	0f b6 00             	movzbl (%eax),%eax
    1279:	84 c0                	test   %al,%al
    127b:	75 ef                	jne    126c <strlen+0xf>
    ;
  return n;
    127d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1280:	c9                   	leave  
    1281:	c3                   	ret    

00001282 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1282:	55                   	push   %ebp
    1283:	89 e5                	mov    %esp,%ebp
    1285:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1288:	8b 45 10             	mov    0x10(%ebp),%eax
    128b:	89 44 24 08          	mov    %eax,0x8(%esp)
    128f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1292:	89 44 24 04          	mov    %eax,0x4(%esp)
    1296:	8b 45 08             	mov    0x8(%ebp),%eax
    1299:	89 04 24             	mov    %eax,(%esp)
    129c:	e8 23 ff ff ff       	call   11c4 <stosb>
  return dst;
    12a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    12a4:	c9                   	leave  
    12a5:	c3                   	ret    

000012a6 <strchr>:

char*
strchr(const char *s, char c)
{
    12a6:	55                   	push   %ebp
    12a7:	89 e5                	mov    %esp,%ebp
    12a9:	83 ec 04             	sub    $0x4,%esp
    12ac:	8b 45 0c             	mov    0xc(%ebp),%eax
    12af:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    12b2:	eb 14                	jmp    12c8 <strchr+0x22>
    if(*s == c)
    12b4:	8b 45 08             	mov    0x8(%ebp),%eax
    12b7:	0f b6 00             	movzbl (%eax),%eax
    12ba:	3a 45 fc             	cmp    -0x4(%ebp),%al
    12bd:	75 05                	jne    12c4 <strchr+0x1e>
      return (char*)s;
    12bf:	8b 45 08             	mov    0x8(%ebp),%eax
    12c2:	eb 13                	jmp    12d7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    12c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12c8:	8b 45 08             	mov    0x8(%ebp),%eax
    12cb:	0f b6 00             	movzbl (%eax),%eax
    12ce:	84 c0                	test   %al,%al
    12d0:	75 e2                	jne    12b4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    12d2:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12d7:	c9                   	leave  
    12d8:	c3                   	ret    

000012d9 <gets>:

char*
gets(char *buf, int max)
{
    12d9:	55                   	push   %ebp
    12da:	89 e5                	mov    %esp,%ebp
    12dc:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    12e6:	eb 44                	jmp    132c <gets+0x53>
    cc = read(0, &c, 1);
    12e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12ef:	00 
    12f0:	8d 45 ef             	lea    -0x11(%ebp),%eax
    12f3:	89 44 24 04          	mov    %eax,0x4(%esp)
    12f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12fe:	e8 3d 01 00 00       	call   1440 <read>
    1303:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1306:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    130a:	7e 2d                	jle    1339 <gets+0x60>
      break;
    buf[i++] = c;
    130c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    130f:	03 45 08             	add    0x8(%ebp),%eax
    1312:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1316:	88 10                	mov    %dl,(%eax)
    1318:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    131c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1320:	3c 0a                	cmp    $0xa,%al
    1322:	74 16                	je     133a <gets+0x61>
    1324:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1328:	3c 0d                	cmp    $0xd,%al
    132a:	74 0e                	je     133a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    132c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    132f:	83 c0 01             	add    $0x1,%eax
    1332:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1335:	7c b1                	jl     12e8 <gets+0xf>
    1337:	eb 01                	jmp    133a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1339:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    133a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    133d:	03 45 08             	add    0x8(%ebp),%eax
    1340:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1343:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1346:	c9                   	leave  
    1347:	c3                   	ret    

00001348 <stat>:

int
stat(char *n, struct stat *st)
{
    1348:	55                   	push   %ebp
    1349:	89 e5                	mov    %esp,%ebp
    134b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    134e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1355:	00 
    1356:	8b 45 08             	mov    0x8(%ebp),%eax
    1359:	89 04 24             	mov    %eax,(%esp)
    135c:	e8 07 01 00 00       	call   1468 <open>
    1361:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1364:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1368:	79 07                	jns    1371 <stat+0x29>
    return -1;
    136a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    136f:	eb 23                	jmp    1394 <stat+0x4c>
  r = fstat(fd, st);
    1371:	8b 45 0c             	mov    0xc(%ebp),%eax
    1374:	89 44 24 04          	mov    %eax,0x4(%esp)
    1378:	8b 45 f0             	mov    -0x10(%ebp),%eax
    137b:	89 04 24             	mov    %eax,(%esp)
    137e:	e8 fd 00 00 00       	call   1480 <fstat>
    1383:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1386:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1389:	89 04 24             	mov    %eax,(%esp)
    138c:	e8 bf 00 00 00       	call   1450 <close>
  return r;
    1391:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1394:	c9                   	leave  
    1395:	c3                   	ret    

00001396 <atoi>:

int
atoi(const char *s)
{
    1396:	55                   	push   %ebp
    1397:	89 e5                	mov    %esp,%ebp
    1399:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    139c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    13a3:	eb 24                	jmp    13c9 <atoi+0x33>
    n = n*10 + *s++ - '0';
    13a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
    13a8:	89 d0                	mov    %edx,%eax
    13aa:	c1 e0 02             	shl    $0x2,%eax
    13ad:	01 d0                	add    %edx,%eax
    13af:	01 c0                	add    %eax,%eax
    13b1:	89 c2                	mov    %eax,%edx
    13b3:	8b 45 08             	mov    0x8(%ebp),%eax
    13b6:	0f b6 00             	movzbl (%eax),%eax
    13b9:	0f be c0             	movsbl %al,%eax
    13bc:	8d 04 02             	lea    (%edx,%eax,1),%eax
    13bf:	83 e8 30             	sub    $0x30,%eax
    13c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    13c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    13c9:	8b 45 08             	mov    0x8(%ebp),%eax
    13cc:	0f b6 00             	movzbl (%eax),%eax
    13cf:	3c 2f                	cmp    $0x2f,%al
    13d1:	7e 0a                	jle    13dd <atoi+0x47>
    13d3:	8b 45 08             	mov    0x8(%ebp),%eax
    13d6:	0f b6 00             	movzbl (%eax),%eax
    13d9:	3c 39                	cmp    $0x39,%al
    13db:	7e c8                	jle    13a5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    13dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13e0:	c9                   	leave  
    13e1:	c3                   	ret    

000013e2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    13e2:	55                   	push   %ebp
    13e3:	89 e5                	mov    %esp,%ebp
    13e5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    13e8:	8b 45 08             	mov    0x8(%ebp),%eax
    13eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    13ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    13f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    13f4:	eb 13                	jmp    1409 <memmove+0x27>
    *dst++ = *src++;
    13f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13f9:	0f b6 10             	movzbl (%eax),%edx
    13fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13ff:	88 10                	mov    %dl,(%eax)
    1401:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1405:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1409:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    140d:	0f 9f c0             	setg   %al
    1410:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1414:	84 c0                	test   %al,%al
    1416:	75 de                	jne    13f6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1418:	8b 45 08             	mov    0x8(%ebp),%eax
}
    141b:	c9                   	leave  
    141c:	c3                   	ret    
    141d:	90                   	nop
    141e:	90                   	nop
    141f:	90                   	nop

00001420 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1420:	b8 01 00 00 00       	mov    $0x1,%eax
    1425:	cd 40                	int    $0x40
    1427:	c3                   	ret    

00001428 <exit>:
SYSCALL(exit)
    1428:	b8 02 00 00 00       	mov    $0x2,%eax
    142d:	cd 40                	int    $0x40
    142f:	c3                   	ret    

00001430 <wait>:
SYSCALL(wait)
    1430:	b8 03 00 00 00       	mov    $0x3,%eax
    1435:	cd 40                	int    $0x40
    1437:	c3                   	ret    

00001438 <pipe>:
SYSCALL(pipe)
    1438:	b8 04 00 00 00       	mov    $0x4,%eax
    143d:	cd 40                	int    $0x40
    143f:	c3                   	ret    

00001440 <read>:
SYSCALL(read)
    1440:	b8 05 00 00 00       	mov    $0x5,%eax
    1445:	cd 40                	int    $0x40
    1447:	c3                   	ret    

00001448 <write>:
SYSCALL(write)
    1448:	b8 10 00 00 00       	mov    $0x10,%eax
    144d:	cd 40                	int    $0x40
    144f:	c3                   	ret    

00001450 <close>:
SYSCALL(close)
    1450:	b8 15 00 00 00       	mov    $0x15,%eax
    1455:	cd 40                	int    $0x40
    1457:	c3                   	ret    

00001458 <kill>:
SYSCALL(kill)
    1458:	b8 06 00 00 00       	mov    $0x6,%eax
    145d:	cd 40                	int    $0x40
    145f:	c3                   	ret    

00001460 <exec>:
SYSCALL(exec)
    1460:	b8 07 00 00 00       	mov    $0x7,%eax
    1465:	cd 40                	int    $0x40
    1467:	c3                   	ret    

00001468 <open>:
SYSCALL(open)
    1468:	b8 0f 00 00 00       	mov    $0xf,%eax
    146d:	cd 40                	int    $0x40
    146f:	c3                   	ret    

00001470 <mknod>:
SYSCALL(mknod)
    1470:	b8 11 00 00 00       	mov    $0x11,%eax
    1475:	cd 40                	int    $0x40
    1477:	c3                   	ret    

00001478 <unlink>:
SYSCALL(unlink)
    1478:	b8 12 00 00 00       	mov    $0x12,%eax
    147d:	cd 40                	int    $0x40
    147f:	c3                   	ret    

00001480 <fstat>:
SYSCALL(fstat)
    1480:	b8 08 00 00 00       	mov    $0x8,%eax
    1485:	cd 40                	int    $0x40
    1487:	c3                   	ret    

00001488 <link>:
SYSCALL(link)
    1488:	b8 13 00 00 00       	mov    $0x13,%eax
    148d:	cd 40                	int    $0x40
    148f:	c3                   	ret    

00001490 <mkdir>:
SYSCALL(mkdir)
    1490:	b8 14 00 00 00       	mov    $0x14,%eax
    1495:	cd 40                	int    $0x40
    1497:	c3                   	ret    

00001498 <chdir>:
SYSCALL(chdir)
    1498:	b8 09 00 00 00       	mov    $0x9,%eax
    149d:	cd 40                	int    $0x40
    149f:	c3                   	ret    

000014a0 <dup>:
SYSCALL(dup)
    14a0:	b8 0a 00 00 00       	mov    $0xa,%eax
    14a5:	cd 40                	int    $0x40
    14a7:	c3                   	ret    

000014a8 <getpid>:
SYSCALL(getpid)
    14a8:	b8 0b 00 00 00       	mov    $0xb,%eax
    14ad:	cd 40                	int    $0x40
    14af:	c3                   	ret    

000014b0 <sbrk>:
SYSCALL(sbrk)
    14b0:	b8 0c 00 00 00       	mov    $0xc,%eax
    14b5:	cd 40                	int    $0x40
    14b7:	c3                   	ret    

000014b8 <sleep>:
SYSCALL(sleep)
    14b8:	b8 0d 00 00 00       	mov    $0xd,%eax
    14bd:	cd 40                	int    $0x40
    14bf:	c3                   	ret    

000014c0 <uptime>:
SYSCALL(uptime)
    14c0:	b8 0e 00 00 00       	mov    $0xe,%eax
    14c5:	cd 40                	int    $0x40
    14c7:	c3                   	ret    

000014c8 <clone>:
SYSCALL(clone)
    14c8:	b8 16 00 00 00       	mov    $0x16,%eax
    14cd:	cd 40                	int    $0x40
    14cf:	c3                   	ret    

000014d0 <texit>:
SYSCALL(texit)
    14d0:	b8 17 00 00 00       	mov    $0x17,%eax
    14d5:	cd 40                	int    $0x40
    14d7:	c3                   	ret    

000014d8 <tsleep>:
SYSCALL(tsleep)
    14d8:	b8 18 00 00 00       	mov    $0x18,%eax
    14dd:	cd 40                	int    $0x40
    14df:	c3                   	ret    

000014e0 <twakeup>:
SYSCALL(twakeup)
    14e0:	b8 19 00 00 00       	mov    $0x19,%eax
    14e5:	cd 40                	int    $0x40
    14e7:	c3                   	ret    

000014e8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    14e8:	55                   	push   %ebp
    14e9:	89 e5                	mov    %esp,%ebp
    14eb:	83 ec 28             	sub    $0x28,%esp
    14ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    14f1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    14f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14fb:	00 
    14fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
    14ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1503:	8b 45 08             	mov    0x8(%ebp),%eax
    1506:	89 04 24             	mov    %eax,(%esp)
    1509:	e8 3a ff ff ff       	call   1448 <write>
}
    150e:	c9                   	leave  
    150f:	c3                   	ret    

00001510 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1510:	55                   	push   %ebp
    1511:	89 e5                	mov    %esp,%ebp
    1513:	53                   	push   %ebx
    1514:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1517:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    151e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1522:	74 17                	je     153b <printint+0x2b>
    1524:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1528:	79 11                	jns    153b <printint+0x2b>
    neg = 1;
    152a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    1531:	8b 45 0c             	mov    0xc(%ebp),%eax
    1534:	f7 d8                	neg    %eax
    1536:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1539:	eb 06                	jmp    1541 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    153b:	8b 45 0c             	mov    0xc(%ebp),%eax
    153e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    1541:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1548:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    154b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    154e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1551:	ba 00 00 00 00       	mov    $0x0,%edx
    1556:	f7 f3                	div    %ebx
    1558:	89 d0                	mov    %edx,%eax
    155a:	0f b6 80 38 1c 00 00 	movzbl 0x1c38(%eax),%eax
    1561:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1565:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1569:	8b 45 10             	mov    0x10(%ebp),%eax
    156c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    156f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1572:	ba 00 00 00 00       	mov    $0x0,%edx
    1577:	f7 75 d4             	divl   -0x2c(%ebp)
    157a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    157d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1581:	75 c5                	jne    1548 <printint+0x38>
  if(neg)
    1583:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1587:	74 28                	je     15b1 <printint+0xa1>
    buf[i++] = '-';
    1589:	8b 45 ec             	mov    -0x14(%ebp),%eax
    158c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1591:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1595:	eb 1a                	jmp    15b1 <printint+0xa1>
    putc(fd, buf[i]);
    1597:	8b 45 ec             	mov    -0x14(%ebp),%eax
    159a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    159f:	0f be c0             	movsbl %al,%eax
    15a2:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a6:	8b 45 08             	mov    0x8(%ebp),%eax
    15a9:	89 04 24             	mov    %eax,(%esp)
    15ac:	e8 37 ff ff ff       	call   14e8 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    15b1:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    15b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    15b9:	79 dc                	jns    1597 <printint+0x87>
    putc(fd, buf[i]);
}
    15bb:	83 c4 44             	add    $0x44,%esp
    15be:	5b                   	pop    %ebx
    15bf:	5d                   	pop    %ebp
    15c0:	c3                   	ret    

000015c1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    15c1:	55                   	push   %ebp
    15c2:	89 e5                	mov    %esp,%ebp
    15c4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    15c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    15ce:	8d 45 0c             	lea    0xc(%ebp),%eax
    15d1:	83 c0 04             	add    $0x4,%eax
    15d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    15d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    15de:	e9 7e 01 00 00       	jmp    1761 <printf+0x1a0>
    c = fmt[i] & 0xff;
    15e3:	8b 55 0c             	mov    0xc(%ebp),%edx
    15e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15e9:	8d 04 02             	lea    (%edx,%eax,1),%eax
    15ec:	0f b6 00             	movzbl (%eax),%eax
    15ef:	0f be c0             	movsbl %al,%eax
    15f2:	25 ff 00 00 00       	and    $0xff,%eax
    15f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    15fa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    15fe:	75 2c                	jne    162c <printf+0x6b>
      if(c == '%'){
    1600:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1604:	75 0c                	jne    1612 <printf+0x51>
        state = '%';
    1606:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    160d:	e9 4b 01 00 00       	jmp    175d <printf+0x19c>
      } else {
        putc(fd, c);
    1612:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1615:	0f be c0             	movsbl %al,%eax
    1618:	89 44 24 04          	mov    %eax,0x4(%esp)
    161c:	8b 45 08             	mov    0x8(%ebp),%eax
    161f:	89 04 24             	mov    %eax,(%esp)
    1622:	e8 c1 fe ff ff       	call   14e8 <putc>
    1627:	e9 31 01 00 00       	jmp    175d <printf+0x19c>
      }
    } else if(state == '%'){
    162c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    1630:	0f 85 27 01 00 00    	jne    175d <printf+0x19c>
      if(c == 'd'){
    1636:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    163a:	75 2d                	jne    1669 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    163c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    163f:	8b 00                	mov    (%eax),%eax
    1641:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1648:	00 
    1649:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1650:	00 
    1651:	89 44 24 04          	mov    %eax,0x4(%esp)
    1655:	8b 45 08             	mov    0x8(%ebp),%eax
    1658:	89 04 24             	mov    %eax,(%esp)
    165b:	e8 b0 fe ff ff       	call   1510 <printint>
        ap++;
    1660:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1664:	e9 ed 00 00 00       	jmp    1756 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1669:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    166d:	74 06                	je     1675 <printf+0xb4>
    166f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1673:	75 2d                	jne    16a2 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1675:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1678:	8b 00                	mov    (%eax),%eax
    167a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1681:	00 
    1682:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1689:	00 
    168a:	89 44 24 04          	mov    %eax,0x4(%esp)
    168e:	8b 45 08             	mov    0x8(%ebp),%eax
    1691:	89 04 24             	mov    %eax,(%esp)
    1694:	e8 77 fe ff ff       	call   1510 <printint>
        ap++;
    1699:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    169d:	e9 b4 00 00 00       	jmp    1756 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    16a2:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    16a6:	75 46                	jne    16ee <printf+0x12d>
        s = (char*)*ap;
    16a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16ab:	8b 00                	mov    (%eax),%eax
    16ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    16b0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    16b4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    16b8:	75 27                	jne    16e1 <printf+0x120>
          s = "(null)";
    16ba:	c7 45 e4 05 1c 00 00 	movl   $0x1c05,-0x1c(%ebp)
        while(*s != 0){
    16c1:	eb 1f                	jmp    16e2 <printf+0x121>
          putc(fd, *s);
    16c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16c6:	0f b6 00             	movzbl (%eax),%eax
    16c9:	0f be c0             	movsbl %al,%eax
    16cc:	89 44 24 04          	mov    %eax,0x4(%esp)
    16d0:	8b 45 08             	mov    0x8(%ebp),%eax
    16d3:	89 04 24             	mov    %eax,(%esp)
    16d6:	e8 0d fe ff ff       	call   14e8 <putc>
          s++;
    16db:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    16df:	eb 01                	jmp    16e2 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    16e1:	90                   	nop
    16e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16e5:	0f b6 00             	movzbl (%eax),%eax
    16e8:	84 c0                	test   %al,%al
    16ea:	75 d7                	jne    16c3 <printf+0x102>
    16ec:	eb 68                	jmp    1756 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    16ee:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    16f2:	75 1d                	jne    1711 <printf+0x150>
        putc(fd, *ap);
    16f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16f7:	8b 00                	mov    (%eax),%eax
    16f9:	0f be c0             	movsbl %al,%eax
    16fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1700:	8b 45 08             	mov    0x8(%ebp),%eax
    1703:	89 04 24             	mov    %eax,(%esp)
    1706:	e8 dd fd ff ff       	call   14e8 <putc>
        ap++;
    170b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    170f:	eb 45                	jmp    1756 <printf+0x195>
      } else if(c == '%'){
    1711:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1715:	75 17                	jne    172e <printf+0x16d>
        putc(fd, c);
    1717:	8b 45 e8             	mov    -0x18(%ebp),%eax
    171a:	0f be c0             	movsbl %al,%eax
    171d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1721:	8b 45 08             	mov    0x8(%ebp),%eax
    1724:	89 04 24             	mov    %eax,(%esp)
    1727:	e8 bc fd ff ff       	call   14e8 <putc>
    172c:	eb 28                	jmp    1756 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    172e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1735:	00 
    1736:	8b 45 08             	mov    0x8(%ebp),%eax
    1739:	89 04 24             	mov    %eax,(%esp)
    173c:	e8 a7 fd ff ff       	call   14e8 <putc>
        putc(fd, c);
    1741:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1744:	0f be c0             	movsbl %al,%eax
    1747:	89 44 24 04          	mov    %eax,0x4(%esp)
    174b:	8b 45 08             	mov    0x8(%ebp),%eax
    174e:	89 04 24             	mov    %eax,(%esp)
    1751:	e8 92 fd ff ff       	call   14e8 <putc>
      }
      state = 0;
    1756:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    175d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1761:	8b 55 0c             	mov    0xc(%ebp),%edx
    1764:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1767:	8d 04 02             	lea    (%edx,%eax,1),%eax
    176a:	0f b6 00             	movzbl (%eax),%eax
    176d:	84 c0                	test   %al,%al
    176f:	0f 85 6e fe ff ff    	jne    15e3 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1775:	c9                   	leave  
    1776:	c3                   	ret    
    1777:	90                   	nop

00001778 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1778:	55                   	push   %ebp
    1779:	89 e5                	mov    %esp,%ebp
    177b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    177e:	8b 45 08             	mov    0x8(%ebp),%eax
    1781:	83 e8 08             	sub    $0x8,%eax
    1784:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1787:	a1 68 1c 00 00       	mov    0x1c68,%eax
    178c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    178f:	eb 24                	jmp    17b5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1791:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1794:	8b 00                	mov    (%eax),%eax
    1796:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1799:	77 12                	ja     17ad <free+0x35>
    179b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    179e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17a1:	77 24                	ja     17c7 <free+0x4f>
    17a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17a6:	8b 00                	mov    (%eax),%eax
    17a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17ab:	77 1a                	ja     17c7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    17ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17b0:	8b 00                	mov    (%eax),%eax
    17b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    17b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17b8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    17bb:	76 d4                	jbe    1791 <free+0x19>
    17bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17c0:	8b 00                	mov    (%eax),%eax
    17c2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    17c5:	76 ca                	jbe    1791 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    17c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17ca:	8b 40 04             	mov    0x4(%eax),%eax
    17cd:	c1 e0 03             	shl    $0x3,%eax
    17d0:	89 c2                	mov    %eax,%edx
    17d2:	03 55 f8             	add    -0x8(%ebp),%edx
    17d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17d8:	8b 00                	mov    (%eax),%eax
    17da:	39 c2                	cmp    %eax,%edx
    17dc:	75 24                	jne    1802 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    17de:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17e1:	8b 50 04             	mov    0x4(%eax),%edx
    17e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17e7:	8b 00                	mov    (%eax),%eax
    17e9:	8b 40 04             	mov    0x4(%eax),%eax
    17ec:	01 c2                	add    %eax,%edx
    17ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17f1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    17f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    17f7:	8b 00                	mov    (%eax),%eax
    17f9:	8b 10                	mov    (%eax),%edx
    17fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17fe:	89 10                	mov    %edx,(%eax)
    1800:	eb 0a                	jmp    180c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1802:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1805:	8b 10                	mov    (%eax),%edx
    1807:	8b 45 f8             	mov    -0x8(%ebp),%eax
    180a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    180c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    180f:	8b 40 04             	mov    0x4(%eax),%eax
    1812:	c1 e0 03             	shl    $0x3,%eax
    1815:	03 45 fc             	add    -0x4(%ebp),%eax
    1818:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    181b:	75 20                	jne    183d <free+0xc5>
    p->s.size += bp->s.size;
    181d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1820:	8b 50 04             	mov    0x4(%eax),%edx
    1823:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1826:	8b 40 04             	mov    0x4(%eax),%eax
    1829:	01 c2                	add    %eax,%edx
    182b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    182e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1831:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1834:	8b 10                	mov    (%eax),%edx
    1836:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1839:	89 10                	mov    %edx,(%eax)
    183b:	eb 08                	jmp    1845 <free+0xcd>
  } else
    p->s.ptr = bp;
    183d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1840:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1843:	89 10                	mov    %edx,(%eax)
  freep = p;
    1845:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1848:	a3 68 1c 00 00       	mov    %eax,0x1c68
}
    184d:	c9                   	leave  
    184e:	c3                   	ret    

0000184f <morecore>:

static Header*
morecore(uint nu)
{
    184f:	55                   	push   %ebp
    1850:	89 e5                	mov    %esp,%ebp
    1852:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1855:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    185c:	77 07                	ja     1865 <morecore+0x16>
    nu = 4096;
    185e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1865:	8b 45 08             	mov    0x8(%ebp),%eax
    1868:	c1 e0 03             	shl    $0x3,%eax
    186b:	89 04 24             	mov    %eax,(%esp)
    186e:	e8 3d fc ff ff       	call   14b0 <sbrk>
    1873:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1876:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    187a:	75 07                	jne    1883 <morecore+0x34>
    return 0;
    187c:	b8 00 00 00 00       	mov    $0x0,%eax
    1881:	eb 22                	jmp    18a5 <morecore+0x56>
  hp = (Header*)p;
    1883:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1886:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1889:	8b 45 f4             	mov    -0xc(%ebp),%eax
    188c:	8b 55 08             	mov    0x8(%ebp),%edx
    188f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1892:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1895:	83 c0 08             	add    $0x8,%eax
    1898:	89 04 24             	mov    %eax,(%esp)
    189b:	e8 d8 fe ff ff       	call   1778 <free>
  return freep;
    18a0:	a1 68 1c 00 00       	mov    0x1c68,%eax
}
    18a5:	c9                   	leave  
    18a6:	c3                   	ret    

000018a7 <malloc>:

void*
malloc(uint nbytes)
{
    18a7:	55                   	push   %ebp
    18a8:	89 e5                	mov    %esp,%ebp
    18aa:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    18ad:	8b 45 08             	mov    0x8(%ebp),%eax
    18b0:	83 c0 07             	add    $0x7,%eax
    18b3:	c1 e8 03             	shr    $0x3,%eax
    18b6:	83 c0 01             	add    $0x1,%eax
    18b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    18bc:	a1 68 1c 00 00       	mov    0x1c68,%eax
    18c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    18c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18c8:	75 23                	jne    18ed <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    18ca:	c7 45 f0 60 1c 00 00 	movl   $0x1c60,-0x10(%ebp)
    18d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18d4:	a3 68 1c 00 00       	mov    %eax,0x1c68
    18d9:	a1 68 1c 00 00       	mov    0x1c68,%eax
    18de:	a3 60 1c 00 00       	mov    %eax,0x1c60
    base.s.size = 0;
    18e3:	c7 05 64 1c 00 00 00 	movl   $0x0,0x1c64
    18ea:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18f0:	8b 00                	mov    (%eax),%eax
    18f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    18f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18f8:	8b 40 04             	mov    0x4(%eax),%eax
    18fb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    18fe:	72 4d                	jb     194d <malloc+0xa6>
      if(p->s.size == nunits)
    1900:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1903:	8b 40 04             	mov    0x4(%eax),%eax
    1906:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1909:	75 0c                	jne    1917 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    190b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    190e:	8b 10                	mov    (%eax),%edx
    1910:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1913:	89 10                	mov    %edx,(%eax)
    1915:	eb 26                	jmp    193d <malloc+0x96>
      else {
        p->s.size -= nunits;
    1917:	8b 45 ec             	mov    -0x14(%ebp),%eax
    191a:	8b 40 04             	mov    0x4(%eax),%eax
    191d:	89 c2                	mov    %eax,%edx
    191f:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1922:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1925:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1928:	8b 45 ec             	mov    -0x14(%ebp),%eax
    192b:	8b 40 04             	mov    0x4(%eax),%eax
    192e:	c1 e0 03             	shl    $0x3,%eax
    1931:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1934:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1937:	8b 55 f4             	mov    -0xc(%ebp),%edx
    193a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    193d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1940:	a3 68 1c 00 00       	mov    %eax,0x1c68
      return (void*)(p + 1);
    1945:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1948:	83 c0 08             	add    $0x8,%eax
    194b:	eb 38                	jmp    1985 <malloc+0xde>
    }
    if(p == freep)
    194d:	a1 68 1c 00 00       	mov    0x1c68,%eax
    1952:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1955:	75 1b                	jne    1972 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1957:	8b 45 f4             	mov    -0xc(%ebp),%eax
    195a:	89 04 24             	mov    %eax,(%esp)
    195d:	e8 ed fe ff ff       	call   184f <morecore>
    1962:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1965:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1969:	75 07                	jne    1972 <malloc+0xcb>
        return 0;
    196b:	b8 00 00 00 00       	mov    $0x0,%eax
    1970:	eb 13                	jmp    1985 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1972:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1975:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1978:	8b 45 ec             	mov    -0x14(%ebp),%eax
    197b:	8b 00                	mov    (%eax),%eax
    197d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1980:	e9 70 ff ff ff       	jmp    18f5 <malloc+0x4e>
}
    1985:	c9                   	leave  
    1986:	c3                   	ret    
    1987:	90                   	nop

00001988 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1988:	55                   	push   %ebp
    1989:	89 e5                	mov    %esp,%ebp
    198b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    198e:	8b 55 08             	mov    0x8(%ebp),%edx
    1991:	8b 45 0c             	mov    0xc(%ebp),%eax
    1994:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1997:	f0 87 02             	lock xchg %eax,(%edx)
    199a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    199d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    19a0:	c9                   	leave  
    19a1:	c3                   	ret    

000019a2 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    19a2:	55                   	push   %ebp
    19a3:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    19a5:	8b 45 08             	mov    0x8(%ebp),%eax
    19a8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    19ae:	5d                   	pop    %ebp
    19af:	c3                   	ret    

000019b0 <lock_acquire>:
void lock_acquire(lock_t *lock){
    19b0:	55                   	push   %ebp
    19b1:	89 e5                	mov    %esp,%ebp
    19b3:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    19b6:	8b 45 08             	mov    0x8(%ebp),%eax
    19b9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    19c0:	00 
    19c1:	89 04 24             	mov    %eax,(%esp)
    19c4:	e8 bf ff ff ff       	call   1988 <xchg>
    19c9:	85 c0                	test   %eax,%eax
    19cb:	75 e9                	jne    19b6 <lock_acquire+0x6>
}
    19cd:	c9                   	leave  
    19ce:	c3                   	ret    

000019cf <lock_release>:
void lock_release(lock_t *lock){
    19cf:	55                   	push   %ebp
    19d0:	89 e5                	mov    %esp,%ebp
    19d2:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    19d5:	8b 45 08             	mov    0x8(%ebp),%eax
    19d8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19df:	00 
    19e0:	89 04 24             	mov    %eax,(%esp)
    19e3:	e8 a0 ff ff ff       	call   1988 <xchg>
}
    19e8:	c9                   	leave  
    19e9:	c3                   	ret    

000019ea <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    19ea:	55                   	push   %ebp
    19eb:	89 e5                	mov    %esp,%ebp
    19ed:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    19f0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    19f7:	e8 ab fe ff ff       	call   18a7 <malloc>
    19fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    19ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a02:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1a05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a08:	25 ff 0f 00 00       	and    $0xfff,%eax
    1a0d:	85 c0                	test   %eax,%eax
    1a0f:	74 15                	je     1a26 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1a11:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a14:	89 c2                	mov    %eax,%edx
    1a16:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1a1c:	b8 00 10 00 00       	mov    $0x1000,%eax
    1a21:	29 d0                	sub    %edx,%eax
    1a23:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1a26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a2a:	75 1b                	jne    1a47 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1a2c:	c7 44 24 04 0c 1c 00 	movl   $0x1c0c,0x4(%esp)
    1a33:	00 
    1a34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a3b:	e8 81 fb ff ff       	call   15c1 <printf>
        return 0;
    1a40:	b8 00 00 00 00       	mov    $0x0,%eax
    1a45:	eb 6f                	jmp    1ab6 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1a47:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1a4a:	8b 55 08             	mov    0x8(%ebp),%edx
    1a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a50:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a54:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a58:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1a5f:	00 
    1a60:	89 04 24             	mov    %eax,(%esp)
    1a63:	e8 60 fa ff ff       	call   14c8 <clone>
    1a68:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1a6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a6f:	79 1b                	jns    1a8c <thread_create+0xa2>
        printf(1,"clone fails\n");
    1a71:	c7 44 24 04 1a 1c 00 	movl   $0x1c1a,0x4(%esp)
    1a78:	00 
    1a79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a80:	e8 3c fb ff ff       	call   15c1 <printf>
        return 0;
    1a85:	b8 00 00 00 00       	mov    $0x0,%eax
    1a8a:	eb 2a                	jmp    1ab6 <thread_create+0xcc>
    }
    if(tid > 0){
    1a8c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a90:	7e 05                	jle    1a97 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1a92:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a95:	eb 1f                	jmp    1ab6 <thread_create+0xcc>
    }
    if(tid == 0){
    1a97:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a9b:	75 14                	jne    1ab1 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1a9d:	c7 44 24 04 27 1c 00 	movl   $0x1c27,0x4(%esp)
    1aa4:	00 
    1aa5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1aac:	e8 10 fb ff ff       	call   15c1 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1ab1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1ab6:	c9                   	leave  
    1ab7:	c3                   	ret    

00001ab8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1ab8:	55                   	push   %ebp
    1ab9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1abb:	8b 45 08             	mov    0x8(%ebp),%eax
    1abe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1ac4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1ace:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1ad8:	5d                   	pop    %ebp
    1ad9:	c3                   	ret    

00001ada <add_q>:

void add_q(struct queue *q, int v){
    1ada:	55                   	push   %ebp
    1adb:	89 e5                	mov    %esp,%ebp
    1add:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1ae0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1ae7:	e8 bb fd ff ff       	call   18a7 <malloc>
    1aec:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1af2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1afc:	8b 55 0c             	mov    0xc(%ebp),%edx
    1aff:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1b01:	8b 45 08             	mov    0x8(%ebp),%eax
    1b04:	8b 40 04             	mov    0x4(%eax),%eax
    1b07:	85 c0                	test   %eax,%eax
    1b09:	75 0b                	jne    1b16 <add_q+0x3c>
        q->head = n;
    1b0b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b11:	89 50 04             	mov    %edx,0x4(%eax)
    1b14:	eb 0c                	jmp    1b22 <add_q+0x48>
    }else{
        q->tail->next = n;
    1b16:	8b 45 08             	mov    0x8(%ebp),%eax
    1b19:	8b 40 08             	mov    0x8(%eax),%eax
    1b1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b1f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1b22:	8b 45 08             	mov    0x8(%ebp),%eax
    1b25:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b28:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2e:	8b 00                	mov    (%eax),%eax
    1b30:	8d 50 01             	lea    0x1(%eax),%edx
    1b33:	8b 45 08             	mov    0x8(%ebp),%eax
    1b36:	89 10                	mov    %edx,(%eax)
}
    1b38:	c9                   	leave  
    1b39:	c3                   	ret    

00001b3a <empty_q>:

int empty_q(struct queue *q){
    1b3a:	55                   	push   %ebp
    1b3b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1b3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b40:	8b 00                	mov    (%eax),%eax
    1b42:	85 c0                	test   %eax,%eax
    1b44:	75 07                	jne    1b4d <empty_q+0x13>
        return 1;
    1b46:	b8 01 00 00 00       	mov    $0x1,%eax
    1b4b:	eb 05                	jmp    1b52 <empty_q+0x18>
    else
        return 0;
    1b4d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1b52:	5d                   	pop    %ebp
    1b53:	c3                   	ret    

00001b54 <pop_q>:
int pop_q(struct queue *q){
    1b54:	55                   	push   %ebp
    1b55:	89 e5                	mov    %esp,%ebp
    1b57:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1b5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b5d:	89 04 24             	mov    %eax,(%esp)
    1b60:	e8 d5 ff ff ff       	call   1b3a <empty_q>
    1b65:	85 c0                	test   %eax,%eax
    1b67:	75 5d                	jne    1bc6 <pop_q+0x72>
       val = q->head->value; 
    1b69:	8b 45 08             	mov    0x8(%ebp),%eax
    1b6c:	8b 40 04             	mov    0x4(%eax),%eax
    1b6f:	8b 00                	mov    (%eax),%eax
    1b71:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1b74:	8b 45 08             	mov    0x8(%ebp),%eax
    1b77:	8b 40 04             	mov    0x4(%eax),%eax
    1b7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1b7d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b80:	8b 40 04             	mov    0x4(%eax),%eax
    1b83:	8b 50 04             	mov    0x4(%eax),%edx
    1b86:	8b 45 08             	mov    0x8(%ebp),%eax
    1b89:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b8f:	89 04 24             	mov    %eax,(%esp)
    1b92:	e8 e1 fb ff ff       	call   1778 <free>
       q->size--;
    1b97:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9a:	8b 00                	mov    (%eax),%eax
    1b9c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1b9f:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba2:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ba4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ba7:	8b 00                	mov    (%eax),%eax
    1ba9:	85 c0                	test   %eax,%eax
    1bab:	75 14                	jne    1bc1 <pop_q+0x6d>
            q->head = 0;
    1bad:	8b 45 08             	mov    0x8(%ebp),%eax
    1bb0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bba:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1bc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bc4:	eb 05                	jmp    1bcb <pop_q+0x77>
    }
    return -1;
    1bc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1bcb:	c9                   	leave  
    1bcc:	c3                   	ret    
