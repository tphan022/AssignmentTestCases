
_grep:     file format elf32-i386


Disassembly of section .text:

00001000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
    1006:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    100d:	e9 bf 00 00 00       	jmp    10d1 <grep+0xd1>
    m += n;
    1012:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1015:	01 45 ec             	add    %eax,-0x14(%ebp)
    p = buf;
    1018:	c7 45 f0 00 1e 00 00 	movl   $0x1e00,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
    101f:	eb 53                	jmp    1074 <grep+0x74>
      *q = 0;
    1021:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1024:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
    1027:	8b 45 f0             	mov    -0x10(%ebp),%eax
    102a:	89 44 24 04          	mov    %eax,0x4(%esp)
    102e:	8b 45 08             	mov    0x8(%ebp),%eax
    1031:	89 04 24             	mov    %eax,(%esp)
    1034:	e8 b1 01 00 00       	call   11ea <match>
    1039:	85 c0                	test   %eax,%eax
    103b:	74 2e                	je     106b <grep+0x6b>
        *q = '\n';
    103d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1040:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
    1043:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1046:	83 c0 01             	add    $0x1,%eax
    1049:	89 c2                	mov    %eax,%edx
    104b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    104e:	89 d1                	mov    %edx,%ecx
    1050:	29 c1                	sub    %eax,%ecx
    1052:	89 c8                	mov    %ecx,%eax
    1054:	89 44 24 08          	mov    %eax,0x8(%esp)
    1058:	8b 45 f0             	mov    -0x10(%ebp),%eax
    105b:	89 44 24 04          	mov    %eax,0x4(%esp)
    105f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1066:	e8 69 05 00 00       	call   15d4 <write>
      }
      p = q+1;
    106b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    106e:	83 c0 01             	add    $0x1,%eax
    1071:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
    1074:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
    107b:	00 
    107c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    107f:	89 04 24             	mov    %eax,(%esp)
    1082:	e8 ab 03 00 00       	call   1432 <strchr>
    1087:	89 45 f4             	mov    %eax,-0xc(%ebp)
    108a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    108e:	75 91                	jne    1021 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
    1090:	81 7d f0 00 1e 00 00 	cmpl   $0x1e00,-0x10(%ebp)
    1097:	75 07                	jne    10a0 <grep+0xa0>
      m = 0;
    1099:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    if(m > 0){
    10a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10a4:	7e 2b                	jle    10d1 <grep+0xd1>
      m -= p - buf;
    10a6:	ba 00 1e 00 00       	mov    $0x1e00,%edx
    10ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10ae:	89 d1                	mov    %edx,%ecx
    10b0:	29 c1                	sub    %eax,%ecx
    10b2:	89 c8                	mov    %ecx,%eax
    10b4:	01 45 ec             	add    %eax,-0x14(%ebp)
      memmove(buf, p, m);
    10b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    10be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    10c5:	c7 04 24 00 1e 00 00 	movl   $0x1e00,(%esp)
    10cc:	e8 9d 04 00 00       	call   156e <memmove>
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    10d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10d4:	ba 00 04 00 00       	mov    $0x400,%edx
    10d9:	89 d1                	mov    %edx,%ecx
    10db:	29 c1                	sub    %eax,%ecx
    10dd:	89 c8                	mov    %ecx,%eax
    10df:	8b 55 ec             	mov    -0x14(%ebp),%edx
    10e2:	81 c2 00 1e 00 00    	add    $0x1e00,%edx
    10e8:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ec:	89 54 24 04          	mov    %edx,0x4(%esp)
    10f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    10f3:	89 04 24             	mov    %eax,(%esp)
    10f6:	e8 d1 04 00 00       	call   15cc <read>
    10fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    10fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1102:	0f 8f 0a ff ff ff    	jg     1012 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
    1108:	c9                   	leave  
    1109:	c3                   	ret    

0000110a <main>:

int
main(int argc, char *argv[])
{
    110a:	55                   	push   %ebp
    110b:	89 e5                	mov    %esp,%ebp
    110d:	83 e4 f0             	and    $0xfffffff0,%esp
    1110:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
    1113:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    1117:	7f 19                	jg     1132 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
    1119:	c7 44 24 04 5c 1d 00 	movl   $0x1d5c,0x4(%esp)
    1120:	00 
    1121:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1128:	e8 20 06 00 00       	call   174d <printf>
    exit();
    112d:	e8 82 04 00 00       	call   15b4 <exit>
  }
  pattern = argv[1];
    1132:	8b 45 0c             	mov    0xc(%ebp),%eax
    1135:	83 c0 04             	add    $0x4,%eax
    1138:	8b 00                	mov    (%eax),%eax
    113a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  
  if(argc <= 2){
    113e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
    1142:	7f 19                	jg     115d <main+0x53>
    grep(pattern, 0);
    1144:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    114b:	00 
    114c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1150:	89 04 24             	mov    %eax,(%esp)
    1153:	e8 a8 fe ff ff       	call   1000 <grep>
    exit();
    1158:	e8 57 04 00 00       	call   15b4 <exit>
  }

  for(i = 2; i < argc; i++){
    115d:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    1164:	00 
    1165:	eb 75                	jmp    11dc <main+0xd2>
    if((fd = open(argv[i], 0)) < 0){
    1167:	8b 44 24 18          	mov    0x18(%esp),%eax
    116b:	c1 e0 02             	shl    $0x2,%eax
    116e:	03 45 0c             	add    0xc(%ebp),%eax
    1171:	8b 00                	mov    (%eax),%eax
    1173:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    117a:	00 
    117b:	89 04 24             	mov    %eax,(%esp)
    117e:	e8 71 04 00 00       	call   15f4 <open>
    1183:	89 44 24 14          	mov    %eax,0x14(%esp)
    1187:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
    118c:	79 29                	jns    11b7 <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
    118e:	8b 44 24 18          	mov    0x18(%esp),%eax
    1192:	c1 e0 02             	shl    $0x2,%eax
    1195:	03 45 0c             	add    0xc(%ebp),%eax
    1198:	8b 00                	mov    (%eax),%eax
    119a:	89 44 24 08          	mov    %eax,0x8(%esp)
    119e:	c7 44 24 04 7c 1d 00 	movl   $0x1d7c,0x4(%esp)
    11a5:	00 
    11a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11ad:	e8 9b 05 00 00       	call   174d <printf>
      exit();
    11b2:	e8 fd 03 00 00       	call   15b4 <exit>
    }
    grep(pattern, fd);
    11b7:	8b 44 24 14          	mov    0x14(%esp),%eax
    11bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    11bf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    11c3:	89 04 24             	mov    %eax,(%esp)
    11c6:	e8 35 fe ff ff       	call   1000 <grep>
    close(fd);
    11cb:	8b 44 24 14          	mov    0x14(%esp),%eax
    11cf:	89 04 24             	mov    %eax,(%esp)
    11d2:	e8 05 04 00 00       	call   15dc <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    11d7:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
    11dc:	8b 44 24 18          	mov    0x18(%esp),%eax
    11e0:	3b 45 08             	cmp    0x8(%ebp),%eax
    11e3:	7c 82                	jl     1167 <main+0x5d>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
    11e5:	e8 ca 03 00 00       	call   15b4 <exit>

000011ea <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
    11ea:	55                   	push   %ebp
    11eb:	89 e5                	mov    %esp,%ebp
    11ed:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
    11f0:	8b 45 08             	mov    0x8(%ebp),%eax
    11f3:	0f b6 00             	movzbl (%eax),%eax
    11f6:	3c 5e                	cmp    $0x5e,%al
    11f8:	75 17                	jne    1211 <match+0x27>
    return matchhere(re+1, text);
    11fa:	8b 45 08             	mov    0x8(%ebp),%eax
    11fd:	8d 50 01             	lea    0x1(%eax),%edx
    1200:	8b 45 0c             	mov    0xc(%ebp),%eax
    1203:	89 44 24 04          	mov    %eax,0x4(%esp)
    1207:	89 14 24             	mov    %edx,(%esp)
    120a:	e8 39 00 00 00       	call   1248 <matchhere>
    120f:	eb 35                	jmp    1246 <match+0x5c>
  do{  // must look at empty string
    if(matchhere(re, text))
    1211:	8b 45 0c             	mov    0xc(%ebp),%eax
    1214:	89 44 24 04          	mov    %eax,0x4(%esp)
    1218:	8b 45 08             	mov    0x8(%ebp),%eax
    121b:	89 04 24             	mov    %eax,(%esp)
    121e:	e8 25 00 00 00       	call   1248 <matchhere>
    1223:	85 c0                	test   %eax,%eax
    1225:	74 07                	je     122e <match+0x44>
      return 1;
    1227:	b8 01 00 00 00       	mov    $0x1,%eax
    122c:	eb 18                	jmp    1246 <match+0x5c>
  }while(*text++ != '\0');
    122e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1231:	0f b6 00             	movzbl (%eax),%eax
    1234:	84 c0                	test   %al,%al
    1236:	0f 95 c0             	setne  %al
    1239:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    123d:	84 c0                	test   %al,%al
    123f:	75 d0                	jne    1211 <match+0x27>
  return 0;
    1241:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1246:	c9                   	leave  
    1247:	c3                   	ret    

00001248 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
    1248:	55                   	push   %ebp
    1249:	89 e5                	mov    %esp,%ebp
    124b:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
    124e:	8b 45 08             	mov    0x8(%ebp),%eax
    1251:	0f b6 00             	movzbl (%eax),%eax
    1254:	84 c0                	test   %al,%al
    1256:	75 0a                	jne    1262 <matchhere+0x1a>
    return 1;
    1258:	b8 01 00 00 00       	mov    $0x1,%eax
    125d:	e9 9b 00 00 00       	jmp    12fd <matchhere+0xb5>
  if(re[1] == '*')
    1262:	8b 45 08             	mov    0x8(%ebp),%eax
    1265:	83 c0 01             	add    $0x1,%eax
    1268:	0f b6 00             	movzbl (%eax),%eax
    126b:	3c 2a                	cmp    $0x2a,%al
    126d:	75 24                	jne    1293 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
    126f:	8b 45 08             	mov    0x8(%ebp),%eax
    1272:	8d 48 02             	lea    0x2(%eax),%ecx
    1275:	8b 45 08             	mov    0x8(%ebp),%eax
    1278:	0f b6 00             	movzbl (%eax),%eax
    127b:	0f be c0             	movsbl %al,%eax
    127e:	8b 55 0c             	mov    0xc(%ebp),%edx
    1281:	89 54 24 08          	mov    %edx,0x8(%esp)
    1285:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1289:	89 04 24             	mov    %eax,(%esp)
    128c:	e8 6e 00 00 00       	call   12ff <matchstar>
    1291:	eb 6a                	jmp    12fd <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
    1293:	8b 45 08             	mov    0x8(%ebp),%eax
    1296:	0f b6 00             	movzbl (%eax),%eax
    1299:	3c 24                	cmp    $0x24,%al
    129b:	75 1d                	jne    12ba <matchhere+0x72>
    129d:	8b 45 08             	mov    0x8(%ebp),%eax
    12a0:	83 c0 01             	add    $0x1,%eax
    12a3:	0f b6 00             	movzbl (%eax),%eax
    12a6:	84 c0                	test   %al,%al
    12a8:	75 10                	jne    12ba <matchhere+0x72>
    return *text == '\0';
    12aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    12ad:	0f b6 00             	movzbl (%eax),%eax
    12b0:	84 c0                	test   %al,%al
    12b2:	0f 94 c0             	sete   %al
    12b5:	0f b6 c0             	movzbl %al,%eax
    12b8:	eb 43                	jmp    12fd <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    12ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    12bd:	0f b6 00             	movzbl (%eax),%eax
    12c0:	84 c0                	test   %al,%al
    12c2:	74 34                	je     12f8 <matchhere+0xb0>
    12c4:	8b 45 08             	mov    0x8(%ebp),%eax
    12c7:	0f b6 00             	movzbl (%eax),%eax
    12ca:	3c 2e                	cmp    $0x2e,%al
    12cc:	74 10                	je     12de <matchhere+0x96>
    12ce:	8b 45 08             	mov    0x8(%ebp),%eax
    12d1:	0f b6 10             	movzbl (%eax),%edx
    12d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    12d7:	0f b6 00             	movzbl (%eax),%eax
    12da:	38 c2                	cmp    %al,%dl
    12dc:	75 1a                	jne    12f8 <matchhere+0xb0>
    return matchhere(re+1, text+1);
    12de:	8b 45 0c             	mov    0xc(%ebp),%eax
    12e1:	8d 50 01             	lea    0x1(%eax),%edx
    12e4:	8b 45 08             	mov    0x8(%ebp),%eax
    12e7:	83 c0 01             	add    $0x1,%eax
    12ea:	89 54 24 04          	mov    %edx,0x4(%esp)
    12ee:	89 04 24             	mov    %eax,(%esp)
    12f1:	e8 52 ff ff ff       	call   1248 <matchhere>
    12f6:	eb 05                	jmp    12fd <matchhere+0xb5>
  return 0;
    12f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    12fd:	c9                   	leave  
    12fe:	c3                   	ret    

000012ff <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
    12ff:	55                   	push   %ebp
    1300:	89 e5                	mov    %esp,%ebp
    1302:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
    1305:	8b 45 10             	mov    0x10(%ebp),%eax
    1308:	89 44 24 04          	mov    %eax,0x4(%esp)
    130c:	8b 45 0c             	mov    0xc(%ebp),%eax
    130f:	89 04 24             	mov    %eax,(%esp)
    1312:	e8 31 ff ff ff       	call   1248 <matchhere>
    1317:	85 c0                	test   %eax,%eax
    1319:	74 07                	je     1322 <matchstar+0x23>
      return 1;
    131b:	b8 01 00 00 00       	mov    $0x1,%eax
    1320:	eb 2c                	jmp    134e <matchstar+0x4f>
  }while(*text!='\0' && (*text++==c || c=='.'));
    1322:	8b 45 10             	mov    0x10(%ebp),%eax
    1325:	0f b6 00             	movzbl (%eax),%eax
    1328:	84 c0                	test   %al,%al
    132a:	74 1d                	je     1349 <matchstar+0x4a>
    132c:	8b 45 10             	mov    0x10(%ebp),%eax
    132f:	0f b6 00             	movzbl (%eax),%eax
    1332:	0f be c0             	movsbl %al,%eax
    1335:	3b 45 08             	cmp    0x8(%ebp),%eax
    1338:	0f 94 c0             	sete   %al
    133b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
    133f:	84 c0                	test   %al,%al
    1341:	75 c2                	jne    1305 <matchstar+0x6>
    1343:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
    1347:	74 bc                	je     1305 <matchstar+0x6>
  return 0;
    1349:	b8 00 00 00 00       	mov    $0x0,%eax
}
    134e:	c9                   	leave  
    134f:	c3                   	ret    

