
_ls:     file format elf32-i386


Disassembly of section .text:

00001000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
    1004:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    1007:	8b 45 08             	mov    0x8(%ebp),%eax
    100a:	89 04 24             	mov    %eax,(%esp)
    100d:	e8 db 03 00 00       	call   13ed <strlen>
    1012:	03 45 08             	add    0x8(%ebp),%eax
    1015:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1018:	eb 04                	jmp    101e <fmtname+0x1e>
    101a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    101e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1021:	3b 45 08             	cmp    0x8(%ebp),%eax
    1024:	72 0a                	jb     1030 <fmtname+0x30>
    1026:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1029:	0f b6 00             	movzbl (%eax),%eax
    102c:	3c 2f                	cmp    $0x2f,%al
    102e:	75 ea                	jne    101a <fmtname+0x1a>
    ;
  p++;
    1030:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    1034:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1037:	89 04 24             	mov    %eax,(%esp)
    103a:	e8 ae 03 00 00       	call   13ed <strlen>
    103f:	83 f8 0d             	cmp    $0xd,%eax
    1042:	76 05                	jbe    1049 <fmtname+0x49>
    return p;
    1044:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1047:	eb 5f                	jmp    10a8 <fmtname+0xa8>
  memmove(buf, p, strlen(p));
    1049:	8b 45 f4             	mov    -0xc(%ebp),%eax
    104c:	89 04 24             	mov    %eax,(%esp)
    104f:	e8 99 03 00 00       	call   13ed <strlen>
    1054:	89 44 24 08          	mov    %eax,0x8(%esp)
    1058:	8b 45 f4             	mov    -0xc(%ebp),%eax
    105b:	89 44 24 04          	mov    %eax,0x4(%esp)
    105f:	c7 04 24 f0 1d 00 00 	movl   $0x1df0,(%esp)
    1066:	e8 07 05 00 00       	call   1572 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    106b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    106e:	89 04 24             	mov    %eax,(%esp)
    1071:	e8 77 03 00 00       	call   13ed <strlen>
    1076:	ba 0e 00 00 00       	mov    $0xe,%edx
    107b:	89 d3                	mov    %edx,%ebx
    107d:	29 c3                	sub    %eax,%ebx
    107f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1082:	89 04 24             	mov    %eax,(%esp)
    1085:	e8 63 03 00 00       	call   13ed <strlen>
    108a:	05 f0 1d 00 00       	add    $0x1df0,%eax
    108f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    1093:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
    109a:	00 
    109b:	89 04 24             	mov    %eax,(%esp)
    109e:	e8 6f 03 00 00       	call   1412 <memset>
  return buf;
    10a3:	b8 f0 1d 00 00       	mov    $0x1df0,%eax
}
    10a8:	83 c4 24             	add    $0x24,%esp
    10ab:	5b                   	pop    %ebx
    10ac:	5d                   	pop    %ebp
    10ad:	c3                   	ret    

000010ae <ls>:

