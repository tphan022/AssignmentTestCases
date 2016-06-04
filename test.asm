
_test:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

int n = 1;

void test_func(void * arg_ptr);

int main(int argc, char *argv[]){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp

   printf(1,"thread_create test begin\n\n");
    1009:	c7 44 24 04 e9 1a 00 	movl   $0x1ae9,0x4(%esp)
    1010:	00 
    1011:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1018:	e8 c0 04 00 00       	call   14dd <printf>

   printf(1,"before thread_create n = %d\n",n);
    101d:	a1 90 1b 00 00       	mov    0x1b90,%eax
    1022:	89 44 24 08          	mov    %eax,0x8(%esp)
    1026:	c7 44 24 04 04 1b 00 	movl   $0x1b04,0x4(%esp)
    102d:	00 
    102e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1035:	e8 a3 04 00 00       	call   14dd <printf>

   int arg = 10;
    103a:	c7 44 24 18 0a 00 00 	movl   $0xa,0x18(%esp)
    1041:	00 
   void *tid = thread_create(test_func, (void *)&arg);
    1042:	8d 44 24 18          	lea    0x18(%esp),%eax
    1046:	89 44 24 04          	mov    %eax,0x4(%esp)
    104a:	c7 04 24 a8 10 00 00 	movl   $0x10a8,(%esp)
    1051:	e8 b0 08 00 00       	call   1906 <thread_create>
    1056:	89 44 24 1c          	mov    %eax,0x1c(%esp)
   if(tid <= 0){
    105a:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    105f:	75 38                	jne    1099 <main+0x99>
       printf(1,"wrong happen");
    1061:	c7 44 24 04 21 1b 00 	movl   $0x1b21,0x4(%esp)
    1068:	00 
    1069:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1070:	e8 68 04 00 00       	call   14dd <printf>
       exit();
    1075:	e8 ca 02 00 00       	call   1344 <exit>
   } 
   while(wait()>= 0)
   printf(1,"\nback to parent n = %d\n",n);
    107a:	a1 90 1b 00 00       	mov    0x1b90,%eax
    107f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1083:	c7 44 24 04 2e 1b 00 	movl   $0x1b2e,0x4(%esp)
    108a:	00 
    108b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1092:	e8 46 04 00 00       	call   14dd <printf>
    1097:	eb 01                	jmp    109a <main+0x9a>
   void *tid = thread_create(test_func, (void *)&arg);
   if(tid <= 0){
       printf(1,"wrong happen");
       exit();
   } 
   while(wait()>= 0)
    1099:	90                   	nop
    109a:	e8 ad 02 00 00       	call   134c <wait>
    109f:	85 c0                	test   %eax,%eax
    10a1:	79 d7                	jns    107a <main+0x7a>
   printf(1,"\nback to parent n = %d\n",n);
   
   exit();
    10a3:	e8 9c 02 00 00       	call   1344 <exit>

000010a8 <test_func>:
}

//void test_func(void *arg_ptr){
void test_func(void *arg_ptr){
    10a8:	55                   	push   %ebp
    10a9:	89 e5                	mov    %esp,%ebp
    10ab:	83 ec 28             	sub    $0x28,%esp
    int * num = (int *)arg_ptr;
    10ae:	8b 45 08             	mov    0x8(%ebp),%eax
    10b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n = *num; 
    10b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b7:	8b 00                	mov    (%eax),%eax
    10b9:	a3 90 1b 00 00       	mov    %eax,0x1b90
    printf(1,"\n n is updated as %d\n",*num);
    10be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c1:	8b 00                	mov    (%eax),%eax
    10c3:	89 44 24 08          	mov    %eax,0x8(%esp)
    10c7:	c7 44 24 04 46 1b 00 	movl   $0x1b46,0x4(%esp)
    10ce:	00 
    10cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10d6:	e8 02 04 00 00       	call   14dd <printf>
    texit();
    10db:	e8 0c 03 00 00       	call   13ec <texit>

000010e0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    10e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10e8:	8b 55 10             	mov    0x10(%ebp),%edx
    10eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ee:	89 cb                	mov    %ecx,%ebx
    10f0:	89 df                	mov    %ebx,%edi
    10f2:	89 d1                	mov    %edx,%ecx
    10f4:	fc                   	cld    
    10f5:	f3 aa                	rep stos %al,%es:(%edi)
    10f7:	89 ca                	mov    %ecx,%edx
    10f9:	89 fb                	mov    %edi,%ebx
    10fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
    10fe:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1101:	5b                   	pop    %ebx
    1102:	5f                   	pop    %edi
    1103:	5d                   	pop    %ebp
    1104:	c3                   	ret    

00001105 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1105:	55                   	push   %ebp
    1106:	89 e5                	mov    %esp,%ebp
    1108:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    110b:	8b 45 08             	mov    0x8(%ebp),%eax
    110e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1111:	8b 45 0c             	mov    0xc(%ebp),%eax
    1114:	0f b6 10             	movzbl (%eax),%edx
    1117:	8b 45 08             	mov    0x8(%ebp),%eax
    111a:	88 10                	mov    %dl,(%eax)
    111c:	8b 45 08             	mov    0x8(%ebp),%eax
    111f:	0f b6 00             	movzbl (%eax),%eax
    1122:	84 c0                	test   %al,%al
    1124:	0f 95 c0             	setne  %al
    1127:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    112b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    112f:	84 c0                	test   %al,%al
    1131:	75 de                	jne    1111 <strcpy+0xc>
    ;
  return os;
    1133:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1136:	c9                   	leave  
    1137:	c3                   	ret    

00001138 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1138:	55                   	push   %ebp
    1139:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    113b:	eb 08                	jmp    1145 <strcmp+0xd>
    p++, q++;
    113d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1141:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1145:	8b 45 08             	mov    0x8(%ebp),%eax
    1148:	0f b6 00             	movzbl (%eax),%eax
    114b:	84 c0                	test   %al,%al
    114d:	74 10                	je     115f <strcmp+0x27>
    114f:	8b 45 08             	mov    0x8(%ebp),%eax
    1152:	0f b6 10             	movzbl (%eax),%edx
    1155:	8b 45 0c             	mov    0xc(%ebp),%eax
    1158:	0f b6 00             	movzbl (%eax),%eax
    115b:	38 c2                	cmp    %al,%dl
    115d:	74 de                	je     113d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    115f:	8b 45 08             	mov    0x8(%ebp),%eax
    1162:	0f b6 00             	movzbl (%eax),%eax
    1165:	0f b6 d0             	movzbl %al,%edx
    1168:	8b 45 0c             	mov    0xc(%ebp),%eax
    116b:	0f b6 00             	movzbl (%eax),%eax
    116e:	0f b6 c0             	movzbl %al,%eax
    1171:	89 d1                	mov    %edx,%ecx
    1173:	29 c1                	sub    %eax,%ecx
    1175:	89 c8                	mov    %ecx,%eax
}
    1177:	5d                   	pop    %ebp
    1178:	c3                   	ret    

