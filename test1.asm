
_test1:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

int n = 1;

void test_func(void *arg_ptr);

int main(int argc, char *argv[]){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 20             	sub    $0x20,%esp


   int pid = fork();
    1009:	e8 de 04 00 00       	call   14ec <fork>
    100e:	89 44 24 14          	mov    %eax,0x14(%esp)
    if(pid == 0){
    1012:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
    1017:	0f 85 43 01 00 00    	jne    1160 <main+0x160>
        void *tid = thread_create(test_func,(void *)0);
    101d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1024:	00 
    1025:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    102c:	e8 85 0a 00 00       	call   1ab6 <thread_create>
    1031:	89 44 24 18          	mov    %eax,0x18(%esp)
         if(tid == 0){
    1035:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    103a:	75 19                	jne    1055 <main+0x55>
            printf(1,"thread_create fails\n");
    103c:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    1043:	00 
    1044:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    104b:	e8 3d 06 00 00       	call   168d <printf>
            exit();
    1050:	e8 9f 04 00 00       	call   14f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
    1055:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    105c:	00 
    105d:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    1064:	e8 4d 0a 00 00       	call   1ab6 <thread_create>
    1069:	89 44 24 18          	mov    %eax,0x18(%esp)
        if(tid == 0){
    106d:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    1072:	75 19                	jne    108d <main+0x8d>
            printf(1,"thread_create fails\n");
    1074:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    107b:	00 
    107c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1083:	e8 05 06 00 00       	call   168d <printf>
            exit();
    1088:	e8 67 04 00 00       	call   14f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
    108d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1094:	00 
    1095:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    109c:	e8 15 0a 00 00       	call   1ab6 <thread_create>
    10a1:	89 44 24 18          	mov    %eax,0x18(%esp)
         if(tid == 0){
    10a5:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    10aa:	75 19                	jne    10c5 <main+0xc5>
            printf(1,"thread_create fails\n");
    10ac:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    10b3:	00 
    10b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10bb:	e8 cd 05 00 00       	call   168d <printf>
            exit();
    10c0:	e8 2f 04 00 00       	call   14f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
    10c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10cc:	00 
    10cd:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    10d4:	e8 dd 09 00 00       	call   1ab6 <thread_create>
    10d9:	89 44 24 18          	mov    %eax,0x18(%esp)
          if(tid == 0){
    10dd:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    10e2:	75 19                	jne    10fd <main+0xfd>
            printf(1,"thread_create fails\n");
    10e4:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    10eb:	00 
    10ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10f3:	e8 95 05 00 00       	call   168d <printf>
            exit();
    10f8:	e8 f7 03 00 00       	call   14f4 <exit>
        }
       tid = thread_create(test_func,(void *)0);
    10fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1104:	00 
    1105:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    110c:	e8 a5 09 00 00       	call   1ab6 <thread_create>
    1111:	89 44 24 18          	mov    %eax,0x18(%esp)
           if(tid == 0){
    1115:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    111a:	75 19                	jne    1135 <main+0x135>
            printf(1,"thread_create fails\n");
    111c:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    1123:	00 
    1124:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    112b:	e8 5d 05 00 00       	call   168d <printf>
            exit();
    1130:	e8 bf 03 00 00       	call   14f4 <exit>
        }
      while(wait()>=0);
    1135:	e8 c2 03 00 00       	call   14fc <wait>
    113a:	85 c0                	test   %eax,%eax
    113c:	79 f7                	jns    1135 <main+0x135>
        printf(1,"I am child, [6] n = %d\n",n);
    113e:	a1 14 1d 00 00       	mov    0x1d14,%eax
    1143:	89 44 24 08          	mov    %eax,0x8(%esp)
    1147:	c7 44 24 04 ae 1c 00 	movl   $0x1cae,0x4(%esp)
    114e:	00 
    114f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1156:	e8 32 05 00 00       	call   168d <printf>
    115b:	e9 11 01 00 00       	jmp    1271 <main+0x271>
    }else if(pid > 0){
    1160:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
    1165:	0f 8e 06 01 00 00    	jle    1271 <main+0x271>
        void *tid = thread_create(test_func,(void *)0);
    116b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1172:	00 
    1173:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    117a:	e8 37 09 00 00       	call   1ab6 <thread_create>
    117f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
    1183:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    1188:	75 19                	jne    11a3 <main+0x1a3>
            printf(1,"thread_create fails\n");
    118a:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    1191:	00 
    1192:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1199:	e8 ef 04 00 00       	call   168d <printf>
            exit();
    119e:	e8 51 03 00 00       	call   14f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
    11a3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11aa:	00 
    11ab:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    11b2:	e8 ff 08 00 00       	call   1ab6 <thread_create>
    11b7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
    11bb:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    11c0:	75 19                	jne    11db <main+0x1db>
            printf(1,"thread_create fails\n");
    11c2:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    11c9:	00 
    11ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d1:	e8 b7 04 00 00       	call   168d <printf>
            exit();
    11d6:	e8 19 03 00 00       	call   14f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
    11db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11e2:	00 
    11e3:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    11ea:	e8 c7 08 00 00       	call   1ab6 <thread_create>
    11ef:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
    11f3:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    11f8:	75 19                	jne    1213 <main+0x213>
            printf(1,"thread_create fails\n");
    11fa:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    1201:	00 
    1202:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1209:	e8 7f 04 00 00       	call   168d <printf>
            exit();
    120e:	e8 e1 02 00 00       	call   14f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
    1213:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    121a:	00 
    121b:	c7 04 24 76 12 00 00 	movl   $0x1276,(%esp)
    1222:	e8 8f 08 00 00       	call   1ab6 <thread_create>
    1227:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
    122b:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    1230:	75 19                	jne    124b <main+0x24b>
            printf(1,"thread_create fails\n");
    1232:	c7 44 24 04 99 1c 00 	movl   $0x1c99,0x4(%esp)
    1239:	00 
    123a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1241:	e8 47 04 00 00       	call   168d <printf>
            exit();
    1246:	e8 a9 02 00 00       	call   14f4 <exit>
        }
        while(wait()>=0);
    124b:	e8 ac 02 00 00       	call   14fc <wait>
    1250:	85 c0                	test   %eax,%eax
    1252:	79 f7                	jns    124b <main+0x24b>
        printf(1,"I am parent, [5] n = %d\n",n);
    1254:	a1 14 1d 00 00       	mov    0x1d14,%eax
    1259:	89 44 24 08          	mov    %eax,0x8(%esp)
    125d:	c7 44 24 04 c6 1c 00 	movl   $0x1cc6,0x4(%esp)
    1264:	00 
    1265:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    126c:	e8 1c 04 00 00       	call   168d <printf>
    }

   exit();
    1271:	e8 7e 02 00 00       	call   14f4 <exit>

00001276 <test_func>:
}

void test_func(void *arg_ptr){
    1276:	55                   	push   %ebp
    1277:	89 e5                	mov    %esp,%ebp
    1279:	83 ec 08             	sub    $0x8,%esp
//    printf(1,"\n n = %d\n",n);
    n++;
    127c:	a1 14 1d 00 00       	mov    0x1d14,%eax
    1281:	83 c0 01             	add    $0x1,%eax
    1284:	a3 14 1d 00 00       	mov    %eax,0x1d14
   // printf(1,"after increase by 1 , n = %d\n\n",n);
    texit();
    1289:	e8 0e 03 00 00       	call   159c <texit>
    128e:	90                   	nop
    128f:	90                   	nop

00001290 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1295:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1298:	8b 55 10             	mov    0x10(%ebp),%edx
    129b:	8b 45 0c             	mov    0xc(%ebp),%eax
    129e:	89 cb                	mov    %ecx,%ebx
    12a0:	89 df                	mov    %ebx,%edi
    12a2:	89 d1                	mov    %edx,%ecx
    12a4:	fc                   	cld    
    12a5:	f3 aa                	rep stos %al,%es:(%edi)
    12a7:	89 ca                	mov    %ecx,%edx
    12a9:	89 fb                	mov    %edi,%ebx
    12ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
    12ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    12b1:	5b                   	pop    %ebx
    12b2:	5f                   	pop    %edi
    12b3:	5d                   	pop    %ebp
    12b4:	c3                   	ret    

000012b5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    12b5:	55                   	push   %ebp
    12b6:	89 e5                	mov    %esp,%ebp
    12b8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    12bb:	8b 45 08             	mov    0x8(%ebp),%eax
    12be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    12c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12c4:	0f b6 10             	movzbl (%eax),%edx
    12c7:	8b 45 08             	mov    0x8(%ebp),%eax
    12ca:	88 10                	mov    %dl,(%eax)
    12cc:	8b 45 08             	mov    0x8(%ebp),%eax
    12cf:	0f b6 00             	movzbl (%eax),%eax
    12d2:	84 c0                	test   %al,%al
    12d4:	0f 95 c0             	setne  %al
    12d7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12db:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    12df:	84 c0                	test   %al,%al
    12e1:	75 de                	jne    12c1 <strcpy+0xc>
    ;
  return os;
    12e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    12e6:	c9                   	leave  
    12e7:	c3                   	ret    

000012e8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    12e8:	55                   	push   %ebp
    12e9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    12eb:	eb 08                	jmp    12f5 <strcmp+0xd>
    p++, q++;
    12ed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    12f1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    12f5:	8b 45 08             	mov    0x8(%ebp),%eax
    12f8:	0f b6 00             	movzbl (%eax),%eax
    12fb:	84 c0                	test   %al,%al
    12fd:	74 10                	je     130f <strcmp+0x27>
    12ff:	8b 45 08             	mov    0x8(%ebp),%eax
    1302:	0f b6 10             	movzbl (%eax),%edx
    1305:	8b 45 0c             	mov    0xc(%ebp),%eax
    1308:	0f b6 00             	movzbl (%eax),%eax
    130b:	38 c2                	cmp    %al,%dl
    130d:	74 de                	je     12ed <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    130f:	8b 45 08             	mov    0x8(%ebp),%eax
    1312:	0f b6 00             	movzbl (%eax),%eax
    1315:	0f b6 d0             	movzbl %al,%edx
    1318:	8b 45 0c             	mov    0xc(%ebp),%eax
    131b:	0f b6 00             	movzbl (%eax),%eax
    131e:	0f b6 c0             	movzbl %al,%eax
    1321:	89 d1                	mov    %edx,%ecx
    1323:	29 c1                	sub    %eax,%ecx
    1325:	89 c8                	mov    %ecx,%eax
}
    1327:	5d                   	pop    %ebp
    1328:	c3                   	ret    

00001329 <strlen>:

uint
strlen(char *s)
{
    1329:	55                   	push   %ebp
    132a:	89 e5                	mov    %esp,%ebp
    132c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    132f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1336:	eb 04                	jmp    133c <strlen+0x13>
    1338:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    133c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    133f:	03 45 08             	add    0x8(%ebp),%eax
    1342:	0f b6 00             	movzbl (%eax),%eax
    1345:	84 c0                	test   %al,%al
    1347:	75 ef                	jne    1338 <strlen+0xf>
    ;
  return n;
    1349:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    134c:	c9                   	leave  
    134d:	c3                   	ret    

0000134e <memset>:

void*
memset(void *dst, int c, uint n)
{
    134e:	55                   	push   %ebp
    134f:	89 e5                	mov    %esp,%ebp
    1351:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1354:	8b 45 10             	mov    0x10(%ebp),%eax
    1357:	89 44 24 08          	mov    %eax,0x8(%esp)
    135b:	8b 45 0c             	mov    0xc(%ebp),%eax
    135e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1362:	8b 45 08             	mov    0x8(%ebp),%eax
    1365:	89 04 24             	mov    %eax,(%esp)
    1368:	e8 23 ff ff ff       	call   1290 <stosb>
  return dst;
    136d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1370:	c9                   	leave  
    1371:	c3                   	ret    

00001372 <strchr>:

char*
strchr(const char *s, char c)
{
    1372:	55                   	push   %ebp
    1373:	89 e5                	mov    %esp,%ebp
    1375:	83 ec 04             	sub    $0x4,%esp
    1378:	8b 45 0c             	mov    0xc(%ebp),%eax
    137b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    137e:	eb 14                	jmp    1394 <strchr+0x22>
    if(*s == c)
    1380:	8b 45 08             	mov    0x8(%ebp),%eax
    1383:	0f b6 00             	movzbl (%eax),%eax
    1386:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1389:	75 05                	jne    1390 <strchr+0x1e>
      return (char*)s;
    138b:	8b 45 08             	mov    0x8(%ebp),%eax
    138e:	eb 13                	jmp    13a3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1390:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1394:	8b 45 08             	mov    0x8(%ebp),%eax
    1397:	0f b6 00             	movzbl (%eax),%eax
    139a:	84 c0                	test   %al,%al
    139c:	75 e2                	jne    1380 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    139e:	b8 00 00 00 00       	mov    $0x0,%eax
}
    13a3:	c9                   	leave  
    13a4:	c3                   	ret    

000013a5 <gets>:

char*
gets(char *buf, int max)
{
    13a5:	55                   	push   %ebp
    13a6:	89 e5                	mov    %esp,%ebp
    13a8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    13ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    13b2:	eb 44                	jmp    13f8 <gets+0x53>
    cc = read(0, &c, 1);
    13b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13bb:	00 
    13bc:	8d 45 ef             	lea    -0x11(%ebp),%eax
    13bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    13c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13ca:	e8 3d 01 00 00       	call   150c <read>
    13cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    13d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13d6:	7e 2d                	jle    1405 <gets+0x60>
      break;
    buf[i++] = c;
    13d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13db:	03 45 08             	add    0x8(%ebp),%eax
    13de:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    13e2:	88 10                	mov    %dl,(%eax)
    13e4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    13e8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    13ec:	3c 0a                	cmp    $0xa,%al
    13ee:	74 16                	je     1406 <gets+0x61>
    13f0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    13f4:	3c 0d                	cmp    $0xd,%al
    13f6:	74 0e                	je     1406 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    13f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13fb:	83 c0 01             	add    $0x1,%eax
    13fe:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1401:	7c b1                	jl     13b4 <gets+0xf>
    1403:	eb 01                	jmp    1406 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1405:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1406:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1409:	03 45 08             	add    0x8(%ebp),%eax
    140c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    140f:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1412:	c9                   	leave  
    1413:	c3                   	ret    

00001414 <stat>:

int
stat(char *n, struct stat *st)
{
    1414:	55                   	push   %ebp
    1415:	89 e5                	mov    %esp,%ebp
    1417:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    141a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1421:	00 
    1422:	8b 45 08             	mov    0x8(%ebp),%eax
    1425:	89 04 24             	mov    %eax,(%esp)
    1428:	e8 07 01 00 00       	call   1534 <open>
    142d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1430:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1434:	79 07                	jns    143d <stat+0x29>
    return -1;
    1436:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    143b:	eb 23                	jmp    1460 <stat+0x4c>
  r = fstat(fd, st);
    143d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1440:	89 44 24 04          	mov    %eax,0x4(%esp)
    1444:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1447:	89 04 24             	mov    %eax,(%esp)
    144a:	e8 fd 00 00 00       	call   154c <fstat>
    144f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1452:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1455:	89 04 24             	mov    %eax,(%esp)
    1458:	e8 bf 00 00 00       	call   151c <close>
  return r;
    145d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1460:	c9                   	leave  
    1461:	c3                   	ret    

00001462 <atoi>:

int
atoi(const char *s)
{
    1462:	55                   	push   %ebp
    1463:	89 e5                	mov    %esp,%ebp
    1465:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1468:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    146f:	eb 24                	jmp    1495 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1471:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1474:	89 d0                	mov    %edx,%eax
    1476:	c1 e0 02             	shl    $0x2,%eax
    1479:	01 d0                	add    %edx,%eax
    147b:	01 c0                	add    %eax,%eax
    147d:	89 c2                	mov    %eax,%edx
    147f:	8b 45 08             	mov    0x8(%ebp),%eax
    1482:	0f b6 00             	movzbl (%eax),%eax
    1485:	0f be c0             	movsbl %al,%eax
    1488:	8d 04 02             	lea    (%edx,%eax,1),%eax
    148b:	83 e8 30             	sub    $0x30,%eax
    148e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1491:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1495:	8b 45 08             	mov    0x8(%ebp),%eax
    1498:	0f b6 00             	movzbl (%eax),%eax
    149b:	3c 2f                	cmp    $0x2f,%al
    149d:	7e 0a                	jle    14a9 <atoi+0x47>
    149f:	8b 45 08             	mov    0x8(%ebp),%eax
    14a2:	0f b6 00             	movzbl (%eax),%eax
    14a5:	3c 39                	cmp    $0x39,%al
    14a7:	7e c8                	jle    1471 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    14a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    14ac:	c9                   	leave  
    14ad:	c3                   	ret    

000014ae <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    14ae:	55                   	push   %ebp
    14af:	89 e5                	mov    %esp,%ebp
    14b1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    14b4:	8b 45 08             	mov    0x8(%ebp),%eax
    14b7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    14ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    14bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    14c0:	eb 13                	jmp    14d5 <memmove+0x27>
    *dst++ = *src++;
    14c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14c5:	0f b6 10             	movzbl (%eax),%edx
    14c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14cb:	88 10                	mov    %dl,(%eax)
    14cd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    14d1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    14d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    14d9:	0f 9f c0             	setg   %al
    14dc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    14e0:	84 c0                	test   %al,%al
    14e2:	75 de                	jne    14c2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    14e4:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14e7:	c9                   	leave  
    14e8:	c3                   	ret    
    14e9:	90                   	nop
    14ea:	90                   	nop
    14eb:	90                   	nop

000014ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    14ec:	b8 01 00 00 00       	mov    $0x1,%eax
    14f1:	cd 40                	int    $0x40
    14f3:	c3                   	ret    

000014f4 <exit>:
SYSCALL(exit)
    14f4:	b8 02 00 00 00       	mov    $0x2,%eax
    14f9:	cd 40                	int    $0x40
    14fb:	c3                   	ret    

000014fc <wait>:
SYSCALL(wait)
    14fc:	b8 03 00 00 00       	mov    $0x3,%eax
    1501:	cd 40                	int    $0x40
    1503:	c3                   	ret    

00001504 <pipe>:
SYSCALL(pipe)
    1504:	b8 04 00 00 00       	mov    $0x4,%eax
    1509:	cd 40                	int    $0x40
    150b:	c3                   	ret    

0000150c <read>:
SYSCALL(read)
    150c:	b8 05 00 00 00       	mov    $0x5,%eax
    1511:	cd 40                	int    $0x40
    1513:	c3                   	ret    

00001514 <write>:
SYSCALL(write)
    1514:	b8 10 00 00 00       	mov    $0x10,%eax
    1519:	cd 40                	int    $0x40
    151b:	c3                   	ret    

0000151c <close>:
SYSCALL(close)
    151c:	b8 15 00 00 00       	mov    $0x15,%eax
    1521:	cd 40                	int    $0x40
    1523:	c3                   	ret    

00001524 <kill>:
SYSCALL(kill)
    1524:	b8 06 00 00 00       	mov    $0x6,%eax
    1529:	cd 40                	int    $0x40
    152b:	c3                   	ret    

0000152c <exec>:
SYSCALL(exec)
    152c:	b8 07 00 00 00       	mov    $0x7,%eax
    1531:	cd 40                	int    $0x40
    1533:	c3                   	ret    

00001534 <open>:
SYSCALL(open)
    1534:	b8 0f 00 00 00       	mov    $0xf,%eax
    1539:	cd 40                	int    $0x40
    153b:	c3                   	ret    

0000153c <mknod>:
SYSCALL(mknod)
    153c:	b8 11 00 00 00       	mov    $0x11,%eax
    1541:	cd 40                	int    $0x40
    1543:	c3                   	ret    

00001544 <unlink>:
SYSCALL(unlink)
    1544:	b8 12 00 00 00       	mov    $0x12,%eax
    1549:	cd 40                	int    $0x40
    154b:	c3                   	ret    

0000154c <fstat>:
SYSCALL(fstat)
    154c:	b8 08 00 00 00       	mov    $0x8,%eax
    1551:	cd 40                	int    $0x40
    1553:	c3                   	ret    

00001554 <link>:
SYSCALL(link)
    1554:	b8 13 00 00 00       	mov    $0x13,%eax
    1559:	cd 40                	int    $0x40
    155b:	c3                   	ret    

0000155c <mkdir>:
SYSCALL(mkdir)
    155c:	b8 14 00 00 00       	mov    $0x14,%eax
    1561:	cd 40                	int    $0x40
    1563:	c3                   	ret    

00001564 <chdir>:
SYSCALL(chdir)
    1564:	b8 09 00 00 00       	mov    $0x9,%eax
    1569:	cd 40                	int    $0x40
    156b:	c3                   	ret    

0000156c <dup>:
SYSCALL(dup)
    156c:	b8 0a 00 00 00       	mov    $0xa,%eax
    1571:	cd 40                	int    $0x40
    1573:	c3                   	ret    

00001574 <getpid>:
SYSCALL(getpid)
    1574:	b8 0b 00 00 00       	mov    $0xb,%eax
    1579:	cd 40                	int    $0x40
    157b:	c3                   	ret    

0000157c <sbrk>:
SYSCALL(sbrk)
    157c:	b8 0c 00 00 00       	mov    $0xc,%eax
    1581:	cd 40                	int    $0x40
    1583:	c3                   	ret    

00001584 <sleep>:
SYSCALL(sleep)
    1584:	b8 0d 00 00 00       	mov    $0xd,%eax
    1589:	cd 40                	int    $0x40
    158b:	c3                   	ret    

0000158c <uptime>:
SYSCALL(uptime)
    158c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1591:	cd 40                	int    $0x40
    1593:	c3                   	ret    

00001594 <clone>:
SYSCALL(clone)
    1594:	b8 16 00 00 00       	mov    $0x16,%eax
    1599:	cd 40                	int    $0x40
    159b:	c3                   	ret    

0000159c <texit>:
SYSCALL(texit)
    159c:	b8 17 00 00 00       	mov    $0x17,%eax
    15a1:	cd 40                	int    $0x40
    15a3:	c3                   	ret    

000015a4 <tsleep>:
SYSCALL(tsleep)
    15a4:	b8 18 00 00 00       	mov    $0x18,%eax
    15a9:	cd 40                	int    $0x40
    15ab:	c3                   	ret    

000015ac <twakeup>:
SYSCALL(twakeup)
    15ac:	b8 19 00 00 00       	mov    $0x19,%eax
    15b1:	cd 40                	int    $0x40
    15b3:	c3                   	ret    

000015b4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    15b4:	55                   	push   %ebp
    15b5:	89 e5                	mov    %esp,%ebp
    15b7:	83 ec 28             	sub    $0x28,%esp
    15ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    15bd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    15c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15c7:	00 
    15c8:	8d 45 f4             	lea    -0xc(%ebp),%eax
    15cb:	89 44 24 04          	mov    %eax,0x4(%esp)
    15cf:	8b 45 08             	mov    0x8(%ebp),%eax
    15d2:	89 04 24             	mov    %eax,(%esp)
    15d5:	e8 3a ff ff ff       	call   1514 <write>
}
    15da:	c9                   	leave  
    15db:	c3                   	ret    

000015dc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    15dc:	55                   	push   %ebp
    15dd:	89 e5                	mov    %esp,%ebp
    15df:	53                   	push   %ebx
    15e0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    15e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    15ea:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    15ee:	74 17                	je     1607 <printint+0x2b>
    15f0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    15f4:	79 11                	jns    1607 <printint+0x2b>
    neg = 1;
    15f6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    15fd:	8b 45 0c             	mov    0xc(%ebp),%eax
    1600:	f7 d8                	neg    %eax
    1602:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1605:	eb 06                	jmp    160d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1607:	8b 45 0c             	mov    0xc(%ebp),%eax
    160a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    160d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1614:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1617:	8b 5d 10             	mov    0x10(%ebp),%ebx
    161a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    161d:	ba 00 00 00 00       	mov    $0x0,%edx
    1622:	f7 f3                	div    %ebx
    1624:	89 d0                	mov    %edx,%eax
    1626:	0f b6 80 18 1d 00 00 	movzbl 0x1d18(%eax),%eax
    162d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1631:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1635:	8b 45 10             	mov    0x10(%ebp),%eax
    1638:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    163b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    163e:	ba 00 00 00 00       	mov    $0x0,%edx
    1643:	f7 75 d4             	divl   -0x2c(%ebp)
    1646:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1649:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    164d:	75 c5                	jne    1614 <printint+0x38>
  if(neg)
    164f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1653:	74 28                	je     167d <printint+0xa1>
    buf[i++] = '-';
    1655:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1658:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    165d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1661:	eb 1a                	jmp    167d <printint+0xa1>
    putc(fd, buf[i]);
    1663:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1666:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    166b:	0f be c0             	movsbl %al,%eax
    166e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1672:	8b 45 08             	mov    0x8(%ebp),%eax
    1675:	89 04 24             	mov    %eax,(%esp)
    1678:	e8 37 ff ff ff       	call   15b4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    167d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1681:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1685:	79 dc                	jns    1663 <printint+0x87>
    putc(fd, buf[i]);
}
    1687:	83 c4 44             	add    $0x44,%esp
    168a:	5b                   	pop    %ebx
    168b:	5d                   	pop    %ebp
    168c:	c3                   	ret    

0000168d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    168d:	55                   	push   %ebp
    168e:	89 e5                	mov    %esp,%ebp
    1690:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1693:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    169a:	8d 45 0c             	lea    0xc(%ebp),%eax
    169d:	83 c0 04             	add    $0x4,%eax
    16a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    16a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    16aa:	e9 7e 01 00 00       	jmp    182d <printf+0x1a0>
    c = fmt[i] & 0xff;
    16af:	8b 55 0c             	mov    0xc(%ebp),%edx
    16b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16b5:	8d 04 02             	lea    (%edx,%eax,1),%eax
    16b8:	0f b6 00             	movzbl (%eax),%eax
    16bb:	0f be c0             	movsbl %al,%eax
    16be:	25 ff 00 00 00       	and    $0xff,%eax
    16c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    16c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    16ca:	75 2c                	jne    16f8 <printf+0x6b>
      if(c == '%'){
    16cc:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    16d0:	75 0c                	jne    16de <printf+0x51>
        state = '%';
    16d2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    16d9:	e9 4b 01 00 00       	jmp    1829 <printf+0x19c>
      } else {
        putc(fd, c);
    16de:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e1:	0f be c0             	movsbl %al,%eax
    16e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    16e8:	8b 45 08             	mov    0x8(%ebp),%eax
    16eb:	89 04 24             	mov    %eax,(%esp)
    16ee:	e8 c1 fe ff ff       	call   15b4 <putc>
    16f3:	e9 31 01 00 00       	jmp    1829 <printf+0x19c>
      }
    } else if(state == '%'){
    16f8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    16fc:	0f 85 27 01 00 00    	jne    1829 <printf+0x19c>
      if(c == 'd'){
    1702:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    1706:	75 2d                	jne    1735 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1708:	8b 45 f4             	mov    -0xc(%ebp),%eax
    170b:	8b 00                	mov    (%eax),%eax
    170d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1714:	00 
    1715:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    171c:	00 
    171d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1721:	8b 45 08             	mov    0x8(%ebp),%eax
    1724:	89 04 24             	mov    %eax,(%esp)
    1727:	e8 b0 fe ff ff       	call   15dc <printint>
        ap++;
    172c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1730:	e9 ed 00 00 00       	jmp    1822 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1735:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1739:	74 06                	je     1741 <printf+0xb4>
    173b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    173f:	75 2d                	jne    176e <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1741:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1744:	8b 00                	mov    (%eax),%eax
    1746:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    174d:	00 
    174e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1755:	00 
    1756:	89 44 24 04          	mov    %eax,0x4(%esp)
    175a:	8b 45 08             	mov    0x8(%ebp),%eax
    175d:	89 04 24             	mov    %eax,(%esp)
    1760:	e8 77 fe ff ff       	call   15dc <printint>
        ap++;
    1765:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1769:	e9 b4 00 00 00       	jmp    1822 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    176e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1772:	75 46                	jne    17ba <printf+0x12d>
        s = (char*)*ap;
    1774:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1777:	8b 00                	mov    (%eax),%eax
    1779:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    177c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1780:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1784:	75 27                	jne    17ad <printf+0x120>
          s = "(null)";
    1786:	c7 45 e4 df 1c 00 00 	movl   $0x1cdf,-0x1c(%ebp)
        while(*s != 0){
    178d:	eb 1f                	jmp    17ae <printf+0x121>
          putc(fd, *s);
    178f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1792:	0f b6 00             	movzbl (%eax),%eax
    1795:	0f be c0             	movsbl %al,%eax
    1798:	89 44 24 04          	mov    %eax,0x4(%esp)
    179c:	8b 45 08             	mov    0x8(%ebp),%eax
    179f:	89 04 24             	mov    %eax,(%esp)
    17a2:	e8 0d fe ff ff       	call   15b4 <putc>
          s++;
    17a7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    17ab:	eb 01                	jmp    17ae <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    17ad:	90                   	nop
    17ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17b1:	0f b6 00             	movzbl (%eax),%eax
    17b4:	84 c0                	test   %al,%al
    17b6:	75 d7                	jne    178f <printf+0x102>
    17b8:	eb 68                	jmp    1822 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    17ba:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    17be:	75 1d                	jne    17dd <printf+0x150>
        putc(fd, *ap);
    17c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c3:	8b 00                	mov    (%eax),%eax
    17c5:	0f be c0             	movsbl %al,%eax
    17c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    17cc:	8b 45 08             	mov    0x8(%ebp),%eax
    17cf:	89 04 24             	mov    %eax,(%esp)
    17d2:	e8 dd fd ff ff       	call   15b4 <putc>
        ap++;
    17d7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    17db:	eb 45                	jmp    1822 <printf+0x195>
      } else if(c == '%'){
    17dd:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    17e1:	75 17                	jne    17fa <printf+0x16d>
        putc(fd, c);
    17e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17e6:	0f be c0             	movsbl %al,%eax
    17e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ed:	8b 45 08             	mov    0x8(%ebp),%eax
    17f0:	89 04 24             	mov    %eax,(%esp)
    17f3:	e8 bc fd ff ff       	call   15b4 <putc>
    17f8:	eb 28                	jmp    1822 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    17fa:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1801:	00 
    1802:	8b 45 08             	mov    0x8(%ebp),%eax
    1805:	89 04 24             	mov    %eax,(%esp)
    1808:	e8 a7 fd ff ff       	call   15b4 <putc>
        putc(fd, c);
    180d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1810:	0f be c0             	movsbl %al,%eax
    1813:	89 44 24 04          	mov    %eax,0x4(%esp)
    1817:	8b 45 08             	mov    0x8(%ebp),%eax
    181a:	89 04 24             	mov    %eax,(%esp)
    181d:	e8 92 fd ff ff       	call   15b4 <putc>
      }
      state = 0;
    1822:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1829:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    182d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1830:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1833:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1836:	0f b6 00             	movzbl (%eax),%eax
    1839:	84 c0                	test   %al,%al
    183b:	0f 85 6e fe ff ff    	jne    16af <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1841:	c9                   	leave  
    1842:	c3                   	ret    
    1843:	90                   	nop

00001844 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1844:	55                   	push   %ebp
    1845:	89 e5                	mov    %esp,%ebp
    1847:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    184a:	8b 45 08             	mov    0x8(%ebp),%eax
    184d:	83 e8 08             	sub    $0x8,%eax
    1850:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1853:	a1 34 1d 00 00       	mov    0x1d34,%eax
    1858:	89 45 fc             	mov    %eax,-0x4(%ebp)
    185b:	eb 24                	jmp    1881 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    185d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1860:	8b 00                	mov    (%eax),%eax
    1862:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1865:	77 12                	ja     1879 <free+0x35>
    1867:	8b 45 f8             	mov    -0x8(%ebp),%eax
    186a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    186d:	77 24                	ja     1893 <free+0x4f>
    186f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1872:	8b 00                	mov    (%eax),%eax
    1874:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1877:	77 1a                	ja     1893 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1879:	8b 45 fc             	mov    -0x4(%ebp),%eax
    187c:	8b 00                	mov    (%eax),%eax
    187e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1881:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1884:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1887:	76 d4                	jbe    185d <free+0x19>
    1889:	8b 45 fc             	mov    -0x4(%ebp),%eax
    188c:	8b 00                	mov    (%eax),%eax
    188e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1891:	76 ca                	jbe    185d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1893:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1896:	8b 40 04             	mov    0x4(%eax),%eax
    1899:	c1 e0 03             	shl    $0x3,%eax
    189c:	89 c2                	mov    %eax,%edx
    189e:	03 55 f8             	add    -0x8(%ebp),%edx
    18a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18a4:	8b 00                	mov    (%eax),%eax
    18a6:	39 c2                	cmp    %eax,%edx
    18a8:	75 24                	jne    18ce <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    18aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18ad:	8b 50 04             	mov    0x4(%eax),%edx
    18b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18b3:	8b 00                	mov    (%eax),%eax
    18b5:	8b 40 04             	mov    0x4(%eax),%eax
    18b8:	01 c2                	add    %eax,%edx
    18ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18bd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    18c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18c3:	8b 00                	mov    (%eax),%eax
    18c5:	8b 10                	mov    (%eax),%edx
    18c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18ca:	89 10                	mov    %edx,(%eax)
    18cc:	eb 0a                	jmp    18d8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    18ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18d1:	8b 10                	mov    (%eax),%edx
    18d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18d6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    18d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18db:	8b 40 04             	mov    0x4(%eax),%eax
    18de:	c1 e0 03             	shl    $0x3,%eax
    18e1:	03 45 fc             	add    -0x4(%ebp),%eax
    18e4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    18e7:	75 20                	jne    1909 <free+0xc5>
    p->s.size += bp->s.size;
    18e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18ec:	8b 50 04             	mov    0x4(%eax),%edx
    18ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    18f2:	8b 40 04             	mov    0x4(%eax),%eax
    18f5:	01 c2                	add    %eax,%edx
    18f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18fa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    18fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1900:	8b 10                	mov    (%eax),%edx
    1902:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1905:	89 10                	mov    %edx,(%eax)
    1907:	eb 08                	jmp    1911 <free+0xcd>
  } else
    p->s.ptr = bp;
    1909:	8b 45 fc             	mov    -0x4(%ebp),%eax
    190c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    190f:	89 10                	mov    %edx,(%eax)
  freep = p;
    1911:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1914:	a3 34 1d 00 00       	mov    %eax,0x1d34
}
    1919:	c9                   	leave  
    191a:	c3                   	ret    

0000191b <morecore>:

static Header*
morecore(uint nu)
{
    191b:	55                   	push   %ebp
    191c:	89 e5                	mov    %esp,%ebp
    191e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1921:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1928:	77 07                	ja     1931 <morecore+0x16>
    nu = 4096;
    192a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1931:	8b 45 08             	mov    0x8(%ebp),%eax
    1934:	c1 e0 03             	shl    $0x3,%eax
    1937:	89 04 24             	mov    %eax,(%esp)
    193a:	e8 3d fc ff ff       	call   157c <sbrk>
    193f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1942:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1946:	75 07                	jne    194f <morecore+0x34>
    return 0;
    1948:	b8 00 00 00 00       	mov    $0x0,%eax
    194d:	eb 22                	jmp    1971 <morecore+0x56>
  hp = (Header*)p;
    194f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1952:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1955:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1958:	8b 55 08             	mov    0x8(%ebp),%edx
    195b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    195e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1961:	83 c0 08             	add    $0x8,%eax
    1964:	89 04 24             	mov    %eax,(%esp)
    1967:	e8 d8 fe ff ff       	call   1844 <free>
  return freep;
    196c:	a1 34 1d 00 00       	mov    0x1d34,%eax
}
    1971:	c9                   	leave  
    1972:	c3                   	ret    

00001973 <malloc>:

void*
malloc(uint nbytes)
{
    1973:	55                   	push   %ebp
    1974:	89 e5                	mov    %esp,%ebp
    1976:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1979:	8b 45 08             	mov    0x8(%ebp),%eax
    197c:	83 c0 07             	add    $0x7,%eax
    197f:	c1 e8 03             	shr    $0x3,%eax
    1982:	83 c0 01             	add    $0x1,%eax
    1985:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1988:	a1 34 1d 00 00       	mov    0x1d34,%eax
    198d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1990:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1994:	75 23                	jne    19b9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1996:	c7 45 f0 2c 1d 00 00 	movl   $0x1d2c,-0x10(%ebp)
    199d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19a0:	a3 34 1d 00 00       	mov    %eax,0x1d34
    19a5:	a1 34 1d 00 00       	mov    0x1d34,%eax
    19aa:	a3 2c 1d 00 00       	mov    %eax,0x1d2c
    base.s.size = 0;
    19af:	c7 05 30 1d 00 00 00 	movl   $0x0,0x1d30
    19b6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    19b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19bc:	8b 00                	mov    (%eax),%eax
    19be:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    19c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19c4:	8b 40 04             	mov    0x4(%eax),%eax
    19c7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    19ca:	72 4d                	jb     1a19 <malloc+0xa6>
      if(p->s.size == nunits)
    19cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19cf:	8b 40 04             	mov    0x4(%eax),%eax
    19d2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    19d5:	75 0c                	jne    19e3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    19d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19da:	8b 10                	mov    (%eax),%edx
    19dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19df:	89 10                	mov    %edx,(%eax)
    19e1:	eb 26                	jmp    1a09 <malloc+0x96>
      else {
        p->s.size -= nunits;
    19e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19e6:	8b 40 04             	mov    0x4(%eax),%eax
    19e9:	89 c2                	mov    %eax,%edx
    19eb:	2b 55 f4             	sub    -0xc(%ebp),%edx
    19ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19f1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    19f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19f7:	8b 40 04             	mov    0x4(%eax),%eax
    19fa:	c1 e0 03             	shl    $0x3,%eax
    19fd:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1a00:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a03:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1a06:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1a09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a0c:	a3 34 1d 00 00       	mov    %eax,0x1d34
      return (void*)(p + 1);
    1a11:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a14:	83 c0 08             	add    $0x8,%eax
    1a17:	eb 38                	jmp    1a51 <malloc+0xde>
    }
    if(p == freep)
    1a19:	a1 34 1d 00 00       	mov    0x1d34,%eax
    1a1e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1a21:	75 1b                	jne    1a3e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a26:	89 04 24             	mov    %eax,(%esp)
    1a29:	e8 ed fe ff ff       	call   191b <morecore>
    1a2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1a31:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a35:	75 07                	jne    1a3e <malloc+0xcb>
        return 0;
    1a37:	b8 00 00 00 00       	mov    $0x0,%eax
    1a3c:	eb 13                	jmp    1a51 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a44:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a47:	8b 00                	mov    (%eax),%eax
    1a49:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1a4c:	e9 70 ff ff ff       	jmp    19c1 <malloc+0x4e>
}
    1a51:	c9                   	leave  
    1a52:	c3                   	ret    
    1a53:	90                   	nop

00001a54 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1a54:	55                   	push   %ebp
    1a55:	89 e5                	mov    %esp,%ebp
    1a57:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1a5a:	8b 55 08             	mov    0x8(%ebp),%edx
    1a5d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a60:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1a63:	f0 87 02             	lock xchg %eax,(%edx)
    1a66:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1a69:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1a6c:	c9                   	leave  
    1a6d:	c3                   	ret    

00001a6e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1a6e:	55                   	push   %ebp
    1a6f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1a71:	8b 45 08             	mov    0x8(%ebp),%eax
    1a74:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1a7a:	5d                   	pop    %ebp
    1a7b:	c3                   	ret    

00001a7c <lock_acquire>:
void lock_acquire(lock_t *lock){
    1a7c:	55                   	push   %ebp
    1a7d:	89 e5                	mov    %esp,%ebp
    1a7f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1a82:	8b 45 08             	mov    0x8(%ebp),%eax
    1a85:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1a8c:	00 
    1a8d:	89 04 24             	mov    %eax,(%esp)
    1a90:	e8 bf ff ff ff       	call   1a54 <xchg>
    1a95:	85 c0                	test   %eax,%eax
    1a97:	75 e9                	jne    1a82 <lock_acquire+0x6>
}
    1a99:	c9                   	leave  
    1a9a:	c3                   	ret    

00001a9b <lock_release>:
void lock_release(lock_t *lock){
    1a9b:	55                   	push   %ebp
    1a9c:	89 e5                	mov    %esp,%ebp
    1a9e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1aa1:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1aab:	00 
    1aac:	89 04 24             	mov    %eax,(%esp)
    1aaf:	e8 a0 ff ff ff       	call   1a54 <xchg>
}
    1ab4:	c9                   	leave  
    1ab5:	c3                   	ret    

00001ab6 <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1ab6:	55                   	push   %ebp
    1ab7:	89 e5                	mov    %esp,%ebp
    1ab9:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1abc:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1ac3:	e8 ab fe ff ff       	call   1973 <malloc>
    1ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1acb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ace:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ad4:	25 ff 0f 00 00       	and    $0xfff,%eax
    1ad9:	85 c0                	test   %eax,%eax
    1adb:	74 15                	je     1af2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1add:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ae0:	89 c2                	mov    %eax,%edx
    1ae2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1ae8:	b8 00 10 00 00       	mov    $0x1000,%eax
    1aed:	29 d0                	sub    %edx,%eax
    1aef:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1af2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1af6:	75 1b                	jne    1b13 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1af8:	c7 44 24 04 e6 1c 00 	movl   $0x1ce6,0x4(%esp)
    1aff:	00 
    1b00:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b07:	e8 81 fb ff ff       	call   168d <printf>
        return 0;
    1b0c:	b8 00 00 00 00       	mov    $0x0,%eax
    1b11:	eb 6f                	jmp    1b82 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1b13:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1b16:	8b 55 08             	mov    0x8(%ebp),%edx
    1b19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b1c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1b20:	89 54 24 08          	mov    %edx,0x8(%esp)
    1b24:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1b2b:	00 
    1b2c:	89 04 24             	mov    %eax,(%esp)
    1b2f:	e8 60 fa ff ff       	call   1594 <clone>
    1b34:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1b37:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b3b:	79 1b                	jns    1b58 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1b3d:	c7 44 24 04 f4 1c 00 	movl   $0x1cf4,0x4(%esp)
    1b44:	00 
    1b45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b4c:	e8 3c fb ff ff       	call   168d <printf>
        return 0;
    1b51:	b8 00 00 00 00       	mov    $0x0,%eax
    1b56:	eb 2a                	jmp    1b82 <thread_create+0xcc>
    }
    if(tid > 0){
    1b58:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b5c:	7e 05                	jle    1b63 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1b5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b61:	eb 1f                	jmp    1b82 <thread_create+0xcc>
    }
    if(tid == 0){
    1b63:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b67:	75 14                	jne    1b7d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1b69:	c7 44 24 04 01 1d 00 	movl   $0x1d01,0x4(%esp)
    1b70:	00 
    1b71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b78:	e8 10 fb ff ff       	call   168d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1b7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1b82:	c9                   	leave  
    1b83:	c3                   	ret    

00001b84 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1b84:	55                   	push   %ebp
    1b85:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1b87:	8b 45 08             	mov    0x8(%ebp),%eax
    1b8a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1b90:	8b 45 08             	mov    0x8(%ebp),%eax
    1b93:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1b9a:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1ba4:	5d                   	pop    %ebp
    1ba5:	c3                   	ret    

00001ba6 <add_q>:

void add_q(struct queue *q, int v){
    1ba6:	55                   	push   %ebp
    1ba7:	89 e5                	mov    %esp,%ebp
    1ba9:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1bac:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1bb3:	e8 bb fd ff ff       	call   1973 <malloc>
    1bb8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bbe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc8:	8b 55 0c             	mov    0xc(%ebp),%edx
    1bcb:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1bcd:	8b 45 08             	mov    0x8(%ebp),%eax
    1bd0:	8b 40 04             	mov    0x4(%eax),%eax
    1bd3:	85 c0                	test   %eax,%eax
    1bd5:	75 0b                	jne    1be2 <add_q+0x3c>
        q->head = n;
    1bd7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bda:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bdd:	89 50 04             	mov    %edx,0x4(%eax)
    1be0:	eb 0c                	jmp    1bee <add_q+0x48>
    }else{
        q->tail->next = n;
    1be2:	8b 45 08             	mov    0x8(%ebp),%eax
    1be5:	8b 40 08             	mov    0x8(%eax),%eax
    1be8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1beb:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1bee:	8b 45 08             	mov    0x8(%ebp),%eax
    1bf1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bf4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1bf7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfa:	8b 00                	mov    (%eax),%eax
    1bfc:	8d 50 01             	lea    0x1(%eax),%edx
    1bff:	8b 45 08             	mov    0x8(%ebp),%eax
    1c02:	89 10                	mov    %edx,(%eax)
}
    1c04:	c9                   	leave  
    1c05:	c3                   	ret    

00001c06 <empty_q>:

int empty_q(struct queue *q){
    1c06:	55                   	push   %ebp
    1c07:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1c09:	8b 45 08             	mov    0x8(%ebp),%eax
    1c0c:	8b 00                	mov    (%eax),%eax
    1c0e:	85 c0                	test   %eax,%eax
    1c10:	75 07                	jne    1c19 <empty_q+0x13>
        return 1;
    1c12:	b8 01 00 00 00       	mov    $0x1,%eax
    1c17:	eb 05                	jmp    1c1e <empty_q+0x18>
    else
        return 0;
    1c19:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1c1e:	5d                   	pop    %ebp
    1c1f:	c3                   	ret    

00001c20 <pop_q>:
int pop_q(struct queue *q){
    1c20:	55                   	push   %ebp
    1c21:	89 e5                	mov    %esp,%ebp
    1c23:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1c26:	8b 45 08             	mov    0x8(%ebp),%eax
    1c29:	89 04 24             	mov    %eax,(%esp)
    1c2c:	e8 d5 ff ff ff       	call   1c06 <empty_q>
    1c31:	85 c0                	test   %eax,%eax
    1c33:	75 5d                	jne    1c92 <pop_q+0x72>
       val = q->head->value; 
    1c35:	8b 45 08             	mov    0x8(%ebp),%eax
    1c38:	8b 40 04             	mov    0x4(%eax),%eax
    1c3b:	8b 00                	mov    (%eax),%eax
    1c3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1c40:	8b 45 08             	mov    0x8(%ebp),%eax
    1c43:	8b 40 04             	mov    0x4(%eax),%eax
    1c46:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1c49:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4c:	8b 40 04             	mov    0x4(%eax),%eax
    1c4f:	8b 50 04             	mov    0x4(%eax),%edx
    1c52:	8b 45 08             	mov    0x8(%ebp),%eax
    1c55:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c5b:	89 04 24             	mov    %eax,(%esp)
    1c5e:	e8 e1 fb ff ff       	call   1844 <free>
       q->size--;
    1c63:	8b 45 08             	mov    0x8(%ebp),%eax
    1c66:	8b 00                	mov    (%eax),%eax
    1c68:	8d 50 ff             	lea    -0x1(%eax),%edx
    1c6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1c70:	8b 45 08             	mov    0x8(%ebp),%eax
    1c73:	8b 00                	mov    (%eax),%eax
    1c75:	85 c0                	test   %eax,%eax
    1c77:	75 14                	jne    1c8d <pop_q+0x6d>
            q->head = 0;
    1c79:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1c83:	8b 45 08             	mov    0x8(%ebp),%eax
    1c86:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1c8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c90:	eb 05                	jmp    1c97 <pop_q+0x77>
    }
    return -1;
    1c92:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1c97:	c9                   	leave  
    1c98:	c3                   	ret    