void
ls(char *path)
{
    10ae:	55                   	push   %ebp
    10af:	89 e5                	mov    %esp,%ebp
    10b1:	57                   	push   %edi
    10b2:	56                   	push   %esi
    10b3:	53                   	push   %ebx
    10b4:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
    10ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10c1:	00 
    10c2:	8b 45 08             	mov    0x8(%ebp),%eax
    10c5:	89 04 24             	mov    %eax,(%esp)
    10c8:	e8 2b 05 00 00       	call   15f8 <open>
    10cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    10d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    10d4:	79 20                	jns    10f6 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
    10d6:	8b 45 08             	mov    0x8(%ebp),%eax
    10d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    10dd:	c7 44 24 04 5d 1d 00 	movl   $0x1d5d,0x4(%esp)
    10e4:	00 
    10e5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    10ec:	e8 60 06 00 00       	call   1751 <printf>
    return;
    10f1:	e9 01 02 00 00       	jmp    12f7 <ls+0x249>
  }
  
  if(fstat(fd, &st) < 0){
    10f6:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
    10fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1100:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1103:	89 04 24             	mov    %eax,(%esp)
    1106:	e8 05 05 00 00       	call   1610 <fstat>
    110b:	85 c0                	test   %eax,%eax
    110d:	79 2b                	jns    113a <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
    110f:	8b 45 08             	mov    0x8(%ebp),%eax
    1112:	89 44 24 08          	mov    %eax,0x8(%esp)
    1116:	c7 44 24 04 71 1d 00 	movl   $0x1d71,0x4(%esp)
    111d:	00 
    111e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1125:	e8 27 06 00 00       	call   1751 <printf>
    close(fd);
    112a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    112d:	89 04 24             	mov    %eax,(%esp)
    1130:	e8 ab 04 00 00       	call   15e0 <close>
    return;
    1135:	e9 bd 01 00 00       	jmp    12f7 <ls+0x249>
  }
  
  switch(st.type){
    113a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
    1141:	98                   	cwtl   
    1142:	83 f8 01             	cmp    $0x1,%eax
    1145:	74 53                	je     119a <ls+0xec>
    1147:	83 f8 02             	cmp    $0x2,%eax
    114a:	0f 85 9c 01 00 00    	jne    12ec <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    1150:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
    1156:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
    115c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
    1163:	0f bf d8             	movswl %ax,%ebx
    1166:	8b 45 08             	mov    0x8(%ebp),%eax
    1169:	89 04 24             	mov    %eax,(%esp)
    116c:	e8 8f fe ff ff       	call   1000 <fmtname>
    1171:	89 7c 24 14          	mov    %edi,0x14(%esp)
    1175:	89 74 24 10          	mov    %esi,0x10(%esp)
    1179:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    117d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1181:	c7 44 24 04 85 1d 00 	movl   $0x1d85,0x4(%esp)
    1188:	00 
    1189:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1190:	e8 bc 05 00 00       	call   1751 <printf>
    break;
    1195:	e9 52 01 00 00       	jmp    12ec <ls+0x23e>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
    119a:	8b 45 08             	mov    0x8(%ebp),%eax
    119d:	89 04 24             	mov    %eax,(%esp)
    11a0:	e8 48 02 00 00       	call   13ed <strlen>
    11a5:	83 c0 10             	add    $0x10,%eax
    11a8:	3d 00 02 00 00       	cmp    $0x200,%eax
    11ad:	76 19                	jbe    11c8 <ls+0x11a>
      printf(1, "ls: path too long\n");
    11af:	c7 44 24 04 92 1d 00 	movl   $0x1d92,0x4(%esp)
    11b6:	00 
    11b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11be:	e8 8e 05 00 00       	call   1751 <printf>
      break;
    11c3:	e9 24 01 00 00       	jmp    12ec <ls+0x23e>
    }
    strcpy(buf, path);
    11c8:	8b 45 08             	mov    0x8(%ebp),%eax
    11cb:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cf:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    11d5:	89 04 24             	mov    %eax,(%esp)
    11d8:	e8 9c 01 00 00       	call   1379 <strcpy>
    p = buf+strlen(buf);
    11dd:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    11e3:	89 04 24             	mov    %eax,(%esp)
    11e6:	e8 02 02 00 00       	call   13ed <strlen>
    11eb:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
    11f1:	8d 04 02             	lea    (%edx,%eax,1),%eax
    11f4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
    11f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11fa:	c6 00 2f             	movb   $0x2f,(%eax)
    11fd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    1201:	e9 c0 00 00 00       	jmp    12c6 <ls+0x218>
      if(de.inum == 0)
    1206:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
    120d:	66 85 c0             	test   %ax,%ax
    1210:	0f 84 af 00 00 00    	je     12c5 <ls+0x217>
        continue;
      memmove(p, de.name, DIRSIZ);
    1216:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    121d:	00 
    121e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
    1224:	83 c0 02             	add    $0x2,%eax
    1227:	89 44 24 04          	mov    %eax,0x4(%esp)
    122b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    122e:	89 04 24             	mov    %eax,(%esp)
    1231:	e8 3c 03 00 00       	call   1572 <memmove>
      p[DIRSIZ] = 0;
    1236:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1239:	83 c0 0e             	add    $0xe,%eax
    123c:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
    123f:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
    1245:	89 44 24 04          	mov    %eax,0x4(%esp)
    1249:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    124f:	89 04 24             	mov    %eax,(%esp)
    1252:	e8 81 02 00 00       	call   14d8 <stat>
    1257:	85 c0                	test   %eax,%eax
    1259:	79 20                	jns    127b <ls+0x1cd>
        printf(1, "ls: cannot stat %s\n", buf);
    125b:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    1261:	89 44 24 08          	mov    %eax,0x8(%esp)
    1265:	c7 44 24 04 71 1d 00 	movl   $0x1d71,0x4(%esp)
    126c:	00 
    126d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1274:	e8 d8 04 00 00       	call   1751 <printf>
        continue;
    1279:	eb 4b                	jmp    12c6 <ls+0x218>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    127b:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
    1281:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
    1287:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
    128e:	0f bf d8             	movswl %ax,%ebx
    1291:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
    1297:	89 04 24             	mov    %eax,(%esp)
    129a:	e8 61 fd ff ff       	call   1000 <fmtname>
    129f:	89 7c 24 14          	mov    %edi,0x14(%esp)
    12a3:	89 74 24 10          	mov    %esi,0x10(%esp)
    12a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    12ab:	89 44 24 08          	mov    %eax,0x8(%esp)
    12af:	c7 44 24 04 85 1d 00 	movl   $0x1d85,0x4(%esp)
    12b6:	00 
    12b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12be:	e8 8e 04 00 00       	call   1751 <printf>
    12c3:	eb 01                	jmp    12c6 <ls+0x218>
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
    12c5:	90                   	nop
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    12c6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    12cd:	00 
    12ce:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
    12d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12db:	89 04 24             	mov    %eax,(%esp)
    12de:	e8 ed 02 00 00       	call   15d0 <read>
    12e3:	83 f8 10             	cmp    $0x10,%eax
    12e6:	0f 84 1a ff ff ff    	je     1206 <ls+0x158>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
    12ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12ef:	89 04 24             	mov    %eax,(%esp)
    12f2:	e8 e9 02 00 00       	call   15e0 <close>
}
    12f7:	81 c4 5c 02 00 00    	add    $0x25c,%esp
    12fd:	5b                   	pop    %ebx
    12fe:	5e                   	pop    %esi
    12ff:	5f                   	pop    %edi
    1300:	5d                   	pop    %ebp
    1301:	c3                   	ret    

00001302 <main>:

int
main(int argc, char *argv[])
{
    1302:	55                   	push   %ebp
    1303:	89 e5                	mov    %esp,%ebp
    1305:	83 e4 f0             	and    $0xfffffff0,%esp
    1308:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
    130b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
    130f:	7f 11                	jg     1322 <main+0x20>
    ls(".");
    1311:	c7 04 24 a5 1d 00 00 	movl   $0x1da5,(%esp)
    1318:	e8 91 fd ff ff       	call   10ae <ls>
    exit();
    131d:	e8 96 02 00 00       	call   15b8 <exit>
  }
  for(i=1; i<argc; i++)
    1322:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    1329:	00 
    132a:	eb 19                	jmp    1345 <main+0x43>
    ls(argv[i]);
    132c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1330:	c1 e0 02             	shl    $0x2,%eax
    1333:	03 45 0c             	add    0xc(%ebp),%eax
    1336:	8b 00                	mov    (%eax),%eax
    1338:	89 04 24             	mov    %eax,(%esp)
    133b:	e8 6e fd ff ff       	call   10ae <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    1340:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
    1345:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1349:	3b 45 08             	cmp    0x8(%ebp),%eax
    134c:	7c de                	jl     132c <main+0x2a>
    ls(argv[i]);
  exit();
    134e:	e8 65 02 00 00       	call   15b8 <exit>
    1353:	90                   	nop

00001354 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1354:	55                   	push   %ebp
    1355:	89 e5                	mov    %esp,%ebp
    1357:	57                   	push   %edi
    1358:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1359:	8b 4d 08             	mov    0x8(%ebp),%ecx
    135c:	8b 55 10             	mov    0x10(%ebp),%edx
    135f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1362:	89 cb                	mov    %ecx,%ebx
    1364:	89 df                	mov    %ebx,%edi
    1366:	89 d1                	mov    %edx,%ecx
    1368:	fc                   	cld    
    1369:	f3 aa                	rep stos %al,%es:(%edi)
    136b:	89 ca                	mov    %ecx,%edx
    136d:	89 fb                	mov    %edi,%ebx
    136f:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1372:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1375:	5b                   	pop    %ebx
    1376:	5f                   	pop    %edi
    1377:	5d                   	pop    %ebp
    1378:	c3                   	ret    

00001379 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1379:	55                   	push   %ebp
    137a:	89 e5                	mov    %esp,%ebp
    137c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    137f:	8b 45 08             	mov    0x8(%ebp),%eax
    1382:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1385:	8b 45 0c             	mov    0xc(%ebp),%eax
    1388:	0f b6 10             	movzbl (%eax),%edx
    138b:	8b 45 08             	mov    0x8(%ebp),%eax
    138e:	88 10                	mov    %dl,(%eax)
    1390:	8b 45 08             	mov    0x8(%ebp),%eax
    1393:	0f b6 00             	movzbl (%eax),%eax
    1396:	84 c0                	test   %al,%al
    1398:	0f 95 c0             	setne  %al
    139b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    139f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    13a3:	84 c0                	test   %al,%al
    13a5:	75 de                	jne    1385 <strcpy+0xc>
    ;
  return os;
    13a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    13aa:	c9                   	leave  
    13ab:	c3                   	ret    