00001179 <strlen>:

uint
strlen(char *s)
{
    1179:	55                   	push   %ebp
    117a:	89 e5                	mov    %esp,%ebp
    117c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    117f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1186:	eb 04                	jmp    118c <strlen+0x13>
    1188:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    118c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    118f:	03 45 08             	add    0x8(%ebp),%eax
    1192:	0f b6 00             	movzbl (%eax),%eax
    1195:	84 c0                	test   %al,%al
    1197:	75 ef                	jne    1188 <strlen+0xf>
    ;
  return n;
    1199:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    119c:	c9                   	leave  
    119d:	c3                   	ret    

0000119e <memset>:

void*
memset(void *dst, int c, uint n)
{
    119e:	55                   	push   %ebp
    119f:	89 e5                	mov    %esp,%ebp
    11a1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    11a4:	8b 45 10             	mov    0x10(%ebp),%eax
    11a7:	89 44 24 08          	mov    %eax,0x8(%esp)
    11ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ae:	89 44 24 04          	mov    %eax,0x4(%esp)
    11b2:	8b 45 08             	mov    0x8(%ebp),%eax
    11b5:	89 04 24             	mov    %eax,(%esp)
    11b8:	e8 23 ff ff ff       	call   10e0 <stosb>
  return dst;
    11bd:	8b 45 08             	mov    0x8(%ebp),%eax
}
    11c0:	c9                   	leave  
    11c1:	c3                   	ret    

000011c2 <strchr>:

char*
strchr(const char *s, char c)
{
    11c2:	55                   	push   %ebp
    11c3:	89 e5                	mov    %esp,%ebp
    11c5:	83 ec 04             	sub    $0x4,%esp
    11c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    11ce:	eb 14                	jmp    11e4 <strchr+0x22>
    if(*s == c)
    11d0:	8b 45 08             	mov    0x8(%ebp),%eax
    11d3:	0f b6 00             	movzbl (%eax),%eax
    11d6:	3a 45 fc             	cmp    -0x4(%ebp),%al
    11d9:	75 05                	jne    11e0 <strchr+0x1e>
      return (char*)s;
    11db:	8b 45 08             	mov    0x8(%ebp),%eax
    11de:	eb 13                	jmp    11f3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    11e0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    11e4:	8b 45 08             	mov    0x8(%ebp),%eax
    11e7:	0f b6 00             	movzbl (%eax),%eax
    11ea:	84 c0                	test   %al,%al
    11ec:	75 e2                	jne    11d0 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    11ee:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11f3:	c9                   	leave  
    11f4:	c3                   	ret    

000011f5 <gets>:

char*
gets(char *buf, int max)
{
    11f5:	55                   	push   %ebp
    11f6:	89 e5                	mov    %esp,%ebp
    11f8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    11fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1202:	eb 44                	jmp    1248 <gets+0x53>
    cc = read(0, &c, 1);
    1204:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    120b:	00 
    120c:	8d 45 ef             	lea    -0x11(%ebp),%eax
    120f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1213:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    121a:	e8 3d 01 00 00       	call   135c <read>
    121f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1222:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1226:	7e 2d                	jle    1255 <gets+0x60>
      break;
    buf[i++] = c;
    1228:	8b 45 f0             	mov    -0x10(%ebp),%eax
    122b:	03 45 08             	add    0x8(%ebp),%eax
    122e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1232:	88 10                	mov    %dl,(%eax)
    1234:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1238:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    123c:	3c 0a                	cmp    $0xa,%al
    123e:	74 16                	je     1256 <gets+0x61>
    1240:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1244:	3c 0d                	cmp    $0xd,%al
    1246:	74 0e                	je     1256 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1248:	8b 45 f0             	mov    -0x10(%ebp),%eax
    124b:	83 c0 01             	add    $0x1,%eax
    124e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1251:	7c b1                	jl     1204 <gets+0xf>
    1253:	eb 01                	jmp    1256 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1255:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1256:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1259:	03 45 08             	add    0x8(%ebp),%eax
    125c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    125f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1262:	c9                   	leave  
    1263:	c3                   	ret    

00001264 <stat>:

int
stat(char *n, struct stat *st)
{
    1264:	55                   	push   %ebp
    1265:	89 e5                	mov    %esp,%ebp
    1267:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    126a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1271:	00 
    1272:	8b 45 08             	mov    0x8(%ebp),%eax
    1275:	89 04 24             	mov    %eax,(%esp)
    1278:	e8 07 01 00 00       	call   1384 <open>
    127d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1284:	79 07                	jns    128d <stat+0x29>
    return -1;
    1286:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    128b:	eb 23                	jmp    12b0 <stat+0x4c>
  r = fstat(fd, st);
    128d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1290:	89 44 24 04          	mov    %eax,0x4(%esp)
    1294:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1297:	89 04 24             	mov    %eax,(%esp)
    129a:	e8 fd 00 00 00       	call   139c <fstat>
    129f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    12a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12a5:	89 04 24             	mov    %eax,(%esp)
    12a8:	e8 bf 00 00 00       	call   136c <close>
  return r;
    12ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    12b0:	c9                   	leave  
    12b1:	c3                   	ret    

000012b2 <atoi>:

int
atoi(const char *s)
{
    12b2:	55                   	push   %ebp
    12b3:	89 e5                	mov    %esp,%ebp
    12b5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    12b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    12bf:	eb 24                	jmp    12e5 <atoi+0x33>
    n = n*10 + *s++ - '0';
    12c1:	8b 55 fc             	mov    -0x4(%ebp),%edx
    12c4:	89 d0                	mov    %edx,%eax
    12c6:	c1 e0 02             	shl    $0x2,%eax
    12c9:	01 d0                	add    %edx,%eax
    12cb:	01 c0                	add    %eax,%eax
    12cd:	89 c2                	mov    %eax,%edx
    12cf:	8b 45 08             	mov    0x8(%ebp),%eax
    12d2:	0f b6 00             	movzbl (%eax),%eax
    12d5:	0f be c0             	movsbl %al,%eax
    12d8:	8d 04 02             	lea    (%edx,%eax,1),%eax
    12db:	83 e8 30             	sub    $0x30,%eax
    12de:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12e5:	8b 45 08             	mov    0x8(%ebp),%eax
    12e8:	0f b6 00             	movzbl (%eax),%eax
    12eb:	3c 2f                	cmp    $0x2f,%al
    12ed:	7e 0a                	jle    12f9 <atoi+0x47>
    12ef:	8b 45 08             	mov    0x8(%ebp),%eax
    12f2:	0f b6 00             	movzbl (%eax),%eax
    12f5:	3c 39                	cmp    $0x39,%al
    12f7:	7e c8                	jle    12c1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    12f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12fc:	c9                   	leave  
    12fd:	c3                   	ret    

000012fe <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12fe:	55                   	push   %ebp
    12ff:	89 e5                	mov    %esp,%ebp
    1301:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1304:	8b 45 08             	mov    0x8(%ebp),%eax
    1307:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    130a:	8b 45 0c             	mov    0xc(%ebp),%eax
    130d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1310:	eb 13                	jmp    1325 <memmove+0x27>
    *dst++ = *src++;
    1312:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1315:	0f b6 10             	movzbl (%eax),%edx
    1318:	8b 45 f8             	mov    -0x8(%ebp),%eax
    131b:	88 10                	mov    %dl,(%eax)
    131d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1321:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1325:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1329:	0f 9f c0             	setg   %al
    132c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1330:	84 c0                	test   %al,%al
    1332:	75 de                	jne    1312 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1334:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1337:	c9                   	leave  
    1338:	c3                   	ret    
    1339:	90                   	nop
    133a:	90                   	nop
    133b:	90                   	nop

0000133c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    133c:	b8 01 00 00 00       	mov    $0x1,%eax
    1341:	cd 40                	int    $0x40
    1343:	c3                   	ret    

00001344 <exit>:
SYSCALL(exit)
    1344:	b8 02 00 00 00       	mov    $0x2,%eax
    1349:	cd 40                	int    $0x40
    134b:	c3                   	ret    

0000134c <wait>:
SYSCALL(wait)
    134c:	b8 03 00 00 00       	mov    $0x3,%eax
    1351:	cd 40                	int    $0x40
    1353:	c3                   	ret    

00001354 <pipe>:
SYSCALL(pipe)
    1354:	b8 04 00 00 00       	mov    $0x4,%eax
    1359:	cd 40                	int    $0x40
    135b:	c3                   	ret    

0000135c <read>:
SYSCALL(read)
    135c:	b8 05 00 00 00       	mov    $0x5,%eax
    1361:	cd 40                	int    $0x40
    1363:	c3                   	ret    

00001364 <write>:
SYSCALL(write)
    1364:	b8 10 00 00 00       	mov    $0x10,%eax
    1369:	cd 40                	int    $0x40
    136b:	c3                   	ret    

0000136c <close>:
SYSCALL(close)
    136c:	b8 15 00 00 00       	mov    $0x15,%eax
    1371:	cd 40                	int    $0x40
    1373:	c3                   	ret    

00001374 <kill>:
SYSCALL(kill)
    1374:	b8 06 00 00 00       	mov    $0x6,%eax
    1379:	cd 40                	int    $0x40
    137b:	c3                   	ret    

0000137c <exec>:
SYSCALL(exec)
    137c:	b8 07 00 00 00       	mov    $0x7,%eax
    1381:	cd 40                	int    $0x40
    1383:	c3                   	ret    

00001384 <open>:
SYSCALL(open)
    1384:	b8 0f 00 00 00       	mov    $0xf,%eax
    1389:	cd 40                	int    $0x40
    138b:	c3                   	ret    

0000138c <mknod>:
SYSCALL(mknod)
    138c:	b8 11 00 00 00       	mov    $0x11,%eax
    1391:	cd 40                	int    $0x40
    1393:	c3                   	ret    

00001394 <unlink>:
SYSCALL(unlink)
    1394:	b8 12 00 00 00       	mov    $0x12,%eax
    1399:	cd 40                	int    $0x40
    139b:	c3                   	ret    

0000139c <fstat>:
SYSCALL(fstat)
    139c:	b8 08 00 00 00       	mov    $0x8,%eax
    13a1:	cd 40                	int    $0x40
    13a3:	c3                   	ret    

000013a4 <link>:
SYSCALL(link)
    13a4:	b8 13 00 00 00       	mov    $0x13,%eax
    13a9:	cd 40                	int    $0x40
    13ab:	c3                   	ret    

000013ac <mkdir>:
SYSCALL(mkdir)
    13ac:	b8 14 00 00 00       	mov    $0x14,%eax
    13b1:	cd 40                	int    $0x40
    13b3:	c3                   	ret    

000013b4 <chdir>:
SYSCALL(chdir)
    13b4:	b8 09 00 00 00       	mov    $0x9,%eax
    13b9:	cd 40                	int    $0x40
    13bb:	c3                   	ret    

000013bc <dup>:
SYSCALL(dup)
    13bc:	b8 0a 00 00 00       	mov    $0xa,%eax
    13c1:	cd 40                	int    $0x40
    13c3:	c3                   	ret    

000013c4 <getpid>:
SYSCALL(getpid)
    13c4:	b8 0b 00 00 00       	mov    $0xb,%eax
    13c9:	cd 40                	int    $0x40
    13cb:	c3                   	ret    

000013cc <sbrk>:
SYSCALL(sbrk)
    13cc:	b8 0c 00 00 00       	mov    $0xc,%eax
    13d1:	cd 40                	int    $0x40
    13d3:	c3                   	ret    

000013d4 <sleep>:
SYSCALL(sleep)
    13d4:	b8 0d 00 00 00       	mov    $0xd,%eax
    13d9:	cd 40                	int    $0x40
    13db:	c3                   	ret    

000013dc <uptime>:
SYSCALL(uptime)
    13dc:	b8 0e 00 00 00       	mov    $0xe,%eax
    13e1:	cd 40                	int    $0x40
    13e3:	c3                   	ret    

000013e4 <clone>:
SYSCALL(clone)
    13e4:	b8 16 00 00 00       	mov    $0x16,%eax
    13e9:	cd 40                	int    $0x40
    13eb:	c3                   	ret    

000013ec <texit>:
SYSCALL(texit)
    13ec:	b8 17 00 00 00       	mov    $0x17,%eax
    13f1:	cd 40                	int    $0x40
    13f3:	c3                   	ret    

000013f4 <tsleep>:
SYSCALL(tsleep)
    13f4:	b8 18 00 00 00       	mov    $0x18,%eax
    13f9:	cd 40                	int    $0x40
    13fb:	c3                   	ret    

000013fc <twakeup>:
SYSCALL(twakeup)
    13fc:	b8 19 00 00 00       	mov    $0x19,%eax
    1401:	cd 40                	int    $0x40
    1403:	c3                   	ret    

00001404 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1404:	55                   	push   %ebp
    1405:	89 e5                	mov    %esp,%ebp
    1407:	83 ec 28             	sub    $0x28,%esp
    140a:	8b 45 0c             	mov    0xc(%ebp),%eax
    140d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1410:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1417:	00 
    1418:	8d 45 f4             	lea    -0xc(%ebp),%eax
    141b:	89 44 24 04          	mov    %eax,0x4(%esp)
    141f:	8b 45 08             	mov    0x8(%ebp),%eax
    1422:	89 04 24             	mov    %eax,(%esp)
    1425:	e8 3a ff ff ff       	call   1364 <write>
}
    142a:	c9                   	leave  
    142b:	c3                   	ret    

0000142c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    142c:	55                   	push   %ebp
    142d:	89 e5                	mov    %esp,%ebp
    142f:	53                   	push   %ebx
    1430:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1433:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    143a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    143e:	74 17                	je     1457 <printint+0x2b>
    1440:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1444:	79 11                	jns    1457 <printint+0x2b>
    neg = 1;
    1446:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    144d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1450:	f7 d8                	neg    %eax
    1452:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1455:	eb 06                	jmp    145d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1457:	8b 45 0c             	mov    0xc(%ebp),%eax
    145a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    145d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1464:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1467:	8b 5d 10             	mov    0x10(%ebp),%ebx
    146a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    146d:	ba 00 00 00 00       	mov    $0x0,%edx
    1472:	f7 f3                	div    %ebx
    1474:	89 d0                	mov    %edx,%eax
    1476:	0f b6 80 94 1b 00 00 	movzbl 0x1b94(%eax),%eax
    147d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1481:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1485:	8b 45 10             	mov    0x10(%ebp),%eax
    1488:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    148b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    148e:	ba 00 00 00 00       	mov    $0x0,%edx
    1493:	f7 75 d4             	divl   -0x2c(%ebp)
    1496:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1499:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    149d:	75 c5                	jne    1464 <printint+0x38>
  if(neg)
    149f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14a3:	74 28                	je     14cd <printint+0xa1>
    buf[i++] = '-';
    14a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    14ad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    14b1:	eb 1a                	jmp    14cd <printint+0xa1>
    putc(fd, buf[i]);
    14b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14b6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    14bb:	0f be c0             	movsbl %al,%eax
    14be:	89 44 24 04          	mov    %eax,0x4(%esp)
    14c2:	8b 45 08             	mov    0x8(%ebp),%eax
    14c5:	89 04 24             	mov    %eax,(%esp)
    14c8:	e8 37 ff ff ff       	call   1404 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    14cd:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    14d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    14d5:	79 dc                	jns    14b3 <printint+0x87>
    putc(fd, buf[i]);
}
    14d7:	83 c4 44             	add    $0x44,%esp
    14da:	5b                   	pop    %ebx
    14db:	5d                   	pop    %ebp
    14dc:	c3                   	ret    

000014dd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14dd:	55                   	push   %ebp
    14de:	89 e5                	mov    %esp,%ebp
    14e0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    14ea:	8d 45 0c             	lea    0xc(%ebp),%eax
    14ed:	83 c0 04             	add    $0x4,%eax
    14f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    14f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    14fa:	e9 7e 01 00 00       	jmp    167d <printf+0x1a0>
    c = fmt[i] & 0xff;
    14ff:	8b 55 0c             	mov    0xc(%ebp),%edx
    1502:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1505:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1508:	0f b6 00             	movzbl (%eax),%eax
    150b:	0f be c0             	movsbl %al,%eax
    150e:	25 ff 00 00 00       	and    $0xff,%eax
    1513:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    1516:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    151a:	75 2c                	jne    1548 <printf+0x6b>
      if(c == '%'){
    151c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1520:	75 0c                	jne    152e <printf+0x51>
        state = '%';
    1522:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1529:	e9 4b 01 00 00       	jmp    1679 <printf+0x19c>
      } else {
        putc(fd, c);
    152e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1531:	0f be c0             	movsbl %al,%eax
    1534:	89 44 24 04          	mov    %eax,0x4(%esp)
    1538:	8b 45 08             	mov    0x8(%ebp),%eax
    153b:	89 04 24             	mov    %eax,(%esp)
    153e:	e8 c1 fe ff ff       	call   1404 <putc>
    1543:	e9 31 01 00 00       	jmp    1679 <printf+0x19c>
      }
    } else if(state == '%'){
    1548:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    154c:	0f 85 27 01 00 00    	jne    1679 <printf+0x19c>
      if(c == 'd'){
    1552:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    1556:	75 2d                	jne    1585 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1558:	8b 45 f4             	mov    -0xc(%ebp),%eax
    155b:	8b 00                	mov    (%eax),%eax
    155d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1564:	00 
    1565:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    156c:	00 
    156d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1571:	8b 45 08             	mov    0x8(%ebp),%eax
    1574:	89 04 24             	mov    %eax,(%esp)
    1577:	e8 b0 fe ff ff       	call   142c <printint>
        ap++;
    157c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1580:	e9 ed 00 00 00       	jmp    1672 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1585:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1589:	74 06                	je     1591 <printf+0xb4>
    158b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    158f:	75 2d                	jne    15be <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1591:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1594:	8b 00                	mov    (%eax),%eax
    1596:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    159d:	00 
    159e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    15a5:	00 
    15a6:	89 44 24 04          	mov    %eax,0x4(%esp)
    15aa:	8b 45 08             	mov    0x8(%ebp),%eax
    15ad:	89 04 24             	mov    %eax,(%esp)
    15b0:	e8 77 fe ff ff       	call   142c <printint>
        ap++;
    15b5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    15b9:	e9 b4 00 00 00       	jmp    1672 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15be:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    15c2:	75 46                	jne    160a <printf+0x12d>
        s = (char*)*ap;
    15c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c7:	8b 00                	mov    (%eax),%eax
    15c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    15cc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    15d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    15d4:	75 27                	jne    15fd <printf+0x120>
          s = "(null)";
    15d6:	c7 45 e4 5c 1b 00 00 	movl   $0x1b5c,-0x1c(%ebp)
        while(*s != 0){
    15dd:	eb 1f                	jmp    15fe <printf+0x121>
          putc(fd, *s);
    15df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    15e2:	0f b6 00             	movzbl (%eax),%eax
    15e5:	0f be c0             	movsbl %al,%eax
    15e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    15ec:	8b 45 08             	mov    0x8(%ebp),%eax
    15ef:	89 04 24             	mov    %eax,(%esp)
    15f2:	e8 0d fe ff ff       	call   1404 <putc>
          s++;
    15f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    15fb:	eb 01                	jmp    15fe <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    15fd:	90                   	nop
    15fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1601:	0f b6 00             	movzbl (%eax),%eax
    1604:	84 c0                	test   %al,%al
    1606:	75 d7                	jne    15df <printf+0x102>
    1608:	eb 68                	jmp    1672 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    160a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    160e:	75 1d                	jne    162d <printf+0x150>
        putc(fd, *ap);
    1610:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1613:	8b 00                	mov    (%eax),%eax
    1615:	0f be c0             	movsbl %al,%eax
    1618:	89 44 24 04          	mov    %eax,0x4(%esp)
    161c:	8b 45 08             	mov    0x8(%ebp),%eax
    161f:	89 04 24             	mov    %eax,(%esp)
    1622:	e8 dd fd ff ff       	call   1404 <putc>
        ap++;
    1627:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    162b:	eb 45                	jmp    1672 <printf+0x195>
      } else if(c == '%'){
    162d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1631:	75 17                	jne    164a <printf+0x16d>
        putc(fd, c);
    1633:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1636:	0f be c0             	movsbl %al,%eax
    1639:	89 44 24 04          	mov    %eax,0x4(%esp)
    163d:	8b 45 08             	mov    0x8(%ebp),%eax
    1640:	89 04 24             	mov    %eax,(%esp)
    1643:	e8 bc fd ff ff       	call   1404 <putc>
    1648:	eb 28                	jmp    1672 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    164a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1651:	00 
    1652:	8b 45 08             	mov    0x8(%ebp),%eax
    1655:	89 04 24             	mov    %eax,(%esp)
    1658:	e8 a7 fd ff ff       	call   1404 <putc>
        putc(fd, c);
    165d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1660:	0f be c0             	movsbl %al,%eax
    1663:	89 44 24 04          	mov    %eax,0x4(%esp)
    1667:	8b 45 08             	mov    0x8(%ebp),%eax
    166a:	89 04 24             	mov    %eax,(%esp)
    166d:	e8 92 fd ff ff       	call   1404 <putc>
      }
      state = 0;
    1672:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1679:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    167d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1680:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1683:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1686:	0f b6 00             	movzbl (%eax),%eax
    1689:	84 c0                	test   %al,%al
    168b:	0f 85 6e fe ff ff    	jne    14ff <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1691:	c9                   	leave  
    1692:	c3                   	ret    
    1693:	90                   	nop

00001694 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1694:	55                   	push   %ebp
    1695:	89 e5                	mov    %esp,%ebp
    1697:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    169a:	8b 45 08             	mov    0x8(%ebp),%eax
    169d:	83 e8 08             	sub    $0x8,%eax
    16a0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a3:	a1 b0 1b 00 00       	mov    0x1bb0,%eax
    16a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16ab:	eb 24                	jmp    16d1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16b0:	8b 00                	mov    (%eax),%eax
    16b2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16b5:	77 12                	ja     16c9 <free+0x35>
    16b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16bd:	77 24                	ja     16e3 <free+0x4f>
    16bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16c2:	8b 00                	mov    (%eax),%eax
    16c4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16c7:	77 1a                	ja     16e3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16cc:	8b 00                	mov    (%eax),%eax
    16ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
    16d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16d4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    16d7:	76 d4                	jbe    16ad <free+0x19>
    16d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16dc:	8b 00                	mov    (%eax),%eax
    16de:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    16e1:	76 ca                	jbe    16ad <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    16e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16e6:	8b 40 04             	mov    0x4(%eax),%eax
    16e9:	c1 e0 03             	shl    $0x3,%eax
    16ec:	89 c2                	mov    %eax,%edx
    16ee:	03 55 f8             	add    -0x8(%ebp),%edx
    16f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    16f4:	8b 00                	mov    (%eax),%eax
    16f6:	39 c2                	cmp    %eax,%edx
    16f8:	75 24                	jne    171e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    16fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16fd:	8b 50 04             	mov    0x4(%eax),%edx
    1700:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1703:	8b 00                	mov    (%eax),%eax
    1705:	8b 40 04             	mov    0x4(%eax),%eax
    1708:	01 c2                	add    %eax,%edx
    170a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    170d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1710:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1713:	8b 00                	mov    (%eax),%eax
    1715:	8b 10                	mov    (%eax),%edx
    1717:	8b 45 f8             	mov    -0x8(%ebp),%eax
    171a:	89 10                	mov    %edx,(%eax)
    171c:	eb 0a                	jmp    1728 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    171e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1721:	8b 10                	mov    (%eax),%edx
    1723:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1726:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1728:	8b 45 fc             	mov    -0x4(%ebp),%eax
    172b:	8b 40 04             	mov    0x4(%eax),%eax
    172e:	c1 e0 03             	shl    $0x3,%eax
    1731:	03 45 fc             	add    -0x4(%ebp),%eax
    1734:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1737:	75 20                	jne    1759 <free+0xc5>
    p->s.size += bp->s.size;
    1739:	8b 45 fc             	mov    -0x4(%ebp),%eax
    173c:	8b 50 04             	mov    0x4(%eax),%edx
    173f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1742:	8b 40 04             	mov    0x4(%eax),%eax
    1745:	01 c2                	add    %eax,%edx
    1747:	8b 45 fc             	mov    -0x4(%ebp),%eax
    174a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    174d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1750:	8b 10                	mov    (%eax),%edx
    1752:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1755:	89 10                	mov    %edx,(%eax)
    1757:	eb 08                	jmp    1761 <free+0xcd>
  } else
    p->s.ptr = bp;
    1759:	8b 45 fc             	mov    -0x4(%ebp),%eax
    175c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    175f:	89 10                	mov    %edx,(%eax)
  freep = p;
    1761:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1764:	a3 b0 1b 00 00       	mov    %eax,0x1bb0
}
    1769:	c9                   	leave  
    176a:	c3                   	ret    

0000176b <morecore>:

static Header*
morecore(uint nu)
{
    176b:	55                   	push   %ebp
    176c:	89 e5                	mov    %esp,%ebp
    176e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1771:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1778:	77 07                	ja     1781 <morecore+0x16>
    nu = 4096;
    177a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1781:	8b 45 08             	mov    0x8(%ebp),%eax
    1784:	c1 e0 03             	shl    $0x3,%eax
    1787:	89 04 24             	mov    %eax,(%esp)
    178a:	e8 3d fc ff ff       	call   13cc <sbrk>
    178f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1792:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1796:	75 07                	jne    179f <morecore+0x34>
    return 0;
    1798:	b8 00 00 00 00       	mov    $0x0,%eax
    179d:	eb 22                	jmp    17c1 <morecore+0x56>
  hp = (Header*)p;
    179f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    17a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17a8:	8b 55 08             	mov    0x8(%ebp),%edx
    17ab:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    17ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17b1:	83 c0 08             	add    $0x8,%eax
    17b4:	89 04 24             	mov    %eax,(%esp)
    17b7:	e8 d8 fe ff ff       	call   1694 <free>
  return freep;
    17bc:	a1 b0 1b 00 00       	mov    0x1bb0,%eax
}
    17c1:	c9                   	leave  
    17c2:	c3                   	ret    

000017c3 <malloc>:

void*
malloc(uint nbytes)
{
    17c3:	55                   	push   %ebp
    17c4:	89 e5                	mov    %esp,%ebp
    17c6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17c9:	8b 45 08             	mov    0x8(%ebp),%eax
    17cc:	83 c0 07             	add    $0x7,%eax
    17cf:	c1 e8 03             	shr    $0x3,%eax
    17d2:	83 c0 01             	add    $0x1,%eax
    17d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    17d8:	a1 b0 1b 00 00       	mov    0x1bb0,%eax
    17dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    17e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    17e4:	75 23                	jne    1809 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    17e6:	c7 45 f0 a8 1b 00 00 	movl   $0x1ba8,-0x10(%ebp)
    17ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f0:	a3 b0 1b 00 00       	mov    %eax,0x1bb0
    17f5:	a1 b0 1b 00 00       	mov    0x1bb0,%eax
    17fa:	a3 a8 1b 00 00       	mov    %eax,0x1ba8
    base.s.size = 0;
    17ff:	c7 05 ac 1b 00 00 00 	movl   $0x0,0x1bac
    1806:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1809:	8b 45 f0             	mov    -0x10(%ebp),%eax
    180c:	8b 00                	mov    (%eax),%eax
    180e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1811:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1814:	8b 40 04             	mov    0x4(%eax),%eax
    1817:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    181a:	72 4d                	jb     1869 <malloc+0xa6>
      if(p->s.size == nunits)
    181c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    181f:	8b 40 04             	mov    0x4(%eax),%eax
    1822:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1825:	75 0c                	jne    1833 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1827:	8b 45 ec             	mov    -0x14(%ebp),%eax
    182a:	8b 10                	mov    (%eax),%edx
    182c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    182f:	89 10                	mov    %edx,(%eax)
    1831:	eb 26                	jmp    1859 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1833:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1836:	8b 40 04             	mov    0x4(%eax),%eax
    1839:	89 c2                	mov    %eax,%edx
    183b:	2b 55 f4             	sub    -0xc(%ebp),%edx
    183e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1841:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1844:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1847:	8b 40 04             	mov    0x4(%eax),%eax
    184a:	c1 e0 03             	shl    $0x3,%eax
    184d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1850:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1853:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1856:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1859:	8b 45 f0             	mov    -0x10(%ebp),%eax
    185c:	a3 b0 1b 00 00       	mov    %eax,0x1bb0
      return (void*)(p + 1);
    1861:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1864:	83 c0 08             	add    $0x8,%eax
    1867:	eb 38                	jmp    18a1 <malloc+0xde>
    }
    if(p == freep)
    1869:	a1 b0 1b 00 00       	mov    0x1bb0,%eax
    186e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1871:	75 1b                	jne    188e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1873:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1876:	89 04 24             	mov    %eax,(%esp)
    1879:	e8 ed fe ff ff       	call   176b <morecore>
    187e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1881:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1885:	75 07                	jne    188e <malloc+0xcb>
        return 0;
    1887:	b8 00 00 00 00       	mov    $0x0,%eax
    188c:	eb 13                	jmp    18a1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    188e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1891:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1894:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1897:	8b 00                	mov    (%eax),%eax
    1899:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    189c:	e9 70 ff ff ff       	jmp    1811 <malloc+0x4e>
}
    18a1:	c9                   	leave  
    18a2:	c3                   	ret    
    18a3:	90                   	nop

000018a4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    18a4:	55                   	push   %ebp
    18a5:	89 e5                	mov    %esp,%ebp
    18a7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18aa:	8b 55 08             	mov    0x8(%ebp),%edx
    18ad:	8b 45 0c             	mov    0xc(%ebp),%eax
    18b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    18b3:	f0 87 02             	lock xchg %eax,(%edx)
    18b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    18b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    18bc:	c9                   	leave  
    18bd:	c3                   	ret    

000018be <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    18be:	55                   	push   %ebp
    18bf:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    18c1:	8b 45 08             	mov    0x8(%ebp),%eax
    18c4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    18ca:	5d                   	pop    %ebp
    18cb:	c3                   	ret    

000018cc <lock_acquire>:
void lock_acquire(lock_t *lock){
    18cc:	55                   	push   %ebp
    18cd:	89 e5                	mov    %esp,%ebp
    18cf:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    18d2:	8b 45 08             	mov    0x8(%ebp),%eax
    18d5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    18dc:	00 
    18dd:	89 04 24             	mov    %eax,(%esp)
    18e0:	e8 bf ff ff ff       	call   18a4 <xchg>
    18e5:	85 c0                	test   %eax,%eax
    18e7:	75 e9                	jne    18d2 <lock_acquire+0x6>
}
    18e9:	c9                   	leave  
    18ea:	c3                   	ret    

000018eb <lock_release>:
void lock_release(lock_t *lock){
    18eb:	55                   	push   %ebp
    18ec:	89 e5                	mov    %esp,%ebp
    18ee:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    18f1:	8b 45 08             	mov    0x8(%ebp),%eax
    18f4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18fb:	00 
    18fc:	89 04 24             	mov    %eax,(%esp)
    18ff:	e8 a0 ff ff ff       	call   18a4 <xchg>
}
    1904:	c9                   	leave  
    1905:	c3                   	ret    

00001906 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1906:	55                   	push   %ebp
    1907:	89 e5                	mov    %esp,%ebp
    1909:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    190c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1913:	e8 ab fe ff ff       	call   17c3 <malloc>
    1918:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    191b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    191e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1921:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1924:	25 ff 0f 00 00       	and    $0xfff,%eax
    1929:	85 c0                	test   %eax,%eax
    192b:	74 15                	je     1942 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    192d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1930:	89 c2                	mov    %eax,%edx
    1932:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1938:	b8 00 10 00 00       	mov    $0x1000,%eax
    193d:	29 d0                	sub    %edx,%eax
    193f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1942:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1946:	75 1b                	jne    1963 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1948:	c7 44 24 04 63 1b 00 	movl   $0x1b63,0x4(%esp)
    194f:	00 
    1950:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1957:	e8 81 fb ff ff       	call   14dd <printf>
        return 0;
    195c:	b8 00 00 00 00       	mov    $0x0,%eax
    1961:	eb 6f                	jmp    19d2 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1963:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1966:	8b 55 08             	mov    0x8(%ebp),%edx
    1969:	8b 45 f0             	mov    -0x10(%ebp),%eax
    196c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1970:	89 54 24 08          	mov    %edx,0x8(%esp)
    1974:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    197b:	00 
    197c:	89 04 24             	mov    %eax,(%esp)
    197f:	e8 60 fa ff ff       	call   13e4 <clone>
    1984:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1987:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    198b:	79 1b                	jns    19a8 <thread_create+0xa2>
        printf(1,"clone fails\n");
    198d:	c7 44 24 04 71 1b 00 	movl   $0x1b71,0x4(%esp)
    1994:	00 
    1995:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    199c:	e8 3c fb ff ff       	call   14dd <printf>
        return 0;
    19a1:	b8 00 00 00 00       	mov    $0x0,%eax
    19a6:	eb 2a                	jmp    19d2 <thread_create+0xcc>
    }
    if(tid > 0){
    19a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19ac:	7e 05                	jle    19b3 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    19ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19b1:	eb 1f                	jmp    19d2 <thread_create+0xcc>
    }
    if(tid == 0){
    19b3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    19b7:	75 14                	jne    19cd <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    19b9:	c7 44 24 04 7e 1b 00 	movl   $0x1b7e,0x4(%esp)
    19c0:	00 
    19c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19c8:	e8 10 fb ff ff       	call   14dd <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    19cd:	b8 00 00 00 00       	mov    $0x0,%eax
}
    19d2:	c9                   	leave  
    19d3:	c3                   	ret    