00001350 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1355:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1358:	8b 55 10             	mov    0x10(%ebp),%edx
    135b:	8b 45 0c             	mov    0xc(%ebp),%eax
    135e:	89 cb                	mov    %ecx,%ebx
    1360:	89 df                	mov    %ebx,%edi
    1362:	89 d1                	mov    %edx,%ecx
    1364:	fc                   	cld    
    1365:	f3 aa                	rep stos %al,%es:(%edi)
    1367:	89 ca                	mov    %ecx,%edx
    1369:	89 fb                	mov    %edi,%ebx
    136b:	89 5d 08             	mov    %ebx,0x8(%ebp)
    136e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1371:	5b                   	pop    %ebx
    1372:	5f                   	pop    %edi
    1373:	5d                   	pop    %ebp
    1374:	c3                   	ret    

00001375 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1375:	55                   	push   %ebp
    1376:	89 e5                	mov    %esp,%ebp
    1378:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    137b:	8b 45 08             	mov    0x8(%ebp),%eax
    137e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1381:	8b 45 0c             	mov    0xc(%ebp),%eax
    1384:	0f b6 10             	movzbl (%eax),%edx
    1387:	8b 45 08             	mov    0x8(%ebp),%eax
    138a:	88 10                	mov    %dl,(%eax)
    138c:	8b 45 08             	mov    0x8(%ebp),%eax
    138f:	0f b6 00             	movzbl (%eax),%eax
    1392:	84 c0                	test   %al,%al
    1394:	0f 95 c0             	setne  %al
    1397:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    139b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    139f:	84 c0                	test   %al,%al
    13a1:	75 de                	jne    1381 <strcpy+0xc>
    ;
  return os;
    13a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13a6:	c9                   	leave  
    13a7:	c3                   	ret    