000013ac <strcmp>:

int
strcmp(const char *p, const char *q)
{
    13ac:	55                   	push   %ebp
    13ad:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    13af:	eb 08                	jmp    13b9 <strcmp+0xd>
    p++, q++;
    13b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    13b5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    13b9:	8b 45 08             	mov    0x8(%ebp),%eax
    13bc:	0f b6 00             	movzbl (%eax),%eax
    13bf:	84 c0                	test   %al,%al
    13c1:	74 10                	je     13d3 <strcmp+0x27>
    13c3:	8b 45 08             	mov    0x8(%ebp),%eax
    13c6:	0f b6 10             	movzbl (%eax),%edx
    13c9:	8b 45 0c             	mov    0xc(%ebp),%eax
    13cc:	0f b6 00             	movzbl (%eax),%eax
    13cf:	38 c2                	cmp    %al,%dl
    13d1:	74 de                	je     13b1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    13d3:	8b 45 08             	mov    0x8(%ebp),%eax
    13d6:	0f b6 00             	movzbl (%eax),%eax
    13d9:	0f b6 d0             	movzbl %al,%edx
    13dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    13df:	0f b6 00             	movzbl (%eax),%eax
    13e2:	0f b6 c0             	movzbl %al,%eax
    13e5:	89 d1                	mov    %edx,%ecx
    13e7:	29 c1                	sub    %eax,%ecx
    13e9:	89 c8                	mov    %ecx,%eax
}
    13eb:	5d                   	pop    %ebp
    13ec:	c3                   	ret    

000013ed <strlen>:

uint
strlen(char *s)
{
    13ed:	55                   	push   %ebp
    13ee:	89 e5                	mov    %esp,%ebp
    13f0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    13f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    13fa:	eb 04                	jmp    1400 <strlen+0x13>
    13fc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1400:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1403:	03 45 08             	add    0x8(%ebp),%eax
    1406:	0f b6 00             	movzbl (%eax),%eax
    1409:	84 c0                	test   %al,%al
    140b:	75 ef                	jne    13fc <strlen+0xf>
    ;
  return n;
    140d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1410:	c9                   	leave  
    1411:	c3                   	ret    

00001412 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1412:	55                   	push   %ebp
    1413:	89 e5                	mov    %esp,%ebp
    1415:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1418:	8b 45 10             	mov    0x10(%ebp),%eax
    141b:	89 44 24 08          	mov    %eax,0x8(%esp)
    141f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1422:	89 44 24 04          	mov    %eax,0x4(%esp)
    1426:	8b 45 08             	mov    0x8(%ebp),%eax
    1429:	89 04 24             	mov    %eax,(%esp)
    142c:	e8 23 ff ff ff       	call   1354 <stosb>
  return dst;
    1431:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1434:	c9                   	leave  
    1435:	c3                   	ret    

00001436 <strchr>:

char*
strchr(const char *s, char c)
{
    1436:	55                   	push   %ebp
    1437:	89 e5                	mov    %esp,%ebp
    1439:	83 ec 04             	sub    $0x4,%esp
    143c:	8b 45 0c             	mov    0xc(%ebp),%eax
    143f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1442:	eb 14                	jmp    1458 <strchr+0x22>
    if(*s == c)
    1444:	8b 45 08             	mov    0x8(%ebp),%eax
    1447:	0f b6 00             	movzbl (%eax),%eax
    144a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    144d:	75 05                	jne    1454 <strchr+0x1e>
      return (char*)s;
    144f:	8b 45 08             	mov    0x8(%ebp),%eax
    1452:	eb 13                	jmp    1467 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1454:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1458:	8b 45 08             	mov    0x8(%ebp),%eax
    145b:	0f b6 00             	movzbl (%eax),%eax
    145e:	84 c0                	test   %al,%al
    1460:	75 e2                	jne    1444 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1462:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1467:	c9                   	leave  
    1468:	c3                   	ret    

00001469 <gets>:

char*
gets(char *buf, int max)
{
    1469:	55                   	push   %ebp
    146a:	89 e5                	mov    %esp,%ebp
    146c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    146f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1476:	eb 44                	jmp    14bc <gets+0x53>
    cc = read(0, &c, 1);
    1478:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    147f:	00 
    1480:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1483:	89 44 24 04          	mov    %eax,0x4(%esp)
    1487:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    148e:	e8 3d 01 00 00       	call   15d0 <read>
    1493:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1496:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    149a:	7e 2d                	jle    14c9 <gets+0x60>
      break;
    buf[i++] = c;
    149c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    149f:	03 45 08             	add    0x8(%ebp),%eax
    14a2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    14a6:	88 10                	mov    %dl,(%eax)
    14a8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    14ac:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14b0:	3c 0a                	cmp    $0xa,%al
    14b2:	74 16                	je     14ca <gets+0x61>
    14b4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    14b8:	3c 0d                	cmp    $0xd,%al
    14ba:	74 0e                	je     14ca <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    14bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14bf:	83 c0 01             	add    $0x1,%eax
    14c2:	3b 45 0c             	cmp    0xc(%ebp),%eax
    14c5:	7c b1                	jl     1478 <gets+0xf>
    14c7:	eb 01                	jmp    14ca <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    14c9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    14ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14cd:	03 45 08             	add    0x8(%ebp),%eax
    14d0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    14d3:	8b 45 08             	mov    0x8(%ebp),%eax
}
    14d6:	c9                   	leave  
    14d7:	c3                   	ret    

000014d8 <stat>:

int
stat(char *n, struct stat *st)
{
    14d8:	55                   	push   %ebp
    14d9:	89 e5                	mov    %esp,%ebp
    14db:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14de:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14e5:	00 
    14e6:	8b 45 08             	mov    0x8(%ebp),%eax
    14e9:	89 04 24             	mov    %eax,(%esp)
    14ec:	e8 07 01 00 00       	call   15f8 <open>
    14f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    14f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    14f8:	79 07                	jns    1501 <stat+0x29>
    return -1;
    14fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    14ff:	eb 23                	jmp    1524 <stat+0x4c>
  r = fstat(fd, st);
    1501:	8b 45 0c             	mov    0xc(%ebp),%eax
    1504:	89 44 24 04          	mov    %eax,0x4(%esp)
    1508:	8b 45 f0             	mov    -0x10(%ebp),%eax
    150b:	89 04 24             	mov    %eax,(%esp)
    150e:	e8 fd 00 00 00       	call   1610 <fstat>
    1513:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1516:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1519:	89 04 24             	mov    %eax,(%esp)
    151c:	e8 bf 00 00 00       	call   15e0 <close>
  return r;
    1521:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1524:	c9                   	leave  
    1525:	c3                   	ret    

00001526 <atoi>:

int
atoi(const char *s)
{
    1526:	55                   	push   %ebp
    1527:	89 e5                	mov    %esp,%ebp
    1529:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    152c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1533:	eb 24                	jmp    1559 <atoi+0x33>
    n = n*10 + *s++ - '0';
    1535:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1538:	89 d0                	mov    %edx,%eax
    153a:	c1 e0 02             	shl    $0x2,%eax
    153d:	01 d0                	add    %edx,%eax
    153f:	01 c0                	add    %eax,%eax
    1541:	89 c2                	mov    %eax,%edx
    1543:	8b 45 08             	mov    0x8(%ebp),%eax
    1546:	0f b6 00             	movzbl (%eax),%eax
    1549:	0f be c0             	movsbl %al,%eax
    154c:	8d 04 02             	lea    (%edx,%eax,1),%eax
    154f:	83 e8 30             	sub    $0x30,%eax
    1552:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1555:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1559:	8b 45 08             	mov    0x8(%ebp),%eax
    155c:	0f b6 00             	movzbl (%eax),%eax
    155f:	3c 2f                	cmp    $0x2f,%al
    1561:	7e 0a                	jle    156d <atoi+0x47>
    1563:	8b 45 08             	mov    0x8(%ebp),%eax
    1566:	0f b6 00             	movzbl (%eax),%eax
    1569:	3c 39                	cmp    $0x39,%al
    156b:	7e c8                	jle    1535 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    156d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1570:	c9                   	leave  
    1571:	c3                   	ret    

00001572 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1572:	55                   	push   %ebp
    1573:	89 e5                	mov    %esp,%ebp
    1575:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1578:	8b 45 08             	mov    0x8(%ebp),%eax
    157b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    157e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1581:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1584:	eb 13                	jmp    1599 <memmove+0x27>
    *dst++ = *src++;
    1586:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1589:	0f b6 10             	movzbl (%eax),%edx
    158c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    158f:	88 10                	mov    %dl,(%eax)
    1591:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1595:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1599:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    159d:	0f 9f c0             	setg   %al
    15a0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    15a4:	84 c0                	test   %al,%al
    15a6:	75 de                	jne    1586 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    15a8:	8b 45 08             	mov    0x8(%ebp),%eax
}
    15ab:	c9                   	leave  
    15ac:	c3                   	ret    
    15ad:	90                   	nop
    15ae:	90                   	nop
    15af:	90                   	nop

000015b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    15b0:	b8 01 00 00 00       	mov    $0x1,%eax
    15b5:	cd 40                	int    $0x40
    15b7:	c3                   	ret    

000015b8 <exit>:
SYSCALL(exit)
    15b8:	b8 02 00 00 00       	mov    $0x2,%eax
    15bd:	cd 40                	int    $0x40
    15bf:	c3                   	ret    

000015c0 <wait>:
SYSCALL(wait)
    15c0:	b8 03 00 00 00       	mov    $0x3,%eax
    15c5:	cd 40                	int    $0x40
    15c7:	c3                   	ret    

000015c8 <pipe>:
SYSCALL(pipe)
    15c8:	b8 04 00 00 00       	mov    $0x4,%eax
    15cd:	cd 40                	int    $0x40
    15cf:	c3                   	ret    

000015d0 <read>:
SYSCALL(read)
    15d0:	b8 05 00 00 00       	mov    $0x5,%eax
    15d5:	cd 40                	int    $0x40
    15d7:	c3                   	ret    

000015d8 <write>:
SYSCALL(write)
    15d8:	b8 10 00 00 00       	mov    $0x10,%eax
    15dd:	cd 40                	int    $0x40
    15df:	c3                   	ret    

000015e0 <close>:
SYSCALL(close)
    15e0:	b8 15 00 00 00       	mov    $0x15,%eax
    15e5:	cd 40                	int    $0x40
    15e7:	c3                   	ret    

000015e8 <kill>:
SYSCALL(kill)
    15e8:	b8 06 00 00 00       	mov    $0x6,%eax
    15ed:	cd 40                	int    $0x40
    15ef:	c3                   	ret    

000015f0 <exec>:
SYSCALL(exec)
    15f0:	b8 07 00 00 00       	mov    $0x7,%eax
    15f5:	cd 40                	int    $0x40
    15f7:	c3                   	ret    

000015f8 <open>:
SYSCALL(open)
    15f8:	b8 0f 00 00 00       	mov    $0xf,%eax
    15fd:	cd 40                	int    $0x40
    15ff:	c3                   	ret    

00001600 <mknod>:
SYSCALL(mknod)
    1600:	b8 11 00 00 00       	mov    $0x11,%eax
    1605:	cd 40                	int    $0x40
    1607:	c3                   	ret    

00001608 <unlink>:
SYSCALL(unlink)
    1608:	b8 12 00 00 00       	mov    $0x12,%eax
    160d:	cd 40                	int    $0x40
    160f:	c3                   	ret    

00001610 <fstat>:
SYSCALL(fstat)
    1610:	b8 08 00 00 00       	mov    $0x8,%eax
    1615:	cd 40                	int    $0x40
    1617:	c3                   	ret    

00001618 <link>:
SYSCALL(link)
    1618:	b8 13 00 00 00       	mov    $0x13,%eax
    161d:	cd 40                	int    $0x40
    161f:	c3                   	ret    

00001620 <mkdir>:
SYSCALL(mkdir)
    1620:	b8 14 00 00 00       	mov    $0x14,%eax
    1625:	cd 40                	int    $0x40
    1627:	c3                   	ret    

00001628 <chdir>:
SYSCALL(chdir)
    1628:	b8 09 00 00 00       	mov    $0x9,%eax
    162d:	cd 40                	int    $0x40
    162f:	c3                   	ret    

00001630 <dup>:
SYSCALL(dup)
    1630:	b8 0a 00 00 00       	mov    $0xa,%eax
    1635:	cd 40                	int    $0x40
    1637:	c3                   	ret    

00001638 <getpid>:
SYSCALL(getpid)
    1638:	b8 0b 00 00 00       	mov    $0xb,%eax
    163d:	cd 40                	int    $0x40
    163f:	c3                   	ret    

00001640 <sbrk>:
SYSCALL(sbrk)
    1640:	b8 0c 00 00 00       	mov    $0xc,%eax
    1645:	cd 40                	int    $0x40
    1647:	c3                   	ret    

00001648 <sleep>:
SYSCALL(sleep)
    1648:	b8 0d 00 00 00       	mov    $0xd,%eax
    164d:	cd 40                	int    $0x40
    164f:	c3                   	ret    

00001650 <uptime>:
SYSCALL(uptime)
    1650:	b8 0e 00 00 00       	mov    $0xe,%eax
    1655:	cd 40                	int    $0x40
    1657:	c3                   	ret    

00001658 <clone>:
SYSCALL(clone)
    1658:	b8 16 00 00 00       	mov    $0x16,%eax
    165d:	cd 40                	int    $0x40
    165f:	c3                   	ret    

00001660 <texit>:
SYSCALL(texit)
    1660:	b8 17 00 00 00       	mov    $0x17,%eax
    1665:	cd 40                	int    $0x40
    1667:	c3                   	ret    

00001668 <tsleep>:
SYSCALL(tsleep)
    1668:	b8 18 00 00 00       	mov    $0x18,%eax
    166d:	cd 40                	int    $0x40
    166f:	c3                   	ret    

00001670 <twakeup>:
SYSCALL(twakeup)
    1670:	b8 19 00 00 00       	mov    $0x19,%eax
    1675:	cd 40                	int    $0x40
    1677:	c3                   	ret    

00001678 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1678:	55                   	push   %ebp
    1679:	89 e5                	mov    %esp,%ebp
    167b:	83 ec 28             	sub    $0x28,%esp
    167e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1681:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1684:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    168b:	00 
    168c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    168f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1693:	8b 45 08             	mov    0x8(%ebp),%eax
    1696:	89 04 24             	mov    %eax,(%esp)
    1699:	e8 3a ff ff ff       	call   15d8 <write>
}
    169e:	c9                   	leave  
    169f:	c3                   	ret    

000016a0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    16a0:	55                   	push   %ebp
    16a1:	89 e5                	mov    %esp,%ebp
    16a3:	53                   	push   %ebx
    16a4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    16a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    16ae:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    16b2:	74 17                	je     16cb <printint+0x2b>
    16b4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    16b8:	79 11                	jns    16cb <printint+0x2b>
    neg = 1;
    16ba:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    16c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    16c4:	f7 d8                	neg    %eax
    16c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    16c9:	eb 06                	jmp    16d1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    16cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    16d1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    16d8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    16db:	8b 5d 10             	mov    0x10(%ebp),%ebx
    16de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16e1:	ba 00 00 00 00       	mov    $0x0,%edx
    16e6:	f7 f3                	div    %ebx
    16e8:	89 d0                	mov    %edx,%eax
    16ea:	0f b6 80 dc 1d 00 00 	movzbl 0x1ddc(%eax),%eax
    16f1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    16f5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    16f9:	8b 45 10             	mov    0x10(%ebp),%eax
    16fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    16ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1702:	ba 00 00 00 00       	mov    $0x0,%edx
    1707:	f7 75 d4             	divl   -0x2c(%ebp)
    170a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    170d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1711:	75 c5                	jne    16d8 <printint+0x38>
  if(neg)
    1713:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1717:	74 28                	je     1741 <printint+0xa1>
    buf[i++] = '-';
    1719:	8b 45 ec             	mov    -0x14(%ebp),%eax
    171c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1721:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1725:	eb 1a                	jmp    1741 <printint+0xa1>
    putc(fd, buf[i]);
    1727:	8b 45 ec             	mov    -0x14(%ebp),%eax
    172a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    172f:	0f be c0             	movsbl %al,%eax
    1732:	89 44 24 04          	mov    %eax,0x4(%esp)
    1736:	8b 45 08             	mov    0x8(%ebp),%eax
    1739:	89 04 24             	mov    %eax,(%esp)
    173c:	e8 37 ff ff ff       	call   1678 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1741:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1745:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1749:	79 dc                	jns    1727 <printint+0x87>
    putc(fd, buf[i]);
}
    174b:	83 c4 44             	add    $0x44,%esp
    174e:	5b                   	pop    %ebx
    174f:	5d                   	pop    %ebp
    1750:	c3                   	ret    

00001751 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1751:	55                   	push   %ebp
    1752:	89 e5                	mov    %esp,%ebp
    1754:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1757:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    175e:	8d 45 0c             	lea    0xc(%ebp),%eax
    1761:	83 c0 04             	add    $0x4,%eax
    1764:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1767:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    176e:	e9 7e 01 00 00       	jmp    18f1 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1773:	8b 55 0c             	mov    0xc(%ebp),%edx
    1776:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1779:	8d 04 02             	lea    (%edx,%eax,1),%eax
    177c:	0f b6 00             	movzbl (%eax),%eax
    177f:	0f be c0             	movsbl %al,%eax
    1782:	25 ff 00 00 00       	and    $0xff,%eax
    1787:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    178a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    178e:	75 2c                	jne    17bc <printf+0x6b>
      if(c == '%'){
    1790:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1794:	75 0c                	jne    17a2 <printf+0x51>
        state = '%';
    1796:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    179d:	e9 4b 01 00 00       	jmp    18ed <printf+0x19c>
      } else {
        putc(fd, c);
    17a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17a5:	0f be c0             	movsbl %al,%eax
    17a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ac:	8b 45 08             	mov    0x8(%ebp),%eax
    17af:	89 04 24             	mov    %eax,(%esp)
    17b2:	e8 c1 fe ff ff       	call   1678 <putc>
    17b7:	e9 31 01 00 00       	jmp    18ed <printf+0x19c>
      }
    } else if(state == '%'){
    17bc:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    17c0:	0f 85 27 01 00 00    	jne    18ed <printf+0x19c>
      if(c == 'd'){
    17c6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    17ca:	75 2d                	jne    17f9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    17cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17cf:	8b 00                	mov    (%eax),%eax
    17d1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    17d8:	00 
    17d9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    17e0:	00 
    17e1:	89 44 24 04          	mov    %eax,0x4(%esp)
    17e5:	8b 45 08             	mov    0x8(%ebp),%eax
    17e8:	89 04 24             	mov    %eax,(%esp)
    17eb:	e8 b0 fe ff ff       	call   16a0 <printint>
        ap++;
    17f0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    17f4:	e9 ed 00 00 00       	jmp    18e6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    17f9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    17fd:	74 06                	je     1805 <printf+0xb4>
    17ff:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1803:	75 2d                	jne    1832 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1805:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1808:	8b 00                	mov    (%eax),%eax
    180a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1811:	00 
    1812:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1819:	00 
    181a:	89 44 24 04          	mov    %eax,0x4(%esp)
    181e:	8b 45 08             	mov    0x8(%ebp),%eax
    1821:	89 04 24             	mov    %eax,(%esp)
    1824:	e8 77 fe ff ff       	call   16a0 <printint>
        ap++;
    1829:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    182d:	e9 b4 00 00 00       	jmp    18e6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1832:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    1836:	75 46                	jne    187e <printf+0x12d>
        s = (char*)*ap;
    1838:	8b 45 f4             	mov    -0xc(%ebp),%eax
    183b:	8b 00                	mov    (%eax),%eax
    183d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1840:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1844:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1848:	75 27                	jne    1871 <printf+0x120>
          s = "(null)";
    184a:	c7 45 e4 a7 1d 00 00 	movl   $0x1da7,-0x1c(%ebp)
        while(*s != 0){
    1851:	eb 1f                	jmp    1872 <printf+0x121>
          putc(fd, *s);
    1853:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1856:	0f b6 00             	movzbl (%eax),%eax
    1859:	0f be c0             	movsbl %al,%eax
    185c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1860:	8b 45 08             	mov    0x8(%ebp),%eax
    1863:	89 04 24             	mov    %eax,(%esp)
    1866:	e8 0d fe ff ff       	call   1678 <putc>
          s++;
    186b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    186f:	eb 01                	jmp    1872 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1871:	90                   	nop
    1872:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1875:	0f b6 00             	movzbl (%eax),%eax
    1878:	84 c0                	test   %al,%al
    187a:	75 d7                	jne    1853 <printf+0x102>
    187c:	eb 68                	jmp    18e6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    187e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1882:	75 1d                	jne    18a1 <printf+0x150>
        putc(fd, *ap);
    1884:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1887:	8b 00                	mov    (%eax),%eax
    1889:	0f be c0             	movsbl %al,%eax
    188c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1890:	8b 45 08             	mov    0x8(%ebp),%eax
    1893:	89 04 24             	mov    %eax,(%esp)
    1896:	e8 dd fd ff ff       	call   1678 <putc>
        ap++;
    189b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    189f:	eb 45                	jmp    18e6 <printf+0x195>
      } else if(c == '%'){
    18a1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    18a5:	75 17                	jne    18be <printf+0x16d>
        putc(fd, c);
    18a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18aa:	0f be c0             	movsbl %al,%eax
    18ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    18b1:	8b 45 08             	mov    0x8(%ebp),%eax
    18b4:	89 04 24             	mov    %eax,(%esp)
    18b7:	e8 bc fd ff ff       	call   1678 <putc>
    18bc:	eb 28                	jmp    18e6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    18be:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    18c5:	00 
    18c6:	8b 45 08             	mov    0x8(%ebp),%eax
    18c9:	89 04 24             	mov    %eax,(%esp)
    18cc:	e8 a7 fd ff ff       	call   1678 <putc>
        putc(fd, c);
    18d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18d4:	0f be c0             	movsbl %al,%eax
    18d7:	89 44 24 04          	mov    %eax,0x4(%esp)
    18db:	8b 45 08             	mov    0x8(%ebp),%eax
    18de:	89 04 24             	mov    %eax,(%esp)
    18e1:	e8 92 fd ff ff       	call   1678 <putc>
      }
      state = 0;
    18e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    18ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    18f1:	8b 55 0c             	mov    0xc(%ebp),%edx
    18f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18f7:	8d 04 02             	lea    (%edx,%eax,1),%eax
    18fa:	0f b6 00             	movzbl (%eax),%eax
    18fd:	84 c0                	test   %al,%al
    18ff:	0f 85 6e fe ff ff    	jne    1773 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1905:	c9                   	leave  
    1906:	c3                   	ret    
    1907:	90                   	nop

00001908 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1908:	55                   	push   %ebp
    1909:	89 e5                	mov    %esp,%ebp
    190b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    190e:	8b 45 08             	mov    0x8(%ebp),%eax
    1911:	83 e8 08             	sub    $0x8,%eax
    1914:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1917:	a1 08 1e 00 00       	mov    0x1e08,%eax
    191c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    191f:	eb 24                	jmp    1945 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1921:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1924:	8b 00                	mov    (%eax),%eax
    1926:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1929:	77 12                	ja     193d <free+0x35>
    192b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    192e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1931:	77 24                	ja     1957 <free+0x4f>
    1933:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1936:	8b 00                	mov    (%eax),%eax
    1938:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    193b:	77 1a                	ja     1957 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    193d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1940:	8b 00                	mov    (%eax),%eax
    1942:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1945:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1948:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    194b:	76 d4                	jbe    1921 <free+0x19>
    194d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1950:	8b 00                	mov    (%eax),%eax
    1952:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1955:	76 ca                	jbe    1921 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1957:	8b 45 f8             	mov    -0x8(%ebp),%eax
    195a:	8b 40 04             	mov    0x4(%eax),%eax
    195d:	c1 e0 03             	shl    $0x3,%eax
    1960:	89 c2                	mov    %eax,%edx
    1962:	03 55 f8             	add    -0x8(%ebp),%edx
    1965:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1968:	8b 00                	mov    (%eax),%eax
    196a:	39 c2                	cmp    %eax,%edx
    196c:	75 24                	jne    1992 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    196e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1971:	8b 50 04             	mov    0x4(%eax),%edx
    1974:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1977:	8b 00                	mov    (%eax),%eax
    1979:	8b 40 04             	mov    0x4(%eax),%eax
    197c:	01 c2                	add    %eax,%edx
    197e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1981:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1984:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1987:	8b 00                	mov    (%eax),%eax
    1989:	8b 10                	mov    (%eax),%edx
    198b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    198e:	89 10                	mov    %edx,(%eax)
    1990:	eb 0a                	jmp    199c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1992:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1995:	8b 10                	mov    (%eax),%edx
    1997:	8b 45 f8             	mov    -0x8(%ebp),%eax
    199a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    199c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    199f:	8b 40 04             	mov    0x4(%eax),%eax
    19a2:	c1 e0 03             	shl    $0x3,%eax
    19a5:	03 45 fc             	add    -0x4(%ebp),%eax
    19a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    19ab:	75 20                	jne    19cd <free+0xc5>
    p->s.size += bp->s.size;
    19ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19b0:	8b 50 04             	mov    0x4(%eax),%edx
    19b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19b6:	8b 40 04             	mov    0x4(%eax),%eax
    19b9:	01 c2                	add    %eax,%edx
    19bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19be:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    19c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    19c4:	8b 10                	mov    (%eax),%edx
    19c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19c9:	89 10                	mov    %edx,(%eax)
    19cb:	eb 08                	jmp    19d5 <free+0xcd>
  } else
    p->s.ptr = bp;
    19cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19d0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    19d3:	89 10                	mov    %edx,(%eax)
  freep = p;
    19d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    19d8:	a3 08 1e 00 00       	mov    %eax,0x1e08
}
    19dd:	c9                   	leave  
    19de:	c3                   	ret    