000019d4 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    19d4:	55                   	push   %ebp
    19d5:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    19d7:	8b 45 08             	mov    0x8(%ebp),%eax
    19da:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    19e0:	8b 45 08             	mov    0x8(%ebp),%eax
    19e3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    19ea:	8b 45 08             	mov    0x8(%ebp),%eax
    19ed:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    19f4:	5d                   	pop    %ebp
    19f5:	c3                   	ret    

000019f6 <add_q>:

void add_q(struct queue *q, int v){
    19f6:	55                   	push   %ebp
    19f7:	89 e5                	mov    %esp,%ebp
    19f9:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    19fc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1a03:	e8 bb fd ff ff       	call   17c3 <malloc>
    1a08:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a0e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a18:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a1b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a20:	8b 40 04             	mov    0x4(%eax),%eax
    1a23:	85 c0                	test   %eax,%eax
    1a25:	75 0b                	jne    1a32 <add_q+0x3c>
        q->head = n;
    1a27:	8b 45 08             	mov    0x8(%ebp),%eax
    1a2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a2d:	89 50 04             	mov    %edx,0x4(%eax)
    1a30:	eb 0c                	jmp    1a3e <add_q+0x48>
    }else{
        q->tail->next = n;
    1a32:	8b 45 08             	mov    0x8(%ebp),%eax
    1a35:	8b 40 08             	mov    0x8(%eax),%eax
    1a38:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a3b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1a3e:	8b 45 08             	mov    0x8(%ebp),%eax
    1a41:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a44:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1a47:	8b 45 08             	mov    0x8(%ebp),%eax
    1a4a:	8b 00                	mov    (%eax),%eax
    1a4c:	8d 50 01             	lea    0x1(%eax),%edx
    1a4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a52:	89 10                	mov    %edx,(%eax)
}
    1a54:	c9                   	leave  
    1a55:	c3                   	ret    