000013a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    13a8:	55                   	push   %ebp
    13a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    13ab:	eb 08                	jmp    13b5 <strcmp+0xd>
    p++, q++;
    13ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    13b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    13b5:	8b 45 08             	mov    0x8(%ebp),%eax
    13b8:	0f b6 00             	movzbl (%eax),%eax
    13bb:	84 c0                	test   %al,%al
    13bd:	74 10                	je     13cf <strcmp+0x27>
    13bf:	8b 45 08             	mov    0x8(%ebp),%eax
    13c2:	0f b6 10             	movzbl (%eax),%edx
    13c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    13c8:	0f b6 00             	movzbl (%eax),%eax
    13cb:	38 c2                	cmp    %al,%dl
    13cd:	74 de                	je     13ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    13cf:	8b 45 08             	mov    0x8(%ebp),%eax
    13d2:	0f b6 00             	movzbl (%eax),%eax
    13d5:	0f b6 d0             	movzbl %al,%edx
    13d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    13db:	0f b6 00             	movzbl (%eax),%eax
    13de:	0f b6 c0             	movzbl %al,%eax
    13e1:	89 d1                	mov    %edx,%ecx
    13e3:	29 c1                	sub    %eax,%ecx
    13e5:	89 c8                	mov    %ecx,%eax
}
    13e7:	5d                   	pop    %ebp
    13e8:	c3                   	ret    

000013e9 <strlen>:

uint
strlen(char *s)
{
    13e9:	55                   	push   %ebp
    13ea:	89 e5                	mov    %esp,%ebp
    13ec:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    13ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    13f6:	eb 04                	jmp    13fc <strlen+0x13>
    13f8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    13fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13ff:	03 45 08             	add    0x8(%ebp),%eax
    1402:	0f b6 00             	movzbl (%eax),%eax
    1405:	84 c0                	test   %al,%al
    1407:	75 ef                	jne    13f8 <strlen+0xf>
    ;
  return n;
    1409:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    140c:	c9                   	leave  
    140d:	c3                   	ret    

0000140e <memset>:

void*
memset(void *dst, int c, uint n)
{
    140e:	55                   	push   %ebp
    140f:	89 e5                	mov    %esp,%ebp
    1411:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1414:	8b 45 10             	mov    0x10(%ebp),%eax
    1417:	89 44 24 08          	mov    %eax,0x8(%esp)
    141b:	8b 45 0c             	mov    0xc(%ebp),%eax
    141e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1422:	8b 45 08             	mov    0x8(%ebp),%eax
    1425:	89 04 24             	mov    %eax,(%esp)
    1428:	e8 23 ff ff ff       	call   1350 <stosb>
  return dst;
    142d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1430:	c9                   	leave  
    1431:	c3                   	ret    

00001432 <strchr>:

char*
strchr(const char *s, char c)
{
    1432:	55                   	push   %ebp
    1433:	89 e5                	mov    %esp,%ebp
    1435:	83 ec 04             	sub    $0x4,%esp
    1438:	8b 45 0c             	mov    0xc(%ebp),%eax
    143b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    143e:	eb 14                	jmp    1454 <strchr+0x22>
    if(*s == c)
    1440:	8b 45 08             	mov    0x8(%ebp),%eax
    1443:	0f b6 00             	movzbl (%eax),%eax
    1446:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1449:	75 05                	jne    1450 <strchr+0x1e>
      return (char*)s;
    144b:	8b 45 08             	mov    0x8(%ebp),%eax
    144e:	eb 13                	jmp    1463 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1450:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1454:	8b 45 08             	mov    0x8(%ebp),%eax
    1457:	0f b6 00             	movzbl (%eax),%eax
    145a:	84 c0                	test   %al,%al
    145c:	75 e2                	jne    1440 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    145e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1463:	c9                   	leave  
    1464:	c3                   	ret    

00001465 <gets>:

char*
gets(char *buf, int max)
{
    1465:	55                   	push   %ebp
    1466:	89 e5                	mov    %esp,%ebp
    1468:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    146b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1472:	eb 44                	jmp    14b8 <gets+0x53>
    cc = read(0, &c, 1);
    1474:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    147b:	00 
    147c:	8d 45 ef             	lea    -0x11(%ebp),%eax
    147f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1483:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    148a:	e8 3d 01 00 00       	call   15cc <read>
    148f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1492:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1496:	7e 2d                	jle    14c5 <gets+0x60>
      break;
    buf[i++] = c;
    1498:	8b 45 f0             	mov    -0x10(%ebp),%eax
    149b:	03 45 08             	add    0x8(%ebp),%eax
    149e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    14a2:	88 10                	mov    %dl,(%eax)
    14a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    14a8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14ac:	3c 0a                	cmp    $0xa,%al
    14ae:	74 16                	je     14c6 <gets+0x61>
    14b0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14b4:	3c 0d                	cmp    $0xd,%al
    14b6:	74 0e                	je     14c6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    14b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14bb:	83 c0 01             	add    $0x1,%eax
    14be:	3b 45 0c             	cmp    0xc(%ebp),%eax
    14c1:	7c b1                	jl     1474 <gets+0xf>
    14c3:	eb 01                	jmp    14c6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    14c5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    14c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14c9:	03 45 08             	add    0x8(%ebp),%eax
    14cc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    14cf:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14d2:	c9                   	leave  
    14d3:	c3                   	ret    

000014d4 <stat>:

int
stat(char *n, struct stat *st)
{
    14d4:	55                   	push   %ebp
    14d5:	89 e5                	mov    %esp,%ebp
    14d7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14e1:	00 
    14e2:	8b 45 08             	mov    0x8(%ebp),%eax
    14e5:	89 04 24             	mov    %eax,(%esp)
    14e8:	e8 07 01 00 00       	call   15f4 <open>
    14ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    14f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14f4:	79 07                	jns    14fd <stat+0x29>
    return -1;
    14f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    14fb:	eb 23                	jmp    1520 <stat+0x4c>
  r = fstat(fd, st);
    14fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    1500:	89 44 24 04          	mov    %eax,0x4(%esp)
    1504:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1507:	89 04 24             	mov    %eax,(%esp)
    150a:	e8 fd 00 00 00       	call   160c <fstat>
    150f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1512:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1515:	89 04 24             	mov    %eax,(%esp)
    1518:	e8 bf 00 00 00       	call   15dc <close>
  return r;
    151d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1520:	c9                   	leave  
    1521:	c3                   	ret    

00001522 <atoi>:

int
atoi(const char *s)
{
    1522:	55                   	push   %ebp
    1523:	89 e5                	mov    %esp,%ebp
    1525:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1528:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    152f:	eb 24                	jmp    1555 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1531:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1534:	89 d0                	mov    %edx,%eax
    1536:	c1 e0 02             	shl    $0x2,%eax
    1539:	01 d0                	add    %edx,%eax
    153b:	01 c0                	add    %eax,%eax
    153d:	89 c2                	mov    %eax,%edx
    153f:	8b 45 08             	mov    0x8(%ebp),%eax
    1542:	0f b6 00             	movzbl (%eax),%eax
    1545:	0f be c0             	movsbl %al,%eax
    1548:	8d 04 02             	lea    (%edx,%eax,1),%eax
    154b:	83 e8 30             	sub    $0x30,%eax
    154e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1551:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1555:	8b 45 08             	mov    0x8(%ebp),%eax
    1558:	0f b6 00             	movzbl (%eax),%eax
    155b:	3c 2f                	cmp    $0x2f,%al
    155d:	7e 0a                	jle    1569 <atoi+0x47>
    155f:	8b 45 08             	mov    0x8(%ebp),%eax
    1562:	0f b6 00             	movzbl (%eax),%eax
    1565:	3c 39                	cmp    $0x39,%al
    1567:	7e c8                	jle    1531 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1569:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    156c:	c9                   	leave  
    156d:	c3                   	ret    

0000156e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    156e:	55                   	push   %ebp
    156f:	89 e5                	mov    %esp,%ebp
    1571:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1574:	8b 45 08             	mov    0x8(%ebp),%eax
    1577:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    157a:	8b 45 0c             	mov    0xc(%ebp),%eax
    157d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1580:	eb 13                	jmp    1595 <memmove+0x27>
    *dst++ = *src++;
    1582:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1585:	0f b6 10             	movzbl (%eax),%edx
    1588:	8b 45 f8             	mov    -0x8(%ebp),%eax
    158b:	88 10                	mov    %dl,(%eax)
    158d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1591:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1595:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1599:	0f 9f c0             	setg   %al
    159c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    15a0:	84 c0                	test   %al,%al
    15a2:	75 de                	jne    1582 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
}
    15a7:	c9                   	leave  
    15a8:	c3                   	ret    
    15a9:	90                   	nop
    15aa:	90                   	nop
    15ab:	90                   	nop

000015ac <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    15ac:	b8 01 00 00 00       	mov    $0x1,%eax
    15b1:	cd 40                	int    $0x40
    15b3:	c3                   	ret    

000015b4 <exit>:
SYSCALL(exit)
    15b4:	b8 02 00 00 00       	mov    $0x2,%eax
    15b9:	cd 40                	int    $0x40
    15bb:	c3                   	ret    

000015bc <wait>:
SYSCALL(wait)
    15bc:	b8 03 00 00 00       	mov    $0x3,%eax
    15c1:	cd 40                	int    $0x40
    15c3:	c3                   	ret    

000015c4 <pipe>:
SYSCALL(pipe)
    15c4:	b8 04 00 00 00       	mov    $0x4,%eax
    15c9:	cd 40                	int    $0x40
    15cb:	c3                   	ret    

000015cc <read>:
SYSCALL(read)
    15cc:	b8 05 00 00 00       	mov    $0x5,%eax
    15d1:	cd 40                	int    $0x40
    15d3:	c3                   	ret    

000015d4 <write>:
SYSCALL(write)
    15d4:	b8 10 00 00 00       	mov    $0x10,%eax
    15d9:	cd 40                	int    $0x40
    15db:	c3                   	ret    

000015dc <close>:
SYSCALL(close)
    15dc:	b8 15 00 00 00       	mov    $0x15,%eax
    15e1:	cd 40                	int    $0x40
    15e3:	c3                   	ret    

000015e4 <kill>:
SYSCALL(kill)
    15e4:	b8 06 00 00 00       	mov    $0x6,%eax
    15e9:	cd 40                	int    $0x40
    15eb:	c3                   	ret    

000015ec <exec>:
SYSCALL(exec)
    15ec:	b8 07 00 00 00       	mov    $0x7,%eax
    15f1:	cd 40                	int    $0x40
    15f3:	c3                   	ret    

000015f4 <open>:
SYSCALL(open)
    15f4:	b8 0f 00 00 00       	mov    $0xf,%eax
    15f9:	cd 40                	int    $0x40
    15fb:	c3                   	ret    

000015fc <mknod>:
SYSCALL(mknod)
    15fc:	b8 11 00 00 00       	mov    $0x11,%eax
    1601:	cd 40                	int    $0x40
    1603:	c3                   	ret    

00001604 <unlink>:
SYSCALL(unlink)
    1604:	b8 12 00 00 00       	mov    $0x12,%eax
    1609:	cd 40                	int    $0x40
    160b:	c3                   	ret    

0000160c <fstat>:
SYSCALL(fstat)
    160c:	b8 08 00 00 00       	mov    $0x8,%eax
    1611:	cd 40                	int    $0x40
    1613:	c3                   	ret    

00001614 <link>:
SYSCALL(link)
    1614:	b8 13 00 00 00       	mov    $0x13,%eax
    1619:	cd 40                	int    $0x40
    161b:	c3                   	ret    

0000161c <mkdir>:
SYSCALL(mkdir)
    161c:	b8 14 00 00 00       	mov    $0x14,%eax
    1621:	cd 40                	int    $0x40
    1623:	c3                   	ret    

00001624 <chdir>:
SYSCALL(chdir)
    1624:	b8 09 00 00 00       	mov    $0x9,%eax
    1629:	cd 40                	int    $0x40
    162b:	c3                   	ret    

0000162c <dup>:
SYSCALL(dup)
    162c:	b8 0a 00 00 00       	mov    $0xa,%eax
    1631:	cd 40                	int    $0x40
    1633:	c3                   	ret    

00001634 <getpid>:
SYSCALL(getpid)
    1634:	b8 0b 00 00 00       	mov    $0xb,%eax
    1639:	cd 40                	int    $0x40
    163b:	c3                   	ret    

0000163c <sbrk>:
SYSCALL(sbrk)
    163c:	b8 0c 00 00 00       	mov    $0xc,%eax
    1641:	cd 40                	int    $0x40
    1643:	c3                   	ret    

00001644 <sleep>:
SYSCALL(sleep)
    1644:	b8 0d 00 00 00       	mov    $0xd,%eax
    1649:	cd 40                	int    $0x40
    164b:	c3                   	ret    

0000164c <uptime>:
SYSCALL(uptime)
    164c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1651:	cd 40                	int    $0x40
    1653:	c3                   	ret    

00001654 <clone>:
SYSCALL(clone)
    1654:	b8 16 00 00 00       	mov    $0x16,%eax
    1659:	cd 40                	int    $0x40
    165b:	c3                   	ret    

0000165c <texit>:
SYSCALL(texit)
    165c:	b8 17 00 00 00       	mov    $0x17,%eax
    1661:	cd 40                	int    $0x40
    1663:	c3                   	ret    

00001664 <tsleep>:
SYSCALL(tsleep)
    1664:	b8 18 00 00 00       	mov    $0x18,%eax
    1669:	cd 40                	int    $0x40
    166b:	c3                   	ret    

0000166c <twakeup>:
SYSCALL(twakeup)
    166c:	b8 19 00 00 00       	mov    $0x19,%eax
    1671:	cd 40                	int    $0x40
    1673:	c3                   	ret    

00001674 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1674:	55                   	push   %ebp
    1675:	89 e5                	mov    %esp,%ebp
    1677:	83 ec 28             	sub    $0x28,%esp
    167a:	8b 45 0c             	mov    0xc(%ebp),%eax
    167d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1680:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1687:	00 
    1688:	8d 45 f4             	lea    -0xc(%ebp),%eax
    168b:	89 44 24 04          	mov    %eax,0x4(%esp)
    168f:	8b 45 08             	mov    0x8(%ebp),%eax
    1692:	89 04 24             	mov    %eax,(%esp)
    1695:	e8 3a ff ff ff       	call   15d4 <write>
}
    169a:	c9                   	leave  
    169b:	c3                   	ret    

0000169c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    169c:	55                   	push   %ebp
    169d:	89 e5                	mov    %esp,%ebp
    169f:	53                   	push   %ebx
    16a0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    16a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    16aa:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    16ae:	74 17                	je     16c7 <printint+0x2b>
    16b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    16b4:	79 11                	jns    16c7 <printint+0x2b>
    neg = 1;
    16b6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    16bd:	8b 45 0c             	mov    0xc(%ebp),%eax
    16c0:	f7 d8                	neg    %eax
    16c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    16c5:	eb 06                	jmp    16cd <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    16c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    16cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    16d4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    16d7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16dd:	ba 00 00 00 00       	mov    $0x0,%edx
    16e2:	f7 f3                	div    %ebx
    16e4:	89 d0                	mov    %edx,%eax
    16e6:	0f b6 80 c8 1d 00 00 	movzbl 0x1dc8(%eax),%eax
    16ed:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    16f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    16f5:	8b 45 10             	mov    0x10(%ebp),%eax
    16f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    16fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16fe:	ba 00 00 00 00       	mov    $0x0,%edx
    1703:	f7 75 d4             	divl   -0x2c(%ebp)
    1706:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1709:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    170d:	75 c5                	jne    16d4 <printint+0x38>
  if(neg)
    170f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1713:	74 28                	je     173d <printint+0xa1>
    buf[i++] = '-';
    1715:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1718:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    171d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1721:	eb 1a                	jmp    173d <printint+0xa1>
    putc(fd, buf[i]);
    1723:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1726:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    172b:	0f be c0             	movsbl %al,%eax
    172e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1732:	8b 45 08             	mov    0x8(%ebp),%eax
    1735:	89 04 24             	mov    %eax,(%esp)
    1738:	e8 37 ff ff ff       	call   1674 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    173d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1741:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1745:	79 dc                	jns    1723 <printint+0x87>
    putc(fd, buf[i]);
}
    1747:	83 c4 44             	add    $0x44,%esp
    174a:	5b                   	pop    %ebx
    174b:	5d                   	pop    %ebp
    174c:	c3                   	ret    

0000174d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    174d:	55                   	push   %ebp
    174e:	89 e5                	mov    %esp,%ebp
    1750:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1753:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    175a:	8d 45 0c             	lea    0xc(%ebp),%eax
    175d:	83 c0 04             	add    $0x4,%eax
    1760:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1763:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    176a:	e9 7e 01 00 00       	jmp    18ed <printf+0x1a0>
    c = fmt[i] & 0xff;
    176f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1772:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1775:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1778:	0f b6 00             	movzbl (%eax),%eax
    177b:	0f be c0             	movsbl %al,%eax
    177e:	25 ff 00 00 00       	and    $0xff,%eax
    1783:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    1786:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    178a:	75 2c                	jne    17b8 <printf+0x6b>
      if(c == '%'){
    178c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1790:	75 0c                	jne    179e <printf+0x51>
        state = '%';
    1792:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1799:	e9 4b 01 00 00       	jmp    18e9 <printf+0x19c>
      } else {
        putc(fd, c);
    179e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17a1:	0f be c0             	movsbl %al,%eax
    17a4:	89 44 24 04          	mov    %eax,0x4(%esp)
    17a8:	8b 45 08             	mov    0x8(%ebp),%eax
    17ab:	89 04 24             	mov    %eax,(%esp)
    17ae:	e8 c1 fe ff ff       	call   1674 <putc>
    17b3:	e9 31 01 00 00       	jmp    18e9 <printf+0x19c>
      }
    } else if(state == '%'){
    17b8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    17bc:	0f 85 27 01 00 00    	jne    18e9 <printf+0x19c>
      if(c == 'd'){
    17c2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    17c6:	75 2d                	jne    17f5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    17c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17cb:	8b 00                	mov    (%eax),%eax
    17cd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    17d4:	00 
    17d5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    17dc:	00 
    17dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    17e1:	8b 45 08             	mov    0x8(%ebp),%eax
    17e4:	89 04 24             	mov    %eax,(%esp)
    17e7:	e8 b0 fe ff ff       	call   169c <printint>
        ap++;
    17ec:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    17f0:	e9 ed 00 00 00       	jmp    18e2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    17f5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    17f9:	74 06                	je     1801 <printf+0xb4>
    17fb:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    17ff:	75 2d                	jne    182e <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1801:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1804:	8b 00                	mov    (%eax),%eax
    1806:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    180d:	00 
    180e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1815:	00 
    1816:	89 44 24 04          	mov    %eax,0x4(%esp)
    181a:	8b 45 08             	mov    0x8(%ebp),%eax
    181d:	89 04 24             	mov    %eax,(%esp)
    1820:	e8 77 fe ff ff       	call   169c <printint>
        ap++;
    1825:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1829:	e9 b4 00 00 00       	jmp    18e2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    182e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1832:	75 46                	jne    187a <printf+0x12d>
        s = (char*)*ap;
    1834:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1837:	8b 00                	mov    (%eax),%eax
    1839:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    183c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1840:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1844:	75 27                	jne    186d <printf+0x120>
          s = "(null)";
    1846:	c7 45 e4 92 1d 00 00 	movl   $0x1d92,-0x1c(%ebp)
        while(*s != 0){
    184d:	eb 1f                	jmp    186e <printf+0x121>
          putc(fd, *s);
    184f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1852:	0f b6 00             	movzbl (%eax),%eax
    1855:	0f be c0             	movsbl %al,%eax
    1858:	89 44 24 04          	mov    %eax,0x4(%esp)
    185c:	8b 45 08             	mov    0x8(%ebp),%eax
    185f:	89 04 24             	mov    %eax,(%esp)
    1862:	e8 0d fe ff ff       	call   1674 <putc>
          s++;
    1867:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    186b:	eb 01                	jmp    186e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    186d:	90                   	nop
    186e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1871:	0f b6 00             	movzbl (%eax),%eax
    1874:	84 c0                	test   %al,%al
    1876:	75 d7                	jne    184f <printf+0x102>
    1878:	eb 68                	jmp    18e2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    187a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    187e:	75 1d                	jne    189d <printf+0x150>
        putc(fd, *ap);
    1880:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1883:	8b 00                	mov    (%eax),%eax
    1885:	0f be c0             	movsbl %al,%eax
    1888:	89 44 24 04          	mov    %eax,0x4(%esp)
    188c:	8b 45 08             	mov    0x8(%ebp),%eax
    188f:	89 04 24             	mov    %eax,(%esp)
    1892:	e8 dd fd ff ff       	call   1674 <putc>
        ap++;
    1897:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    189b:	eb 45                	jmp    18e2 <printf+0x195>
      } else if(c == '%'){
    189d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    18a1:	75 17                	jne    18ba <printf+0x16d>
        putc(fd, c);
    18a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18a6:	0f be c0             	movsbl %al,%eax
    18a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    18ad:	8b 45 08             	mov    0x8(%ebp),%eax
    18b0:	89 04 24             	mov    %eax,(%esp)
    18b3:	e8 bc fd ff ff       	call   1674 <putc>
    18b8:	eb 28                	jmp    18e2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    18ba:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    18c1:	00 
    18c2:	8b 45 08             	mov    0x8(%ebp),%eax
    18c5:	89 04 24             	mov    %eax,(%esp)
    18c8:	e8 a7 fd ff ff       	call   1674 <putc>
        putc(fd, c);
    18cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18d0:	0f be c0             	movsbl %al,%eax
    18d3:	89 44 24 04          	mov    %eax,0x4(%esp)
    18d7:	8b 45 08             	mov    0x8(%ebp),%eax
    18da:	89 04 24             	mov    %eax,(%esp)
    18dd:	e8 92 fd ff ff       	call   1674 <putc>
      }
      state = 0;
    18e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    18e9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    18ed:	8b 55 0c             	mov    0xc(%ebp),%edx
    18f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18f3:	8d 04 02             	lea    (%edx,%eax,1),%eax
    18f6:	0f b6 00             	movzbl (%eax),%eax
    18f9:	84 c0                	test   %al,%al
    18fb:	0f 85 6e fe ff ff    	jne    176f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1901:	c9                   	leave  
    1902:	c3                   	ret    
    1903:	90                   	nop

00001904 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1904:	55                   	push   %ebp
    1905:	89 e5                	mov    %esp,%ebp
    1907:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    190a:	8b 45 08             	mov    0x8(%ebp),%eax
    190d:	83 e8 08             	sub    $0x8,%eax
    1910:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1913:	a1 e8 1d 00 00       	mov    0x1de8,%eax
    1918:	89 45 fc             	mov    %eax,-0x4(%ebp)
    191b:	eb 24                	jmp    1941 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    191d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1920:	8b 00                	mov    (%eax),%eax
    1922:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1925:	77 12                	ja     1939 <free+0x35>
    1927:	8b 45 f8             	mov    -0x8(%ebp),%eax
    192a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    192d:	77 24                	ja     1953 <free+0x4f>
    192f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1932:	8b 00                	mov    (%eax),%eax
    1934:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1937:	77 1a                	ja     1953 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1939:	8b 45 fc             	mov    -0x4(%ebp),%eax
    193c:	8b 00                	mov    (%eax),%eax
    193e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1941:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1944:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1947:	76 d4                	jbe    191d <free+0x19>
    1949:	8b 45 fc             	mov    -0x4(%ebp),%eax
    194c:	8b 00                	mov    (%eax),%eax
    194e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1951:	76 ca                	jbe    191d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1953:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1956:	8b 40 04             	mov    0x4(%eax),%eax
    1959:	c1 e0 03             	shl    $0x3,%eax
    195c:	89 c2                	mov    %eax,%edx
    195e:	03 55 f8             	add    -0x8(%ebp),%edx
    1961:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1964:	8b 00                	mov    (%eax),%eax
    1966:	39 c2                	cmp    %eax,%edx
    1968:	75 24                	jne    198e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    196a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    196d:	8b 50 04             	mov    0x4(%eax),%edx
    1970:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1973:	8b 00                	mov    (%eax),%eax
    1975:	8b 40 04             	mov    0x4(%eax),%eax
    1978:	01 c2                	add    %eax,%edx
    197a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    197d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1980:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1983:	8b 00                	mov    (%eax),%eax
    1985:	8b 10                	mov    (%eax),%edx
    1987:	8b 45 f8             	mov    -0x8(%ebp),%eax
    198a:	89 10                	mov    %edx,(%eax)
    198c:	eb 0a                	jmp    1998 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    198e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1991:	8b 10                	mov    (%eax),%edx
    1993:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1996:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1998:	8b 45 fc             	mov    -0x4(%ebp),%eax
    199b:	8b 40 04             	mov    0x4(%eax),%eax
    199e:	c1 e0 03             	shl    $0x3,%eax
    19a1:	03 45 fc             	add    -0x4(%ebp),%eax
    19a4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19a7:	75 20                	jne    19c9 <free+0xc5>
    p->s.size += bp->s.size;
    19a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ac:	8b 50 04             	mov    0x4(%eax),%edx
    19af:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19b2:	8b 40 04             	mov    0x4(%eax),%eax
    19b5:	01 c2                	add    %eax,%edx
    19b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19ba:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    19bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19c0:	8b 10                	mov    (%eax),%edx
    19c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19c5:	89 10                	mov    %edx,(%eax)
    19c7:	eb 08                	jmp    19d1 <free+0xcd>
  } else
    p->s.ptr = bp;
    19c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19cc:	8b 55 f8             	mov    -0x8(%ebp),%edx
    19cf:	89 10                	mov    %edx,(%eax)
  freep = p;
    19d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19d4:	a3 e8 1d 00 00       	mov    %eax,0x1de8
}
    19d9:	c9                   	leave  
    19da:	c3                   	ret    

000019db <morecore>:

static Header*
morecore(uint nu)
{
    19db:	55                   	push   %ebp
    19dc:	89 e5                	mov    %esp,%ebp
    19de:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    19e1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    19e8:	77 07                	ja     19f1 <morecore+0x16>
    nu = 4096;
    19ea:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    19f1:	8b 45 08             	mov    0x8(%ebp),%eax
    19f4:	c1 e0 03             	shl    $0x3,%eax
    19f7:	89 04 24             	mov    %eax,(%esp)
    19fa:	e8 3d fc ff ff       	call   163c <sbrk>
    19ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1a02:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1a06:	75 07                	jne    1a0f <morecore+0x34>
    return 0;
    1a08:	b8 00 00 00 00       	mov    $0x0,%eax
    1a0d:	eb 22                	jmp    1a31 <morecore+0x56>
  hp = (Header*)p;
    1a0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a12:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a18:	8b 55 08             	mov    0x8(%ebp),%edx
    1a1b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a21:	83 c0 08             	add    $0x8,%eax
    1a24:	89 04 24             	mov    %eax,(%esp)
    1a27:	e8 d8 fe ff ff       	call   1904 <free>
  return freep;
    1a2c:	a1 e8 1d 00 00       	mov    0x1de8,%eax
}
    1a31:	c9                   	leave  
    1a32:	c3                   	ret    

00001a33 <malloc>:

void*
malloc(uint nbytes)
{
    1a33:	55                   	push   %ebp
    1a34:	89 e5                	mov    %esp,%ebp
    1a36:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a39:	8b 45 08             	mov    0x8(%ebp),%eax
    1a3c:	83 c0 07             	add    $0x7,%eax
    1a3f:	c1 e8 03             	shr    $0x3,%eax
    1a42:	83 c0 01             	add    $0x1,%eax
    1a45:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1a48:	a1 e8 1d 00 00       	mov    0x1de8,%eax
    1a4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a50:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a54:	75 23                	jne    1a79 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1a56:	c7 45 f0 e0 1d 00 00 	movl   $0x1de0,-0x10(%ebp)
    1a5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a60:	a3 e8 1d 00 00       	mov    %eax,0x1de8
    1a65:	a1 e8 1d 00 00       	mov    0x1de8,%eax
    1a6a:	a3 e0 1d 00 00       	mov    %eax,0x1de0
    base.s.size = 0;
    1a6f:	c7 05 e4 1d 00 00 00 	movl   $0x0,0x1de4
    1a76:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a7c:	8b 00                	mov    (%eax),%eax
    1a7e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1a81:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a84:	8b 40 04             	mov    0x4(%eax),%eax
    1a87:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a8a:	72 4d                	jb     1ad9 <malloc+0xa6>
      if(p->s.size == nunits)
    1a8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a8f:	8b 40 04             	mov    0x4(%eax),%eax
    1a92:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a95:	75 0c                	jne    1aa3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1a97:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a9a:	8b 10                	mov    (%eax),%edx
    1a9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a9f:	89 10                	mov    %edx,(%eax)
    1aa1:	eb 26                	jmp    1ac9 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1aa3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aa6:	8b 40 04             	mov    0x4(%eax),%eax
    1aa9:	89 c2                	mov    %eax,%edx
    1aab:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1aae:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ab1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1ab4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ab7:	8b 40 04             	mov    0x4(%eax),%eax
    1aba:	c1 e0 03             	shl    $0x3,%eax
    1abd:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1ac0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ac3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ac6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1ac9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1acc:	a3 e8 1d 00 00       	mov    %eax,0x1de8
      return (void*)(p + 1);
    1ad1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ad4:	83 c0 08             	add    $0x8,%eax
    1ad7:	eb 38                	jmp    1b11 <malloc+0xde>
    }
    if(p == freep)
    1ad9:	a1 e8 1d 00 00       	mov    0x1de8,%eax
    1ade:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1ae1:	75 1b                	jne    1afe <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ae6:	89 04 24             	mov    %eax,(%esp)
    1ae9:	e8 ed fe ff ff       	call   19db <morecore>
    1aee:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1af1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1af5:	75 07                	jne    1afe <malloc+0xcb>
        return 0;
    1af7:	b8 00 00 00 00       	mov    $0x0,%eax
    1afc:	eb 13                	jmp    1b11 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1afe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b01:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b04:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b07:	8b 00                	mov    (%eax),%eax
    1b09:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1b0c:	e9 70 ff ff ff       	jmp    1a81 <malloc+0x4e>
}
    1b11:	c9                   	leave  
    1b12:	c3                   	ret    
    1b13:	90                   	nop

00001b14 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1b14:	55                   	push   %ebp
    1b15:	89 e5                	mov    %esp,%ebp
    1b17:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1b1a:	8b 55 08             	mov    0x8(%ebp),%edx
    1b1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b20:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b23:	f0 87 02             	lock xchg %eax,(%edx)
    1b26:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1b29:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1b2c:	c9                   	leave  
    1b2d:	c3                   	ret    

00001b2e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1b2e:	55                   	push   %ebp
    1b2f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1b31:	8b 45 08             	mov    0x8(%ebp),%eax
    1b34:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1b3a:	5d                   	pop    %ebp
    1b3b:	c3                   	ret    

00001b3c <lock_acquire>:
void lock_acquire(lock_t *lock){
    1b3c:	55                   	push   %ebp
    1b3d:	89 e5                	mov    %esp,%ebp
    1b3f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1b42:	8b 45 08             	mov    0x8(%ebp),%eax
    1b45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1b4c:	00 
    1b4d:	89 04 24             	mov    %eax,(%esp)
    1b50:	e8 bf ff ff ff       	call   1b14 <xchg>
    1b55:	85 c0                	test   %eax,%eax
    1b57:	75 e9                	jne    1b42 <lock_acquire+0x6>
}
    1b59:	c9                   	leave  
    1b5a:	c3                   	ret    

00001b5b <lock_release>:
void lock_release(lock_t *lock){
    1b5b:	55                   	push   %ebp
    1b5c:	89 e5                	mov    %esp,%ebp
    1b5e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1b61:	8b 45 08             	mov    0x8(%ebp),%eax
    1b64:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b6b:	00 
    1b6c:	89 04 24             	mov    %eax,(%esp)
    1b6f:	e8 a0 ff ff ff       	call   1b14 <xchg>
}
    1b74:	c9                   	leave  
    1b75:	c3                   	ret    

00001b76 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1b76:	55                   	push   %ebp
    1b77:	89 e5                	mov    %esp,%ebp
    1b79:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1b7c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1b83:	e8 ab fe ff ff       	call   1a33 <malloc>
    1b88:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1b8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b94:	25 ff 0f 00 00       	and    $0xfff,%eax
    1b99:	85 c0                	test   %eax,%eax
    1b9b:	74 15                	je     1bb2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1b9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ba0:	89 c2                	mov    %eax,%edx
    1ba2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1ba8:	b8 00 10 00 00       	mov    $0x1000,%eax
    1bad:	29 d0                	sub    %edx,%eax
    1baf:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1bb2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1bb6:	75 1b                	jne    1bd3 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1bb8:	c7 44 24 04 99 1d 00 	movl   $0x1d99,0x4(%esp)
    1bbf:	00 
    1bc0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bc7:	e8 81 fb ff ff       	call   174d <printf>
        return 0;
    1bcc:	b8 00 00 00 00       	mov    $0x0,%eax
    1bd1:	eb 6f                	jmp    1c42 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1bd3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1bd6:	8b 55 08             	mov    0x8(%ebp),%edx
    1bd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bdc:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1be0:	89 54 24 08          	mov    %edx,0x8(%esp)
    1be4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1beb:	00 
    1bec:	89 04 24             	mov    %eax,(%esp)
    1bef:	e8 60 fa ff ff       	call   1654 <clone>
    1bf4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1bf7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1bfb:	79 1b                	jns    1c18 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1bfd:	c7 44 24 04 a7 1d 00 	movl   $0x1da7,0x4(%esp)
    1c04:	00 
    1c05:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c0c:	e8 3c fb ff ff       	call   174d <printf>
        return 0;
    1c11:	b8 00 00 00 00       	mov    $0x0,%eax
    1c16:	eb 2a                	jmp    1c42 <thread_create+0xcc>
    }
    if(tid > 0){
    1c18:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c1c:	7e 05                	jle    1c23 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1c1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c21:	eb 1f                	jmp    1c42 <thread_create+0xcc>
    }
    if(tid == 0){
    1c23:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c27:	75 14                	jne    1c3d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1c29:	c7 44 24 04 b4 1d 00 	movl   $0x1db4,0x4(%esp)
    1c30:	00 
    1c31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c38:	e8 10 fb ff ff       	call   174d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1c3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c42:	c9                   	leave  
    1c43:	c3                   	ret    

00001c44 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1c44:	55                   	push   %ebp
    1c45:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1c47:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1c50:	8b 45 08             	mov    0x8(%ebp),%eax
    1c53:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1c5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c5d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1c64:	5d                   	pop    %ebp
    1c65:	c3                   	ret    

00001c66 <add_q>:

void add_q(struct queue *q, int v){
    1c66:	55                   	push   %ebp
    1c67:	89 e5                	mov    %esp,%ebp
    1c69:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1c6c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1c73:	e8 bb fd ff ff       	call   1a33 <malloc>
    1c78:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c7e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c88:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c8b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1c8d:	8b 45 08             	mov    0x8(%ebp),%eax
    1c90:	8b 40 04             	mov    0x4(%eax),%eax
    1c93:	85 c0                	test   %eax,%eax
    1c95:	75 0b                	jne    1ca2 <add_q+0x3c>
        q->head = n;
    1c97:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c9d:	89 50 04             	mov    %edx,0x4(%eax)
    1ca0:	eb 0c                	jmp    1cae <add_q+0x48>
    }else{
        q->tail->next = n;
    1ca2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca5:	8b 40 08             	mov    0x8(%eax),%eax
    1ca8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cab:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1cae:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cb4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1cb7:	8b 45 08             	mov    0x8(%ebp),%eax
    1cba:	8b 00                	mov    (%eax),%eax
    1cbc:	8d 50 01             	lea    0x1(%eax),%edx
    1cbf:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc2:	89 10                	mov    %edx,(%eax)
}
    1cc4:	c9                   	leave  
    1cc5:	c3                   	ret    

00001cc6 <empty_q>:

int empty_q(struct queue *q){
    1cc6:	55                   	push   %ebp
    1cc7:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1cc9:	8b 45 08             	mov    0x8(%ebp),%eax
    1ccc:	8b 00                	mov    (%eax),%eax
    1cce:	85 c0                	test   %eax,%eax
    1cd0:	75 07                	jne    1cd9 <empty_q+0x13>
        return 1;
    1cd2:	b8 01 00 00 00       	mov    $0x1,%eax
    1cd7:	eb 05                	jmp    1cde <empty_q+0x18>
    else
        return 0;
    1cd9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1cde:	5d                   	pop    %ebp
    1cdf:	c3                   	ret    

00001ce0 <pop_q>:
int pop_q(struct queue *q){
    1ce0:	55                   	push   %ebp
    1ce1:	89 e5                	mov    %esp,%ebp
    1ce3:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1ce6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce9:	89 04 24             	mov    %eax,(%esp)
    1cec:	e8 d5 ff ff ff       	call   1cc6 <empty_q>
    1cf1:	85 c0                	test   %eax,%eax
    1cf3:	75 5d                	jne    1d52 <pop_q+0x72>
       val = q->head->value; 
    1cf5:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf8:	8b 40 04             	mov    0x4(%eax),%eax
    1cfb:	8b 00                	mov    (%eax),%eax
    1cfd:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1d00:	8b 45 08             	mov    0x8(%ebp),%eax
    1d03:	8b 40 04             	mov    0x4(%eax),%eax
    1d06:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1d09:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0c:	8b 40 04             	mov    0x4(%eax),%eax
    1d0f:	8b 50 04             	mov    0x4(%eax),%edx
    1d12:	8b 45 08             	mov    0x8(%ebp),%eax
    1d15:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d1b:	89 04 24             	mov    %eax,(%esp)
    1d1e:	e8 e1 fb ff ff       	call   1904 <free>
       q->size--;
    1d23:	8b 45 08             	mov    0x8(%ebp),%eax
    1d26:	8b 00                	mov    (%eax),%eax
    1d28:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d2b:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1d30:	8b 45 08             	mov    0x8(%ebp),%eax
    1d33:	8b 00                	mov    (%eax),%eax
    1d35:	85 c0                	test   %eax,%eax
    1d37:	75 14                	jne    1d4d <pop_q+0x6d>
            q->head = 0;
    1d39:	8b 45 08             	mov    0x8(%ebp),%eax
    1d3c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1d43:	8b 45 08             	mov    0x8(%ebp),%eax
    1d46:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1d4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d50:	eb 05                	jmp    1d57 <pop_q+0x77>
    }
    return -1;
    1d52:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1d57:	c9                   	leave  
    1d58:	c3                   	ret    