000019df <morecore>:

static Header*
morecore(uint nu)
{
    19df:	55                   	push   %ebp
    19e0:	89 e5                	mov    %esp,%ebp
    19e2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    19e5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    19ec:	77 07                	ja     19f5 <morecore+0x16>
    nu = 4096;
    19ee:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    19f5:	8b 45 08             	mov    0x8(%ebp),%eax
    19f8:	c1 e0 03             	shl    $0x3,%eax
    19fb:	89 04 24             	mov    %eax,(%esp)
    19fe:	e8 3d fc ff ff       	call   1640 <sbrk>
    1a03:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1a06:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1a0a:	75 07                	jne    1a13 <morecore+0x34>
    return 0;
    1a0c:	b8 00 00 00 00       	mov    $0x0,%eax
    1a11:	eb 22                	jmp    1a35 <morecore+0x56>
  hp = (Header*)p;
    1a13:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a16:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a1c:	8b 55 08             	mov    0x8(%ebp),%edx
    1a1f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a25:	83 c0 08             	add    $0x8,%eax
    1a28:	89 04 24             	mov    %eax,(%esp)
    1a2b:	e8 d8 fe ff ff       	call   1908 <free>
  return freep;
    1a30:	a1 08 1e 00 00       	mov    0x1e08,%eax
}
    1a35:	c9                   	leave  
    1a36:	c3                   	ret    