00001a56 <empty_q>:

int empty_q(struct queue *q){
    1a56:	55                   	push   %ebp
    1a57:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1a59:	8b 45 08             	mov    0x8(%ebp),%eax
    1a5c:	8b 00                	mov    (%eax),%eax
    1a5e:	85 c0                	test   %eax,%eax
    1a60:	75 07                	jne    1a69 <empty_q+0x13>
        return 1;
    1a62:	b8 01 00 00 00       	mov    $0x1,%eax
    1a67:	eb 05                	jmp    1a6e <empty_q+0x18>
    else
        return 0;
    1a69:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1a6e:	5d                   	pop    %ebp
    1a6f:	c3                   	ret    

00001a70 <pop_q>:
int pop_q(struct queue *q){
    1a70:	55                   	push   %ebp
    1a71:	89 e5                	mov    %esp,%ebp
    1a73:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1a76:	8b 45 08             	mov    0x8(%ebp),%eax
    1a79:	89 04 24             	mov    %eax,(%esp)
    1a7c:	e8 d5 ff ff ff       	call   1a56 <empty_q>
    1a81:	85 c0                	test   %eax,%eax
    1a83:	75 5d                	jne    1ae2 <pop_q+0x72>
       val = q->head->value; 
    1a85:	8b 45 08             	mov    0x8(%ebp),%eax
    1a88:	8b 40 04             	mov    0x4(%eax),%eax
    1a8b:	8b 00                	mov    (%eax),%eax
    1a8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1a90:	8b 45 08             	mov    0x8(%ebp),%eax
    1a93:	8b 40 04             	mov    0x4(%eax),%eax
    1a96:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1a99:	8b 45 08             	mov    0x8(%ebp),%eax
    1a9c:	8b 40 04             	mov    0x4(%eax),%eax
    1a9f:	8b 50 04             	mov    0x4(%eax),%edx
    1aa2:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa5:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aab:	89 04 24             	mov    %eax,(%esp)
    1aae:	e8 e1 fb ff ff       	call   1694 <free>
       q->size--;
    1ab3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab6:	8b 00                	mov    (%eax),%eax
    1ab8:	8d 50 ff             	lea    -0x1(%eax),%edx
    1abb:	8b 45 08             	mov    0x8(%ebp),%eax
    1abe:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1ac0:	8b 45 08             	mov    0x8(%ebp),%eax
    1ac3:	8b 00                	mov    (%eax),%eax
    1ac5:	85 c0                	test   %eax,%eax
    1ac7:	75 14                	jne    1add <pop_q+0x6d>
            q->head = 0;
    1ac9:	8b 45 08             	mov    0x8(%ebp),%eax
    1acc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1ad3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ad6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1add:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ae0:	eb 05                	jmp    1ae7 <pop_q+0x77>
    }
    return -1;
    1ae2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1ae7:	c9                   	leave  
    1ae8:	c3                   	ret    