00001a37 <malloc>:

void*
malloc(uint nbytes)
{
    1a37:	55                   	push   %ebp
    1a38:	89 e5                	mov    %esp,%ebp
    1a3a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1a3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1a40:	83 c0 07             	add    $0x7,%eax
    1a43:	c1 e8 03             	shr    $0x3,%eax
    1a46:	83 c0 01             	add    $0x1,%eax
    1a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1a4c:	a1 08 1e 00 00       	mov    0x1e08,%eax
    1a51:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a54:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a58:	75 23                	jne    1a7d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1a5a:	c7 45 f0 00 1e 00 00 	movl   $0x1e00,-0x10(%ebp)
    1a61:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a64:	a3 08 1e 00 00       	mov    %eax,0x1e08
    1a69:	a1 08 1e 00 00       	mov    0x1e08,%eax
    1a6e:	a3 00 1e 00 00       	mov    %eax,0x1e00
    base.s.size = 0;
    1a73:	c7 05 04 1e 00 00 00 	movl   $0x0,0x1e04
    1a7a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a80:	8b 00                	mov    (%eax),%eax
    1a82:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1a85:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a88:	8b 40 04             	mov    0x4(%eax),%eax
    1a8b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a8e:	72 4d                	jb     1add <malloc+0xa6>
      if(p->s.size == nunits)
    1a90:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a93:	8b 40 04             	mov    0x4(%eax),%eax
    1a96:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a99:	75 0c                	jne    1aa7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1a9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a9e:	8b 10                	mov    (%eax),%edx
    1aa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aa3:	89 10                	mov    %edx,(%eax)
    1aa5:	eb 26                	jmp    1acd <malloc+0x96>
      else {
        p->s.size -= nunits;
    1aa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aaa:	8b 40 04             	mov    0x4(%eax),%eax
    1aad:	89 c2                	mov    %eax,%edx
    1aaf:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1ab2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ab5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1ab8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1abb:	8b 40 04             	mov    0x4(%eax),%eax
    1abe:	c1 e0 03             	shl    $0x3,%eax
    1ac1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1ac4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ac7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1aca:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1acd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ad0:	a3 08 1e 00 00       	mov    %eax,0x1e08
      return (void*)(p + 1);
    1ad5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ad8:	83 c0 08             	add    $0x8,%eax
    1adb:	eb 38                	jmp    1b15 <malloc+0xde>
    }
    if(p == freep)
    1add:	a1 08 1e 00 00       	mov    0x1e08,%eax
    1ae2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1ae5:	75 1b                	jne    1b02 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aea:	89 04 24             	mov    %eax,(%esp)
    1aed:	e8 ed fe ff ff       	call   19df <morecore>
    1af2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1af5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1af9:	75 07                	jne    1b02 <malloc+0xcb>
        return 0;
    1afb:	b8 00 00 00 00       	mov    $0x0,%eax
    1b00:	eb 13                	jmp    1b15 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b05:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b0b:	8b 00                	mov    (%eax),%eax
    1b0d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1b10:	e9 70 ff ff ff       	jmp    1a85 <malloc+0x4e>
}
    1b15:	c9                   	leave  
    1b16:	c3                   	ret    
    1b17:	90                   	nop

00001b18 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1b18:	55                   	push   %ebp
    1b19:	89 e5                	mov    %esp,%ebp
    1b1b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1b1e:	8b 55 08             	mov    0x8(%ebp),%edx
    1b21:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b24:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b27:	f0 87 02             	lock xchg %eax,(%edx)
    1b2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1b2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1b30:	c9                   	leave  
    1b31:	c3                   	ret    

00001b32 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1b32:	55                   	push   %ebp
    1b33:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1b35:	8b 45 08             	mov    0x8(%ebp),%eax
    1b38:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1b3e:	5d                   	pop    %ebp
    1b3f:	c3                   	ret    

00001b40 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1b40:	55                   	push   %ebp
    1b41:	89 e5                	mov    %esp,%ebp
    1b43:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1b46:	8b 45 08             	mov    0x8(%ebp),%eax
    1b49:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1b50:	00 
    1b51:	89 04 24             	mov    %eax,(%esp)
    1b54:	e8 bf ff ff ff       	call   1b18 <xchg>
    1b59:	85 c0                	test   %eax,%eax
    1b5b:	75 e9                	jne    1b46 <lock_acquire+0x6>
}
    1b5d:	c9                   	leave  
    1b5e:	c3                   	ret    

00001b5f <lock_release>:
void lock_release(lock_t *lock){
    1b5f:	55                   	push   %ebp
    1b60:	89 e5                	mov    %esp,%ebp
    1b62:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1b65:	8b 45 08             	mov    0x8(%ebp),%eax
    1b68:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b6f:	00 
    1b70:	89 04 24             	mov    %eax,(%esp)
    1b73:	e8 a0 ff ff ff       	call   1b18 <xchg>
}
    1b78:	c9                   	leave  
    1b79:	c3                   	ret    

00001b7a <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1b7a:	55                   	push   %ebp
    1b7b:	89 e5                	mov    %esp,%ebp
    1b7d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1b80:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1b87:	e8 ab fe ff ff       	call   1a37 <malloc>
    1b8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1b8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b92:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1b95:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b98:	25 ff 0f 00 00       	and    $0xfff,%eax
    1b9d:	85 c0                	test   %eax,%eax
    1b9f:	74 15                	je     1bb6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1ba1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ba4:	89 c2                	mov    %eax,%edx
    1ba6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1bac:	b8 00 10 00 00       	mov    $0x1000,%eax
    1bb1:	29 d0                	sub    %edx,%eax
    1bb3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1bb6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1bba:	75 1b                	jne    1bd7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1bbc:	c7 44 24 04 ae 1d 00 	movl   $0x1dae,0x4(%esp)
    1bc3:	00 
    1bc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bcb:	e8 81 fb ff ff       	call   1751 <printf>
        return 0;
    1bd0:	b8 00 00 00 00       	mov    $0x0,%eax
    1bd5:	eb 6f                	jmp    1c46 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1bd7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1bda:	8b 55 08             	mov    0x8(%ebp),%edx
    1bdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1be0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1be4:	89 54 24 08          	mov    %edx,0x8(%esp)
    1be8:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1bef:	00 
    1bf0:	89 04 24             	mov    %eax,(%esp)
    1bf3:	e8 60 fa ff ff       	call   1658 <clone>
    1bf8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1bfb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1bff:	79 1b                	jns    1c1c <thread_create+0xa2>
        printf(1,"clone fails\n");
    1c01:	c7 44 24 04 bc 1d 00 	movl   $0x1dbc,0x4(%esp)
    1c08:	00 
    1c09:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c10:	e8 3c fb ff ff       	call   1751 <printf>
        return 0;
    1c15:	b8 00 00 00 00       	mov    $0x0,%eax
    1c1a:	eb 2a                	jmp    1c46 <thread_create+0xcc>
    }
    if(tid > 0){
    1c1c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c20:	7e 05                	jle    1c27 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c25:	eb 1f                	jmp    1c46 <thread_create+0xcc>
    }
    if(tid == 0){
    1c27:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c2b:	75 14                	jne    1c41 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1c2d:	c7 44 24 04 c9 1d 00 	movl   $0x1dc9,0x4(%esp)
    1c34:	00 
    1c35:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c3c:	e8 10 fb ff ff       	call   1751 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1c41:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c46:	c9                   	leave  
    1c47:	c3                   	ret    

00001c48 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1c48:	55                   	push   %ebp
    1c49:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1c4b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1c54:	8b 45 08             	mov    0x8(%ebp),%eax
    1c57:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1c5e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c61:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1c68:	5d                   	pop    %ebp
    1c69:	c3                   	ret    

00001c6a <add_q>:

void add_q(struct queue *q, int v){
    1c6a:	55                   	push   %ebp
    1c6b:	89 e5                	mov    %esp,%ebp
    1c6d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1c70:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1c77:	e8 bb fd ff ff       	call   1a37 <malloc>
    1c7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1c7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c82:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c8c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1c8f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1c91:	8b 45 08             	mov    0x8(%ebp),%eax
    1c94:	8b 40 04             	mov    0x4(%eax),%eax
    1c97:	85 c0                	test   %eax,%eax
    1c99:	75 0b                	jne    1ca6 <add_q+0x3c>
        q->head = n;
    1c9b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ca1:	89 50 04             	mov    %edx,0x4(%eax)
    1ca4:	eb 0c                	jmp    1cb2 <add_q+0x48>
    }else{
        q->tail->next = n;
    1ca6:	8b 45 08             	mov    0x8(%ebp),%eax
    1ca9:	8b 40 08             	mov    0x8(%eax),%eax
    1cac:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1caf:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1cb2:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1cb8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbe:	8b 00                	mov    (%eax),%eax
    1cc0:	8d 50 01             	lea    0x1(%eax),%edx
    1cc3:	8b 45 08             	mov    0x8(%ebp),%eax
    1cc6:	89 10                	mov    %edx,(%eax)
}
    1cc8:	c9                   	leave  
    1cc9:	c3                   	ret    

00001cca <empty_q>:

int empty_q(struct queue *q){
    1cca:	55                   	push   %ebp
    1ccb:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1ccd:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd0:	8b 00                	mov    (%eax),%eax
    1cd2:	85 c0                	test   %eax,%eax
    1cd4:	75 07                	jne    1cdd <empty_q+0x13>
        return 1;
    1cd6:	b8 01 00 00 00       	mov    $0x1,%eax
    1cdb:	eb 05                	jmp    1ce2 <empty_q+0x18>
    else
        return 0;
    1cdd:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1ce2:	5d                   	pop    %ebp
    1ce3:	c3                   	ret    

00001ce4 <pop_q>:
int pop_q(struct queue *q){
    1ce4:	55                   	push   %ebp
    1ce5:	89 e5                	mov    %esp,%ebp
    1ce7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1cea:	8b 45 08             	mov    0x8(%ebp),%eax
    1ced:	89 04 24             	mov    %eax,(%esp)
    1cf0:	e8 d5 ff ff ff       	call   1cca <empty_q>
    1cf5:	85 c0                	test   %eax,%eax
    1cf7:	75 5d                	jne    1d56 <pop_q+0x72>
       val = q->head->value; 
    1cf9:	8b 45 08             	mov    0x8(%ebp),%eax
    1cfc:	8b 40 04             	mov    0x4(%eax),%eax
    1cff:	8b 00                	mov    (%eax),%eax
    1d01:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1d04:	8b 45 08             	mov    0x8(%ebp),%eax
    1d07:	8b 40 04             	mov    0x4(%eax),%eax
    1d0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1d0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d10:	8b 40 04             	mov    0x4(%eax),%eax
    1d13:	8b 50 04             	mov    0x4(%eax),%edx
    1d16:	8b 45 08             	mov    0x8(%ebp),%eax
    1d19:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d1f:	89 04 24             	mov    %eax,(%esp)
    1d22:	e8 e1 fb ff ff       	call   1908 <free>
       q->size--;
    1d27:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2a:	8b 00                	mov    (%eax),%eax
    1d2c:	8d 50 ff             	lea    -0x1(%eax),%edx
    1d2f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d32:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1d34:	8b 45 08             	mov    0x8(%ebp),%eax
    1d37:	8b 00                	mov    (%eax),%eax
    1d39:	85 c0                	test   %eax,%eax
    1d3b:	75 14                	jne    1d51 <pop_q+0x6d>
            q->head = 0;
    1d3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d40:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1d47:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1d51:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d54:	eb 05                	jmp    1d5b <pop_q+0x77>
    }
    return -1;
    1d56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1d5b:	c9                   	leave  
    1d5c:	c3                   	ret    
