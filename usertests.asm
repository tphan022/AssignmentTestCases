
_usertests:     file format elf32-i386


Disassembly of section .text:

00001000 <opentest>:

// simple file system tests

void
opentest(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(stdout, "open test\n");
    1006:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    100b:	c7 44 24 04 da 53 00 	movl   $0x53da,0x4(%esp)
    1012:	00 
    1013:	89 04 24             	mov    %eax,(%esp)
    1016:	e8 9a 3d 00 00       	call   4db5 <printf>
  fd = open("echo", 0);
    101b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1022:	00 
    1023:	c7 04 24 c4 53 00 00 	movl   $0x53c4,(%esp)
    102a:	e8 2d 3c 00 00       	call   4c5c <open>
    102f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1032:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1036:	79 1a                	jns    1052 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
    1038:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    103d:	c7 44 24 04 e5 53 00 	movl   $0x53e5,0x4(%esp)
    1044:	00 
    1045:	89 04 24             	mov    %eax,(%esp)
    1048:	e8 68 3d 00 00       	call   4db5 <printf>
    exit();
    104d:	e8 ca 3b 00 00       	call   4c1c <exit>
  }
  close(fd);
    1052:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1055:	89 04 24             	mov    %eax,(%esp)
    1058:	e8 e7 3b 00 00       	call   4c44 <close>
  fd = open("doesnotexist", 0);
    105d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1064:	00 
    1065:	c7 04 24 f8 53 00 00 	movl   $0x53f8,(%esp)
    106c:	e8 eb 3b 00 00       	call   4c5c <open>
    1071:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    1074:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1078:	78 1a                	js     1094 <opentest+0x94>
    printf(stdout, "open doesnotexist succeeded!\n");
    107a:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    107f:	c7 44 24 04 05 54 00 	movl   $0x5405,0x4(%esp)
    1086:	00 
    1087:	89 04 24             	mov    %eax,(%esp)
    108a:	e8 26 3d 00 00       	call   4db5 <printf>
    exit();
    108f:	e8 88 3b 00 00       	call   4c1c <exit>
  }
  printf(stdout, "open test ok\n");
    1094:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1099:	c7 44 24 04 23 54 00 	movl   $0x5423,0x4(%esp)
    10a0:	00 
    10a1:	89 04 24             	mov    %eax,(%esp)
    10a4:	e8 0c 3d 00 00       	call   4db5 <printf>
}
    10a9:	c9                   	leave  
    10aa:	c3                   	ret    

000010ab <writetest>:

void
writetest(void)
{
    10ab:	55                   	push   %ebp
    10ac:	89 e5                	mov    %esp,%ebp
    10ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
    10b1:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    10b6:	c7 44 24 04 31 54 00 	movl   $0x5431,0x4(%esp)
    10bd:	00 
    10be:	89 04 24             	mov    %eax,(%esp)
    10c1:	e8 ef 3c 00 00       	call   4db5 <printf>
  fd = open("small", O_CREATE|O_RDWR);
    10c6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    10cd:	00 
    10ce:	c7 04 24 42 54 00 00 	movl   $0x5442,(%esp)
    10d5:	e8 82 3b 00 00       	call   4c5c <open>
    10da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
    10dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10e1:	78 21                	js     1104 <writetest+0x59>
    printf(stdout, "creat small succeeded; ok\n");
    10e3:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    10e8:	c7 44 24 04 48 54 00 	movl   $0x5448,0x4(%esp)
    10ef:	00 
    10f0:	89 04 24             	mov    %eax,(%esp)
    10f3:	e8 bd 3c 00 00       	call   4db5 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    10f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    10ff:	e9 a0 00 00 00       	jmp    11a4 <writetest+0xf9>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    1104:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1109:	c7 44 24 04 63 54 00 	movl   $0x5463,0x4(%esp)
    1110:	00 
    1111:	89 04 24             	mov    %eax,(%esp)
    1114:	e8 9c 3c 00 00       	call   4db5 <printf>
    exit();
    1119:	e8 fe 3a 00 00       	call   4c1c <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
    111e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1125:	00 
    1126:	c7 44 24 04 7f 54 00 	movl   $0x547f,0x4(%esp)
    112d:	00 
    112e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1131:	89 04 24             	mov    %eax,(%esp)
    1134:	e8 03 3b 00 00       	call   4c3c <write>
    1139:	83 f8 0a             	cmp    $0xa,%eax
    113c:	74 21                	je     115f <writetest+0xb4>
      printf(stdout, "error: write aa %d new file failed\n", i);
    113e:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1143:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1146:	89 54 24 08          	mov    %edx,0x8(%esp)
    114a:	c7 44 24 04 8c 54 00 	movl   $0x548c,0x4(%esp)
    1151:	00 
    1152:	89 04 24             	mov    %eax,(%esp)
    1155:	e8 5b 3c 00 00       	call   4db5 <printf>
      exit();
    115a:	e8 bd 3a 00 00       	call   4c1c <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
    115f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1166:	00 
    1167:	c7 44 24 04 b0 54 00 	movl   $0x54b0,0x4(%esp)
    116e:	00 
    116f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1172:	89 04 24             	mov    %eax,(%esp)
    1175:	e8 c2 3a 00 00       	call   4c3c <write>
    117a:	83 f8 0a             	cmp    $0xa,%eax
    117d:	74 21                	je     11a0 <writetest+0xf5>
      printf(stdout, "error: write bb %d new file failed\n", i);
    117f:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1184:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1187:	89 54 24 08          	mov    %edx,0x8(%esp)
    118b:	c7 44 24 04 bc 54 00 	movl   $0x54bc,0x4(%esp)
    1192:	00 
    1193:	89 04 24             	mov    %eax,(%esp)
    1196:	e8 1a 3c 00 00       	call   4db5 <printf>
      exit();
    119b:	e8 7c 3a 00 00       	call   4c1c <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    11a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    11a4:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    11a8:	0f 8e 70 ff ff ff    	jle    111e <writetest+0x73>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
    11ae:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    11b3:	c7 44 24 04 e0 54 00 	movl   $0x54e0,0x4(%esp)
    11ba:	00 
    11bb:	89 04 24             	mov    %eax,(%esp)
    11be:	e8 f2 3b 00 00       	call   4db5 <printf>
  close(fd);
    11c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11c6:	89 04 24             	mov    %eax,(%esp)
    11c9:	e8 76 3a 00 00       	call   4c44 <close>
  fd = open("small", O_RDONLY);
    11ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11d5:	00 
    11d6:	c7 04 24 42 54 00 00 	movl   $0x5442,(%esp)
    11dd:	e8 7a 3a 00 00       	call   4c5c <open>
    11e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
    11e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11e9:	78 3e                	js     1229 <writetest+0x17e>
    printf(stdout, "open small succeeded ok\n");
    11eb:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    11f0:	c7 44 24 04 eb 54 00 	movl   $0x54eb,0x4(%esp)
    11f7:	00 
    11f8:	89 04 24             	mov    %eax,(%esp)
    11fb:	e8 b5 3b 00 00       	call   4db5 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
    1200:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
    1207:	00 
    1208:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    120f:	00 
    1210:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1213:	89 04 24             	mov    %eax,(%esp)
    1216:	e8 19 3a 00 00       	call   4c34 <read>
    121b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
    121e:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
    1225:	74 1c                	je     1243 <writetest+0x198>
    1227:	eb 4c                	jmp    1275 <writetest+0x1ca>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
    1229:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    122e:	c7 44 24 04 04 55 00 	movl   $0x5504,0x4(%esp)
    1235:	00 
    1236:	89 04 24             	mov    %eax,(%esp)
    1239:	e8 77 3b 00 00       	call   4db5 <printf>
    exit();
    123e:	e8 d9 39 00 00       	call   4c1c <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
    1243:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1248:	c7 44 24 04 1f 55 00 	movl   $0x551f,0x4(%esp)
    124f:	00 
    1250:	89 04 24             	mov    %eax,(%esp)
    1253:	e8 5d 3b 00 00       	call   4db5 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
    1258:	8b 45 f0             	mov    -0x10(%ebp),%eax
    125b:	89 04 24             	mov    %eax,(%esp)
    125e:	e8 e1 39 00 00       	call   4c44 <close>

  if(unlink("small") < 0){
    1263:	c7 04 24 42 54 00 00 	movl   $0x5442,(%esp)
    126a:	e8 fd 39 00 00       	call   4c6c <unlink>
    126f:	85 c0                	test   %eax,%eax
    1271:	78 1c                	js     128f <writetest+0x1e4>
    1273:	eb 34                	jmp    12a9 <writetest+0x1fe>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
    1275:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    127a:	c7 44 24 04 32 55 00 	movl   $0x5532,0x4(%esp)
    1281:	00 
    1282:	89 04 24             	mov    %eax,(%esp)
    1285:	e8 2b 3b 00 00       	call   4db5 <printf>
    exit();
    128a:	e8 8d 39 00 00       	call   4c1c <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
    128f:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1294:	c7 44 24 04 3f 55 00 	movl   $0x553f,0x4(%esp)
    129b:	00 
    129c:	89 04 24             	mov    %eax,(%esp)
    129f:	e8 11 3b 00 00       	call   4db5 <printf>
    exit();
    12a4:	e8 73 39 00 00       	call   4c1c <exit>
  }
  printf(stdout, "small file test ok\n");
    12a9:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    12ae:	c7 44 24 04 54 55 00 	movl   $0x5554,0x4(%esp)
    12b5:	00 
    12b6:	89 04 24             	mov    %eax,(%esp)
    12b9:	e8 f7 3a 00 00       	call   4db5 <printf>
}
    12be:	c9                   	leave  
    12bf:	c3                   	ret    

000012c0 <writetest1>:

void
writetest1(void)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	83 ec 28             	sub    $0x28,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
    12c6:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    12cb:	c7 44 24 04 68 55 00 	movl   $0x5568,0x4(%esp)
    12d2:	00 
    12d3:	89 04 24             	mov    %eax,(%esp)
    12d6:	e8 da 3a 00 00       	call   4db5 <printf>

  fd = open("big", O_CREATE|O_RDWR);
    12db:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    12e2:	00 
    12e3:	c7 04 24 78 55 00 00 	movl   $0x5578,(%esp)
    12ea:	e8 6d 39 00 00       	call   4c5c <open>
    12ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    12f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    12f6:	79 1a                	jns    1312 <writetest1+0x52>
    printf(stdout, "error: creat big failed!\n");
    12f8:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    12fd:	c7 44 24 04 7c 55 00 	movl   $0x557c,0x4(%esp)
    1304:	00 
    1305:	89 04 24             	mov    %eax,(%esp)
    1308:	e8 a8 3a 00 00       	call   4db5 <printf>
    exit();
    130d:	e8 0a 39 00 00       	call   4c1c <exit>
  }

  for(i = 0; i < MAXFILE; i++){
    1312:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1319:	eb 51                	jmp    136c <writetest1+0xac>
    ((int*)buf)[0] = i;
    131b:	b8 c0 92 00 00       	mov    $0x92c0,%eax
    1320:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1323:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
    1325:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    132c:	00 
    132d:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    1334:	00 
    1335:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1338:	89 04 24             	mov    %eax,(%esp)
    133b:	e8 fc 38 00 00       	call   4c3c <write>
    1340:	3d 00 02 00 00       	cmp    $0x200,%eax
    1345:	74 21                	je     1368 <writetest1+0xa8>
      printf(stdout, "error: write big file failed\n", i);
    1347:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    134c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    134f:	89 54 24 08          	mov    %edx,0x8(%esp)
    1353:	c7 44 24 04 96 55 00 	movl   $0x5596,0x4(%esp)
    135a:	00 
    135b:	89 04 24             	mov    %eax,(%esp)
    135e:	e8 52 3a 00 00       	call   4db5 <printf>
      exit();
    1363:	e8 b4 38 00 00       	call   4c1c <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    1368:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    136c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    136f:	3d 8b 00 00 00       	cmp    $0x8b,%eax
    1374:	76 a5                	jbe    131b <writetest1+0x5b>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
    1376:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1379:	89 04 24             	mov    %eax,(%esp)
    137c:	e8 c3 38 00 00       	call   4c44 <close>

  fd = open("big", O_RDONLY);
    1381:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1388:	00 
    1389:	c7 04 24 78 55 00 00 	movl   $0x5578,(%esp)
    1390:	e8 c7 38 00 00       	call   4c5c <open>
    1395:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1398:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    139c:	79 1a                	jns    13b8 <writetest1+0xf8>
    printf(stdout, "error: open big failed!\n");
    139e:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    13a3:	c7 44 24 04 b4 55 00 	movl   $0x55b4,0x4(%esp)
    13aa:	00 
    13ab:	89 04 24             	mov    %eax,(%esp)
    13ae:	e8 02 3a 00 00       	call   4db5 <printf>
    exit();
    13b3:	e8 64 38 00 00       	call   4c1c <exit>
  }

  n = 0;
    13b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  for(;;){
    i = read(fd, buf, 512);
    13bf:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    13c6:	00 
    13c7:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    13ce:	00 
    13cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13d2:	89 04 24             	mov    %eax,(%esp)
    13d5:	e8 5a 38 00 00       	call   4c34 <read>
    13da:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(i == 0){
    13dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    13e1:	75 2e                	jne    1411 <writetest1+0x151>
      if(n == MAXFILE - 1){
    13e3:	81 7d f4 8b 00 00 00 	cmpl   $0x8b,-0xc(%ebp)
    13ea:	0f 85 8c 00 00 00    	jne    147c <writetest1+0x1bc>
        printf(stdout, "read only %d blocks from big", n);
    13f0:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    13f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    13f8:	89 54 24 08          	mov    %edx,0x8(%esp)
    13fc:	c7 44 24 04 cd 55 00 	movl   $0x55cd,0x4(%esp)
    1403:	00 
    1404:	89 04 24             	mov    %eax,(%esp)
    1407:	e8 a9 39 00 00       	call   4db5 <printf>
        exit();
    140c:	e8 0b 38 00 00       	call   4c1c <exit>
      }
      break;
    } else if(i != 512){
    1411:	81 7d ec 00 02 00 00 	cmpl   $0x200,-0x14(%ebp)
    1418:	74 21                	je     143b <writetest1+0x17b>
      printf(stdout, "read failed %d\n", i);
    141a:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    141f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1422:	89 54 24 08          	mov    %edx,0x8(%esp)
    1426:	c7 44 24 04 ea 55 00 	movl   $0x55ea,0x4(%esp)
    142d:	00 
    142e:	89 04 24             	mov    %eax,(%esp)
    1431:	e8 7f 39 00 00       	call   4db5 <printf>
      exit();
    1436:	e8 e1 37 00 00       	call   4c1c <exit>
    }
    if(((int*)buf)[0] != n){
    143b:	b8 c0 92 00 00       	mov    $0x92c0,%eax
    1440:	8b 00                	mov    (%eax),%eax
    1442:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1445:	74 2c                	je     1473 <writetest1+0x1b3>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
    1447:	b8 c0 92 00 00       	mov    $0x92c0,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
    144c:	8b 10                	mov    (%eax),%edx
    144e:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1453:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1457:	8b 55 f4             	mov    -0xc(%ebp),%edx
    145a:	89 54 24 08          	mov    %edx,0x8(%esp)
    145e:	c7 44 24 04 fc 55 00 	movl   $0x55fc,0x4(%esp)
    1465:	00 
    1466:	89 04 24             	mov    %eax,(%esp)
    1469:	e8 47 39 00 00       	call   4db5 <printf>
             n, ((int*)buf)[0]);
      exit();
    146e:	e8 a9 37 00 00       	call   4c1c <exit>
    }
    n++;
    1473:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
    1477:	e9 43 ff ff ff       	jmp    13bf <writetest1+0xff>
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    147c:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
    147d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1480:	89 04 24             	mov    %eax,(%esp)
    1483:	e8 bc 37 00 00       	call   4c44 <close>
  if(unlink("big") < 0){
    1488:	c7 04 24 78 55 00 00 	movl   $0x5578,(%esp)
    148f:	e8 d8 37 00 00       	call   4c6c <unlink>
    1494:	85 c0                	test   %eax,%eax
    1496:	79 1a                	jns    14b2 <writetest1+0x1f2>
    printf(stdout, "unlink big failed\n");
    1498:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    149d:	c7 44 24 04 1c 56 00 	movl   $0x561c,0x4(%esp)
    14a4:	00 
    14a5:	89 04 24             	mov    %eax,(%esp)
    14a8:	e8 08 39 00 00       	call   4db5 <printf>
    exit();
    14ad:	e8 6a 37 00 00       	call   4c1c <exit>
  }
  printf(stdout, "big files ok\n");
    14b2:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    14b7:	c7 44 24 04 2f 56 00 	movl   $0x562f,0x4(%esp)
    14be:	00 
    14bf:	89 04 24             	mov    %eax,(%esp)
    14c2:	e8 ee 38 00 00       	call   4db5 <printf>
}
    14c7:	c9                   	leave  
    14c8:	c3                   	ret    

000014c9 <createtest>:

void
createtest(void)
{
    14c9:	55                   	push   %ebp
    14ca:	89 e5                	mov    %esp,%ebp
    14cc:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
    14cf:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    14d4:	c7 44 24 04 40 56 00 	movl   $0x5640,0x4(%esp)
    14db:	00 
    14dc:	89 04 24             	mov    %eax,(%esp)
    14df:	e8 d1 38 00 00       	call   4db5 <printf>

  name[0] = 'a';
    14e4:	c6 05 c0 b2 00 00 61 	movb   $0x61,0xb2c0
  name[2] = '\0';
    14eb:	c6 05 c2 b2 00 00 00 	movb   $0x0,0xb2c2
  for(i = 0; i < 52; i++){
    14f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14f9:	eb 31                	jmp    152c <createtest+0x63>
    name[1] = '0' + i;
    14fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14fe:	83 c0 30             	add    $0x30,%eax
    1501:	a2 c1 b2 00 00       	mov    %al,0xb2c1
    fd = open(name, O_CREATE|O_RDWR);
    1506:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    150d:	00 
    150e:	c7 04 24 c0 b2 00 00 	movl   $0xb2c0,(%esp)
    1515:	e8 42 37 00 00       	call   4c5c <open>
    151a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    close(fd);
    151d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1520:	89 04 24             	mov    %eax,(%esp)
    1523:	e8 1c 37 00 00       	call   4c44 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    1528:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    152c:	83 7d f0 33          	cmpl   $0x33,-0x10(%ebp)
    1530:	7e c9                	jle    14fb <createtest+0x32>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
    1532:	c6 05 c0 b2 00 00 61 	movb   $0x61,0xb2c0
  name[2] = '\0';
    1539:	c6 05 c2 b2 00 00 00 	movb   $0x0,0xb2c2
  for(i = 0; i < 52; i++){
    1540:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1547:	eb 1b                	jmp    1564 <createtest+0x9b>
    name[1] = '0' + i;
    1549:	8b 45 f0             	mov    -0x10(%ebp),%eax
    154c:	83 c0 30             	add    $0x30,%eax
    154f:	a2 c1 b2 00 00       	mov    %al,0xb2c1
    unlink(name);
    1554:	c7 04 24 c0 b2 00 00 	movl   $0xb2c0,(%esp)
    155b:	e8 0c 37 00 00       	call   4c6c <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    1560:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1564:	83 7d f0 33          	cmpl   $0x33,-0x10(%ebp)
    1568:	7e df                	jle    1549 <createtest+0x80>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
    156a:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    156f:	c7 44 24 04 68 56 00 	movl   $0x5668,0x4(%esp)
    1576:	00 
    1577:	89 04 24             	mov    %eax,(%esp)
    157a:	e8 36 38 00 00       	call   4db5 <printf>
}
    157f:	c9                   	leave  
    1580:	c3                   	ret    

00001581 <dirtest>:

void dirtest(void)
{
    1581:	55                   	push   %ebp
    1582:	89 e5                	mov    %esp,%ebp
    1584:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
    1587:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    158c:	c7 44 24 04 8e 56 00 	movl   $0x568e,0x4(%esp)
    1593:	00 
    1594:	89 04 24             	mov    %eax,(%esp)
    1597:	e8 19 38 00 00       	call   4db5 <printf>

  if(mkdir("dir0") < 0){
    159c:	c7 04 24 9a 56 00 00 	movl   $0x569a,(%esp)
    15a3:	e8 dc 36 00 00       	call   4c84 <mkdir>
    15a8:	85 c0                	test   %eax,%eax
    15aa:	79 1a                	jns    15c6 <dirtest+0x45>
    printf(stdout, "mkdir failed\n");
    15ac:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    15b1:	c7 44 24 04 9f 56 00 	movl   $0x569f,0x4(%esp)
    15b8:	00 
    15b9:	89 04 24             	mov    %eax,(%esp)
    15bc:	e8 f4 37 00 00       	call   4db5 <printf>
    exit();
    15c1:	e8 56 36 00 00       	call   4c1c <exit>
  }

  if(chdir("dir0") < 0){
    15c6:	c7 04 24 9a 56 00 00 	movl   $0x569a,(%esp)
    15cd:	e8 ba 36 00 00       	call   4c8c <chdir>
    15d2:	85 c0                	test   %eax,%eax
    15d4:	79 1a                	jns    15f0 <dirtest+0x6f>
    printf(stdout, "chdir dir0 failed\n");
    15d6:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    15db:	c7 44 24 04 ad 56 00 	movl   $0x56ad,0x4(%esp)
    15e2:	00 
    15e3:	89 04 24             	mov    %eax,(%esp)
    15e6:	e8 ca 37 00 00       	call   4db5 <printf>
    exit();
    15eb:	e8 2c 36 00 00       	call   4c1c <exit>
  }

  if(chdir("..") < 0){
    15f0:	c7 04 24 c0 56 00 00 	movl   $0x56c0,(%esp)
    15f7:	e8 90 36 00 00       	call   4c8c <chdir>
    15fc:	85 c0                	test   %eax,%eax
    15fe:	79 1a                	jns    161a <dirtest+0x99>
    printf(stdout, "chdir .. failed\n");
    1600:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1605:	c7 44 24 04 c3 56 00 	movl   $0x56c3,0x4(%esp)
    160c:	00 
    160d:	89 04 24             	mov    %eax,(%esp)
    1610:	e8 a0 37 00 00       	call   4db5 <printf>
    exit();
    1615:	e8 02 36 00 00       	call   4c1c <exit>
  }

  if(unlink("dir0") < 0){
    161a:	c7 04 24 9a 56 00 00 	movl   $0x569a,(%esp)
    1621:	e8 46 36 00 00       	call   4c6c <unlink>
    1626:	85 c0                	test   %eax,%eax
    1628:	79 1a                	jns    1644 <dirtest+0xc3>
    printf(stdout, "unlink dir0 failed\n");
    162a:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    162f:	c7 44 24 04 d4 56 00 	movl   $0x56d4,0x4(%esp)
    1636:	00 
    1637:	89 04 24             	mov    %eax,(%esp)
    163a:	e8 76 37 00 00       	call   4db5 <printf>
    exit();
    163f:	e8 d8 35 00 00       	call   4c1c <exit>
  }
  printf(stdout, "mkdir test\n");
    1644:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1649:	c7 44 24 04 8e 56 00 	movl   $0x568e,0x4(%esp)
    1650:	00 
    1651:	89 04 24             	mov    %eax,(%esp)
    1654:	e8 5c 37 00 00       	call   4db5 <printf>
}
    1659:	c9                   	leave  
    165a:	c3                   	ret    

0000165b <exectest>:

void
exectest(void)
{
    165b:	55                   	push   %ebp
    165c:	89 e5                	mov    %esp,%ebp
    165e:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
    1661:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1666:	c7 44 24 04 e8 56 00 	movl   $0x56e8,0x4(%esp)
    166d:	00 
    166e:	89 04 24             	mov    %eax,(%esp)
    1671:	e8 3f 37 00 00       	call   4db5 <printf>
  if(exec("echo", echoargv) < 0){
    1676:	c7 44 24 04 bc 6a 00 	movl   $0x6abc,0x4(%esp)
    167d:	00 
    167e:	c7 04 24 c4 53 00 00 	movl   $0x53c4,(%esp)
    1685:	e8 ca 35 00 00       	call   4c54 <exec>
    168a:	85 c0                	test   %eax,%eax
    168c:	79 1a                	jns    16a8 <exectest+0x4d>
    printf(stdout, "exec echo failed\n");
    168e:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    1693:	c7 44 24 04 f3 56 00 	movl   $0x56f3,0x4(%esp)
    169a:	00 
    169b:	89 04 24             	mov    %eax,(%esp)
    169e:	e8 12 37 00 00       	call   4db5 <printf>
    exit();
    16a3:	e8 74 35 00 00       	call   4c1c <exit>
  }
}
    16a8:	c9                   	leave  
    16a9:	c3                   	ret    

000016aa <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
    16aa:	55                   	push   %ebp
    16ab:	89 e5                	mov    %esp,%ebp
    16ad:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    16b0:	8d 45 d8             	lea    -0x28(%ebp),%eax
    16b3:	89 04 24             	mov    %eax,(%esp)
    16b6:	e8 71 35 00 00       	call   4c2c <pipe>
    16bb:	85 c0                	test   %eax,%eax
    16bd:	74 19                	je     16d8 <pipe1+0x2e>
    printf(1, "pipe() failed\n");
    16bf:	c7 44 24 04 05 57 00 	movl   $0x5705,0x4(%esp)
    16c6:	00 
    16c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16ce:	e8 e2 36 00 00       	call   4db5 <printf>
    exit();
    16d3:	e8 44 35 00 00       	call   4c1c <exit>
  }
  pid = fork();
    16d8:	e8 37 35 00 00       	call   4c14 <fork>
    16dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
    16e0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  if(pid == 0){
    16e7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    16eb:	0f 85 84 00 00 00    	jne    1775 <pipe1+0xcb>
    close(fds[0]);
    16f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    16f4:	89 04 24             	mov    %eax,(%esp)
    16f7:	e8 48 35 00 00       	call   4c44 <close>
    for(n = 0; n < 5; n++){
    16fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1703:	eb 65                	jmp    176a <pipe1+0xc0>
      for(i = 0; i < 1033; i++)
    1705:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    170c:	eb 14                	jmp    1722 <pipe1+0x78>
        buf[i] = seq++;
    170e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1711:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1714:	88 90 c0 92 00 00    	mov    %dl,0x92c0(%eax)
    171a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
    171e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1722:	81 7d e8 08 04 00 00 	cmpl   $0x408,-0x18(%ebp)
    1729:	7e e3                	jle    170e <pipe1+0x64>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
    172b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    172e:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
    1735:	00 
    1736:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    173d:	00 
    173e:	89 04 24             	mov    %eax,(%esp)
    1741:	e8 f6 34 00 00       	call   4c3c <write>
    1746:	3d 09 04 00 00       	cmp    $0x409,%eax
    174b:	74 19                	je     1766 <pipe1+0xbc>
        printf(1, "pipe1 oops 1\n");
    174d:	c7 44 24 04 14 57 00 	movl   $0x5714,0x4(%esp)
    1754:	00 
    1755:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    175c:	e8 54 36 00 00       	call   4db5 <printf>
        exit();
    1761:	e8 b6 34 00 00       	call   4c1c <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
    1766:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    176a:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
    176e:	7e 95                	jle    1705 <pipe1+0x5b>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
    1770:	e8 a7 34 00 00       	call   4c1c <exit>
  } else if(pid > 0){
    1775:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1779:	0f 8e fb 00 00 00    	jle    187a <pipe1+0x1d0>
    close(fds[1]);
    177f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1782:	89 04 24             	mov    %eax,(%esp)
    1785:	e8 ba 34 00 00       	call   4c44 <close>
    total = 0;
    178a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = 1;
    1791:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
    1798:	eb 6a                	jmp    1804 <pipe1+0x15a>
      for(i = 0; i < n; i++){
    179a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    17a1:	eb 3f                	jmp    17e2 <pipe1+0x138>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    17a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17a6:	0f b6 80 c0 92 00 00 	movzbl 0x92c0(%eax),%eax
    17ad:	0f be c0             	movsbl %al,%eax
    17b0:	33 45 e4             	xor    -0x1c(%ebp),%eax
    17b3:	25 ff 00 00 00       	and    $0xff,%eax
    17b8:	85 c0                	test   %eax,%eax
    17ba:	0f 95 c0             	setne  %al
    17bd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    17c1:	84 c0                	test   %al,%al
    17c3:	74 19                	je     17de <pipe1+0x134>
          printf(1, "pipe1 oops 2\n");
    17c5:	c7 44 24 04 22 57 00 	movl   $0x5722,0x4(%esp)
    17cc:	00 
    17cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    17d4:	e8 dc 35 00 00       	call   4db5 <printf>
          return;
    17d9:	e9 b5 00 00 00       	jmp    1893 <pipe1+0x1e9>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
    17de:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    17e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17e5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    17e8:	7c b9                	jl     17a3 <pipe1+0xf9>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
    17ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17ed:	01 45 f4             	add    %eax,-0xc(%ebp)
      cc = cc * 2;
    17f0:	d1 65 f0             	shll   -0x10(%ebp)
      if(cc > sizeof(buf))
    17f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17f6:	3d 00 20 00 00       	cmp    $0x2000,%eax
    17fb:	76 07                	jbe    1804 <pipe1+0x15a>
        cc = sizeof(buf);
    17fd:	c7 45 f0 00 20 00 00 	movl   $0x2000,-0x10(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
    1804:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1807:	8b 55 f0             	mov    -0x10(%ebp),%edx
    180a:	89 54 24 08          	mov    %edx,0x8(%esp)
    180e:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    1815:	00 
    1816:	89 04 24             	mov    %eax,(%esp)
    1819:	e8 16 34 00 00       	call   4c34 <read>
    181e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1821:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1825:	0f 8f 6f ff ff ff    	jg     179a <pipe1+0xf0>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
    182b:	81 7d f4 2d 14 00 00 	cmpl   $0x142d,-0xc(%ebp)
    1832:	74 20                	je     1854 <pipe1+0x1aa>
      printf(1, "pipe1 oops 3 total %d\n", total);
    1834:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1837:	89 44 24 08          	mov    %eax,0x8(%esp)
    183b:	c7 44 24 04 30 57 00 	movl   $0x5730,0x4(%esp)
    1842:	00 
    1843:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    184a:	e8 66 35 00 00       	call   4db5 <printf>
      exit();
    184f:	e8 c8 33 00 00       	call   4c1c <exit>
    }
    close(fds[0]);
    1854:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1857:	89 04 24             	mov    %eax,(%esp)
    185a:	e8 e5 33 00 00       	call   4c44 <close>
    wait();
    185f:	e8 c0 33 00 00       	call   4c24 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
    1864:	c7 44 24 04 47 57 00 	movl   $0x5747,0x4(%esp)
    186b:	00 
    186c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1873:	e8 3d 35 00 00       	call   4db5 <printf>
    1878:	eb 19                	jmp    1893 <pipe1+0x1e9>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
    187a:	c7 44 24 04 51 57 00 	movl   $0x5751,0x4(%esp)
    1881:	00 
    1882:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1889:	e8 27 35 00 00       	call   4db5 <printf>
    exit();
    188e:	e8 89 33 00 00       	call   4c1c <exit>
  }
  printf(1, "pipe1 ok\n");
}
    1893:	c9                   	leave  
    1894:	c3                   	ret    

00001895 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
    1895:	55                   	push   %ebp
    1896:	89 e5                	mov    %esp,%ebp
    1898:	83 ec 38             	sub    $0x38,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
    189b:	c7 44 24 04 60 57 00 	movl   $0x5760,0x4(%esp)
    18a2:	00 
    18a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18aa:	e8 06 35 00 00       	call   4db5 <printf>
  pid1 = fork();
    18af:	e8 60 33 00 00       	call   4c14 <fork>
    18b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid1 == 0)
    18b7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18bb:	75 02                	jne    18bf <preempt+0x2a>
    for(;;)
      ;
    18bd:	eb fe                	jmp    18bd <preempt+0x28>

  pid2 = fork();
    18bf:	e8 50 33 00 00       	call   4c14 <fork>
    18c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
    18c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18cb:	75 02                	jne    18cf <preempt+0x3a>
    for(;;)
      ;
    18cd:	eb fe                	jmp    18cd <preempt+0x38>

  pipe(pfds);
    18cf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    18d2:	89 04 24             	mov    %eax,(%esp)
    18d5:	e8 52 33 00 00       	call   4c2c <pipe>
  pid3 = fork();
    18da:	e8 35 33 00 00       	call   4c14 <fork>
    18df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid3 == 0){
    18e2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    18e6:	75 4c                	jne    1934 <preempt+0x9f>
    close(pfds[0]);
    18e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18eb:	89 04 24             	mov    %eax,(%esp)
    18ee:	e8 51 33 00 00       	call   4c44 <close>
    if(write(pfds[1], "x", 1) != 1)
    18f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18f6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    18fd:	00 
    18fe:	c7 44 24 04 6a 57 00 	movl   $0x576a,0x4(%esp)
    1905:	00 
    1906:	89 04 24             	mov    %eax,(%esp)
    1909:	e8 2e 33 00 00       	call   4c3c <write>
    190e:	83 f8 01             	cmp    $0x1,%eax
    1911:	74 14                	je     1927 <preempt+0x92>
      printf(1, "preempt write error");
    1913:	c7 44 24 04 6c 57 00 	movl   $0x576c,0x4(%esp)
    191a:	00 
    191b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1922:	e8 8e 34 00 00       	call   4db5 <printf>
    close(pfds[1]);
    1927:	8b 45 e8             	mov    -0x18(%ebp),%eax
    192a:	89 04 24             	mov    %eax,(%esp)
    192d:	e8 12 33 00 00       	call   4c44 <close>
    for(;;)
      ;
    1932:	eb fe                	jmp    1932 <preempt+0x9d>
  }

  close(pfds[1]);
    1934:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1937:	89 04 24             	mov    %eax,(%esp)
    193a:	e8 05 33 00 00       	call   4c44 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    193f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1942:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1949:	00 
    194a:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    1951:	00 
    1952:	89 04 24             	mov    %eax,(%esp)
    1955:	e8 da 32 00 00       	call   4c34 <read>
    195a:	83 f8 01             	cmp    $0x1,%eax
    195d:	74 16                	je     1975 <preempt+0xe0>
    printf(1, "preempt read error");
    195f:	c7 44 24 04 80 57 00 	movl   $0x5780,0x4(%esp)
    1966:	00 
    1967:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196e:	e8 42 34 00 00       	call   4db5 <printf>
    return;
    1973:	eb 77                	jmp    19ec <preempt+0x157>
  }
  close(pfds[0]);
    1975:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1978:	89 04 24             	mov    %eax,(%esp)
    197b:	e8 c4 32 00 00       	call   4c44 <close>
  printf(1, "kill... ");
    1980:	c7 44 24 04 93 57 00 	movl   $0x5793,0x4(%esp)
    1987:	00 
    1988:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    198f:	e8 21 34 00 00       	call   4db5 <printf>
  kill(pid1);
    1994:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1997:	89 04 24             	mov    %eax,(%esp)
    199a:	e8 ad 32 00 00       	call   4c4c <kill>
  kill(pid2);
    199f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19a2:	89 04 24             	mov    %eax,(%esp)
    19a5:	e8 a2 32 00 00       	call   4c4c <kill>
  kill(pid3);
    19aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ad:	89 04 24             	mov    %eax,(%esp)
    19b0:	e8 97 32 00 00       	call   4c4c <kill>
  printf(1, "wait... ");
    19b5:	c7 44 24 04 9c 57 00 	movl   $0x579c,0x4(%esp)
    19bc:	00 
    19bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19c4:	e8 ec 33 00 00       	call   4db5 <printf>
  wait();
    19c9:	e8 56 32 00 00       	call   4c24 <wait>
  wait();
    19ce:	e8 51 32 00 00       	call   4c24 <wait>
  wait();
    19d3:	e8 4c 32 00 00       	call   4c24 <wait>
  printf(1, "preempt ok\n");
    19d8:	c7 44 24 04 a5 57 00 	movl   $0x57a5,0x4(%esp)
    19df:	00 
    19e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    19e7:	e8 c9 33 00 00       	call   4db5 <printf>
}
    19ec:	c9                   	leave  
    19ed:	c3                   	ret    

000019ee <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
    19ee:	55                   	push   %ebp
    19ef:	89 e5                	mov    %esp,%ebp
    19f1:	83 ec 28             	sub    $0x28,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
    19f4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    19fb:	eb 53                	jmp    1a50 <exitwait+0x62>
    pid = fork();
    19fd:	e8 12 32 00 00       	call   4c14 <fork>
    1a02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0){
    1a05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a09:	79 16                	jns    1a21 <exitwait+0x33>
      printf(1, "fork failed\n");
    1a0b:	c7 44 24 04 b1 57 00 	movl   $0x57b1,0x4(%esp)
    1a12:	00 
    1a13:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a1a:	e8 96 33 00 00       	call   4db5 <printf>
      return;
    1a1f:	eb 49                	jmp    1a6a <exitwait+0x7c>
    }
    if(pid){
    1a21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a25:	74 20                	je     1a47 <exitwait+0x59>
      if(wait() != pid){
    1a27:	e8 f8 31 00 00       	call   4c24 <wait>
    1a2c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1a2f:	74 1b                	je     1a4c <exitwait+0x5e>
        printf(1, "wait wrong pid\n");
    1a31:	c7 44 24 04 be 57 00 	movl   $0x57be,0x4(%esp)
    1a38:	00 
    1a39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a40:	e8 70 33 00 00       	call   4db5 <printf>
        return;
    1a45:	eb 23                	jmp    1a6a <exitwait+0x7c>
      }
    } else {
      exit();
    1a47:	e8 d0 31 00 00       	call   4c1c <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    1a4c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1a50:	83 7d f0 63          	cmpl   $0x63,-0x10(%ebp)
    1a54:	7e a7                	jle    19fd <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
    1a56:	c7 44 24 04 ce 57 00 	movl   $0x57ce,0x4(%esp)
    1a5d:	00 
    1a5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a65:	e8 4b 33 00 00       	call   4db5 <printf>
}
    1a6a:	c9                   	leave  
    1a6b:	c3                   	ret    

00001a6c <mem>:

void
mem(void)
{
    1a6c:	55                   	push   %ebp
    1a6d:	89 e5                	mov    %esp,%ebp
    1a6f:	83 ec 28             	sub    $0x28,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
    1a72:	c7 44 24 04 db 57 00 	movl   $0x57db,0x4(%esp)
    1a79:	00 
    1a7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a81:	e8 2f 33 00 00       	call   4db5 <printf>
  ppid = getpid();
    1a86:	e8 11 32 00 00       	call   4c9c <getpid>
    1a8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((pid = fork()) == 0){
    1a8e:	e8 81 31 00 00       	call   4c14 <fork>
    1a93:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1a96:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1a9a:	0f 85 aa 00 00 00    	jne    1b4a <mem+0xde>
    m1 = 0;
    1aa0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while((m2 = malloc(10001)) != 0){
    1aa7:	eb 0e                	jmp    1ab7 <mem+0x4b>
      *(char**)m2 = m1;
    1aa9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    1aaf:	89 10                	mov    %edx,(%eax)
      m1 = m2;
    1ab1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ab4:	89 45 e8             	mov    %eax,-0x18(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
    1ab7:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
    1abe:	e8 d8 35 00 00       	call   509b <malloc>
    1ac3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1ac6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1aca:	75 dd                	jne    1aa9 <mem+0x3d>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
    1acc:	eb 19                	jmp    1ae7 <mem+0x7b>
      m2 = *(char**)m1;
    1ace:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ad1:	8b 00                	mov    (%eax),%eax
    1ad3:	89 45 ec             	mov    %eax,-0x14(%ebp)
      free(m1);
    1ad6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ad9:	89 04 24             	mov    %eax,(%esp)
    1adc:	e8 8b 34 00 00       	call   4f6c <free>
      m1 = m2;
    1ae1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ae4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
    1ae7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1aeb:	75 e1                	jne    1ace <mem+0x62>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    1aed:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
    1af4:	e8 a2 35 00 00       	call   509b <malloc>
    1af9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(m1 == 0){
    1afc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1b00:	75 24                	jne    1b26 <mem+0xba>
      printf(1, "couldn't allocate mem?!!\n");
    1b02:	c7 44 24 04 e5 57 00 	movl   $0x57e5,0x4(%esp)
    1b09:	00 
    1b0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b11:	e8 9f 32 00 00       	call   4db5 <printf>
      kill(ppid);
    1b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b19:	89 04 24             	mov    %eax,(%esp)
    1b1c:	e8 2b 31 00 00       	call   4c4c <kill>
      exit();
    1b21:	e8 f6 30 00 00       	call   4c1c <exit>
    }
    free(m1);
    1b26:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b29:	89 04 24             	mov    %eax,(%esp)
    1b2c:	e8 3b 34 00 00       	call   4f6c <free>
    printf(1, "mem ok\n");
    1b31:	c7 44 24 04 ff 57 00 	movl   $0x57ff,0x4(%esp)
    1b38:	00 
    1b39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b40:	e8 70 32 00 00       	call   4db5 <printf>
    exit();
    1b45:	e8 d2 30 00 00       	call   4c1c <exit>
  } else {
    wait();
    1b4a:	e8 d5 30 00 00       	call   4c24 <wait>
  }
}
    1b4f:	c9                   	leave  
    1b50:	c3                   	ret    

00001b51 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
    1b51:	55                   	push   %ebp
    1b52:	89 e5                	mov    %esp,%ebp
    1b54:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
    1b57:	c7 44 24 04 07 58 00 	movl   $0x5807,0x4(%esp)
    1b5e:	00 
    1b5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b66:	e8 4a 32 00 00       	call   4db5 <printf>

  unlink("sharedfd");
    1b6b:	c7 04 24 16 58 00 00 	movl   $0x5816,(%esp)
    1b72:	e8 f5 30 00 00       	call   4c6c <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    1b77:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1b7e:	00 
    1b7f:	c7 04 24 16 58 00 00 	movl   $0x5816,(%esp)
    1b86:	e8 d1 30 00 00       	call   4c5c <open>
    1b8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
    1b8e:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1b92:	79 19                	jns    1bad <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
    1b94:	c7 44 24 04 20 58 00 	movl   $0x5820,0x4(%esp)
    1b9b:	00 
    1b9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ba3:	e8 0d 32 00 00       	call   4db5 <printf>
    return;
    1ba8:	e9 9b 01 00 00       	jmp    1d48 <sharedfd+0x1f7>
  }
  pid = fork();
    1bad:	e8 62 30 00 00       	call   4c14 <fork>
    1bb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1bb5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1bb9:	75 07                	jne    1bc2 <sharedfd+0x71>
    1bbb:	b8 63 00 00 00       	mov    $0x63,%eax
    1bc0:	eb 05                	jmp    1bc7 <sharedfd+0x76>
    1bc2:	b8 70 00 00 00       	mov    $0x70,%eax
    1bc7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1bce:	00 
    1bcf:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bd3:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    1bd6:	89 04 24             	mov    %eax,(%esp)
    1bd9:	e8 98 2e 00 00       	call   4a76 <memset>
  for(i = 0; i < 1000; i++){
    1bde:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1be5:	eb 39                	jmp    1c20 <sharedfd+0xcf>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    1be7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1bee:	00 
    1bef:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    1bf2:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bf6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1bf9:	89 04 24             	mov    %eax,(%esp)
    1bfc:	e8 3b 30 00 00       	call   4c3c <write>
    1c01:	83 f8 0a             	cmp    $0xa,%eax
    1c04:	74 16                	je     1c1c <sharedfd+0xcb>
      printf(1, "fstests: write sharedfd failed\n");
    1c06:	c7 44 24 04 4c 58 00 	movl   $0x584c,0x4(%esp)
    1c0d:	00 
    1c0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c15:	e8 9b 31 00 00       	call   4db5 <printf>
      break;
    1c1a:	eb 0d                	jmp    1c29 <sharedfd+0xd8>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
    1c1c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1c20:	81 7d e8 e7 03 00 00 	cmpl   $0x3e7,-0x18(%ebp)
    1c27:	7e be                	jle    1be7 <sharedfd+0x96>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    1c29:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1c2d:	75 05                	jne    1c34 <sharedfd+0xe3>
    exit();
    1c2f:	e8 e8 2f 00 00       	call   4c1c <exit>
  else
    wait();
    1c34:	e8 eb 2f 00 00       	call   4c24 <wait>
  close(fd);
    1c39:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1c3c:	89 04 24             	mov    %eax,(%esp)
    1c3f:	e8 00 30 00 00       	call   4c44 <close>
  fd = open("sharedfd", 0);
    1c44:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1c4b:	00 
    1c4c:	c7 04 24 16 58 00 00 	movl   $0x5816,(%esp)
    1c53:	e8 04 30 00 00       	call   4c5c <open>
    1c58:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
    1c5b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1c5f:	79 19                	jns    1c7a <sharedfd+0x129>
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1c61:	c7 44 24 04 6c 58 00 	movl   $0x586c,0x4(%esp)
    1c68:	00 
    1c69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c70:	e8 40 31 00 00       	call   4db5 <printf>
    return;
    1c75:	e9 ce 00 00 00       	jmp    1d48 <sharedfd+0x1f7>
  }
  nc = np = 0;
    1c7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c84:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1c87:	eb 35                	jmp    1cbe <sharedfd+0x16d>
    for(i = 0; i < sizeof(buf); i++){
    1c89:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1c90:	eb 24                	jmp    1cb6 <sharedfd+0x165>
      if(buf[i] == 'c')
    1c92:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c95:	0f b6 44 05 d6       	movzbl -0x2a(%ebp,%eax,1),%eax
    1c9a:	3c 63                	cmp    $0x63,%al
    1c9c:	75 04                	jne    1ca2 <sharedfd+0x151>
        nc++;
    1c9e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
    1ca2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ca5:	0f b6 44 05 d6       	movzbl -0x2a(%ebp,%eax,1),%eax
    1caa:	3c 70                	cmp    $0x70,%al
    1cac:	75 04                	jne    1cb2 <sharedfd+0x161>
        np++;
    1cae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    1cb2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1cb6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1cb9:	83 f8 09             	cmp    $0x9,%eax
    1cbc:	76 d4                	jbe    1c92 <sharedfd+0x141>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1cbe:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1cc5:	00 
    1cc6:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    1cc9:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ccd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1cd0:	89 04 24             	mov    %eax,(%esp)
    1cd3:	e8 5c 2f 00 00       	call   4c34 <read>
    1cd8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1cdb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cdf:	7f a8                	jg     1c89 <sharedfd+0x138>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    1ce1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ce4:	89 04 24             	mov    %eax,(%esp)
    1ce7:	e8 58 2f 00 00       	call   4c44 <close>
  unlink("sharedfd");
    1cec:	c7 04 24 16 58 00 00 	movl   $0x5816,(%esp)
    1cf3:	e8 74 2f 00 00       	call   4c6c <unlink>
  if(nc == 10000 && np == 10000){
    1cf8:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
    1cff:	75 20                	jne    1d21 <sharedfd+0x1d0>
    1d01:	81 7d f4 10 27 00 00 	cmpl   $0x2710,-0xc(%ebp)
    1d08:	75 17                	jne    1d21 <sharedfd+0x1d0>
    printf(1, "sharedfd ok\n");
    1d0a:	c7 44 24 04 97 58 00 	movl   $0x5897,0x4(%esp)
    1d11:	00 
    1d12:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d19:	e8 97 30 00 00       	call   4db5 <printf>
        np++;
    }
  }
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    1d1e:	90                   	nop
    1d1f:	eb 27                	jmp    1d48 <sharedfd+0x1f7>
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d24:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1d28:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d2b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d2f:	c7 44 24 04 a4 58 00 	movl   $0x58a4,0x4(%esp)
    1d36:	00 
    1d37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d3e:	e8 72 30 00 00       	call   4db5 <printf>
    exit();
    1d43:	e8 d4 2e 00 00       	call   4c1c <exit>
  }
}
    1d48:	c9                   	leave  
    1d49:	c3                   	ret    

00001d4a <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
    1d4a:	55                   	push   %ebp
    1d4b:	89 e5                	mov    %esp,%ebp
    1d4d:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
    1d50:	c7 44 24 04 b9 58 00 	movl   $0x58b9,0x4(%esp)
    1d57:	00 
    1d58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d5f:	e8 51 30 00 00       	call   4db5 <printf>

  unlink("f1");
    1d64:	c7 04 24 c8 58 00 00 	movl   $0x58c8,(%esp)
    1d6b:	e8 fc 2e 00 00       	call   4c6c <unlink>
  unlink("f2");
    1d70:	c7 04 24 cb 58 00 00 	movl   $0x58cb,(%esp)
    1d77:	e8 f0 2e 00 00       	call   4c6c <unlink>

  pid = fork();
    1d7c:	e8 93 2e 00 00       	call   4c14 <fork>
    1d81:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(pid < 0){
    1d84:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1d88:	79 19                	jns    1da3 <twofiles+0x59>
    printf(1, "fork failed\n");
    1d8a:	c7 44 24 04 b1 57 00 	movl   $0x57b1,0x4(%esp)
    1d91:	00 
    1d92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d99:	e8 17 30 00 00       	call   4db5 <printf>
    exit();
    1d9e:	e8 79 2e 00 00       	call   4c1c <exit>
  }

  fname = pid ? "f1" : "f2";
    1da3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1da7:	74 07                	je     1db0 <twofiles+0x66>
    1da9:	b8 c8 58 00 00       	mov    $0x58c8,%eax
    1dae:	eb 05                	jmp    1db5 <twofiles+0x6b>
    1db0:	b8 cb 58 00 00       	mov    $0x58cb,%eax
    1db5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
    1db8:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1dbf:	00 
    1dc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1dc3:	89 04 24             	mov    %eax,(%esp)
    1dc6:	e8 91 2e 00 00       	call   4c5c <open>
    1dcb:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(fd < 0){
    1dce:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1dd2:	79 19                	jns    1ded <twofiles+0xa3>
    printf(1, "create failed\n");
    1dd4:	c7 44 24 04 ce 58 00 	movl   $0x58ce,0x4(%esp)
    1ddb:	00 
    1ddc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1de3:	e8 cd 2f 00 00       	call   4db5 <printf>
    exit();
    1de8:	e8 2f 2e 00 00       	call   4c1c <exit>
  }

  memset(buf, pid?'p':'c', 512);
    1ded:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1df1:	74 07                	je     1dfa <twofiles+0xb0>
    1df3:	b8 70 00 00 00       	mov    $0x70,%eax
    1df8:	eb 05                	jmp    1dff <twofiles+0xb5>
    1dfa:	b8 63 00 00 00       	mov    $0x63,%eax
    1dff:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1e06:	00 
    1e07:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e0b:	c7 04 24 c0 92 00 00 	movl   $0x92c0,(%esp)
    1e12:	e8 5f 2c 00 00       	call   4a76 <memset>
  for(i = 0; i < 12; i++){
    1e17:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1e1e:	eb 4b                	jmp    1e6b <twofiles+0x121>
    if((n = write(fd, buf, 500)) != 500){
    1e20:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
    1e27:	00 
    1e28:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    1e2f:	00 
    1e30:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1e33:	89 04 24             	mov    %eax,(%esp)
    1e36:	e8 01 2e 00 00       	call   4c3c <write>
    1e3b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1e3e:	81 7d ec f4 01 00 00 	cmpl   $0x1f4,-0x14(%ebp)
    1e45:	74 20                	je     1e67 <twofiles+0x11d>
      printf(1, "write failed %d\n", n);
    1e47:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1e4a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e4e:	c7 44 24 04 dd 58 00 	movl   $0x58dd,0x4(%esp)
    1e55:	00 
    1e56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e5d:	e8 53 2f 00 00       	call   4db5 <printf>
      exit();
    1e62:	e8 b5 2d 00 00       	call   4c1c <exit>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
    1e67:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1e6b:	83 7d e4 0b          	cmpl   $0xb,-0x1c(%ebp)
    1e6f:	7e af                	jle    1e20 <twofiles+0xd6>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
    1e71:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1e74:	89 04 24             	mov    %eax,(%esp)
    1e77:	e8 c8 2d 00 00       	call   4c44 <close>
  if(pid)
    1e7c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1e80:	74 11                	je     1e93 <twofiles+0x149>
    wait();
    1e82:	e8 9d 2d 00 00       	call   4c24 <wait>
  else
    exit();

  for(i = 0; i < 2; i++){
    1e87:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1e8e:	e9 e6 00 00 00       	jmp    1f79 <twofiles+0x22f>
  }
  close(fd);
  if(pid)
    wait();
  else
    exit();
    1e93:	e8 84 2d 00 00       	call   4c1c <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    1e98:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1e9c:	74 07                	je     1ea5 <twofiles+0x15b>
    1e9e:	b8 c8 58 00 00       	mov    $0x58c8,%eax
    1ea3:	eb 05                	jmp    1eaa <twofiles+0x160>
    1ea5:	b8 cb 58 00 00       	mov    $0x58cb,%eax
    1eaa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1eb1:	00 
    1eb2:	89 04 24             	mov    %eax,(%esp)
    1eb5:	e8 a2 2d 00 00       	call   4c5c <open>
    1eba:	89 45 dc             	mov    %eax,-0x24(%ebp)
    total = 0;
    1ebd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1ec4:	eb 57                	jmp    1f1d <twofiles+0x1d3>
      for(j = 0; j < n; j++){
    1ec6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1ecd:	eb 40                	jmp    1f0f <twofiles+0x1c5>
        if(buf[j] != (i?'p':'c')){
    1ecf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1ed2:	0f b6 80 c0 92 00 00 	movzbl 0x92c0(%eax),%eax
    1ed9:	0f be d0             	movsbl %al,%edx
    1edc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1ee0:	74 07                	je     1ee9 <twofiles+0x19f>
    1ee2:	b8 70 00 00 00       	mov    $0x70,%eax
    1ee7:	eb 05                	jmp    1eee <twofiles+0x1a4>
    1ee9:	b8 63 00 00 00       	mov    $0x63,%eax
    1eee:	39 c2                	cmp    %eax,%edx
    1ef0:	74 19                	je     1f0b <twofiles+0x1c1>
          printf(1, "wrong char\n");
    1ef2:	c7 44 24 04 ee 58 00 	movl   $0x58ee,0x4(%esp)
    1ef9:	00 
    1efa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f01:	e8 af 2e 00 00       	call   4db5 <printf>
          exit();
    1f06:	e8 11 2d 00 00       	call   4c1c <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    1f0b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1f0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f12:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1f15:	7c b8                	jl     1ecf <twofiles+0x185>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    1f17:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1f1a:	01 45 f0             	add    %eax,-0x10(%ebp)
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1f1d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1f24:	00 
    1f25:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    1f2c:	00 
    1f2d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1f30:	89 04 24             	mov    %eax,(%esp)
    1f33:	e8 fc 2c 00 00       	call   4c34 <read>
    1f38:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1f3b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1f3f:	7f 85                	jg     1ec6 <twofiles+0x17c>
          exit();
        }
      }
      total += n;
    }
    close(fd);
    1f41:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1f44:	89 04 24             	mov    %eax,(%esp)
    1f47:	e8 f8 2c 00 00       	call   4c44 <close>
    if(total != 12*500){
    1f4c:	81 7d f0 70 17 00 00 	cmpl   $0x1770,-0x10(%ebp)
    1f53:	74 20                	je     1f75 <twofiles+0x22b>
      printf(1, "wrong length %d\n", total);
    1f55:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1f58:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f5c:	c7 44 24 04 fa 58 00 	movl   $0x58fa,0x4(%esp)
    1f63:	00 
    1f64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f6b:	e8 45 2e 00 00       	call   4db5 <printf>
      exit();
    1f70:	e8 a7 2c 00 00       	call   4c1c <exit>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
    1f75:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1f79:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1f7d:	0f 8e 15 ff ff ff    	jle    1e98 <twofiles+0x14e>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
    1f83:	c7 04 24 c8 58 00 00 	movl   $0x58c8,(%esp)
    1f8a:	e8 dd 2c 00 00       	call   4c6c <unlink>
  unlink("f2");
    1f8f:	c7 04 24 cb 58 00 00 	movl   $0x58cb,(%esp)
    1f96:	e8 d1 2c 00 00       	call   4c6c <unlink>

  printf(1, "twofiles ok\n");
    1f9b:	c7 44 24 04 0b 59 00 	movl   $0x590b,0x4(%esp)
    1fa2:	00 
    1fa3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1faa:	e8 06 2e 00 00       	call   4db5 <printf>
}
    1faf:	c9                   	leave  
    1fb0:	c3                   	ret    

00001fb1 <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
    1fb1:	55                   	push   %ebp
    1fb2:	89 e5                	mov    %esp,%ebp
    1fb4:	83 ec 48             	sub    $0x48,%esp
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
    1fb7:	c7 44 24 04 18 59 00 	movl   $0x5918,0x4(%esp)
    1fbe:	00 
    1fbf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fc6:	e8 ea 2d 00 00       	call   4db5 <printf>
  pid = fork();
    1fcb:	e8 44 2c 00 00       	call   4c14 <fork>
    1fd0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1fd3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1fd7:	79 19                	jns    1ff2 <createdelete+0x41>
    printf(1, "fork failed\n");
    1fd9:	c7 44 24 04 b1 57 00 	movl   $0x57b1,0x4(%esp)
    1fe0:	00 
    1fe1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fe8:	e8 c8 2d 00 00       	call   4db5 <printf>
    exit();
    1fed:	e8 2a 2c 00 00       	call   4c1c <exit>
  }

  name[0] = pid ? 'p' : 'c';
    1ff2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1ff6:	74 07                	je     1fff <createdelete+0x4e>
    1ff8:	b8 70 00 00 00       	mov    $0x70,%eax
    1ffd:	eb 05                	jmp    2004 <createdelete+0x53>
    1fff:	b8 63 00 00 00       	mov    $0x63,%eax
    2004:	88 45 cc             	mov    %al,-0x34(%ebp)
  name[2] = '\0';
    2007:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
  for(i = 0; i < N; i++){
    200b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2012:	e9 98 00 00 00       	jmp    20af <createdelete+0xfe>
    name[1] = '0' + i;
    2017:	8b 45 f0             	mov    -0x10(%ebp),%eax
    201a:	83 c0 30             	add    $0x30,%eax
    201d:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    2020:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2027:	00 
    2028:	8d 45 cc             	lea    -0x34(%ebp),%eax
    202b:	89 04 24             	mov    %eax,(%esp)
    202e:	e8 29 2c 00 00       	call   4c5c <open>
    2033:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(fd < 0){
    2036:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    203a:	79 19                	jns    2055 <createdelete+0xa4>
      printf(1, "create failed\n");
    203c:	c7 44 24 04 ce 58 00 	movl   $0x58ce,0x4(%esp)
    2043:	00 
    2044:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    204b:	e8 65 2d 00 00       	call   4db5 <printf>
      exit();
    2050:	e8 c7 2b 00 00       	call   4c1c <exit>
    }
    close(fd);
    2055:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2058:	89 04 24             	mov    %eax,(%esp)
    205b:	e8 e4 2b 00 00       	call   4c44 <close>
    if(i > 0 && (i % 2 ) == 0){
    2060:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2064:	7e 45                	jle    20ab <createdelete+0xfa>
    2066:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2069:	83 e0 01             	and    $0x1,%eax
    206c:	85 c0                	test   %eax,%eax
    206e:	75 3b                	jne    20ab <createdelete+0xfa>
      name[1] = '0' + (i / 2);
    2070:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2073:	89 c2                	mov    %eax,%edx
    2075:	c1 ea 1f             	shr    $0x1f,%edx
    2078:	8d 04 02             	lea    (%edx,%eax,1),%eax
    207b:	d1 f8                	sar    %eax
    207d:	83 c0 30             	add    $0x30,%eax
    2080:	88 45 cd             	mov    %al,-0x33(%ebp)
      if(unlink(name) < 0){
    2083:	8d 45 cc             	lea    -0x34(%ebp),%eax
    2086:	89 04 24             	mov    %eax,(%esp)
    2089:	e8 de 2b 00 00       	call   4c6c <unlink>
    208e:	85 c0                	test   %eax,%eax
    2090:	79 19                	jns    20ab <createdelete+0xfa>
        printf(1, "unlink failed\n");
    2092:	c7 44 24 04 2b 59 00 	movl   $0x592b,0x4(%esp)
    2099:	00 
    209a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20a1:	e8 0f 2d 00 00       	call   4db5 <printf>
        exit();
    20a6:	e8 71 2b 00 00       	call   4c1c <exit>
    exit();
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    20ab:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    20af:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
    20b3:	0f 8e 5e ff ff ff    	jle    2017 <createdelete+0x66>
        exit();
      }
    }
  }

  if(pid==0)
    20b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    20bd:	75 05                	jne    20c4 <createdelete+0x113>
    exit();
    20bf:	e8 58 2b 00 00       	call   4c1c <exit>
  else
    wait();
    20c4:	e8 5b 2b 00 00       	call   4c24 <wait>

  for(i = 0; i < N; i++){
    20c9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    20d0:	e9 34 01 00 00       	jmp    2209 <createdelete+0x258>
    name[0] = 'p';
    20d5:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    20d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20dc:	83 c0 30             	add    $0x30,%eax
    20df:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    20e2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    20e9:	00 
    20ea:	8d 45 cc             	lea    -0x34(%ebp),%eax
    20ed:	89 04 24             	mov    %eax,(%esp)
    20f0:	e8 67 2b 00 00       	call   4c5c <open>
    20f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    20f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    20fc:	74 06                	je     2104 <createdelete+0x153>
    20fe:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    2102:	7e 26                	jle    212a <createdelete+0x179>
    2104:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2108:	79 20                	jns    212a <createdelete+0x179>
      printf(1, "oops createdelete %s didn't exist\n", name);
    210a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    210d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2111:	c7 44 24 04 3c 59 00 	movl   $0x593c,0x4(%esp)
    2118:	00 
    2119:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2120:	e8 90 2c 00 00       	call   4db5 <printf>
      exit();
    2125:	e8 f2 2a 00 00       	call   4c1c <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    212a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    212e:	7e 2c                	jle    215c <createdelete+0x1ab>
    2130:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    2134:	7f 26                	jg     215c <createdelete+0x1ab>
    2136:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    213a:	78 20                	js     215c <createdelete+0x1ab>
      printf(1, "oops createdelete %s did exist\n", name);
    213c:	8d 45 cc             	lea    -0x34(%ebp),%eax
    213f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2143:	c7 44 24 04 60 59 00 	movl   $0x5960,0x4(%esp)
    214a:	00 
    214b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2152:	e8 5e 2c 00 00       	call   4db5 <printf>
      exit();
    2157:	e8 c0 2a 00 00       	call   4c1c <exit>
    }
    if(fd >= 0)
    215c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2160:	78 0b                	js     216d <createdelete+0x1bc>
      close(fd);
    2162:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2165:	89 04 24             	mov    %eax,(%esp)
    2168:	e8 d7 2a 00 00       	call   4c44 <close>

    name[0] = 'c';
    216d:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    name[1] = '0' + i;
    2171:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2174:	83 c0 30             	add    $0x30,%eax
    2177:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    217a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2181:	00 
    2182:	8d 45 cc             	lea    -0x34(%ebp),%eax
    2185:	89 04 24             	mov    %eax,(%esp)
    2188:	e8 cf 2a 00 00       	call   4c5c <open>
    218d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    2190:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2194:	74 06                	je     219c <createdelete+0x1eb>
    2196:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    219a:	7e 26                	jle    21c2 <createdelete+0x211>
    219c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21a0:	79 20                	jns    21c2 <createdelete+0x211>
      printf(1, "oops createdelete %s didn't exist\n", name);
    21a2:	8d 45 cc             	lea    -0x34(%ebp),%eax
    21a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    21a9:	c7 44 24 04 3c 59 00 	movl   $0x593c,0x4(%esp)
    21b0:	00 
    21b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21b8:	e8 f8 2b 00 00       	call   4db5 <printf>
      exit();
    21bd:	e8 5a 2a 00 00       	call   4c1c <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    21c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    21c6:	7e 2c                	jle    21f4 <createdelete+0x243>
    21c8:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    21cc:	7f 26                	jg     21f4 <createdelete+0x243>
    21ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21d2:	78 20                	js     21f4 <createdelete+0x243>
      printf(1, "oops createdelete %s did exist\n", name);
    21d4:	8d 45 cc             	lea    -0x34(%ebp),%eax
    21d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    21db:	c7 44 24 04 60 59 00 	movl   $0x5960,0x4(%esp)
    21e2:	00 
    21e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21ea:	e8 c6 2b 00 00       	call   4db5 <printf>
      exit();
    21ef:	e8 28 2a 00 00       	call   4c1c <exit>
    }
    if(fd >= 0)
    21f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21f8:	78 0b                	js     2205 <createdelete+0x254>
      close(fd);
    21fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21fd:	89 04 24             	mov    %eax,(%esp)
    2200:	e8 3f 2a 00 00       	call   4c44 <close>
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    2205:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2209:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
    220d:	0f 8e c2 fe ff ff    	jle    20d5 <createdelete+0x124>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    2213:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    221a:	eb 2b                	jmp    2247 <createdelete+0x296>
    name[0] = 'p';
    221c:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    2220:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2223:	83 c0 30             	add    $0x30,%eax
    2226:	88 45 cd             	mov    %al,-0x33(%ebp)
    unlink(name);
    2229:	8d 45 cc             	lea    -0x34(%ebp),%eax
    222c:	89 04 24             	mov    %eax,(%esp)
    222f:	e8 38 2a 00 00       	call   4c6c <unlink>
    name[0] = 'c';
    2234:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    unlink(name);
    2238:	8d 45 cc             	lea    -0x34(%ebp),%eax
    223b:	89 04 24             	mov    %eax,(%esp)
    223e:	e8 29 2a 00 00       	call   4c6c <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    2243:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2247:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
    224b:	7e cf                	jle    221c <createdelete+0x26b>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    224d:	c7 44 24 04 80 59 00 	movl   $0x5980,0x4(%esp)
    2254:	00 
    2255:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    225c:	e8 54 2b 00 00       	call   4db5 <printf>
}
    2261:	c9                   	leave  
    2262:	c3                   	ret    

00002263 <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    2263:	55                   	push   %ebp
    2264:	89 e5                	mov    %esp,%ebp
    2266:	83 ec 28             	sub    $0x28,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    2269:	c7 44 24 04 91 59 00 	movl   $0x5991,0x4(%esp)
    2270:	00 
    2271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2278:	e8 38 2b 00 00       	call   4db5 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    227d:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2284:	00 
    2285:	c7 04 24 a2 59 00 00 	movl   $0x59a2,(%esp)
    228c:	e8 cb 29 00 00       	call   4c5c <open>
    2291:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    2294:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2298:	79 19                	jns    22b3 <unlinkread+0x50>
    printf(1, "create unlinkread failed\n");
    229a:	c7 44 24 04 ad 59 00 	movl   $0x59ad,0x4(%esp)
    22a1:	00 
    22a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22a9:	e8 07 2b 00 00       	call   4db5 <printf>
    exit();
    22ae:	e8 69 29 00 00       	call   4c1c <exit>
  }
  write(fd, "hello", 5);
    22b3:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    22ba:	00 
    22bb:	c7 44 24 04 c7 59 00 	movl   $0x59c7,0x4(%esp)
    22c2:	00 
    22c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22c6:	89 04 24             	mov    %eax,(%esp)
    22c9:	e8 6e 29 00 00       	call   4c3c <write>
  close(fd);
    22ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22d1:	89 04 24             	mov    %eax,(%esp)
    22d4:	e8 6b 29 00 00       	call   4c44 <close>

  fd = open("unlinkread", O_RDWR);
    22d9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    22e0:	00 
    22e1:	c7 04 24 a2 59 00 00 	movl   $0x59a2,(%esp)
    22e8:	e8 6f 29 00 00       	call   4c5c <open>
    22ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    22f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    22f4:	79 19                	jns    230f <unlinkread+0xac>
    printf(1, "open unlinkread failed\n");
    22f6:	c7 44 24 04 cd 59 00 	movl   $0x59cd,0x4(%esp)
    22fd:	00 
    22fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2305:	e8 ab 2a 00 00       	call   4db5 <printf>
    exit();
    230a:	e8 0d 29 00 00       	call   4c1c <exit>
  }
  if(unlink("unlinkread") != 0){
    230f:	c7 04 24 a2 59 00 00 	movl   $0x59a2,(%esp)
    2316:	e8 51 29 00 00       	call   4c6c <unlink>
    231b:	85 c0                	test   %eax,%eax
    231d:	74 19                	je     2338 <unlinkread+0xd5>
    printf(1, "unlink unlinkread failed\n");
    231f:	c7 44 24 04 e5 59 00 	movl   $0x59e5,0x4(%esp)
    2326:	00 
    2327:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    232e:	e8 82 2a 00 00       	call   4db5 <printf>
    exit();
    2333:	e8 e4 28 00 00       	call   4c1c <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    2338:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    233f:	00 
    2340:	c7 04 24 a2 59 00 00 	movl   $0x59a2,(%esp)
    2347:	e8 10 29 00 00       	call   4c5c <open>
    234c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  write(fd1, "yyy", 3);
    234f:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    2356:	00 
    2357:	c7 44 24 04 ff 59 00 	movl   $0x59ff,0x4(%esp)
    235e:	00 
    235f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2362:	89 04 24             	mov    %eax,(%esp)
    2365:	e8 d2 28 00 00       	call   4c3c <write>
  close(fd1);
    236a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    236d:	89 04 24             	mov    %eax,(%esp)
    2370:	e8 cf 28 00 00       	call   4c44 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    2375:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    237c:	00 
    237d:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    2384:	00 
    2385:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2388:	89 04 24             	mov    %eax,(%esp)
    238b:	e8 a4 28 00 00       	call   4c34 <read>
    2390:	83 f8 05             	cmp    $0x5,%eax
    2393:	74 19                	je     23ae <unlinkread+0x14b>
    printf(1, "unlinkread read failed");
    2395:	c7 44 24 04 03 5a 00 	movl   $0x5a03,0x4(%esp)
    239c:	00 
    239d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23a4:	e8 0c 2a 00 00       	call   4db5 <printf>
    exit();
    23a9:	e8 6e 28 00 00       	call   4c1c <exit>
  }
  if(buf[0] != 'h'){
    23ae:	0f b6 05 c0 92 00 00 	movzbl 0x92c0,%eax
    23b5:	3c 68                	cmp    $0x68,%al
    23b7:	74 19                	je     23d2 <unlinkread+0x16f>
    printf(1, "unlinkread wrong data\n");
    23b9:	c7 44 24 04 1a 5a 00 	movl   $0x5a1a,0x4(%esp)
    23c0:	00 
    23c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23c8:	e8 e8 29 00 00       	call   4db5 <printf>
    exit();
    23cd:	e8 4a 28 00 00       	call   4c1c <exit>
  }
  if(write(fd, buf, 10) != 10){
    23d2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    23d9:	00 
    23da:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    23e1:	00 
    23e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23e5:	89 04 24             	mov    %eax,(%esp)
    23e8:	e8 4f 28 00 00       	call   4c3c <write>
    23ed:	83 f8 0a             	cmp    $0xa,%eax
    23f0:	74 19                	je     240b <unlinkread+0x1a8>
    printf(1, "unlinkread write failed\n");
    23f2:	c7 44 24 04 31 5a 00 	movl   $0x5a31,0x4(%esp)
    23f9:	00 
    23fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2401:	e8 af 29 00 00       	call   4db5 <printf>
    exit();
    2406:	e8 11 28 00 00       	call   4c1c <exit>
  }
  close(fd);
    240b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    240e:	89 04 24             	mov    %eax,(%esp)
    2411:	e8 2e 28 00 00       	call   4c44 <close>
  unlink("unlinkread");
    2416:	c7 04 24 a2 59 00 00 	movl   $0x59a2,(%esp)
    241d:	e8 4a 28 00 00       	call   4c6c <unlink>
  printf(1, "unlinkread ok\n");
    2422:	c7 44 24 04 4a 5a 00 	movl   $0x5a4a,0x4(%esp)
    2429:	00 
    242a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2431:	e8 7f 29 00 00       	call   4db5 <printf>
}
    2436:	c9                   	leave  
    2437:	c3                   	ret    

00002438 <linktest>:

void
linktest(void)
{
    2438:	55                   	push   %ebp
    2439:	89 e5                	mov    %esp,%ebp
    243b:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "linktest\n");
    243e:	c7 44 24 04 59 5a 00 	movl   $0x5a59,0x4(%esp)
    2445:	00 
    2446:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    244d:	e8 63 29 00 00       	call   4db5 <printf>

  unlink("lf1");
    2452:	c7 04 24 63 5a 00 00 	movl   $0x5a63,(%esp)
    2459:	e8 0e 28 00 00       	call   4c6c <unlink>
  unlink("lf2");
    245e:	c7 04 24 67 5a 00 00 	movl   $0x5a67,(%esp)
    2465:	e8 02 28 00 00       	call   4c6c <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    246a:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2471:	00 
    2472:	c7 04 24 63 5a 00 00 	movl   $0x5a63,(%esp)
    2479:	e8 de 27 00 00       	call   4c5c <open>
    247e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2481:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2485:	79 19                	jns    24a0 <linktest+0x68>
    printf(1, "create lf1 failed\n");
    2487:	c7 44 24 04 6b 5a 00 	movl   $0x5a6b,0x4(%esp)
    248e:	00 
    248f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2496:	e8 1a 29 00 00       	call   4db5 <printf>
    exit();
    249b:	e8 7c 27 00 00       	call   4c1c <exit>
  }
  if(write(fd, "hello", 5) != 5){
    24a0:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    24a7:	00 
    24a8:	c7 44 24 04 c7 59 00 	movl   $0x59c7,0x4(%esp)
    24af:	00 
    24b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24b3:	89 04 24             	mov    %eax,(%esp)
    24b6:	e8 81 27 00 00       	call   4c3c <write>
    24bb:	83 f8 05             	cmp    $0x5,%eax
    24be:	74 19                	je     24d9 <linktest+0xa1>
    printf(1, "write lf1 failed\n");
    24c0:	c7 44 24 04 7e 5a 00 	movl   $0x5a7e,0x4(%esp)
    24c7:	00 
    24c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24cf:	e8 e1 28 00 00       	call   4db5 <printf>
    exit();
    24d4:	e8 43 27 00 00       	call   4c1c <exit>
  }
  close(fd);
    24d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24dc:	89 04 24             	mov    %eax,(%esp)
    24df:	e8 60 27 00 00       	call   4c44 <close>

  if(link("lf1", "lf2") < 0){
    24e4:	c7 44 24 04 67 5a 00 	movl   $0x5a67,0x4(%esp)
    24eb:	00 
    24ec:	c7 04 24 63 5a 00 00 	movl   $0x5a63,(%esp)
    24f3:	e8 84 27 00 00       	call   4c7c <link>
    24f8:	85 c0                	test   %eax,%eax
    24fa:	79 19                	jns    2515 <linktest+0xdd>
    printf(1, "link lf1 lf2 failed\n");
    24fc:	c7 44 24 04 90 5a 00 	movl   $0x5a90,0x4(%esp)
    2503:	00 
    2504:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    250b:	e8 a5 28 00 00       	call   4db5 <printf>
    exit();
    2510:	e8 07 27 00 00       	call   4c1c <exit>
  }
  unlink("lf1");
    2515:	c7 04 24 63 5a 00 00 	movl   $0x5a63,(%esp)
    251c:	e8 4b 27 00 00       	call   4c6c <unlink>

  if(open("lf1", 0) >= 0){
    2521:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2528:	00 
    2529:	c7 04 24 63 5a 00 00 	movl   $0x5a63,(%esp)
    2530:	e8 27 27 00 00       	call   4c5c <open>
    2535:	85 c0                	test   %eax,%eax
    2537:	78 19                	js     2552 <linktest+0x11a>
    printf(1, "unlinked lf1 but it is still there!\n");
    2539:	c7 44 24 04 a8 5a 00 	movl   $0x5aa8,0x4(%esp)
    2540:	00 
    2541:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2548:	e8 68 28 00 00       	call   4db5 <printf>
    exit();
    254d:	e8 ca 26 00 00       	call   4c1c <exit>
  }

  fd = open("lf2", 0);
    2552:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2559:	00 
    255a:	c7 04 24 67 5a 00 00 	movl   $0x5a67,(%esp)
    2561:	e8 f6 26 00 00       	call   4c5c <open>
    2566:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2569:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    256d:	79 19                	jns    2588 <linktest+0x150>
    printf(1, "open lf2 failed\n");
    256f:	c7 44 24 04 cd 5a 00 	movl   $0x5acd,0x4(%esp)
    2576:	00 
    2577:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    257e:	e8 32 28 00 00       	call   4db5 <printf>
    exit();
    2583:	e8 94 26 00 00       	call   4c1c <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    2588:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    258f:	00 
    2590:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    2597:	00 
    2598:	8b 45 f4             	mov    -0xc(%ebp),%eax
    259b:	89 04 24             	mov    %eax,(%esp)
    259e:	e8 91 26 00 00       	call   4c34 <read>
    25a3:	83 f8 05             	cmp    $0x5,%eax
    25a6:	74 19                	je     25c1 <linktest+0x189>
    printf(1, "read lf2 failed\n");
    25a8:	c7 44 24 04 de 5a 00 	movl   $0x5ade,0x4(%esp)
    25af:	00 
    25b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25b7:	e8 f9 27 00 00       	call   4db5 <printf>
    exit();
    25bc:	e8 5b 26 00 00       	call   4c1c <exit>
  }
  close(fd);
    25c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25c4:	89 04 24             	mov    %eax,(%esp)
    25c7:	e8 78 26 00 00       	call   4c44 <close>

  if(link("lf2", "lf2") >= 0){
    25cc:	c7 44 24 04 67 5a 00 	movl   $0x5a67,0x4(%esp)
    25d3:	00 
    25d4:	c7 04 24 67 5a 00 00 	movl   $0x5a67,(%esp)
    25db:	e8 9c 26 00 00       	call   4c7c <link>
    25e0:	85 c0                	test   %eax,%eax
    25e2:	78 19                	js     25fd <linktest+0x1c5>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    25e4:	c7 44 24 04 ef 5a 00 	movl   $0x5aef,0x4(%esp)
    25eb:	00 
    25ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25f3:	e8 bd 27 00 00       	call   4db5 <printf>
    exit();
    25f8:	e8 1f 26 00 00       	call   4c1c <exit>
  }

  unlink("lf2");
    25fd:	c7 04 24 67 5a 00 00 	movl   $0x5a67,(%esp)
    2604:	e8 63 26 00 00       	call   4c6c <unlink>
  if(link("lf2", "lf1") >= 0){
    2609:	c7 44 24 04 63 5a 00 	movl   $0x5a63,0x4(%esp)
    2610:	00 
    2611:	c7 04 24 67 5a 00 00 	movl   $0x5a67,(%esp)
    2618:	e8 5f 26 00 00       	call   4c7c <link>
    261d:	85 c0                	test   %eax,%eax
    261f:	78 19                	js     263a <linktest+0x202>
    printf(1, "link non-existant succeeded! oops\n");
    2621:	c7 44 24 04 10 5b 00 	movl   $0x5b10,0x4(%esp)
    2628:	00 
    2629:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2630:	e8 80 27 00 00       	call   4db5 <printf>
    exit();
    2635:	e8 e2 25 00 00       	call   4c1c <exit>
  }

  if(link(".", "lf1") >= 0){
    263a:	c7 44 24 04 63 5a 00 	movl   $0x5a63,0x4(%esp)
    2641:	00 
    2642:	c7 04 24 33 5b 00 00 	movl   $0x5b33,(%esp)
    2649:	e8 2e 26 00 00       	call   4c7c <link>
    264e:	85 c0                	test   %eax,%eax
    2650:	78 19                	js     266b <linktest+0x233>
    printf(1, "link . lf1 succeeded! oops\n");
    2652:	c7 44 24 04 35 5b 00 	movl   $0x5b35,0x4(%esp)
    2659:	00 
    265a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2661:	e8 4f 27 00 00       	call   4db5 <printf>
    exit();
    2666:	e8 b1 25 00 00       	call   4c1c <exit>
  }

  printf(1, "linktest ok\n");
    266b:	c7 44 24 04 51 5b 00 	movl   $0x5b51,0x4(%esp)
    2672:	00 
    2673:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    267a:	e8 36 27 00 00       	call   4db5 <printf>
}
    267f:	c9                   	leave  
    2680:	c3                   	ret    

00002681 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    2681:	55                   	push   %ebp
    2682:	89 e5                	mov    %esp,%ebp
    2684:	83 ec 68             	sub    $0x68,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    2687:	c7 44 24 04 5e 5b 00 	movl   $0x5b5e,0x4(%esp)
    268e:	00 
    268f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2696:	e8 1a 27 00 00       	call   4db5 <printf>
  file[0] = 'C';
    269b:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    269f:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    26a3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    26aa:	e9 f7 00 00 00       	jmp    27a6 <concreate+0x125>
    file[1] = '0' + i;
    26af:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26b2:	83 c0 30             	add    $0x30,%eax
    26b5:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    26b8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    26bb:	89 04 24             	mov    %eax,(%esp)
    26be:	e8 a9 25 00 00       	call   4c6c <unlink>
    pid = fork();
    26c3:	e8 4c 25 00 00       	call   4c14 <fork>
    26c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    26cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    26cf:	74 3a                	je     270b <concreate+0x8a>
    26d1:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    26d4:	ba 56 55 55 55       	mov    $0x55555556,%edx
    26d9:	89 c8                	mov    %ecx,%eax
    26db:	f7 ea                	imul   %edx
    26dd:	89 c8                	mov    %ecx,%eax
    26df:	c1 f8 1f             	sar    $0x1f,%eax
    26e2:	29 c2                	sub    %eax,%edx
    26e4:	89 d0                	mov    %edx,%eax
    26e6:	01 c0                	add    %eax,%eax
    26e8:	01 d0                	add    %edx,%eax
    26ea:	89 ca                	mov    %ecx,%edx
    26ec:	29 c2                	sub    %eax,%edx
    26ee:	83 fa 01             	cmp    $0x1,%edx
    26f1:	75 18                	jne    270b <concreate+0x8a>
      link("C0", file);
    26f3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    26f6:	89 44 24 04          	mov    %eax,0x4(%esp)
    26fa:	c7 04 24 6e 5b 00 00 	movl   $0x5b6e,(%esp)
    2701:	e8 76 25 00 00       	call   4c7c <link>
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    2706:	e9 87 00 00 00       	jmp    2792 <concreate+0x111>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    270b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    270f:	75 3a                	jne    274b <concreate+0xca>
    2711:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    2714:	ba 67 66 66 66       	mov    $0x66666667,%edx
    2719:	89 c8                	mov    %ecx,%eax
    271b:	f7 ea                	imul   %edx
    271d:	d1 fa                	sar    %edx
    271f:	89 c8                	mov    %ecx,%eax
    2721:	c1 f8 1f             	sar    $0x1f,%eax
    2724:	29 c2                	sub    %eax,%edx
    2726:	89 d0                	mov    %edx,%eax
    2728:	c1 e0 02             	shl    $0x2,%eax
    272b:	01 d0                	add    %edx,%eax
    272d:	89 ca                	mov    %ecx,%edx
    272f:	29 c2                	sub    %eax,%edx
    2731:	83 fa 01             	cmp    $0x1,%edx
    2734:	75 15                	jne    274b <concreate+0xca>
      link("C0", file);
    2736:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2739:	89 44 24 04          	mov    %eax,0x4(%esp)
    273d:	c7 04 24 6e 5b 00 00 	movl   $0x5b6e,(%esp)
    2744:	e8 33 25 00 00       	call   4c7c <link>
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    2749:	eb 47                	jmp    2792 <concreate+0x111>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    274b:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2752:	00 
    2753:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2756:	89 04 24             	mov    %eax,(%esp)
    2759:	e8 fe 24 00 00       	call   4c5c <open>
    275e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(fd < 0){
    2761:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2765:	79 20                	jns    2787 <concreate+0x106>
        printf(1, "concreate create %s failed\n", file);
    2767:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    276a:	89 44 24 08          	mov    %eax,0x8(%esp)
    276e:	c7 44 24 04 71 5b 00 	movl   $0x5b71,0x4(%esp)
    2775:	00 
    2776:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    277d:	e8 33 26 00 00       	call   4db5 <printf>
        exit();
    2782:	e8 95 24 00 00       	call   4c1c <exit>
      }
      close(fd);
    2787:	8b 45 f4             	mov    -0xc(%ebp),%eax
    278a:	89 04 24             	mov    %eax,(%esp)
    278d:	e8 b2 24 00 00       	call   4c44 <close>
    }
    if(pid == 0)
    2792:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2796:	75 05                	jne    279d <concreate+0x11c>
      exit();
    2798:	e8 7f 24 00 00       	call   4c1c <exit>
    else
      wait();
    279d:	e8 82 24 00 00       	call   4c24 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    27a2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    27a6:	83 7d e8 27          	cmpl   $0x27,-0x18(%ebp)
    27aa:	0f 8e ff fe ff ff    	jle    26af <concreate+0x2e>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    27b0:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    27b7:	00 
    27b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27bf:	00 
    27c0:	8d 45 bd             	lea    -0x43(%ebp),%eax
    27c3:	89 04 24             	mov    %eax,(%esp)
    27c6:	e8 ab 22 00 00       	call   4a76 <memset>
  fd = open(".", 0);
    27cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27d2:	00 
    27d3:	c7 04 24 33 5b 00 00 	movl   $0x5b33,(%esp)
    27da:	e8 7d 24 00 00       	call   4c5c <open>
    27df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  n = 0;
    27e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    27e9:	e9 9d 00 00 00       	jmp    288b <concreate+0x20a>
    if(de.inum == 0)
    27ee:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    27f2:	66 85 c0             	test   %ax,%ax
    27f5:	0f 84 8f 00 00 00    	je     288a <concreate+0x209>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    27fb:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    27ff:	3c 43                	cmp    $0x43,%al
    2801:	0f 85 84 00 00 00    	jne    288b <concreate+0x20a>
    2807:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    280b:	84 c0                	test   %al,%al
    280d:	75 7c                	jne    288b <concreate+0x20a>
      i = de.name[1] - '0';
    280f:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    2813:	0f be c0             	movsbl %al,%eax
    2816:	83 e8 30             	sub    $0x30,%eax
    2819:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    281c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2820:	78 08                	js     282a <concreate+0x1a9>
    2822:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2825:	83 f8 27             	cmp    $0x27,%eax
    2828:	76 23                	jbe    284d <concreate+0x1cc>
        printf(1, "concreate weird file %s\n", de.name);
    282a:	8d 45 ac             	lea    -0x54(%ebp),%eax
    282d:	83 c0 02             	add    $0x2,%eax
    2830:	89 44 24 08          	mov    %eax,0x8(%esp)
    2834:	c7 44 24 04 8d 5b 00 	movl   $0x5b8d,0x4(%esp)
    283b:	00 
    283c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2843:	e8 6d 25 00 00       	call   4db5 <printf>
        exit();
    2848:	e8 cf 23 00 00       	call   4c1c <exit>
      }
      if(fa[i]){
    284d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2850:	0f b6 44 05 bd       	movzbl -0x43(%ebp,%eax,1),%eax
    2855:	84 c0                	test   %al,%al
    2857:	74 23                	je     287c <concreate+0x1fb>
        printf(1, "concreate duplicate file %s\n", de.name);
    2859:	8d 45 ac             	lea    -0x54(%ebp),%eax
    285c:	83 c0 02             	add    $0x2,%eax
    285f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2863:	c7 44 24 04 a6 5b 00 	movl   $0x5ba6,0x4(%esp)
    286a:	00 
    286b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2872:	e8 3e 25 00 00       	call   4db5 <printf>
        exit();
    2877:	e8 a0 23 00 00       	call   4c1c <exit>
      }
      fa[i] = 1;
    287c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    287f:	c6 44 05 bd 01       	movb   $0x1,-0x43(%ebp,%eax,1)
      n++;
    2884:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2888:	eb 01                	jmp    288b <concreate+0x20a>
  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    if(de.inum == 0)
      continue;
    288a:	90                   	nop
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    288b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    2892:	00 
    2893:	8d 45 ac             	lea    -0x54(%ebp),%eax
    2896:	89 44 24 04          	mov    %eax,0x4(%esp)
    289a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    289d:	89 04 24             	mov    %eax,(%esp)
    28a0:	e8 8f 23 00 00       	call   4c34 <read>
    28a5:	85 c0                	test   %eax,%eax
    28a7:	0f 8f 41 ff ff ff    	jg     27ee <concreate+0x16d>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    28ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28b0:	89 04 24             	mov    %eax,(%esp)
    28b3:	e8 8c 23 00 00       	call   4c44 <close>

  if(n != 40){
    28b8:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    28bc:	74 19                	je     28d7 <concreate+0x256>
    printf(1, "concreate not enough files in directory listing\n");
    28be:	c7 44 24 04 c4 5b 00 	movl   $0x5bc4,0x4(%esp)
    28c5:	00 
    28c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28cd:	e8 e3 24 00 00       	call   4db5 <printf>
    exit();
    28d2:	e8 45 23 00 00       	call   4c1c <exit>
  }

  for(i = 0; i < 40; i++){
    28d7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    28de:	e9 2d 01 00 00       	jmp    2a10 <concreate+0x38f>
    file[1] = '0' + i;
    28e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    28e6:	83 c0 30             	add    $0x30,%eax
    28e9:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    28ec:	e8 23 23 00 00       	call   4c14 <fork>
    28f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    28f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    28f8:	79 19                	jns    2913 <concreate+0x292>
      printf(1, "fork failed\n");
    28fa:	c7 44 24 04 b1 57 00 	movl   $0x57b1,0x4(%esp)
    2901:	00 
    2902:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2909:	e8 a7 24 00 00       	call   4db5 <printf>
      exit();
    290e:	e8 09 23 00 00       	call   4c1c <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    2913:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    2916:	ba 56 55 55 55       	mov    $0x55555556,%edx
    291b:	89 c8                	mov    %ecx,%eax
    291d:	f7 ea                	imul   %edx
    291f:	89 c8                	mov    %ecx,%eax
    2921:	c1 f8 1f             	sar    $0x1f,%eax
    2924:	29 c2                	sub    %eax,%edx
    2926:	89 d0                	mov    %edx,%eax
    2928:	01 c0                	add    %eax,%eax
    292a:	01 d0                	add    %edx,%eax
    292c:	89 ca                	mov    %ecx,%edx
    292e:	29 c2                	sub    %eax,%edx
    2930:	85 d2                	test   %edx,%edx
    2932:	75 06                	jne    293a <concreate+0x2b9>
    2934:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2938:	74 28                	je     2962 <concreate+0x2e1>
       ((i % 3) == 1 && pid != 0)){
    293a:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    293d:	ba 56 55 55 55       	mov    $0x55555556,%edx
    2942:	89 c8                	mov    %ecx,%eax
    2944:	f7 ea                	imul   %edx
    2946:	89 c8                	mov    %ecx,%eax
    2948:	c1 f8 1f             	sar    $0x1f,%eax
    294b:	29 c2                	sub    %eax,%edx
    294d:	89 d0                	mov    %edx,%eax
    294f:	01 c0                	add    %eax,%eax
    2951:	01 d0                	add    %edx,%eax
    2953:	89 ca                	mov    %ecx,%edx
    2955:	29 c2                	sub    %eax,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    2957:	83 fa 01             	cmp    $0x1,%edx
    295a:	75 74                	jne    29d0 <concreate+0x34f>
    295c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2960:	74 6e                	je     29d0 <concreate+0x34f>
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    2962:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2969:	00 
    296a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    296d:	89 04 24             	mov    %eax,(%esp)
    2970:	e8 e7 22 00 00       	call   4c5c <open>
    2975:	89 04 24             	mov    %eax,(%esp)
    2978:	e8 c7 22 00 00       	call   4c44 <close>
      close(open(file, 0));
    297d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2984:	00 
    2985:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    2988:	89 04 24             	mov    %eax,(%esp)
    298b:	e8 cc 22 00 00       	call   4c5c <open>
    2990:	89 04 24             	mov    %eax,(%esp)
    2993:	e8 ac 22 00 00       	call   4c44 <close>
      close(open(file, 0));
    2998:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    299f:	00 
    29a0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    29a3:	89 04 24             	mov    %eax,(%esp)
    29a6:	e8 b1 22 00 00       	call   4c5c <open>
    29ab:	89 04 24             	mov    %eax,(%esp)
    29ae:	e8 91 22 00 00       	call   4c44 <close>
      close(open(file, 0));
    29b3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    29ba:	00 
    29bb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    29be:	89 04 24             	mov    %eax,(%esp)
    29c1:	e8 96 22 00 00       	call   4c5c <open>
    29c6:	89 04 24             	mov    %eax,(%esp)
    29c9:	e8 76 22 00 00       	call   4c44 <close>
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    29ce:	eb 2c                	jmp    29fc <concreate+0x37b>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    29d0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    29d3:	89 04 24             	mov    %eax,(%esp)
    29d6:	e8 91 22 00 00       	call   4c6c <unlink>
      unlink(file);
    29db:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    29de:	89 04 24             	mov    %eax,(%esp)
    29e1:	e8 86 22 00 00       	call   4c6c <unlink>
      unlink(file);
    29e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    29e9:	89 04 24             	mov    %eax,(%esp)
    29ec:	e8 7b 22 00 00       	call   4c6c <unlink>
      unlink(file);
    29f1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    29f4:	89 04 24             	mov    %eax,(%esp)
    29f7:	e8 70 22 00 00       	call   4c6c <unlink>
    }
    if(pid == 0)
    29fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2a00:	75 05                	jne    2a07 <concreate+0x386>
      exit();
    2a02:	e8 15 22 00 00       	call   4c1c <exit>
    else
      wait();
    2a07:	e8 18 22 00 00       	call   4c24 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    2a0c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    2a10:	83 7d e8 27          	cmpl   $0x27,-0x18(%ebp)
    2a14:	0f 8e c9 fe ff ff    	jle    28e3 <concreate+0x262>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    2a1a:	c7 44 24 04 f5 5b 00 	movl   $0x5bf5,0x4(%esp)
    2a21:	00 
    2a22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a29:	e8 87 23 00 00       	call   4db5 <printf>
}
    2a2e:	c9                   	leave  
    2a2f:	c3                   	ret    

00002a30 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    2a30:	55                   	push   %ebp
    2a31:	89 e5                	mov    %esp,%ebp
    2a33:	83 ec 28             	sub    $0x28,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    2a36:	c7 44 24 04 03 5c 00 	movl   $0x5c03,0x4(%esp)
    2a3d:	00 
    2a3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a45:	e8 6b 23 00 00       	call   4db5 <printf>

  unlink("x");
    2a4a:	c7 04 24 6a 57 00 00 	movl   $0x576a,(%esp)
    2a51:	e8 16 22 00 00       	call   4c6c <unlink>
  pid = fork();
    2a56:	e8 b9 21 00 00       	call   4c14 <fork>
    2a5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    2a5e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2a62:	79 19                	jns    2a7d <linkunlink+0x4d>
    printf(1, "fork failed\n");
    2a64:	c7 44 24 04 b1 57 00 	movl   $0x57b1,0x4(%esp)
    2a6b:	00 
    2a6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a73:	e8 3d 23 00 00       	call   4db5 <printf>
    exit();
    2a78:	e8 9f 21 00 00       	call   4c1c <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    2a7d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2a81:	74 07                	je     2a8a <linkunlink+0x5a>
    2a83:	b8 01 00 00 00       	mov    $0x1,%eax
    2a88:	eb 05                	jmp    2a8f <linkunlink+0x5f>
    2a8a:	b8 61 00 00 00       	mov    $0x61,%eax
    2a8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; i < 100; i++){
    2a92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2a99:	e9 8e 00 00 00       	jmp    2b2c <linkunlink+0xfc>
    x = x * 1103515245 + 12345;
    2a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2aa1:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    2aa7:	05 39 30 00 00       	add    $0x3039,%eax
    2aac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if((x % 3) == 0){
    2aaf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2ab2:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    2ab7:	89 c8                	mov    %ecx,%eax
    2ab9:	f7 e2                	mul    %edx
    2abb:	d1 ea                	shr    %edx
    2abd:	89 d0                	mov    %edx,%eax
    2abf:	01 c0                	add    %eax,%eax
    2ac1:	01 d0                	add    %edx,%eax
    2ac3:	89 ca                	mov    %ecx,%edx
    2ac5:	29 c2                	sub    %eax,%edx
    2ac7:	85 d2                	test   %edx,%edx
    2ac9:	75 1e                	jne    2ae9 <linkunlink+0xb9>
      close(open("x", O_RDWR | O_CREATE));
    2acb:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2ad2:	00 
    2ad3:	c7 04 24 6a 57 00 00 	movl   $0x576a,(%esp)
    2ada:	e8 7d 21 00 00       	call   4c5c <open>
    2adf:	89 04 24             	mov    %eax,(%esp)
    2ae2:	e8 5d 21 00 00       	call   4c44 <close>
    2ae7:	eb 3f                	jmp    2b28 <linkunlink+0xf8>
    } else if((x % 3) == 1){
    2ae9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2aec:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    2af1:	89 c8                	mov    %ecx,%eax
    2af3:	f7 e2                	mul    %edx
    2af5:	d1 ea                	shr    %edx
    2af7:	89 d0                	mov    %edx,%eax
    2af9:	01 c0                	add    %eax,%eax
    2afb:	01 d0                	add    %edx,%eax
    2afd:	89 ca                	mov    %ecx,%edx
    2aff:	29 c2                	sub    %eax,%edx
    2b01:	83 fa 01             	cmp    $0x1,%edx
    2b04:	75 16                	jne    2b1c <linkunlink+0xec>
      link("cat", "x");
    2b06:	c7 44 24 04 6a 57 00 	movl   $0x576a,0x4(%esp)
    2b0d:	00 
    2b0e:	c7 04 24 14 5c 00 00 	movl   $0x5c14,(%esp)
    2b15:	e8 62 21 00 00       	call   4c7c <link>
    2b1a:	eb 0c                	jmp    2b28 <linkunlink+0xf8>
    } else {
      unlink("x");
    2b1c:	c7 04 24 6a 57 00 00 	movl   $0x576a,(%esp)
    2b23:	e8 44 21 00 00       	call   4c6c <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    2b28:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2b2c:	83 7d f0 63          	cmpl   $0x63,-0x10(%ebp)
    2b30:	0f 8e 68 ff ff ff    	jle    2a9e <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    2b36:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b3a:	74 1b                	je     2b57 <linkunlink+0x127>
    wait();
    2b3c:	e8 e3 20 00 00       	call   4c24 <wait>
  else 
    exit();

  printf(1, "linkunlink ok\n");
    2b41:	c7 44 24 04 18 5c 00 	movl   $0x5c18,0x4(%esp)
    2b48:	00 
    2b49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b50:	e8 60 22 00 00       	call   4db5 <printf>
}
    2b55:	c9                   	leave  
    2b56:	c3                   	ret    
  }

  if(pid)
    wait();
  else 
    exit();
    2b57:	e8 c0 20 00 00       	call   4c1c <exit>

00002b5c <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    2b5c:	55                   	push   %ebp
    2b5d:	89 e5                	mov    %esp,%ebp
    2b5f:	83 ec 38             	sub    $0x38,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    2b62:	c7 44 24 04 27 5c 00 	movl   $0x5c27,0x4(%esp)
    2b69:	00 
    2b6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b71:	e8 3f 22 00 00       	call   4db5 <printf>
  unlink("bd");
    2b76:	c7 04 24 34 5c 00 00 	movl   $0x5c34,(%esp)
    2b7d:	e8 ea 20 00 00       	call   4c6c <unlink>

  fd = open("bd", O_CREATE);
    2b82:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2b89:	00 
    2b8a:	c7 04 24 34 5c 00 00 	movl   $0x5c34,(%esp)
    2b91:	e8 c6 20 00 00       	call   4c5c <open>
    2b96:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2b99:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b9d:	79 19                	jns    2bb8 <bigdir+0x5c>
    printf(1, "bigdir create failed\n");
    2b9f:	c7 44 24 04 37 5c 00 	movl   $0x5c37,0x4(%esp)
    2ba6:	00 
    2ba7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bae:	e8 02 22 00 00       	call   4db5 <printf>
    exit();
    2bb3:	e8 64 20 00 00       	call   4c1c <exit>
  }
  close(fd);
    2bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bbb:	89 04 24             	mov    %eax,(%esp)
    2bbe:	e8 81 20 00 00       	call   4c44 <close>

  for(i = 0; i < 500; i++){
    2bc3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2bca:	eb 68                	jmp    2c34 <bigdir+0xd8>
    name[0] = 'x';
    2bcc:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    2bd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2bd3:	8d 50 3f             	lea    0x3f(%eax),%edx
    2bd6:	85 c0                	test   %eax,%eax
    2bd8:	0f 48 c2             	cmovs  %edx,%eax
    2bdb:	c1 f8 06             	sar    $0x6,%eax
    2bde:	83 c0 30             	add    $0x30,%eax
    2be1:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    2be4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2be7:	89 c2                	mov    %eax,%edx
    2be9:	c1 fa 1f             	sar    $0x1f,%edx
    2bec:	c1 ea 1a             	shr    $0x1a,%edx
    2bef:	01 d0                	add    %edx,%eax
    2bf1:	83 e0 3f             	and    $0x3f,%eax
    2bf4:	29 d0                	sub    %edx,%eax
    2bf6:	83 c0 30             	add    $0x30,%eax
    2bf9:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    2bfc:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    2c00:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    2c03:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c07:	c7 04 24 34 5c 00 00 	movl   $0x5c34,(%esp)
    2c0e:	e8 69 20 00 00       	call   4c7c <link>
    2c13:	85 c0                	test   %eax,%eax
    2c15:	74 19                	je     2c30 <bigdir+0xd4>
      printf(1, "bigdir link failed\n");
    2c17:	c7 44 24 04 4d 5c 00 	movl   $0x5c4d,0x4(%esp)
    2c1e:	00 
    2c1f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c26:	e8 8a 21 00 00       	call   4db5 <printf>
      exit();
    2c2b:	e8 ec 1f 00 00       	call   4c1c <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    2c30:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2c34:	81 7d f0 f3 01 00 00 	cmpl   $0x1f3,-0x10(%ebp)
    2c3b:	7e 8f                	jle    2bcc <bigdir+0x70>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    2c3d:	c7 04 24 34 5c 00 00 	movl   $0x5c34,(%esp)
    2c44:	e8 23 20 00 00       	call   4c6c <unlink>
  for(i = 0; i < 500; i++){
    2c49:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2c50:	eb 60                	jmp    2cb2 <bigdir+0x156>
    name[0] = 'x';
    2c52:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    2c56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c59:	8d 50 3f             	lea    0x3f(%eax),%edx
    2c5c:	85 c0                	test   %eax,%eax
    2c5e:	0f 48 c2             	cmovs  %edx,%eax
    2c61:	c1 f8 06             	sar    $0x6,%eax
    2c64:	83 c0 30             	add    $0x30,%eax
    2c67:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    2c6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2c6d:	89 c2                	mov    %eax,%edx
    2c6f:	c1 fa 1f             	sar    $0x1f,%edx
    2c72:	c1 ea 1a             	shr    $0x1a,%edx
    2c75:	01 d0                	add    %edx,%eax
    2c77:	83 e0 3f             	and    $0x3f,%eax
    2c7a:	29 d0                	sub    %edx,%eax
    2c7c:	83 c0 30             	add    $0x30,%eax
    2c7f:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    2c82:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    2c86:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    2c89:	89 04 24             	mov    %eax,(%esp)
    2c8c:	e8 db 1f 00 00       	call   4c6c <unlink>
    2c91:	85 c0                	test   %eax,%eax
    2c93:	74 19                	je     2cae <bigdir+0x152>
      printf(1, "bigdir unlink failed");
    2c95:	c7 44 24 04 61 5c 00 	movl   $0x5c61,0x4(%esp)
    2c9c:	00 
    2c9d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ca4:	e8 0c 21 00 00       	call   4db5 <printf>
      exit();
    2ca9:	e8 6e 1f 00 00       	call   4c1c <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    2cae:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2cb2:	81 7d f0 f3 01 00 00 	cmpl   $0x1f3,-0x10(%ebp)
    2cb9:	7e 97                	jle    2c52 <bigdir+0xf6>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    2cbb:	c7 44 24 04 76 5c 00 	movl   $0x5c76,0x4(%esp)
    2cc2:	00 
    2cc3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cca:	e8 e6 20 00 00       	call   4db5 <printf>
}
    2ccf:	c9                   	leave  
    2cd0:	c3                   	ret    

00002cd1 <subdir>:

void
subdir(void)
{
    2cd1:	55                   	push   %ebp
    2cd2:	89 e5                	mov    %esp,%ebp
    2cd4:	83 ec 28             	sub    $0x28,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    2cd7:	c7 44 24 04 81 5c 00 	movl   $0x5c81,0x4(%esp)
    2cde:	00 
    2cdf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ce6:	e8 ca 20 00 00       	call   4db5 <printf>

  unlink("ff");
    2ceb:	c7 04 24 8e 5c 00 00 	movl   $0x5c8e,(%esp)
    2cf2:	e8 75 1f 00 00       	call   4c6c <unlink>
  if(mkdir("dd") != 0){
    2cf7:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    2cfe:	e8 81 1f 00 00       	call   4c84 <mkdir>
    2d03:	85 c0                	test   %eax,%eax
    2d05:	74 19                	je     2d20 <subdir+0x4f>
    printf(1, "subdir mkdir dd failed\n");
    2d07:	c7 44 24 04 94 5c 00 	movl   $0x5c94,0x4(%esp)
    2d0e:	00 
    2d0f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d16:	e8 9a 20 00 00       	call   4db5 <printf>
    exit();
    2d1b:	e8 fc 1e 00 00       	call   4c1c <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    2d20:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2d27:	00 
    2d28:	c7 04 24 ac 5c 00 00 	movl   $0x5cac,(%esp)
    2d2f:	e8 28 1f 00 00       	call   4c5c <open>
    2d34:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    2d37:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d3b:	79 19                	jns    2d56 <subdir+0x85>
    printf(1, "create dd/ff failed\n");
    2d3d:	c7 44 24 04 b2 5c 00 	movl   $0x5cb2,0x4(%esp)
    2d44:	00 
    2d45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d4c:	e8 64 20 00 00       	call   4db5 <printf>
    exit();
    2d51:	e8 c6 1e 00 00       	call   4c1c <exit>
  }
  write(fd, "ff", 2);
    2d56:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2d5d:	00 
    2d5e:	c7 44 24 04 8e 5c 00 	movl   $0x5c8e,0x4(%esp)
    2d65:	00 
    2d66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d69:	89 04 24             	mov    %eax,(%esp)
    2d6c:	e8 cb 1e 00 00       	call   4c3c <write>
  close(fd);
    2d71:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d74:	89 04 24             	mov    %eax,(%esp)
    2d77:	e8 c8 1e 00 00       	call   4c44 <close>
  
  if(unlink("dd") >= 0){
    2d7c:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    2d83:	e8 e4 1e 00 00       	call   4c6c <unlink>
    2d88:	85 c0                	test   %eax,%eax
    2d8a:	78 19                	js     2da5 <subdir+0xd4>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2d8c:	c7 44 24 04 c8 5c 00 	movl   $0x5cc8,0x4(%esp)
    2d93:	00 
    2d94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d9b:	e8 15 20 00 00       	call   4db5 <printf>
    exit();
    2da0:	e8 77 1e 00 00       	call   4c1c <exit>
  }

  if(mkdir("/dd/dd") != 0){
    2da5:	c7 04 24 ee 5c 00 00 	movl   $0x5cee,(%esp)
    2dac:	e8 d3 1e 00 00       	call   4c84 <mkdir>
    2db1:	85 c0                	test   %eax,%eax
    2db3:	74 19                	je     2dce <subdir+0xfd>
    printf(1, "subdir mkdir dd/dd failed\n");
    2db5:	c7 44 24 04 f5 5c 00 	movl   $0x5cf5,0x4(%esp)
    2dbc:	00 
    2dbd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dc4:	e8 ec 1f 00 00       	call   4db5 <printf>
    exit();
    2dc9:	e8 4e 1e 00 00       	call   4c1c <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2dce:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2dd5:	00 
    2dd6:	c7 04 24 10 5d 00 00 	movl   $0x5d10,(%esp)
    2ddd:	e8 7a 1e 00 00       	call   4c5c <open>
    2de2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    2de5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2de9:	79 19                	jns    2e04 <subdir+0x133>
    printf(1, "create dd/dd/ff failed\n");
    2deb:	c7 44 24 04 19 5d 00 	movl   $0x5d19,0x4(%esp)
    2df2:	00 
    2df3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dfa:	e8 b6 1f 00 00       	call   4db5 <printf>
    exit();
    2dff:	e8 18 1e 00 00       	call   4c1c <exit>
  }
  write(fd, "FF", 2);
    2e04:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2e0b:	00 
    2e0c:	c7 44 24 04 31 5d 00 	movl   $0x5d31,0x4(%esp)
    2e13:	00 
    2e14:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e17:	89 04 24             	mov    %eax,(%esp)
    2e1a:	e8 1d 1e 00 00       	call   4c3c <write>
  close(fd);
    2e1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e22:	89 04 24             	mov    %eax,(%esp)
    2e25:	e8 1a 1e 00 00       	call   4c44 <close>

  fd = open("dd/dd/../ff", 0);
    2e2a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2e31:	00 
    2e32:	c7 04 24 34 5d 00 00 	movl   $0x5d34,(%esp)
    2e39:	e8 1e 1e 00 00       	call   4c5c <open>
    2e3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    2e41:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2e45:	79 19                	jns    2e60 <subdir+0x18f>
    printf(1, "open dd/dd/../ff failed\n");
    2e47:	c7 44 24 04 40 5d 00 	movl   $0x5d40,0x4(%esp)
    2e4e:	00 
    2e4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e56:	e8 5a 1f 00 00       	call   4db5 <printf>
    exit();
    2e5b:	e8 bc 1d 00 00       	call   4c1c <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    2e60:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2e67:	00 
    2e68:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    2e6f:	00 
    2e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e73:	89 04 24             	mov    %eax,(%esp)
    2e76:	e8 b9 1d 00 00       	call   4c34 <read>
    2e7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    2e7e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    2e82:	75 0b                	jne    2e8f <subdir+0x1be>
    2e84:	0f b6 05 c0 92 00 00 	movzbl 0x92c0,%eax
    2e8b:	3c 66                	cmp    $0x66,%al
    2e8d:	74 19                	je     2ea8 <subdir+0x1d7>
    printf(1, "dd/dd/../ff wrong content\n");
    2e8f:	c7 44 24 04 59 5d 00 	movl   $0x5d59,0x4(%esp)
    2e96:	00 
    2e97:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e9e:	e8 12 1f 00 00       	call   4db5 <printf>
    exit();
    2ea3:	e8 74 1d 00 00       	call   4c1c <exit>
  }
  close(fd);
    2ea8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2eab:	89 04 24             	mov    %eax,(%esp)
    2eae:	e8 91 1d 00 00       	call   4c44 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2eb3:	c7 44 24 04 74 5d 00 	movl   $0x5d74,0x4(%esp)
    2eba:	00 
    2ebb:	c7 04 24 10 5d 00 00 	movl   $0x5d10,(%esp)
    2ec2:	e8 b5 1d 00 00       	call   4c7c <link>
    2ec7:	85 c0                	test   %eax,%eax
    2ec9:	74 19                	je     2ee4 <subdir+0x213>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2ecb:	c7 44 24 04 80 5d 00 	movl   $0x5d80,0x4(%esp)
    2ed2:	00 
    2ed3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2eda:	e8 d6 1e 00 00       	call   4db5 <printf>
    exit();
    2edf:	e8 38 1d 00 00       	call   4c1c <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    2ee4:	c7 04 24 10 5d 00 00 	movl   $0x5d10,(%esp)
    2eeb:	e8 7c 1d 00 00       	call   4c6c <unlink>
    2ef0:	85 c0                	test   %eax,%eax
    2ef2:	74 19                	je     2f0d <subdir+0x23c>
    printf(1, "unlink dd/dd/ff failed\n");
    2ef4:	c7 44 24 04 a1 5d 00 	movl   $0x5da1,0x4(%esp)
    2efb:	00 
    2efc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f03:	e8 ad 1e 00 00       	call   4db5 <printf>
    exit();
    2f08:	e8 0f 1d 00 00       	call   4c1c <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2f0d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2f14:	00 
    2f15:	c7 04 24 10 5d 00 00 	movl   $0x5d10,(%esp)
    2f1c:	e8 3b 1d 00 00       	call   4c5c <open>
    2f21:	85 c0                	test   %eax,%eax
    2f23:	78 19                	js     2f3e <subdir+0x26d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    2f25:	c7 44 24 04 bc 5d 00 	movl   $0x5dbc,0x4(%esp)
    2f2c:	00 
    2f2d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f34:	e8 7c 1e 00 00       	call   4db5 <printf>
    exit();
    2f39:	e8 de 1c 00 00       	call   4c1c <exit>
  }

  if(chdir("dd") != 0){
    2f3e:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    2f45:	e8 42 1d 00 00       	call   4c8c <chdir>
    2f4a:	85 c0                	test   %eax,%eax
    2f4c:	74 19                	je     2f67 <subdir+0x296>
    printf(1, "chdir dd failed\n");
    2f4e:	c7 44 24 04 e0 5d 00 	movl   $0x5de0,0x4(%esp)
    2f55:	00 
    2f56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f5d:	e8 53 1e 00 00       	call   4db5 <printf>
    exit();
    2f62:	e8 b5 1c 00 00       	call   4c1c <exit>
  }
  if(chdir("dd/../../dd") != 0){
    2f67:	c7 04 24 f1 5d 00 00 	movl   $0x5df1,(%esp)
    2f6e:	e8 19 1d 00 00       	call   4c8c <chdir>
    2f73:	85 c0                	test   %eax,%eax
    2f75:	74 19                	je     2f90 <subdir+0x2bf>
    printf(1, "chdir dd/../../dd failed\n");
    2f77:	c7 44 24 04 fd 5d 00 	movl   $0x5dfd,0x4(%esp)
    2f7e:	00 
    2f7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f86:	e8 2a 1e 00 00       	call   4db5 <printf>
    exit();
    2f8b:	e8 8c 1c 00 00       	call   4c1c <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    2f90:	c7 04 24 17 5e 00 00 	movl   $0x5e17,(%esp)
    2f97:	e8 f0 1c 00 00       	call   4c8c <chdir>
    2f9c:	85 c0                	test   %eax,%eax
    2f9e:	74 19                	je     2fb9 <subdir+0x2e8>
    printf(1, "chdir dd/../../dd failed\n");
    2fa0:	c7 44 24 04 fd 5d 00 	movl   $0x5dfd,0x4(%esp)
    2fa7:	00 
    2fa8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2faf:	e8 01 1e 00 00       	call   4db5 <printf>
    exit();
    2fb4:	e8 63 1c 00 00       	call   4c1c <exit>
  }
  if(chdir("./..") != 0){
    2fb9:	c7 04 24 26 5e 00 00 	movl   $0x5e26,(%esp)
    2fc0:	e8 c7 1c 00 00       	call   4c8c <chdir>
    2fc5:	85 c0                	test   %eax,%eax
    2fc7:	74 19                	je     2fe2 <subdir+0x311>
    printf(1, "chdir ./.. failed\n");
    2fc9:	c7 44 24 04 2b 5e 00 	movl   $0x5e2b,0x4(%esp)
    2fd0:	00 
    2fd1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fd8:	e8 d8 1d 00 00       	call   4db5 <printf>
    exit();
    2fdd:	e8 3a 1c 00 00       	call   4c1c <exit>
  }

  fd = open("dd/dd/ffff", 0);
    2fe2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2fe9:	00 
    2fea:	c7 04 24 74 5d 00 00 	movl   $0x5d74,(%esp)
    2ff1:	e8 66 1c 00 00       	call   4c5c <open>
    2ff6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    2ff9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2ffd:	79 19                	jns    3018 <subdir+0x347>
    printf(1, "open dd/dd/ffff failed\n");
    2fff:	c7 44 24 04 3e 5e 00 	movl   $0x5e3e,0x4(%esp)
    3006:	00 
    3007:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    300e:	e8 a2 1d 00 00       	call   4db5 <printf>
    exit();
    3013:	e8 04 1c 00 00       	call   4c1c <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    3018:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    301f:	00 
    3020:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    3027:	00 
    3028:	8b 45 f0             	mov    -0x10(%ebp),%eax
    302b:	89 04 24             	mov    %eax,(%esp)
    302e:	e8 01 1c 00 00       	call   4c34 <read>
    3033:	83 f8 02             	cmp    $0x2,%eax
    3036:	74 19                	je     3051 <subdir+0x380>
    printf(1, "read dd/dd/ffff wrong len\n");
    3038:	c7 44 24 04 56 5e 00 	movl   $0x5e56,0x4(%esp)
    303f:	00 
    3040:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3047:	e8 69 1d 00 00       	call   4db5 <printf>
    exit();
    304c:	e8 cb 1b 00 00       	call   4c1c <exit>
  }
  close(fd);
    3051:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3054:	89 04 24             	mov    %eax,(%esp)
    3057:	e8 e8 1b 00 00       	call   4c44 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    305c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3063:	00 
    3064:	c7 04 24 10 5d 00 00 	movl   $0x5d10,(%esp)
    306b:	e8 ec 1b 00 00       	call   4c5c <open>
    3070:	85 c0                	test   %eax,%eax
    3072:	78 19                	js     308d <subdir+0x3bc>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    3074:	c7 44 24 04 74 5e 00 	movl   $0x5e74,0x4(%esp)
    307b:	00 
    307c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3083:	e8 2d 1d 00 00       	call   4db5 <printf>
    exit();
    3088:	e8 8f 1b 00 00       	call   4c1c <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    308d:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3094:	00 
    3095:	c7 04 24 99 5e 00 00 	movl   $0x5e99,(%esp)
    309c:	e8 bb 1b 00 00       	call   4c5c <open>
    30a1:	85 c0                	test   %eax,%eax
    30a3:	78 19                	js     30be <subdir+0x3ed>
    printf(1, "create dd/ff/ff succeeded!\n");
    30a5:	c7 44 24 04 a2 5e 00 	movl   $0x5ea2,0x4(%esp)
    30ac:	00 
    30ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30b4:	e8 fc 1c 00 00       	call   4db5 <printf>
    exit();
    30b9:	e8 5e 1b 00 00       	call   4c1c <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    30be:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    30c5:	00 
    30c6:	c7 04 24 be 5e 00 00 	movl   $0x5ebe,(%esp)
    30cd:	e8 8a 1b 00 00       	call   4c5c <open>
    30d2:	85 c0                	test   %eax,%eax
    30d4:	78 19                	js     30ef <subdir+0x41e>
    printf(1, "create dd/xx/ff succeeded!\n");
    30d6:	c7 44 24 04 c7 5e 00 	movl   $0x5ec7,0x4(%esp)
    30dd:	00 
    30de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30e5:	e8 cb 1c 00 00       	call   4db5 <printf>
    exit();
    30ea:	e8 2d 1b 00 00       	call   4c1c <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    30ef:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    30f6:	00 
    30f7:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    30fe:	e8 59 1b 00 00       	call   4c5c <open>
    3103:	85 c0                	test   %eax,%eax
    3105:	78 19                	js     3120 <subdir+0x44f>
    printf(1, "create dd succeeded!\n");
    3107:	c7 44 24 04 e3 5e 00 	movl   $0x5ee3,0x4(%esp)
    310e:	00 
    310f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3116:	e8 9a 1c 00 00       	call   4db5 <printf>
    exit();
    311b:	e8 fc 1a 00 00       	call   4c1c <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    3120:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    3127:	00 
    3128:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    312f:	e8 28 1b 00 00       	call   4c5c <open>
    3134:	85 c0                	test   %eax,%eax
    3136:	78 19                	js     3151 <subdir+0x480>
    printf(1, "open dd rdwr succeeded!\n");
    3138:	c7 44 24 04 f9 5e 00 	movl   $0x5ef9,0x4(%esp)
    313f:	00 
    3140:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3147:	e8 69 1c 00 00       	call   4db5 <printf>
    exit();
    314c:	e8 cb 1a 00 00       	call   4c1c <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    3151:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    3158:	00 
    3159:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    3160:	e8 f7 1a 00 00       	call   4c5c <open>
    3165:	85 c0                	test   %eax,%eax
    3167:	78 19                	js     3182 <subdir+0x4b1>
    printf(1, "open dd wronly succeeded!\n");
    3169:	c7 44 24 04 12 5f 00 	movl   $0x5f12,0x4(%esp)
    3170:	00 
    3171:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3178:	e8 38 1c 00 00       	call   4db5 <printf>
    exit();
    317d:	e8 9a 1a 00 00       	call   4c1c <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    3182:	c7 44 24 04 2d 5f 00 	movl   $0x5f2d,0x4(%esp)
    3189:	00 
    318a:	c7 04 24 99 5e 00 00 	movl   $0x5e99,(%esp)
    3191:	e8 e6 1a 00 00       	call   4c7c <link>
    3196:	85 c0                	test   %eax,%eax
    3198:	75 19                	jne    31b3 <subdir+0x4e2>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    319a:	c7 44 24 04 38 5f 00 	movl   $0x5f38,0x4(%esp)
    31a1:	00 
    31a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31a9:	e8 07 1c 00 00       	call   4db5 <printf>
    exit();
    31ae:	e8 69 1a 00 00       	call   4c1c <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    31b3:	c7 44 24 04 2d 5f 00 	movl   $0x5f2d,0x4(%esp)
    31ba:	00 
    31bb:	c7 04 24 be 5e 00 00 	movl   $0x5ebe,(%esp)
    31c2:	e8 b5 1a 00 00       	call   4c7c <link>
    31c7:	85 c0                	test   %eax,%eax
    31c9:	75 19                	jne    31e4 <subdir+0x513>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    31cb:	c7 44 24 04 5c 5f 00 	movl   $0x5f5c,0x4(%esp)
    31d2:	00 
    31d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31da:	e8 d6 1b 00 00       	call   4db5 <printf>
    exit();
    31df:	e8 38 1a 00 00       	call   4c1c <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    31e4:	c7 44 24 04 74 5d 00 	movl   $0x5d74,0x4(%esp)
    31eb:	00 
    31ec:	c7 04 24 ac 5c 00 00 	movl   $0x5cac,(%esp)
    31f3:	e8 84 1a 00 00       	call   4c7c <link>
    31f8:	85 c0                	test   %eax,%eax
    31fa:	75 19                	jne    3215 <subdir+0x544>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    31fc:	c7 44 24 04 80 5f 00 	movl   $0x5f80,0x4(%esp)
    3203:	00 
    3204:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    320b:	e8 a5 1b 00 00       	call   4db5 <printf>
    exit();
    3210:	e8 07 1a 00 00       	call   4c1c <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    3215:	c7 04 24 99 5e 00 00 	movl   $0x5e99,(%esp)
    321c:	e8 63 1a 00 00       	call   4c84 <mkdir>
    3221:	85 c0                	test   %eax,%eax
    3223:	75 19                	jne    323e <subdir+0x56d>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    3225:	c7 44 24 04 a2 5f 00 	movl   $0x5fa2,0x4(%esp)
    322c:	00 
    322d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3234:	e8 7c 1b 00 00       	call   4db5 <printf>
    exit();
    3239:	e8 de 19 00 00       	call   4c1c <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    323e:	c7 04 24 be 5e 00 00 	movl   $0x5ebe,(%esp)
    3245:	e8 3a 1a 00 00       	call   4c84 <mkdir>
    324a:	85 c0                	test   %eax,%eax
    324c:	75 19                	jne    3267 <subdir+0x596>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    324e:	c7 44 24 04 bd 5f 00 	movl   $0x5fbd,0x4(%esp)
    3255:	00 
    3256:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    325d:	e8 53 1b 00 00       	call   4db5 <printf>
    exit();
    3262:	e8 b5 19 00 00       	call   4c1c <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    3267:	c7 04 24 74 5d 00 00 	movl   $0x5d74,(%esp)
    326e:	e8 11 1a 00 00       	call   4c84 <mkdir>
    3273:	85 c0                	test   %eax,%eax
    3275:	75 19                	jne    3290 <subdir+0x5bf>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    3277:	c7 44 24 04 d8 5f 00 	movl   $0x5fd8,0x4(%esp)
    327e:	00 
    327f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3286:	e8 2a 1b 00 00       	call   4db5 <printf>
    exit();
    328b:	e8 8c 19 00 00       	call   4c1c <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    3290:	c7 04 24 be 5e 00 00 	movl   $0x5ebe,(%esp)
    3297:	e8 d0 19 00 00       	call   4c6c <unlink>
    329c:	85 c0                	test   %eax,%eax
    329e:	75 19                	jne    32b9 <subdir+0x5e8>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    32a0:	c7 44 24 04 f5 5f 00 	movl   $0x5ff5,0x4(%esp)
    32a7:	00 
    32a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32af:	e8 01 1b 00 00       	call   4db5 <printf>
    exit();
    32b4:	e8 63 19 00 00       	call   4c1c <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    32b9:	c7 04 24 99 5e 00 00 	movl   $0x5e99,(%esp)
    32c0:	e8 a7 19 00 00       	call   4c6c <unlink>
    32c5:	85 c0                	test   %eax,%eax
    32c7:	75 19                	jne    32e2 <subdir+0x611>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    32c9:	c7 44 24 04 11 60 00 	movl   $0x6011,0x4(%esp)
    32d0:	00 
    32d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32d8:	e8 d8 1a 00 00       	call   4db5 <printf>
    exit();
    32dd:	e8 3a 19 00 00       	call   4c1c <exit>
  }
  if(chdir("dd/ff") == 0){
    32e2:	c7 04 24 ac 5c 00 00 	movl   $0x5cac,(%esp)
    32e9:	e8 9e 19 00 00       	call   4c8c <chdir>
    32ee:	85 c0                	test   %eax,%eax
    32f0:	75 19                	jne    330b <subdir+0x63a>
    printf(1, "chdir dd/ff succeeded!\n");
    32f2:	c7 44 24 04 2d 60 00 	movl   $0x602d,0x4(%esp)
    32f9:	00 
    32fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3301:	e8 af 1a 00 00       	call   4db5 <printf>
    exit();
    3306:	e8 11 19 00 00       	call   4c1c <exit>
  }
  if(chdir("dd/xx") == 0){
    330b:	c7 04 24 45 60 00 00 	movl   $0x6045,(%esp)
    3312:	e8 75 19 00 00       	call   4c8c <chdir>
    3317:	85 c0                	test   %eax,%eax
    3319:	75 19                	jne    3334 <subdir+0x663>
    printf(1, "chdir dd/xx succeeded!\n");
    331b:	c7 44 24 04 4b 60 00 	movl   $0x604b,0x4(%esp)
    3322:	00 
    3323:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    332a:	e8 86 1a 00 00       	call   4db5 <printf>
    exit();
    332f:	e8 e8 18 00 00       	call   4c1c <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    3334:	c7 04 24 74 5d 00 00 	movl   $0x5d74,(%esp)
    333b:	e8 2c 19 00 00       	call   4c6c <unlink>
    3340:	85 c0                	test   %eax,%eax
    3342:	74 19                	je     335d <subdir+0x68c>
    printf(1, "unlink dd/dd/ff failed\n");
    3344:	c7 44 24 04 a1 5d 00 	movl   $0x5da1,0x4(%esp)
    334b:	00 
    334c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3353:	e8 5d 1a 00 00       	call   4db5 <printf>
    exit();
    3358:	e8 bf 18 00 00       	call   4c1c <exit>
  }
  if(unlink("dd/ff") != 0){
    335d:	c7 04 24 ac 5c 00 00 	movl   $0x5cac,(%esp)
    3364:	e8 03 19 00 00       	call   4c6c <unlink>
    3369:	85 c0                	test   %eax,%eax
    336b:	74 19                	je     3386 <subdir+0x6b5>
    printf(1, "unlink dd/ff failed\n");
    336d:	c7 44 24 04 63 60 00 	movl   $0x6063,0x4(%esp)
    3374:	00 
    3375:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    337c:	e8 34 1a 00 00       	call   4db5 <printf>
    exit();
    3381:	e8 96 18 00 00       	call   4c1c <exit>
  }
  if(unlink("dd") == 0){
    3386:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    338d:	e8 da 18 00 00       	call   4c6c <unlink>
    3392:	85 c0                	test   %eax,%eax
    3394:	75 19                	jne    33af <subdir+0x6de>
    printf(1, "unlink non-empty dd succeeded!\n");
    3396:	c7 44 24 04 78 60 00 	movl   $0x6078,0x4(%esp)
    339d:	00 
    339e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33a5:	e8 0b 1a 00 00       	call   4db5 <printf>
    exit();
    33aa:	e8 6d 18 00 00       	call   4c1c <exit>
  }
  if(unlink("dd/dd") < 0){
    33af:	c7 04 24 98 60 00 00 	movl   $0x6098,(%esp)
    33b6:	e8 b1 18 00 00       	call   4c6c <unlink>
    33bb:	85 c0                	test   %eax,%eax
    33bd:	79 19                	jns    33d8 <subdir+0x707>
    printf(1, "unlink dd/dd failed\n");
    33bf:	c7 44 24 04 9e 60 00 	movl   $0x609e,0x4(%esp)
    33c6:	00 
    33c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33ce:	e8 e2 19 00 00       	call   4db5 <printf>
    exit();
    33d3:	e8 44 18 00 00       	call   4c1c <exit>
  }
  if(unlink("dd") < 0){
    33d8:	c7 04 24 91 5c 00 00 	movl   $0x5c91,(%esp)
    33df:	e8 88 18 00 00       	call   4c6c <unlink>
    33e4:	85 c0                	test   %eax,%eax
    33e6:	79 19                	jns    3401 <subdir+0x730>
    printf(1, "unlink dd failed\n");
    33e8:	c7 44 24 04 b3 60 00 	movl   $0x60b3,0x4(%esp)
    33ef:	00 
    33f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33f7:	e8 b9 19 00 00       	call   4db5 <printf>
    exit();
    33fc:	e8 1b 18 00 00       	call   4c1c <exit>
  }

  printf(1, "subdir ok\n");
    3401:	c7 44 24 04 c5 60 00 	movl   $0x60c5,0x4(%esp)
    3408:	00 
    3409:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3410:	e8 a0 19 00 00       	call   4db5 <printf>
}
    3415:	c9                   	leave  
    3416:	c3                   	ret    

00003417 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    3417:	55                   	push   %ebp
    3418:	89 e5                	mov    %esp,%ebp
    341a:	83 ec 28             	sub    $0x28,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    341d:	c7 44 24 04 d0 60 00 	movl   $0x60d0,0x4(%esp)
    3424:	00 
    3425:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    342c:	e8 84 19 00 00       	call   4db5 <printf>

  unlink("bigwrite");
    3431:	c7 04 24 df 60 00 00 	movl   $0x60df,(%esp)
    3438:	e8 2f 18 00 00       	call   4c6c <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    343d:	c7 45 ec f3 01 00 00 	movl   $0x1f3,-0x14(%ebp)
    3444:	e9 b3 00 00 00       	jmp    34fc <bigwrite+0xe5>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    3449:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3450:	00 
    3451:	c7 04 24 df 60 00 00 	movl   $0x60df,(%esp)
    3458:	e8 ff 17 00 00       	call   4c5c <open>
    345d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    3460:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3464:	79 19                	jns    347f <bigwrite+0x68>
      printf(1, "cannot create bigwrite\n");
    3466:	c7 44 24 04 e8 60 00 	movl   $0x60e8,0x4(%esp)
    346d:	00 
    346e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3475:	e8 3b 19 00 00       	call   4db5 <printf>
      exit();
    347a:	e8 9d 17 00 00       	call   4c1c <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    347f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3486:	eb 50                	jmp    34d8 <bigwrite+0xc1>
      int cc = write(fd, buf, sz);
    3488:	8b 45 ec             	mov    -0x14(%ebp),%eax
    348b:	89 44 24 08          	mov    %eax,0x8(%esp)
    348f:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    3496:	00 
    3497:	8b 45 e8             	mov    -0x18(%ebp),%eax
    349a:	89 04 24             	mov    %eax,(%esp)
    349d:	e8 9a 17 00 00       	call   4c3c <write>
    34a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(cc != sz){
    34a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    34ab:	74 27                	je     34d4 <bigwrite+0xbd>
        printf(1, "write(%d) ret %d\n", sz, cc);
    34ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    34b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    34b7:	89 44 24 08          	mov    %eax,0x8(%esp)
    34bb:	c7 44 24 04 00 61 00 	movl   $0x6100,0x4(%esp)
    34c2:	00 
    34c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34ca:	e8 e6 18 00 00       	call   4db5 <printf>
        exit();
    34cf:	e8 48 17 00 00       	call   4c1c <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    34d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    34d8:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    34dc:	7e aa                	jle    3488 <bigwrite+0x71>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    34de:	8b 45 e8             	mov    -0x18(%ebp),%eax
    34e1:	89 04 24             	mov    %eax,(%esp)
    34e4:	e8 5b 17 00 00       	call   4c44 <close>
    unlink("bigwrite");
    34e9:	c7 04 24 df 60 00 00 	movl   $0x60df,(%esp)
    34f0:	e8 77 17 00 00       	call   4c6c <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    34f5:	81 45 ec d7 01 00 00 	addl   $0x1d7,-0x14(%ebp)
    34fc:	81 7d ec ff 17 00 00 	cmpl   $0x17ff,-0x14(%ebp)
    3503:	0f 8e 40 ff ff ff    	jle    3449 <bigwrite+0x32>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    3509:	c7 44 24 04 12 61 00 	movl   $0x6112,0x4(%esp)
    3510:	00 
    3511:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3518:	e8 98 18 00 00       	call   4db5 <printf>
}
    351d:	c9                   	leave  
    351e:	c3                   	ret    

0000351f <bigfile>:

void
bigfile(void)
{
    351f:	55                   	push   %ebp
    3520:	89 e5                	mov    %esp,%ebp
    3522:	83 ec 28             	sub    $0x28,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    3525:	c7 44 24 04 1f 61 00 	movl   $0x611f,0x4(%esp)
    352c:	00 
    352d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3534:	e8 7c 18 00 00       	call   4db5 <printf>

  unlink("bigfile");
    3539:	c7 04 24 2d 61 00 00 	movl   $0x612d,(%esp)
    3540:	e8 27 17 00 00       	call   4c6c <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    3545:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    354c:	00 
    354d:	c7 04 24 2d 61 00 00 	movl   $0x612d,(%esp)
    3554:	e8 03 17 00 00       	call   4c5c <open>
    3559:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
    355c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3560:	79 19                	jns    357b <bigfile+0x5c>
    printf(1, "cannot create bigfile");
    3562:	c7 44 24 04 35 61 00 	movl   $0x6135,0x4(%esp)
    3569:	00 
    356a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3571:	e8 3f 18 00 00       	call   4db5 <printf>
    exit();
    3576:	e8 a1 16 00 00       	call   4c1c <exit>
  }
  for(i = 0; i < 20; i++){
    357b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    3582:	eb 5a                	jmp    35de <bigfile+0xbf>
    memset(buf, i, 600);
    3584:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    358b:	00 
    358c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    358f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3593:	c7 04 24 c0 92 00 00 	movl   $0x92c0,(%esp)
    359a:	e8 d7 14 00 00       	call   4a76 <memset>
    if(write(fd, buf, 600) != 600){
    359f:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    35a6:	00 
    35a7:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    35ae:	00 
    35af:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35b2:	89 04 24             	mov    %eax,(%esp)
    35b5:	e8 82 16 00 00       	call   4c3c <write>
    35ba:	3d 58 02 00 00       	cmp    $0x258,%eax
    35bf:	74 19                	je     35da <bigfile+0xbb>
      printf(1, "write bigfile failed\n");
    35c1:	c7 44 24 04 4b 61 00 	movl   $0x614b,0x4(%esp)
    35c8:	00 
    35c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35d0:	e8 e0 17 00 00       	call   4db5 <printf>
      exit();
    35d5:	e8 42 16 00 00       	call   4c1c <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    35da:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    35de:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
    35e2:	7e a0                	jle    3584 <bigfile+0x65>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    35e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    35e7:	89 04 24             	mov    %eax,(%esp)
    35ea:	e8 55 16 00 00       	call   4c44 <close>

  fd = open("bigfile", 0);
    35ef:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    35f6:	00 
    35f7:	c7 04 24 2d 61 00 00 	movl   $0x612d,(%esp)
    35fe:	e8 59 16 00 00       	call   4c5c <open>
    3603:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
    3606:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    360a:	79 19                	jns    3625 <bigfile+0x106>
    printf(1, "cannot open bigfile\n");
    360c:	c7 44 24 04 61 61 00 	movl   $0x6161,0x4(%esp)
    3613:	00 
    3614:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    361b:	e8 95 17 00 00       	call   4db5 <printf>
    exit();
    3620:	e8 f7 15 00 00       	call   4c1c <exit>
  }
  total = 0;
    3625:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    362c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    cc = read(fd, buf, 300);
    3633:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    363a:	00 
    363b:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    3642:	00 
    3643:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3646:	89 04 24             	mov    %eax,(%esp)
    3649:	e8 e6 15 00 00       	call   4c34 <read>
    364e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 0){
    3651:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3655:	79 19                	jns    3670 <bigfile+0x151>
      printf(1, "read bigfile failed\n");
    3657:	c7 44 24 04 76 61 00 	movl   $0x6176,0x4(%esp)
    365e:	00 
    365f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3666:	e8 4a 17 00 00       	call   4db5 <printf>
      exit();
    366b:	e8 ac 15 00 00       	call   4c1c <exit>
    }
    if(cc == 0)
    3670:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3674:	0f 84 80 00 00 00    	je     36fa <bigfile+0x1db>
      break;
    if(cc != 300){
    367a:	81 7d f4 2c 01 00 00 	cmpl   $0x12c,-0xc(%ebp)
    3681:	74 19                	je     369c <bigfile+0x17d>
      printf(1, "short read bigfile\n");
    3683:	c7 44 24 04 8b 61 00 	movl   $0x618b,0x4(%esp)
    368a:	00 
    368b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3692:	e8 1e 17 00 00       	call   4db5 <printf>
      exit();
    3697:	e8 80 15 00 00       	call   4c1c <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    369c:	0f b6 05 c0 92 00 00 	movzbl 0x92c0,%eax
    36a3:	0f be d0             	movsbl %al,%edx
    36a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36a9:	89 c1                	mov    %eax,%ecx
    36ab:	c1 e9 1f             	shr    $0x1f,%ecx
    36ae:	8d 04 01             	lea    (%ecx,%eax,1),%eax
    36b1:	d1 f8                	sar    %eax
    36b3:	39 c2                	cmp    %eax,%edx
    36b5:	75 1b                	jne    36d2 <bigfile+0x1b3>
    36b7:	0f b6 05 eb 93 00 00 	movzbl 0x93eb,%eax
    36be:	0f be d0             	movsbl %al,%edx
    36c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36c4:	89 c1                	mov    %eax,%ecx
    36c6:	c1 e9 1f             	shr    $0x1f,%ecx
    36c9:	8d 04 01             	lea    (%ecx,%eax,1),%eax
    36cc:	d1 f8                	sar    %eax
    36ce:	39 c2                	cmp    %eax,%edx
    36d0:	74 19                	je     36eb <bigfile+0x1cc>
      printf(1, "read bigfile wrong data\n");
    36d2:	c7 44 24 04 9f 61 00 	movl   $0x619f,0x4(%esp)
    36d9:	00 
    36da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36e1:	e8 cf 16 00 00       	call   4db5 <printf>
      exit();
    36e6:	e8 31 15 00 00       	call   4c1c <exit>
    }
    total += cc;
    36eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36ee:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    36f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    36f5:	e9 39 ff ff ff       	jmp    3633 <bigfile+0x114>
    if(cc < 0){
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    36fa:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    36fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    36fe:	89 04 24             	mov    %eax,(%esp)
    3701:	e8 3e 15 00 00       	call   4c44 <close>
  if(total != 20*600){
    3706:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    370d:	74 19                	je     3728 <bigfile+0x209>
    printf(1, "read bigfile wrong total\n");
    370f:	c7 44 24 04 b8 61 00 	movl   $0x61b8,0x4(%esp)
    3716:	00 
    3717:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    371e:	e8 92 16 00 00       	call   4db5 <printf>
    exit();
    3723:	e8 f4 14 00 00       	call   4c1c <exit>
  }
  unlink("bigfile");
    3728:	c7 04 24 2d 61 00 00 	movl   $0x612d,(%esp)
    372f:	e8 38 15 00 00       	call   4c6c <unlink>

  printf(1, "bigfile test ok\n");
    3734:	c7 44 24 04 d2 61 00 	movl   $0x61d2,0x4(%esp)
    373b:	00 
    373c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3743:	e8 6d 16 00 00       	call   4db5 <printf>
}
    3748:	c9                   	leave  
    3749:	c3                   	ret    

0000374a <fourteen>:

void
fourteen(void)
{
    374a:	55                   	push   %ebp
    374b:	89 e5                	mov    %esp,%ebp
    374d:	83 ec 28             	sub    $0x28,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    3750:	c7 44 24 04 e3 61 00 	movl   $0x61e3,0x4(%esp)
    3757:	00 
    3758:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    375f:	e8 51 16 00 00       	call   4db5 <printf>

  if(mkdir("12345678901234") != 0){
    3764:	c7 04 24 f2 61 00 00 	movl   $0x61f2,(%esp)
    376b:	e8 14 15 00 00       	call   4c84 <mkdir>
    3770:	85 c0                	test   %eax,%eax
    3772:	74 19                	je     378d <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    3774:	c7 44 24 04 01 62 00 	movl   $0x6201,0x4(%esp)
    377b:	00 
    377c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3783:	e8 2d 16 00 00       	call   4db5 <printf>
    exit();
    3788:	e8 8f 14 00 00       	call   4c1c <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    378d:	c7 04 24 20 62 00 00 	movl   $0x6220,(%esp)
    3794:	e8 eb 14 00 00       	call   4c84 <mkdir>
    3799:	85 c0                	test   %eax,%eax
    379b:	74 19                	je     37b6 <fourteen+0x6c>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    379d:	c7 44 24 04 40 62 00 	movl   $0x6240,0x4(%esp)
    37a4:	00 
    37a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    37ac:	e8 04 16 00 00       	call   4db5 <printf>
    exit();
    37b1:	e8 66 14 00 00       	call   4c1c <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    37b6:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    37bd:	00 
    37be:	c7 04 24 70 62 00 00 	movl   $0x6270,(%esp)
    37c5:	e8 92 14 00 00       	call   4c5c <open>
    37ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    37cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    37d1:	79 19                	jns    37ec <fourteen+0xa2>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    37d3:	c7 44 24 04 a0 62 00 	movl   $0x62a0,0x4(%esp)
    37da:	00 
    37db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    37e2:	e8 ce 15 00 00       	call   4db5 <printf>
    exit();
    37e7:	e8 30 14 00 00       	call   4c1c <exit>
  }
  close(fd);
    37ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37ef:	89 04 24             	mov    %eax,(%esp)
    37f2:	e8 4d 14 00 00       	call   4c44 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    37f7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    37fe:	00 
    37ff:	c7 04 24 e0 62 00 00 	movl   $0x62e0,(%esp)
    3806:	e8 51 14 00 00       	call   4c5c <open>
    380b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    380e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3812:	79 19                	jns    382d <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    3814:	c7 44 24 04 10 63 00 	movl   $0x6310,0x4(%esp)
    381b:	00 
    381c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3823:	e8 8d 15 00 00       	call   4db5 <printf>
    exit();
    3828:	e8 ef 13 00 00       	call   4c1c <exit>
  }
  close(fd);
    382d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3830:	89 04 24             	mov    %eax,(%esp)
    3833:	e8 0c 14 00 00       	call   4c44 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    3838:	c7 04 24 4a 63 00 00 	movl   $0x634a,(%esp)
    383f:	e8 40 14 00 00       	call   4c84 <mkdir>
    3844:	85 c0                	test   %eax,%eax
    3846:	75 19                	jne    3861 <fourteen+0x117>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    3848:	c7 44 24 04 68 63 00 	movl   $0x6368,0x4(%esp)
    384f:	00 
    3850:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3857:	e8 59 15 00 00       	call   4db5 <printf>
    exit();
    385c:	e8 bb 13 00 00       	call   4c1c <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    3861:	c7 04 24 98 63 00 00 	movl   $0x6398,(%esp)
    3868:	e8 17 14 00 00       	call   4c84 <mkdir>
    386d:	85 c0                	test   %eax,%eax
    386f:	75 19                	jne    388a <fourteen+0x140>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    3871:	c7 44 24 04 b8 63 00 	movl   $0x63b8,0x4(%esp)
    3878:	00 
    3879:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3880:	e8 30 15 00 00       	call   4db5 <printf>
    exit();
    3885:	e8 92 13 00 00       	call   4c1c <exit>
  }

  printf(1, "fourteen ok\n");
    388a:	c7 44 24 04 e9 63 00 	movl   $0x63e9,0x4(%esp)
    3891:	00 
    3892:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3899:	e8 17 15 00 00       	call   4db5 <printf>
}
    389e:	c9                   	leave  
    389f:	c3                   	ret    

000038a0 <rmdot>:

void
rmdot(void)
{
    38a0:	55                   	push   %ebp
    38a1:	89 e5                	mov    %esp,%ebp
    38a3:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    38a6:	c7 44 24 04 f6 63 00 	movl   $0x63f6,0x4(%esp)
    38ad:	00 
    38ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38b5:	e8 fb 14 00 00       	call   4db5 <printf>
  if(mkdir("dots") != 0){
    38ba:	c7 04 24 02 64 00 00 	movl   $0x6402,(%esp)
    38c1:	e8 be 13 00 00       	call   4c84 <mkdir>
    38c6:	85 c0                	test   %eax,%eax
    38c8:	74 19                	je     38e3 <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    38ca:	c7 44 24 04 07 64 00 	movl   $0x6407,0x4(%esp)
    38d1:	00 
    38d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38d9:	e8 d7 14 00 00       	call   4db5 <printf>
    exit();
    38de:	e8 39 13 00 00       	call   4c1c <exit>
  }
  if(chdir("dots") != 0){
    38e3:	c7 04 24 02 64 00 00 	movl   $0x6402,(%esp)
    38ea:	e8 9d 13 00 00       	call   4c8c <chdir>
    38ef:	85 c0                	test   %eax,%eax
    38f1:	74 19                	je     390c <rmdot+0x6c>
    printf(1, "chdir dots failed\n");
    38f3:	c7 44 24 04 1a 64 00 	movl   $0x641a,0x4(%esp)
    38fa:	00 
    38fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3902:	e8 ae 14 00 00       	call   4db5 <printf>
    exit();
    3907:	e8 10 13 00 00       	call   4c1c <exit>
  }
  if(unlink(".") == 0){
    390c:	c7 04 24 33 5b 00 00 	movl   $0x5b33,(%esp)
    3913:	e8 54 13 00 00       	call   4c6c <unlink>
    3918:	85 c0                	test   %eax,%eax
    391a:	75 19                	jne    3935 <rmdot+0x95>
    printf(1, "rm . worked!\n");
    391c:	c7 44 24 04 2d 64 00 	movl   $0x642d,0x4(%esp)
    3923:	00 
    3924:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    392b:	e8 85 14 00 00       	call   4db5 <printf>
    exit();
    3930:	e8 e7 12 00 00       	call   4c1c <exit>
  }
  if(unlink("..") == 0){
    3935:	c7 04 24 c0 56 00 00 	movl   $0x56c0,(%esp)
    393c:	e8 2b 13 00 00       	call   4c6c <unlink>
    3941:	85 c0                	test   %eax,%eax
    3943:	75 19                	jne    395e <rmdot+0xbe>
    printf(1, "rm .. worked!\n");
    3945:	c7 44 24 04 3b 64 00 	movl   $0x643b,0x4(%esp)
    394c:	00 
    394d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3954:	e8 5c 14 00 00       	call   4db5 <printf>
    exit();
    3959:	e8 be 12 00 00       	call   4c1c <exit>
  }
  if(chdir("/") != 0){
    395e:	c7 04 24 4a 64 00 00 	movl   $0x644a,(%esp)
    3965:	e8 22 13 00 00       	call   4c8c <chdir>
    396a:	85 c0                	test   %eax,%eax
    396c:	74 19                	je     3987 <rmdot+0xe7>
    printf(1, "chdir / failed\n");
    396e:	c7 44 24 04 4c 64 00 	movl   $0x644c,0x4(%esp)
    3975:	00 
    3976:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    397d:	e8 33 14 00 00       	call   4db5 <printf>
    exit();
    3982:	e8 95 12 00 00       	call   4c1c <exit>
  }
  if(unlink("dots/.") == 0){
    3987:	c7 04 24 5c 64 00 00 	movl   $0x645c,(%esp)
    398e:	e8 d9 12 00 00       	call   4c6c <unlink>
    3993:	85 c0                	test   %eax,%eax
    3995:	75 19                	jne    39b0 <rmdot+0x110>
    printf(1, "unlink dots/. worked!\n");
    3997:	c7 44 24 04 63 64 00 	movl   $0x6463,0x4(%esp)
    399e:	00 
    399f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39a6:	e8 0a 14 00 00       	call   4db5 <printf>
    exit();
    39ab:	e8 6c 12 00 00       	call   4c1c <exit>
  }
  if(unlink("dots/..") == 0){
    39b0:	c7 04 24 7a 64 00 00 	movl   $0x647a,(%esp)
    39b7:	e8 b0 12 00 00       	call   4c6c <unlink>
    39bc:	85 c0                	test   %eax,%eax
    39be:	75 19                	jne    39d9 <rmdot+0x139>
    printf(1, "unlink dots/.. worked!\n");
    39c0:	c7 44 24 04 82 64 00 	movl   $0x6482,0x4(%esp)
    39c7:	00 
    39c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39cf:	e8 e1 13 00 00       	call   4db5 <printf>
    exit();
    39d4:	e8 43 12 00 00       	call   4c1c <exit>
  }
  if(unlink("dots") != 0){
    39d9:	c7 04 24 02 64 00 00 	movl   $0x6402,(%esp)
    39e0:	e8 87 12 00 00       	call   4c6c <unlink>
    39e5:	85 c0                	test   %eax,%eax
    39e7:	74 19                	je     3a02 <rmdot+0x162>
    printf(1, "unlink dots failed!\n");
    39e9:	c7 44 24 04 9a 64 00 	movl   $0x649a,0x4(%esp)
    39f0:	00 
    39f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39f8:	e8 b8 13 00 00       	call   4db5 <printf>
    exit();
    39fd:	e8 1a 12 00 00       	call   4c1c <exit>
  }
  printf(1, "rmdot ok\n");
    3a02:	c7 44 24 04 af 64 00 	movl   $0x64af,0x4(%esp)
    3a09:	00 
    3a0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a11:	e8 9f 13 00 00       	call   4db5 <printf>
}
    3a16:	c9                   	leave  
    3a17:	c3                   	ret    

00003a18 <dirfile>:

void
dirfile(void)
{
    3a18:	55                   	push   %ebp
    3a19:	89 e5                	mov    %esp,%ebp
    3a1b:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "dir vs file\n");
    3a1e:	c7 44 24 04 b9 64 00 	movl   $0x64b9,0x4(%esp)
    3a25:	00 
    3a26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a2d:	e8 83 13 00 00       	call   4db5 <printf>

  fd = open("dirfile", O_CREATE);
    3a32:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3a39:	00 
    3a3a:	c7 04 24 c6 64 00 00 	movl   $0x64c6,(%esp)
    3a41:	e8 16 12 00 00       	call   4c5c <open>
    3a46:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    3a49:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3a4d:	79 19                	jns    3a68 <dirfile+0x50>
    printf(1, "create dirfile failed\n");
    3a4f:	c7 44 24 04 ce 64 00 	movl   $0x64ce,0x4(%esp)
    3a56:	00 
    3a57:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a5e:	e8 52 13 00 00       	call   4db5 <printf>
    exit();
    3a63:	e8 b4 11 00 00       	call   4c1c <exit>
  }
  close(fd);
    3a68:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a6b:	89 04 24             	mov    %eax,(%esp)
    3a6e:	e8 d1 11 00 00       	call   4c44 <close>
  if(chdir("dirfile") == 0){
    3a73:	c7 04 24 c6 64 00 00 	movl   $0x64c6,(%esp)
    3a7a:	e8 0d 12 00 00       	call   4c8c <chdir>
    3a7f:	85 c0                	test   %eax,%eax
    3a81:	75 19                	jne    3a9c <dirfile+0x84>
    printf(1, "chdir dirfile succeeded!\n");
    3a83:	c7 44 24 04 e5 64 00 	movl   $0x64e5,0x4(%esp)
    3a8a:	00 
    3a8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a92:	e8 1e 13 00 00       	call   4db5 <printf>
    exit();
    3a97:	e8 80 11 00 00       	call   4c1c <exit>
  }
  fd = open("dirfile/xx", 0);
    3a9c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3aa3:	00 
    3aa4:	c7 04 24 ff 64 00 00 	movl   $0x64ff,(%esp)
    3aab:	e8 ac 11 00 00       	call   4c5c <open>
    3ab0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    3ab3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3ab7:	78 19                	js     3ad2 <dirfile+0xba>
    printf(1, "create dirfile/xx succeeded!\n");
    3ab9:	c7 44 24 04 0a 65 00 	movl   $0x650a,0x4(%esp)
    3ac0:	00 
    3ac1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ac8:	e8 e8 12 00 00       	call   4db5 <printf>
    exit();
    3acd:	e8 4a 11 00 00       	call   4c1c <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    3ad2:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3ad9:	00 
    3ada:	c7 04 24 ff 64 00 00 	movl   $0x64ff,(%esp)
    3ae1:	e8 76 11 00 00       	call   4c5c <open>
    3ae6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    3ae9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3aed:	78 19                	js     3b08 <dirfile+0xf0>
    printf(1, "create dirfile/xx succeeded!\n");
    3aef:	c7 44 24 04 0a 65 00 	movl   $0x650a,0x4(%esp)
    3af6:	00 
    3af7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3afe:	e8 b2 12 00 00       	call   4db5 <printf>
    exit();
    3b03:	e8 14 11 00 00       	call   4c1c <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    3b08:	c7 04 24 ff 64 00 00 	movl   $0x64ff,(%esp)
    3b0f:	e8 70 11 00 00       	call   4c84 <mkdir>
    3b14:	85 c0                	test   %eax,%eax
    3b16:	75 19                	jne    3b31 <dirfile+0x119>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    3b18:	c7 44 24 04 28 65 00 	movl   $0x6528,0x4(%esp)
    3b1f:	00 
    3b20:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b27:	e8 89 12 00 00       	call   4db5 <printf>
    exit();
    3b2c:	e8 eb 10 00 00       	call   4c1c <exit>
  }
  if(unlink("dirfile/xx") == 0){
    3b31:	c7 04 24 ff 64 00 00 	movl   $0x64ff,(%esp)
    3b38:	e8 2f 11 00 00       	call   4c6c <unlink>
    3b3d:	85 c0                	test   %eax,%eax
    3b3f:	75 19                	jne    3b5a <dirfile+0x142>
    printf(1, "unlink dirfile/xx succeeded!\n");
    3b41:	c7 44 24 04 45 65 00 	movl   $0x6545,0x4(%esp)
    3b48:	00 
    3b49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b50:	e8 60 12 00 00       	call   4db5 <printf>
    exit();
    3b55:	e8 c2 10 00 00       	call   4c1c <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    3b5a:	c7 44 24 04 ff 64 00 	movl   $0x64ff,0x4(%esp)
    3b61:	00 
    3b62:	c7 04 24 63 65 00 00 	movl   $0x6563,(%esp)
    3b69:	e8 0e 11 00 00       	call   4c7c <link>
    3b6e:	85 c0                	test   %eax,%eax
    3b70:	75 19                	jne    3b8b <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    3b72:	c7 44 24 04 6c 65 00 	movl   $0x656c,0x4(%esp)
    3b79:	00 
    3b7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b81:	e8 2f 12 00 00       	call   4db5 <printf>
    exit();
    3b86:	e8 91 10 00 00       	call   4c1c <exit>
  }
  if(unlink("dirfile") != 0){
    3b8b:	c7 04 24 c6 64 00 00 	movl   $0x64c6,(%esp)
    3b92:	e8 d5 10 00 00       	call   4c6c <unlink>
    3b97:	85 c0                	test   %eax,%eax
    3b99:	74 19                	je     3bb4 <dirfile+0x19c>
    printf(1, "unlink dirfile failed!\n");
    3b9b:	c7 44 24 04 8b 65 00 	movl   $0x658b,0x4(%esp)
    3ba2:	00 
    3ba3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3baa:	e8 06 12 00 00       	call   4db5 <printf>
    exit();
    3baf:	e8 68 10 00 00       	call   4c1c <exit>
  }

  fd = open(".", O_RDWR);
    3bb4:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    3bbb:	00 
    3bbc:	c7 04 24 33 5b 00 00 	movl   $0x5b33,(%esp)
    3bc3:	e8 94 10 00 00       	call   4c5c <open>
    3bc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    3bcb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3bcf:	78 19                	js     3bea <dirfile+0x1d2>
    printf(1, "open . for writing succeeded!\n");
    3bd1:	c7 44 24 04 a4 65 00 	movl   $0x65a4,0x4(%esp)
    3bd8:	00 
    3bd9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3be0:	e8 d0 11 00 00       	call   4db5 <printf>
    exit();
    3be5:	e8 32 10 00 00       	call   4c1c <exit>
  }
  fd = open(".", 0);
    3bea:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3bf1:	00 
    3bf2:	c7 04 24 33 5b 00 00 	movl   $0x5b33,(%esp)
    3bf9:	e8 5e 10 00 00       	call   4c5c <open>
    3bfe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    3c01:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3c08:	00 
    3c09:	c7 44 24 04 6a 57 00 	movl   $0x576a,0x4(%esp)
    3c10:	00 
    3c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c14:	89 04 24             	mov    %eax,(%esp)
    3c17:	e8 20 10 00 00       	call   4c3c <write>
    3c1c:	85 c0                	test   %eax,%eax
    3c1e:	7e 19                	jle    3c39 <dirfile+0x221>
    printf(1, "write . succeeded!\n");
    3c20:	c7 44 24 04 c3 65 00 	movl   $0x65c3,0x4(%esp)
    3c27:	00 
    3c28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c2f:	e8 81 11 00 00       	call   4db5 <printf>
    exit();
    3c34:	e8 e3 0f 00 00       	call   4c1c <exit>
  }
  close(fd);
    3c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c3c:	89 04 24             	mov    %eax,(%esp)
    3c3f:	e8 00 10 00 00       	call   4c44 <close>

  printf(1, "dir vs file OK\n");
    3c44:	c7 44 24 04 d7 65 00 	movl   $0x65d7,0x4(%esp)
    3c4b:	00 
    3c4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c53:	e8 5d 11 00 00       	call   4db5 <printf>
}
    3c58:	c9                   	leave  
    3c59:	c3                   	ret    

00003c5a <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3c5a:	55                   	push   %ebp
    3c5b:	89 e5                	mov    %esp,%ebp
    3c5d:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(1, "empty file name\n");
    3c60:	c7 44 24 04 e7 65 00 	movl   $0x65e7,0x4(%esp)
    3c67:	00 
    3c68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c6f:	e8 41 11 00 00       	call   4db5 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3c74:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3c7b:	e9 d2 00 00 00       	jmp    3d52 <iref+0xf8>
    if(mkdir("irefd") != 0){
    3c80:	c7 04 24 f8 65 00 00 	movl   $0x65f8,(%esp)
    3c87:	e8 f8 0f 00 00       	call   4c84 <mkdir>
    3c8c:	85 c0                	test   %eax,%eax
    3c8e:	74 19                	je     3ca9 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    3c90:	c7 44 24 04 fe 65 00 	movl   $0x65fe,0x4(%esp)
    3c97:	00 
    3c98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c9f:	e8 11 11 00 00       	call   4db5 <printf>
      exit();
    3ca4:	e8 73 0f 00 00       	call   4c1c <exit>
    }
    if(chdir("irefd") != 0){
    3ca9:	c7 04 24 f8 65 00 00 	movl   $0x65f8,(%esp)
    3cb0:	e8 d7 0f 00 00       	call   4c8c <chdir>
    3cb5:	85 c0                	test   %eax,%eax
    3cb7:	74 19                	je     3cd2 <iref+0x78>
      printf(1, "chdir irefd failed\n");
    3cb9:	c7 44 24 04 12 66 00 	movl   $0x6612,0x4(%esp)
    3cc0:	00 
    3cc1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3cc8:	e8 e8 10 00 00       	call   4db5 <printf>
      exit();
    3ccd:	e8 4a 0f 00 00       	call   4c1c <exit>
    }

    mkdir("");
    3cd2:	c7 04 24 26 66 00 00 	movl   $0x6626,(%esp)
    3cd9:	e8 a6 0f 00 00       	call   4c84 <mkdir>
    link("README", "");
    3cde:	c7 44 24 04 26 66 00 	movl   $0x6626,0x4(%esp)
    3ce5:	00 
    3ce6:	c7 04 24 63 65 00 00 	movl   $0x6563,(%esp)
    3ced:	e8 8a 0f 00 00       	call   4c7c <link>
    fd = open("", O_CREATE);
    3cf2:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3cf9:	00 
    3cfa:	c7 04 24 26 66 00 00 	movl   $0x6626,(%esp)
    3d01:	e8 56 0f 00 00       	call   4c5c <open>
    3d06:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(fd >= 0)
    3d09:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d0d:	78 0b                	js     3d1a <iref+0xc0>
      close(fd);
    3d0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d12:	89 04 24             	mov    %eax,(%esp)
    3d15:	e8 2a 0f 00 00       	call   4c44 <close>
    fd = open("xx", O_CREATE);
    3d1a:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3d21:	00 
    3d22:	c7 04 24 27 66 00 00 	movl   $0x6627,(%esp)
    3d29:	e8 2e 0f 00 00       	call   4c5c <open>
    3d2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(fd >= 0)
    3d31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d35:	78 0b                	js     3d42 <iref+0xe8>
      close(fd);
    3d37:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d3a:	89 04 24             	mov    %eax,(%esp)
    3d3d:	e8 02 0f 00 00       	call   4c44 <close>
    unlink("xx");
    3d42:	c7 04 24 27 66 00 00 	movl   $0x6627,(%esp)
    3d49:	e8 1e 0f 00 00       	call   4c6c <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3d4e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3d52:	83 7d f0 32          	cmpl   $0x32,-0x10(%ebp)
    3d56:	0f 8e 24 ff ff ff    	jle    3c80 <iref+0x26>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    3d5c:	c7 04 24 4a 64 00 00 	movl   $0x644a,(%esp)
    3d63:	e8 24 0f 00 00       	call   4c8c <chdir>
  printf(1, "empty file name OK\n");
    3d68:	c7 44 24 04 2a 66 00 	movl   $0x662a,0x4(%esp)
    3d6f:	00 
    3d70:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3d77:	e8 39 10 00 00       	call   4db5 <printf>
}
    3d7c:	c9                   	leave  
    3d7d:	c3                   	ret    

00003d7e <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    3d7e:	55                   	push   %ebp
    3d7f:	89 e5                	mov    %esp,%ebp
    3d81:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    3d84:	c7 44 24 04 3e 66 00 	movl   $0x663e,0x4(%esp)
    3d8b:	00 
    3d8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3d93:	e8 1d 10 00 00       	call   4db5 <printf>

  for(n=0; n<1000; n++){
    3d98:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3d9f:	eb 1d                	jmp    3dbe <forktest+0x40>
    pid = fork();
    3da1:	e8 6e 0e 00 00       	call   4c14 <fork>
    3da6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0)
    3da9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3dad:	78 1a                	js     3dc9 <forktest+0x4b>
      break;
    if(pid == 0)
    3daf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3db3:	75 05                	jne    3dba <forktest+0x3c>
      exit();
    3db5:	e8 62 0e 00 00       	call   4c1c <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3dba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3dbe:	81 7d f0 e7 03 00 00 	cmpl   $0x3e7,-0x10(%ebp)
    3dc5:	7e da                	jle    3da1 <forktest+0x23>
    3dc7:	eb 01                	jmp    3dca <forktest+0x4c>
    pid = fork();
    if(pid < 0)
      break;
    3dc9:	90                   	nop
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    3dca:	81 7d f0 e8 03 00 00 	cmpl   $0x3e8,-0x10(%ebp)
    3dd1:	75 3f                	jne    3e12 <forktest+0x94>
    printf(1, "fork claimed to work 1000 times!\n");
    3dd3:	c7 44 24 04 4c 66 00 	movl   $0x664c,0x4(%esp)
    3dda:	00 
    3ddb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3de2:	e8 ce 0f 00 00       	call   4db5 <printf>
    exit();
    3de7:	e8 30 0e 00 00       	call   4c1c <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    3dec:	e8 33 0e 00 00       	call   4c24 <wait>
    3df1:	85 c0                	test   %eax,%eax
    3df3:	79 19                	jns    3e0e <forktest+0x90>
      printf(1, "wait stopped early\n");
    3df5:	c7 44 24 04 6e 66 00 	movl   $0x666e,0x4(%esp)
    3dfc:	00 
    3dfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e04:	e8 ac 0f 00 00       	call   4db5 <printf>
      exit();
    3e09:	e8 0e 0e 00 00       	call   4c1c <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    3e0e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    3e12:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3e16:	7f d4                	jg     3dec <forktest+0x6e>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    3e18:	e8 07 0e 00 00       	call   4c24 <wait>
    3e1d:	83 f8 ff             	cmp    $0xffffffff,%eax
    3e20:	74 19                	je     3e3b <forktest+0xbd>
    printf(1, "wait got too many\n");
    3e22:	c7 44 24 04 82 66 00 	movl   $0x6682,0x4(%esp)
    3e29:	00 
    3e2a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e31:	e8 7f 0f 00 00       	call   4db5 <printf>
    exit();
    3e36:	e8 e1 0d 00 00       	call   4c1c <exit>
  }
  
  printf(1, "fork test OK\n");
    3e3b:	c7 44 24 04 95 66 00 	movl   $0x6695,0x4(%esp)
    3e42:	00 
    3e43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e4a:	e8 66 0f 00 00       	call   4db5 <printf>
}
    3e4f:	c9                   	leave  
    3e50:	c3                   	ret    

00003e51 <sbrktest>:

void
sbrktest(void)
{
    3e51:	55                   	push   %ebp
    3e52:	89 e5                	mov    %esp,%ebp
    3e54:	53                   	push   %ebx
    3e55:	81 ec 84 00 00 00    	sub    $0x84,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    3e5b:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    3e60:	c7 44 24 04 a3 66 00 	movl   $0x66a3,0x4(%esp)
    3e67:	00 
    3e68:	89 04 24             	mov    %eax,(%esp)
    3e6b:	e8 45 0f 00 00       	call   4db5 <printf>
  oldbrk = sbrk(0);
    3e70:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e77:	e8 28 0e 00 00       	call   4ca4 <sbrk>
    3e7c:	89 45 e8             	mov    %eax,-0x18(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    3e7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e86:	e8 19 0e 00 00       	call   4ca4 <sbrk>
    3e8b:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    3e8e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3e95:	eb 59                	jmp    3ef0 <sbrktest+0x9f>
    b = sbrk(1);
    3e97:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e9e:	e8 01 0e 00 00       	call   4ca4 <sbrk>
    3ea3:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if(b != a){
    3ea6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ea9:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    3eac:	74 2f                	je     3edd <sbrktest+0x8c>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3eae:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    3eb3:	8b 55 dc             	mov    -0x24(%ebp),%edx
    3eb6:	89 54 24 10          	mov    %edx,0x10(%esp)
    3eba:	8b 55 d8             	mov    -0x28(%ebp),%edx
    3ebd:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3ec1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ec4:	89 54 24 08          	mov    %edx,0x8(%esp)
    3ec8:	c7 44 24 04 ae 66 00 	movl   $0x66ae,0x4(%esp)
    3ecf:	00 
    3ed0:	89 04 24             	mov    %eax,(%esp)
    3ed3:	e8 dd 0e 00 00       	call   4db5 <printf>
      exit();
    3ed8:	e8 3f 0d 00 00       	call   4c1c <exit>
    }
    *b = 1;
    3edd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ee0:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    3ee3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3ee6:	83 c0 01             	add    $0x1,%eax
    3ee9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    3eec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3ef0:	81 7d f4 87 13 00 00 	cmpl   $0x1387,-0xc(%ebp)
    3ef7:	7e 9e                	jle    3e97 <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    3ef9:	e8 16 0d 00 00       	call   4c14 <fork>
    3efe:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(pid < 0){
    3f01:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    3f05:	79 1a                	jns    3f21 <sbrktest+0xd0>
    printf(stdout, "sbrk test fork failed\n");
    3f07:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    3f0c:	c7 44 24 04 c9 66 00 	movl   $0x66c9,0x4(%esp)
    3f13:	00 
    3f14:	89 04 24             	mov    %eax,(%esp)
    3f17:	e8 99 0e 00 00       	call   4db5 <printf>
    exit();
    3f1c:	e8 fb 0c 00 00       	call   4c1c <exit>
  }
  c = sbrk(1);
    3f21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3f28:	e8 77 0d 00 00       	call   4ca4 <sbrk>
    3f2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    3f30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3f37:	e8 68 0d 00 00       	call   4ca4 <sbrk>
    3f3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    3f3f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3f42:	83 c0 01             	add    $0x1,%eax
    3f45:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    3f48:	74 1a                	je     3f64 <sbrktest+0x113>
    printf(stdout, "sbrk test failed post-fork\n");
    3f4a:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    3f4f:	c7 44 24 04 e0 66 00 	movl   $0x66e0,0x4(%esp)
    3f56:	00 
    3f57:	89 04 24             	mov    %eax,(%esp)
    3f5a:	e8 56 0e 00 00       	call   4db5 <printf>
    exit();
    3f5f:	e8 b8 0c 00 00       	call   4c1c <exit>
  }
  if(pid == 0)
    3f64:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    3f68:	75 05                	jne    3f6f <sbrktest+0x11e>
    exit();
    3f6a:	e8 ad 0c 00 00       	call   4c1c <exit>
  wait();
    3f6f:	e8 b0 0c 00 00       	call   4c24 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3f74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f7b:	e8 24 0d 00 00       	call   4ca4 <sbrk>
    3f80:	89 45 d8             	mov    %eax,-0x28(%ebp)
  amt = (BIG) - (uint)a;
    3f83:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3f86:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3f8b:	89 d1                	mov    %edx,%ecx
    3f8d:	29 c1                	sub    %eax,%ecx
    3f8f:	89 c8                	mov    %ecx,%eax
    3f91:	89 45 f0             	mov    %eax,-0x10(%ebp)
  p = sbrk(amt);
    3f94:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f97:	89 04 24             	mov    %eax,(%esp)
    3f9a:	e8 05 0d 00 00       	call   4ca4 <sbrk>
    3f9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if (p != a) { 
    3fa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3fa5:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    3fa8:	74 1a                	je     3fc4 <sbrktest+0x173>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3faa:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    3faf:	c7 44 24 04 fc 66 00 	movl   $0x66fc,0x4(%esp)
    3fb6:	00 
    3fb7:	89 04 24             	mov    %eax,(%esp)
    3fba:	e8 f6 0d 00 00       	call   4db5 <printf>
    exit();
    3fbf:	e8 58 0c 00 00       	call   4c1c <exit>
  }
  lastaddr = (char*) (BIG-1);
    3fc4:	c7 45 e4 ff ff 3f 06 	movl   $0x63fffff,-0x1c(%ebp)
  *lastaddr = 99;
    3fcb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3fce:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    3fd1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fd8:	e8 c7 0c 00 00       	call   4ca4 <sbrk>
    3fdd:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c = sbrk(-4096);
    3fe0:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    3fe7:	e8 b8 0c 00 00       	call   4ca4 <sbrk>
    3fec:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    3fef:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3ff3:	75 1a                	jne    400f <sbrktest+0x1be>
    printf(stdout, "sbrk could not deallocate\n");
    3ff5:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    3ffa:	c7 44 24 04 3a 67 00 	movl   $0x673a,0x4(%esp)
    4001:	00 
    4002:	89 04 24             	mov    %eax,(%esp)
    4005:	e8 ab 0d 00 00       	call   4db5 <printf>
    exit();
    400a:	e8 0d 0c 00 00       	call   4c1c <exit>
  }
  c = sbrk(0);
    400f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4016:	e8 89 0c 00 00       	call   4ca4 <sbrk>
    401b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    401e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4021:	2d 00 10 00 00       	sub    $0x1000,%eax
    4026:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    4029:	74 28                	je     4053 <sbrktest+0x202>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    402b:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4030:	8b 55 e0             	mov    -0x20(%ebp),%edx
    4033:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4037:	8b 55 d8             	mov    -0x28(%ebp),%edx
    403a:	89 54 24 08          	mov    %edx,0x8(%esp)
    403e:	c7 44 24 04 58 67 00 	movl   $0x6758,0x4(%esp)
    4045:	00 
    4046:	89 04 24             	mov    %eax,(%esp)
    4049:	e8 67 0d 00 00       	call   4db5 <printf>
    exit();
    404e:	e8 c9 0b 00 00       	call   4c1c <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    4053:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    405a:	e8 45 0c 00 00       	call   4ca4 <sbrk>
    405f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c = sbrk(4096);
    4062:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    4069:	e8 36 0c 00 00       	call   4ca4 <sbrk>
    406e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    4071:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4074:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    4077:	75 19                	jne    4092 <sbrktest+0x241>
    4079:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4080:	e8 1f 0c 00 00       	call   4ca4 <sbrk>
    4085:	8b 55 d8             	mov    -0x28(%ebp),%edx
    4088:	81 c2 00 10 00 00    	add    $0x1000,%edx
    408e:	39 d0                	cmp    %edx,%eax
    4090:	74 28                	je     40ba <sbrktest+0x269>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    4092:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4097:	8b 55 e0             	mov    -0x20(%ebp),%edx
    409a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    409e:	8b 55 d8             	mov    -0x28(%ebp),%edx
    40a1:	89 54 24 08          	mov    %edx,0x8(%esp)
    40a5:	c7 44 24 04 90 67 00 	movl   $0x6790,0x4(%esp)
    40ac:	00 
    40ad:	89 04 24             	mov    %eax,(%esp)
    40b0:	e8 00 0d 00 00       	call   4db5 <printf>
    exit();
    40b5:	e8 62 0b 00 00       	call   4c1c <exit>
  }
  if(*lastaddr == 99){
    40ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    40bd:	0f b6 00             	movzbl (%eax),%eax
    40c0:	3c 63                	cmp    $0x63,%al
    40c2:	75 1a                	jne    40de <sbrktest+0x28d>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    40c4:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    40c9:	c7 44 24 04 b8 67 00 	movl   $0x67b8,0x4(%esp)
    40d0:	00 
    40d1:	89 04 24             	mov    %eax,(%esp)
    40d4:	e8 dc 0c 00 00       	call   4db5 <printf>
    exit();
    40d9:	e8 3e 0b 00 00       	call   4c1c <exit>
  }

  a = sbrk(0);
    40de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    40e5:	e8 ba 0b 00 00       	call   4ca4 <sbrk>
    40ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    40ed:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    40f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    40f7:	e8 a8 0b 00 00       	call   4ca4 <sbrk>
    40fc:	89 da                	mov    %ebx,%edx
    40fe:	29 c2                	sub    %eax,%edx
    4100:	89 d0                	mov    %edx,%eax
    4102:	89 04 24             	mov    %eax,(%esp)
    4105:	e8 9a 0b 00 00       	call   4ca4 <sbrk>
    410a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    410d:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4110:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    4113:	74 28                	je     413d <sbrktest+0x2ec>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    4115:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    411a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    411d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4121:	8b 55 d8             	mov    -0x28(%ebp),%edx
    4124:	89 54 24 08          	mov    %edx,0x8(%esp)
    4128:	c7 44 24 04 e8 67 00 	movl   $0x67e8,0x4(%esp)
    412f:	00 
    4130:	89 04 24             	mov    %eax,(%esp)
    4133:	e8 7d 0c 00 00       	call   4db5 <printf>
    exit();
    4138:	e8 df 0a 00 00       	call   4c1c <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    413d:	c7 45 d8 00 00 00 80 	movl   $0x80000000,-0x28(%ebp)
    4144:	eb 7b                	jmp    41c1 <sbrktest+0x370>
    ppid = getpid();
    4146:	e8 51 0b 00 00       	call   4c9c <getpid>
    414b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    pid = fork();
    414e:	e8 c1 0a 00 00       	call   4c14 <fork>
    4153:	89 45 d0             	mov    %eax,-0x30(%ebp)
    if(pid < 0){
    4156:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    415a:	79 1a                	jns    4176 <sbrktest+0x325>
      printf(stdout, "fork failed\n");
    415c:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4161:	c7 44 24 04 b1 57 00 	movl   $0x57b1,0x4(%esp)
    4168:	00 
    4169:	89 04 24             	mov    %eax,(%esp)
    416c:	e8 44 0c 00 00       	call   4db5 <printf>
      exit();
    4171:	e8 a6 0a 00 00       	call   4c1c <exit>
    }
    if(pid == 0){
    4176:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    417a:	75 39                	jne    41b5 <sbrktest+0x364>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    417c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    417f:	0f b6 00             	movzbl (%eax),%eax
    4182:	0f be d0             	movsbl %al,%edx
    4185:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    418a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    418e:	8b 55 d8             	mov    -0x28(%ebp),%edx
    4191:	89 54 24 08          	mov    %edx,0x8(%esp)
    4195:	c7 44 24 04 09 68 00 	movl   $0x6809,0x4(%esp)
    419c:	00 
    419d:	89 04 24             	mov    %eax,(%esp)
    41a0:	e8 10 0c 00 00       	call   4db5 <printf>
      kill(ppid);
    41a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    41a8:	89 04 24             	mov    %eax,(%esp)
    41ab:	e8 9c 0a 00 00       	call   4c4c <kill>
      exit();
    41b0:	e8 67 0a 00 00       	call   4c1c <exit>
    }
    wait();
    41b5:	e8 6a 0a 00 00       	call   4c24 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    41ba:	81 45 d8 50 c3 00 00 	addl   $0xc350,-0x28(%ebp)
    41c1:	81 7d d8 7f 84 1e 80 	cmpl   $0x801e847f,-0x28(%ebp)
    41c8:	0f 86 78 ff ff ff    	jbe    4146 <sbrktest+0x2f5>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    41ce:	8d 45 c8             	lea    -0x38(%ebp),%eax
    41d1:	89 04 24             	mov    %eax,(%esp)
    41d4:	e8 53 0a 00 00       	call   4c2c <pipe>
    41d9:	85 c0                	test   %eax,%eax
    41db:	74 19                	je     41f6 <sbrktest+0x3a5>
    printf(1, "pipe() failed\n");
    41dd:	c7 44 24 04 05 57 00 	movl   $0x5705,0x4(%esp)
    41e4:	00 
    41e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    41ec:	e8 c4 0b 00 00       	call   4db5 <printf>
    exit();
    41f1:	e8 26 0a 00 00       	call   4c1c <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    41f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    41fd:	e9 86 00 00 00       	jmp    4288 <sbrktest+0x437>
    if((pids[i] = fork()) == 0){
    4202:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    4205:	e8 0a 0a 00 00       	call   4c14 <fork>
    420a:	89 44 9d a0          	mov    %eax,-0x60(%ebp,%ebx,4)
    420e:	8b 44 9d a0          	mov    -0x60(%ebp,%ebx,4),%eax
    4212:	85 c0                	test   %eax,%eax
    4214:	75 48                	jne    425e <sbrktest+0x40d>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    4216:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    421d:	e8 82 0a 00 00       	call   4ca4 <sbrk>
    4222:	ba 00 00 40 06       	mov    $0x6400000,%edx
    4227:	89 d1                	mov    %edx,%ecx
    4229:	29 c1                	sub    %eax,%ecx
    422b:	89 c8                	mov    %ecx,%eax
    422d:	89 04 24             	mov    %eax,(%esp)
    4230:	e8 6f 0a 00 00       	call   4ca4 <sbrk>
      write(fds[1], "x", 1);
    4235:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4238:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    423f:	00 
    4240:	c7 44 24 04 6a 57 00 	movl   $0x576a,0x4(%esp)
    4247:	00 
    4248:	89 04 24             	mov    %eax,(%esp)
    424b:	e8 ec 09 00 00       	call   4c3c <write>
      // sit around until killed
      for(;;) sleep(1000);
    4250:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    4257:	e8 50 0a 00 00       	call   4cac <sleep>
    425c:	eb f2                	jmp    4250 <sbrktest+0x3ff>
    }
    if(pids[i] != -1)
    425e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4261:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    4265:	83 f8 ff             	cmp    $0xffffffff,%eax
    4268:	74 1a                	je     4284 <sbrktest+0x433>
      read(fds[0], &scratch, 1);
    426a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    426d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4274:	00 
    4275:	8d 55 9f             	lea    -0x61(%ebp),%edx
    4278:	89 54 24 04          	mov    %edx,0x4(%esp)
    427c:	89 04 24             	mov    %eax,(%esp)
    427f:	e8 b0 09 00 00       	call   4c34 <read>
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    4284:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4288:	8b 45 f4             	mov    -0xc(%ebp),%eax
    428b:	83 f8 09             	cmp    $0x9,%eax
    428e:	0f 86 6e ff ff ff    	jbe    4202 <sbrktest+0x3b1>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    4294:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    429b:	e8 04 0a 00 00       	call   4ca4 <sbrk>
    42a0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    42a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    42aa:	eb 27                	jmp    42d3 <sbrktest+0x482>
    if(pids[i] == -1)
    42ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42af:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    42b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    42b6:	74 16                	je     42ce <sbrktest+0x47d>
      continue;
    kill(pids[i]);
    42b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42bb:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    42bf:	89 04 24             	mov    %eax,(%esp)
    42c2:	e8 85 09 00 00       	call   4c4c <kill>
    wait();
    42c7:	e8 58 09 00 00       	call   4c24 <wait>
    42cc:	eb 01                	jmp    42cf <sbrktest+0x47e>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
      continue;
    42ce:	90                   	nop
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    42cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    42d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42d6:	83 f8 09             	cmp    $0x9,%eax
    42d9:	76 d1                	jbe    42ac <sbrktest+0x45b>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    42db:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    42df:	75 1a                	jne    42fb <sbrktest+0x4aa>
    printf(stdout, "failed sbrk leaked memory\n");
    42e1:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    42e6:	c7 44 24 04 22 68 00 	movl   $0x6822,0x4(%esp)
    42ed:	00 
    42ee:	89 04 24             	mov    %eax,(%esp)
    42f1:	e8 bf 0a 00 00       	call   4db5 <printf>
    exit();
    42f6:	e8 21 09 00 00       	call   4c1c <exit>
  }

  if(sbrk(0) > oldbrk)
    42fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4302:	e8 9d 09 00 00       	call   4ca4 <sbrk>
    4307:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    430a:	76 1d                	jbe    4329 <sbrktest+0x4d8>
    sbrk(-(sbrk(0) - oldbrk));
    430c:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    430f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4316:	e8 89 09 00 00       	call   4ca4 <sbrk>
    431b:	89 da                	mov    %ebx,%edx
    431d:	29 c2                	sub    %eax,%edx
    431f:	89 d0                	mov    %edx,%eax
    4321:	89 04 24             	mov    %eax,(%esp)
    4324:	e8 7b 09 00 00       	call   4ca4 <sbrk>

  printf(stdout, "sbrk test OK\n");
    4329:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    432e:	c7 44 24 04 3d 68 00 	movl   $0x683d,0x4(%esp)
    4335:	00 
    4336:	89 04 24             	mov    %eax,(%esp)
    4339:	e8 77 0a 00 00       	call   4db5 <printf>
}
    433e:	81 c4 84 00 00 00    	add    $0x84,%esp
    4344:	5b                   	pop    %ebx
    4345:	5d                   	pop    %ebp
    4346:	c3                   	ret    

00004347 <validateint>:

void
validateint(int *p)
{
    4347:	55                   	push   %ebp
    4348:	89 e5                	mov    %esp,%ebp
    434a:	53                   	push   %ebx
    434b:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    434e:	b8 0d 00 00 00       	mov    $0xd,%eax
    4353:	8b 55 08             	mov    0x8(%ebp),%edx
    4356:	89 d1                	mov    %edx,%ecx
    4358:	89 e3                	mov    %esp,%ebx
    435a:	89 cc                	mov    %ecx,%esp
    435c:	cd 40                	int    $0x40
    435e:	89 dc                	mov    %ebx,%esp
    4360:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    4363:	83 c4 10             	add    $0x10,%esp
    4366:	5b                   	pop    %ebx
    4367:	5d                   	pop    %ebp
    4368:	c3                   	ret    

00004369 <validatetest>:

void
validatetest(void)
{
    4369:	55                   	push   %ebp
    436a:	89 e5                	mov    %esp,%ebp
    436c:	83 ec 28             	sub    $0x28,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    436f:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4374:	c7 44 24 04 4b 68 00 	movl   $0x684b,0x4(%esp)
    437b:	00 
    437c:	89 04 24             	mov    %eax,(%esp)
    437f:	e8 31 0a 00 00       	call   4db5 <printf>
  hi = 1100*1024;
    4384:	c7 45 ec 00 30 11 00 	movl   $0x113000,-0x14(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    438b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4392:	eb 7f                	jmp    4413 <validatetest+0xaa>
    if((pid = fork()) == 0){
    4394:	e8 7b 08 00 00       	call   4c14 <fork>
    4399:	89 45 f0             	mov    %eax,-0x10(%ebp)
    439c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    43a0:	75 10                	jne    43b2 <validatetest+0x49>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    43a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43a5:	89 04 24             	mov    %eax,(%esp)
    43a8:	e8 9a ff ff ff       	call   4347 <validateint>
      exit();
    43ad:	e8 6a 08 00 00       	call   4c1c <exit>
    }
    sleep(0);
    43b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43b9:	e8 ee 08 00 00       	call   4cac <sleep>
    sleep(0);
    43be:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    43c5:	e8 e2 08 00 00       	call   4cac <sleep>
    kill(pid);
    43ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43cd:	89 04 24             	mov    %eax,(%esp)
    43d0:	e8 77 08 00 00       	call   4c4c <kill>
    wait();
    43d5:	e8 4a 08 00 00       	call   4c24 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    43da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    43e1:	c7 04 24 5a 68 00 00 	movl   $0x685a,(%esp)
    43e8:	e8 8f 08 00 00       	call   4c7c <link>
    43ed:	83 f8 ff             	cmp    $0xffffffff,%eax
    43f0:	74 1a                	je     440c <validatetest+0xa3>
      printf(stdout, "link should not succeed\n");
    43f2:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    43f7:	c7 44 24 04 65 68 00 	movl   $0x6865,0x4(%esp)
    43fe:	00 
    43ff:	89 04 24             	mov    %eax,(%esp)
    4402:	e8 ae 09 00 00       	call   4db5 <printf>
      exit();
    4407:	e8 10 08 00 00       	call   4c1c <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    440c:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    4413:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4416:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4419:	0f 83 75 ff ff ff    	jae    4394 <validatetest+0x2b>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    441f:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4424:	c7 44 24 04 7e 68 00 	movl   $0x687e,0x4(%esp)
    442b:	00 
    442c:	89 04 24             	mov    %eax,(%esp)
    442f:	e8 81 09 00 00       	call   4db5 <printf>
}
    4434:	c9                   	leave  
    4435:	c3                   	ret    

00004436 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    4436:	55                   	push   %ebp
    4437:	89 e5                	mov    %esp,%ebp
    4439:	83 ec 28             	sub    $0x28,%esp
  int i;

  printf(stdout, "bss test\n");
    443c:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4441:	c7 44 24 04 8b 68 00 	movl   $0x688b,0x4(%esp)
    4448:	00 
    4449:	89 04 24             	mov    %eax,(%esp)
    444c:	e8 64 09 00 00       	call   4db5 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    4451:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4458:	eb 2c                	jmp    4486 <bsstest+0x50>
    if(uninit[i] != '\0'){
    445a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    445d:	0f b6 80 a0 6b 00 00 	movzbl 0x6ba0(%eax),%eax
    4464:	84 c0                	test   %al,%al
    4466:	74 1a                	je     4482 <bsstest+0x4c>
      printf(stdout, "bss test failed\n");
    4468:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    446d:	c7 44 24 04 95 68 00 	movl   $0x6895,0x4(%esp)
    4474:	00 
    4475:	89 04 24             	mov    %eax,(%esp)
    4478:	e8 38 09 00 00       	call   4db5 <printf>
      exit();
    447d:	e8 9a 07 00 00       	call   4c1c <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    4482:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4486:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4489:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    448e:	76 ca                	jbe    445a <bsstest+0x24>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    4490:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4495:	c7 44 24 04 a6 68 00 	movl   $0x68a6,0x4(%esp)
    449c:	00 
    449d:	89 04 24             	mov    %eax,(%esp)
    44a0:	e8 10 09 00 00       	call   4db5 <printf>
}
    44a5:	c9                   	leave  
    44a6:	c3                   	ret    

000044a7 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    44a7:	55                   	push   %ebp
    44a8:	89 e5                	mov    %esp,%ebp
    44aa:	83 ec 28             	sub    $0x28,%esp
  int pid, fd;

  unlink("bigarg-ok");
    44ad:	c7 04 24 b3 68 00 00 	movl   $0x68b3,(%esp)
    44b4:	e8 b3 07 00 00       	call   4c6c <unlink>
  pid = fork();
    44b9:	e8 56 07 00 00       	call   4c14 <fork>
    44be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid == 0){
    44c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    44c5:	0f 85 90 00 00 00    	jne    455b <bigargtest+0xb4>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    44cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    44d2:	eb 12                	jmp    44e6 <bigargtest+0x3f>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    44d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    44d7:	c7 04 85 00 6b 00 00 	movl   $0x68c0,0x6b00(,%eax,4)
    44de:	c0 68 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    44e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    44e6:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    44ea:	7e e8                	jle    44d4 <bigargtest+0x2d>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    44ec:	c7 05 7c 6b 00 00 00 	movl   $0x0,0x6b7c
    44f3:	00 00 00 
    printf(stdout, "bigarg test\n");
    44f6:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    44fb:	c7 44 24 04 9d 69 00 	movl   $0x699d,0x4(%esp)
    4502:	00 
    4503:	89 04 24             	mov    %eax,(%esp)
    4506:	e8 aa 08 00 00       	call   4db5 <printf>
    exec("echo", args);
    450b:	c7 44 24 04 00 6b 00 	movl   $0x6b00,0x4(%esp)
    4512:	00 
    4513:	c7 04 24 c4 53 00 00 	movl   $0x53c4,(%esp)
    451a:	e8 35 07 00 00       	call   4c54 <exec>
    printf(stdout, "bigarg test ok\n");
    451f:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4524:	c7 44 24 04 aa 69 00 	movl   $0x69aa,0x4(%esp)
    452b:	00 
    452c:	89 04 24             	mov    %eax,(%esp)
    452f:	e8 81 08 00 00       	call   4db5 <printf>
    fd = open("bigarg-ok", O_CREATE);
    4534:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    453b:	00 
    453c:	c7 04 24 b3 68 00 00 	movl   $0x68b3,(%esp)
    4543:	e8 14 07 00 00       	call   4c5c <open>
    4548:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
    454b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    454e:	89 04 24             	mov    %eax,(%esp)
    4551:	e8 ee 06 00 00       	call   4c44 <close>
    exit();
    4556:	e8 c1 06 00 00       	call   4c1c <exit>
  } else if(pid < 0){
    455b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    455f:	79 1a                	jns    457b <bigargtest+0xd4>
    printf(stdout, "bigargtest: fork failed\n");
    4561:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    4566:	c7 44 24 04 ba 69 00 	movl   $0x69ba,0x4(%esp)
    456d:	00 
    456e:	89 04 24             	mov    %eax,(%esp)
    4571:	e8 3f 08 00 00       	call   4db5 <printf>
    exit();
    4576:	e8 a1 06 00 00       	call   4c1c <exit>
  }
  wait();
    457b:	e8 a4 06 00 00       	call   4c24 <wait>
  fd = open("bigarg-ok", 0);
    4580:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4587:	00 
    4588:	c7 04 24 b3 68 00 00 	movl   $0x68b3,(%esp)
    458f:	e8 c8 06 00 00       	call   4c5c <open>
    4594:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    4597:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    459b:	79 1a                	jns    45b7 <bigargtest+0x110>
    printf(stdout, "bigarg test failed!\n");
    459d:	a1 d0 6a 00 00       	mov    0x6ad0,%eax
    45a2:	c7 44 24 04 d3 69 00 	movl   $0x69d3,0x4(%esp)
    45a9:	00 
    45aa:	89 04 24             	mov    %eax,(%esp)
    45ad:	e8 03 08 00 00       	call   4db5 <printf>
    exit();
    45b2:	e8 65 06 00 00       	call   4c1c <exit>
  }
  close(fd);
    45b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45ba:	89 04 24             	mov    %eax,(%esp)
    45bd:	e8 82 06 00 00       	call   4c44 <close>
  unlink("bigarg-ok");
    45c2:	c7 04 24 b3 68 00 00 	movl   $0x68b3,(%esp)
    45c9:	e8 9e 06 00 00       	call   4c6c <unlink>
}
    45ce:	c9                   	leave  
    45cf:	c3                   	ret    

000045d0 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    45d0:	55                   	push   %ebp
    45d1:	89 e5                	mov    %esp,%ebp
    45d3:	53                   	push   %ebx
    45d4:	83 ec 74             	sub    $0x74,%esp
  int nfiles;
  int fsblocks = 0;
    45d7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)

  printf(1, "fsfull test\n");
    45de:	c7 44 24 04 e8 69 00 	movl   $0x69e8,0x4(%esp)
    45e5:	00 
    45e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    45ed:	e8 c3 07 00 00       	call   4db5 <printf>

  for(nfiles = 0; ; nfiles++){
    45f2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    char name[64];
    name[0] = 'f';
    45f9:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    45fd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4600:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    4605:	89 c8                	mov    %ecx,%eax
    4607:	f7 ea                	imul   %edx
    4609:	c1 fa 06             	sar    $0x6,%edx
    460c:	89 c8                	mov    %ecx,%eax
    460e:	c1 f8 1f             	sar    $0x1f,%eax
    4611:	89 d1                	mov    %edx,%ecx
    4613:	29 c1                	sub    %eax,%ecx
    4615:	89 c8                	mov    %ecx,%eax
    4617:	83 c0 30             	add    $0x30,%eax
    461a:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    461d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    4620:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    4625:	89 d8                	mov    %ebx,%eax
    4627:	f7 ea                	imul   %edx
    4629:	c1 fa 06             	sar    $0x6,%edx
    462c:	89 d8                	mov    %ebx,%eax
    462e:	c1 f8 1f             	sar    $0x1f,%eax
    4631:	89 d1                	mov    %edx,%ecx
    4633:	29 c1                	sub    %eax,%ecx
    4635:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    463b:	89 d9                	mov    %ebx,%ecx
    463d:	29 c1                	sub    %eax,%ecx
    463f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    4644:	89 c8                	mov    %ecx,%eax
    4646:	f7 ea                	imul   %edx
    4648:	c1 fa 05             	sar    $0x5,%edx
    464b:	89 c8                	mov    %ecx,%eax
    464d:	c1 f8 1f             	sar    $0x1f,%eax
    4650:	89 d1                	mov    %edx,%ecx
    4652:	29 c1                	sub    %eax,%ecx
    4654:	89 c8                	mov    %ecx,%eax
    4656:	83 c0 30             	add    $0x30,%eax
    4659:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    465c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    465f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    4664:	89 d8                	mov    %ebx,%eax
    4666:	f7 ea                	imul   %edx
    4668:	c1 fa 05             	sar    $0x5,%edx
    466b:	89 d8                	mov    %ebx,%eax
    466d:	c1 f8 1f             	sar    $0x1f,%eax
    4670:	89 d1                	mov    %edx,%ecx
    4672:	29 c1                	sub    %eax,%ecx
    4674:	6b c1 64             	imul   $0x64,%ecx,%eax
    4677:	89 d9                	mov    %ebx,%ecx
    4679:	29 c1                	sub    %eax,%ecx
    467b:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4680:	89 c8                	mov    %ecx,%eax
    4682:	f7 ea                	imul   %edx
    4684:	c1 fa 02             	sar    $0x2,%edx
    4687:	89 c8                	mov    %ecx,%eax
    4689:	c1 f8 1f             	sar    $0x1f,%eax
    468c:	89 d1                	mov    %edx,%ecx
    468e:	29 c1                	sub    %eax,%ecx
    4690:	89 c8                	mov    %ecx,%eax
    4692:	83 c0 30             	add    $0x30,%eax
    4695:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    4698:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    469b:	ba 67 66 66 66       	mov    $0x66666667,%edx
    46a0:	89 c8                	mov    %ecx,%eax
    46a2:	f7 ea                	imul   %edx
    46a4:	c1 fa 02             	sar    $0x2,%edx
    46a7:	89 c8                	mov    %ecx,%eax
    46a9:	c1 f8 1f             	sar    $0x1f,%eax
    46ac:	29 c2                	sub    %eax,%edx
    46ae:	89 d0                	mov    %edx,%eax
    46b0:	c1 e0 02             	shl    $0x2,%eax
    46b3:	01 d0                	add    %edx,%eax
    46b5:	01 c0                	add    %eax,%eax
    46b7:	89 ca                	mov    %ecx,%edx
    46b9:	29 c2                	sub    %eax,%edx
    46bb:	89 d0                	mov    %edx,%eax
    46bd:	83 c0 30             	add    $0x30,%eax
    46c0:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    46c3:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    46c7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    46ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    46ce:	c7 44 24 04 f5 69 00 	movl   $0x69f5,0x4(%esp)
    46d5:	00 
    46d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    46dd:	e8 d3 06 00 00       	call   4db5 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    46e2:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    46e9:	00 
    46ea:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    46ed:	89 04 24             	mov    %eax,(%esp)
    46f0:	e8 67 05 00 00       	call   4c5c <open>
    46f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    46f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    46fc:	79 1d                	jns    471b <fsfull+0x14b>
      printf(1, "open %s failed\n", name);
    46fe:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4701:	89 44 24 08          	mov    %eax,0x8(%esp)
    4705:	c7 44 24 04 01 6a 00 	movl   $0x6a01,0x4(%esp)
    470c:	00 
    470d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4714:	e8 9c 06 00 00       	call   4db5 <printf>
      break;
    4719:	eb 72                	jmp    478d <fsfull+0x1bd>
    }
    int total = 0;
    471b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    4722:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    4729:	00 
    472a:	c7 44 24 04 c0 92 00 	movl   $0x92c0,0x4(%esp)
    4731:	00 
    4732:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4735:	89 04 24             	mov    %eax,(%esp)
    4738:	e8 ff 04 00 00       	call   4c3c <write>
    473d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(cc < 512)
    4740:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    4747:	7e 0c                	jle    4755 <fsfull+0x185>
        break;
      total += cc;
    4749:	8b 45 f4             	mov    -0xc(%ebp),%eax
    474c:	01 45 f0             	add    %eax,-0x10(%ebp)
      fsblocks++;
    474f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    }
    4753:	eb cd                	jmp    4722 <fsfull+0x152>
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
    4755:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    4756:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4759:	89 44 24 08          	mov    %eax,0x8(%esp)
    475d:	c7 44 24 04 11 6a 00 	movl   $0x6a11,0x4(%esp)
    4764:	00 
    4765:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    476c:	e8 44 06 00 00       	call   4db5 <printf>
    close(fd);
    4771:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4774:	89 04 24             	mov    %eax,(%esp)
    4777:	e8 c8 04 00 00       	call   4c44 <close>
    if(total == 0)
    477c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4780:	75 02                	jne    4784 <fsfull+0x1b4>
      break;
    4782:	eb 09                	jmp    478d <fsfull+0x1bd>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    4784:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    4788:	e9 6c fe ff ff       	jmp    45f9 <fsfull+0x29>

  while(nfiles >= 0){
    478d:	e9 dd 00 00 00       	jmp    486f <fsfull+0x29f>
    char name[64];
    name[0] = 'f';
    4792:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    4796:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4799:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    479e:	89 c8                	mov    %ecx,%eax
    47a0:	f7 ea                	imul   %edx
    47a2:	c1 fa 06             	sar    $0x6,%edx
    47a5:	89 c8                	mov    %ecx,%eax
    47a7:	c1 f8 1f             	sar    $0x1f,%eax
    47aa:	89 d1                	mov    %edx,%ecx
    47ac:	29 c1                	sub    %eax,%ecx
    47ae:	89 c8                	mov    %ecx,%eax
    47b0:	83 c0 30             	add    $0x30,%eax
    47b3:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    47b6:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    47b9:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    47be:	89 d8                	mov    %ebx,%eax
    47c0:	f7 ea                	imul   %edx
    47c2:	c1 fa 06             	sar    $0x6,%edx
    47c5:	89 d8                	mov    %ebx,%eax
    47c7:	c1 f8 1f             	sar    $0x1f,%eax
    47ca:	89 d1                	mov    %edx,%ecx
    47cc:	29 c1                	sub    %eax,%ecx
    47ce:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    47d4:	89 d9                	mov    %ebx,%ecx
    47d6:	29 c1                	sub    %eax,%ecx
    47d8:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    47dd:	89 c8                	mov    %ecx,%eax
    47df:	f7 ea                	imul   %edx
    47e1:	c1 fa 05             	sar    $0x5,%edx
    47e4:	89 c8                	mov    %ecx,%eax
    47e6:	c1 f8 1f             	sar    $0x1f,%eax
    47e9:	89 d1                	mov    %edx,%ecx
    47eb:	29 c1                	sub    %eax,%ecx
    47ed:	89 c8                	mov    %ecx,%eax
    47ef:	83 c0 30             	add    $0x30,%eax
    47f2:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    47f5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    47f8:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    47fd:	89 d8                	mov    %ebx,%eax
    47ff:	f7 ea                	imul   %edx
    4801:	c1 fa 05             	sar    $0x5,%edx
    4804:	89 d8                	mov    %ebx,%eax
    4806:	c1 f8 1f             	sar    $0x1f,%eax
    4809:	89 d1                	mov    %edx,%ecx
    480b:	29 c1                	sub    %eax,%ecx
    480d:	6b c1 64             	imul   $0x64,%ecx,%eax
    4810:	89 d9                	mov    %ebx,%ecx
    4812:	29 c1                	sub    %eax,%ecx
    4814:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4819:	89 c8                	mov    %ecx,%eax
    481b:	f7 ea                	imul   %edx
    481d:	c1 fa 02             	sar    $0x2,%edx
    4820:	89 c8                	mov    %ecx,%eax
    4822:	c1 f8 1f             	sar    $0x1f,%eax
    4825:	89 d1                	mov    %edx,%ecx
    4827:	29 c1                	sub    %eax,%ecx
    4829:	89 c8                	mov    %ecx,%eax
    482b:	83 c0 30             	add    $0x30,%eax
    482e:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    4831:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    4834:	ba 67 66 66 66       	mov    $0x66666667,%edx
    4839:	89 c8                	mov    %ecx,%eax
    483b:	f7 ea                	imul   %edx
    483d:	c1 fa 02             	sar    $0x2,%edx
    4840:	89 c8                	mov    %ecx,%eax
    4842:	c1 f8 1f             	sar    $0x1f,%eax
    4845:	29 c2                	sub    %eax,%edx
    4847:	89 d0                	mov    %edx,%eax
    4849:	c1 e0 02             	shl    $0x2,%eax
    484c:	01 d0                	add    %edx,%eax
    484e:	01 c0                	add    %eax,%eax
    4850:	89 ca                	mov    %ecx,%edx
    4852:	29 c2                	sub    %eax,%edx
    4854:	89 d0                	mov    %edx,%eax
    4856:	83 c0 30             	add    $0x30,%eax
    4859:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    485c:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    4860:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4863:	89 04 24             	mov    %eax,(%esp)
    4866:	e8 01 04 00 00       	call   4c6c <unlink>
    nfiles--;
    486b:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    486f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    4873:	0f 89 19 ff ff ff    	jns    4792 <fsfull+0x1c2>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    4879:	c7 44 24 04 21 6a 00 	movl   $0x6a21,0x4(%esp)
    4880:	00 
    4881:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4888:	e8 28 05 00 00       	call   4db5 <printf>
}
    488d:	83 c4 74             	add    $0x74,%esp
    4890:	5b                   	pop    %ebx
    4891:	5d                   	pop    %ebp
    4892:	c3                   	ret    

00004893 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    4893:	55                   	push   %ebp
    4894:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    4896:	a1 d4 6a 00 00       	mov    0x6ad4,%eax
    489b:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    48a1:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    48a6:	a3 d4 6a 00 00       	mov    %eax,0x6ad4
  return randstate;
    48ab:	a1 d4 6a 00 00       	mov    0x6ad4,%eax
}
    48b0:	5d                   	pop    %ebp
    48b1:	c3                   	ret    

000048b2 <main>:

int
main(int argc, char *argv[])
{
    48b2:	55                   	push   %ebp
    48b3:	89 e5                	mov    %esp,%ebp
    48b5:	83 e4 f0             	and    $0xfffffff0,%esp
    48b8:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    48bb:	c7 44 24 04 37 6a 00 	movl   $0x6a37,0x4(%esp)
    48c2:	00 
    48c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    48ca:	e8 e6 04 00 00       	call   4db5 <printf>

  if(open("usertests.ran", 0) >= 0){
    48cf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    48d6:	00 
    48d7:	c7 04 24 4b 6a 00 00 	movl   $0x6a4b,(%esp)
    48de:	e8 79 03 00 00       	call   4c5c <open>
    48e3:	85 c0                	test   %eax,%eax
    48e5:	78 19                	js     4900 <main+0x4e>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    48e7:	c7 44 24 04 5c 6a 00 	movl   $0x6a5c,0x4(%esp)
    48ee:	00 
    48ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    48f6:	e8 ba 04 00 00       	call   4db5 <printf>
    exit();
    48fb:	e8 1c 03 00 00       	call   4c1c <exit>
  }
  close(open("usertests.ran", O_CREATE));
    4900:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    4907:	00 
    4908:	c7 04 24 4b 6a 00 00 	movl   $0x6a4b,(%esp)
    490f:	e8 48 03 00 00       	call   4c5c <open>
    4914:	89 04 24             	mov    %eax,(%esp)
    4917:	e8 28 03 00 00       	call   4c44 <close>

  bigargtest();
    491c:	e8 86 fb ff ff       	call   44a7 <bigargtest>
  bigwrite();
    4921:	e8 f1 ea ff ff       	call   3417 <bigwrite>
  bigargtest();
    4926:	e8 7c fb ff ff       	call   44a7 <bigargtest>
  bsstest();
    492b:	e8 06 fb ff ff       	call   4436 <bsstest>
  sbrktest();
    4930:	e8 1c f5 ff ff       	call   3e51 <sbrktest>
  validatetest();
    4935:	e8 2f fa ff ff       	call   4369 <validatetest>

  opentest();
    493a:	e8 c1 c6 ff ff       	call   1000 <opentest>
  writetest();
    493f:	e8 67 c7 ff ff       	call   10ab <writetest>
  writetest1();
    4944:	e8 77 c9 ff ff       	call   12c0 <writetest1>
  createtest();
    4949:	e8 7b cb ff ff       	call   14c9 <createtest>

  mem();
    494e:	e8 19 d1 ff ff       	call   1a6c <mem>
  pipe1();
    4953:	e8 52 cd ff ff       	call   16aa <pipe1>
  preempt();
    4958:	e8 38 cf ff ff       	call   1895 <preempt>
  exitwait();
    495d:	e8 8c d0 ff ff       	call   19ee <exitwait>

  rmdot();
    4962:	e8 39 ef ff ff       	call   38a0 <rmdot>
  fourteen();
    4967:	e8 de ed ff ff       	call   374a <fourteen>
  bigfile();
    496c:	e8 ae eb ff ff       	call   351f <bigfile>
  subdir();
    4971:	e8 5b e3 ff ff       	call   2cd1 <subdir>
  concreate();
    4976:	e8 06 dd ff ff       	call   2681 <concreate>
  linkunlink();
    497b:	e8 b0 e0 ff ff       	call   2a30 <linkunlink>
  linktest();
    4980:	e8 b3 da ff ff       	call   2438 <linktest>
  unlinkread();
    4985:	e8 d9 d8 ff ff       	call   2263 <unlinkread>
  createdelete();
    498a:	e8 22 d6 ff ff       	call   1fb1 <createdelete>
  twofiles();
    498f:	e8 b6 d3 ff ff       	call   1d4a <twofiles>
  sharedfd();
    4994:	e8 b8 d1 ff ff       	call   1b51 <sharedfd>
  dirfile();
    4999:	e8 7a f0 ff ff       	call   3a18 <dirfile>
  iref();
    499e:	e8 b7 f2 ff ff       	call   3c5a <iref>
  forktest();
    49a3:	e8 d6 f3 ff ff       	call   3d7e <forktest>
  bigdir(); // slow
    49a8:	e8 af e1 ff ff       	call   2b5c <bigdir>

  exectest();
    49ad:	e8 a9 cc ff ff       	call   165b <exectest>

  exit();
    49b2:	e8 65 02 00 00       	call   4c1c <exit>
    49b7:	90                   	nop

000049b8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    49b8:	55                   	push   %ebp
    49b9:	89 e5                	mov    %esp,%ebp
    49bb:	57                   	push   %edi
    49bc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    49bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    49c0:	8b 55 10             	mov    0x10(%ebp),%edx
    49c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    49c6:	89 cb                	mov    %ecx,%ebx
    49c8:	89 df                	mov    %ebx,%edi
    49ca:	89 d1                	mov    %edx,%ecx
    49cc:	fc                   	cld    
    49cd:	f3 aa                	rep stos %al,%es:(%edi)
    49cf:	89 ca                	mov    %ecx,%edx
    49d1:	89 fb                	mov    %edi,%ebx
    49d3:	89 5d 08             	mov    %ebx,0x8(%ebp)
    49d6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    49d9:	5b                   	pop    %ebx
    49da:	5f                   	pop    %edi
    49db:	5d                   	pop    %ebp
    49dc:	c3                   	ret    

000049dd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    49dd:	55                   	push   %ebp
    49de:	89 e5                	mov    %esp,%ebp
    49e0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    49e3:	8b 45 08             	mov    0x8(%ebp),%eax
    49e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    49e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    49ec:	0f b6 10             	movzbl (%eax),%edx
    49ef:	8b 45 08             	mov    0x8(%ebp),%eax
    49f2:	88 10                	mov    %dl,(%eax)
    49f4:	8b 45 08             	mov    0x8(%ebp),%eax
    49f7:	0f b6 00             	movzbl (%eax),%eax
    49fa:	84 c0                	test   %al,%al
    49fc:	0f 95 c0             	setne  %al
    49ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4a03:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    4a07:	84 c0                	test   %al,%al
    4a09:	75 de                	jne    49e9 <strcpy+0xc>
    ;
  return os;
    4a0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4a0e:	c9                   	leave  
    4a0f:	c3                   	ret    

00004a10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    4a10:	55                   	push   %ebp
    4a11:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    4a13:	eb 08                	jmp    4a1d <strcmp+0xd>
    p++, q++;
    4a15:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4a19:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    4a1d:	8b 45 08             	mov    0x8(%ebp),%eax
    4a20:	0f b6 00             	movzbl (%eax),%eax
    4a23:	84 c0                	test   %al,%al
    4a25:	74 10                	je     4a37 <strcmp+0x27>
    4a27:	8b 45 08             	mov    0x8(%ebp),%eax
    4a2a:	0f b6 10             	movzbl (%eax),%edx
    4a2d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a30:	0f b6 00             	movzbl (%eax),%eax
    4a33:	38 c2                	cmp    %al,%dl
    4a35:	74 de                	je     4a15 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    4a37:	8b 45 08             	mov    0x8(%ebp),%eax
    4a3a:	0f b6 00             	movzbl (%eax),%eax
    4a3d:	0f b6 d0             	movzbl %al,%edx
    4a40:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a43:	0f b6 00             	movzbl (%eax),%eax
    4a46:	0f b6 c0             	movzbl %al,%eax
    4a49:	89 d1                	mov    %edx,%ecx
    4a4b:	29 c1                	sub    %eax,%ecx
    4a4d:	89 c8                	mov    %ecx,%eax
}
    4a4f:	5d                   	pop    %ebp
    4a50:	c3                   	ret    

00004a51 <strlen>:

uint
strlen(char *s)
{
    4a51:	55                   	push   %ebp
    4a52:	89 e5                	mov    %esp,%ebp
    4a54:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    4a57:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    4a5e:	eb 04                	jmp    4a64 <strlen+0x13>
    4a60:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    4a64:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4a67:	03 45 08             	add    0x8(%ebp),%eax
    4a6a:	0f b6 00             	movzbl (%eax),%eax
    4a6d:	84 c0                	test   %al,%al
    4a6f:	75 ef                	jne    4a60 <strlen+0xf>
    ;
  return n;
    4a71:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4a74:	c9                   	leave  
    4a75:	c3                   	ret    

00004a76 <memset>:

void*
memset(void *dst, int c, uint n)
{
    4a76:	55                   	push   %ebp
    4a77:	89 e5                	mov    %esp,%ebp
    4a79:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    4a7c:	8b 45 10             	mov    0x10(%ebp),%eax
    4a7f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a83:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a86:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a8a:	8b 45 08             	mov    0x8(%ebp),%eax
    4a8d:	89 04 24             	mov    %eax,(%esp)
    4a90:	e8 23 ff ff ff       	call   49b8 <stosb>
  return dst;
    4a95:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4a98:	c9                   	leave  
    4a99:	c3                   	ret    

00004a9a <strchr>:

char*
strchr(const char *s, char c)
{
    4a9a:	55                   	push   %ebp
    4a9b:	89 e5                	mov    %esp,%ebp
    4a9d:	83 ec 04             	sub    $0x4,%esp
    4aa0:	8b 45 0c             	mov    0xc(%ebp),%eax
    4aa3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    4aa6:	eb 14                	jmp    4abc <strchr+0x22>
    if(*s == c)
    4aa8:	8b 45 08             	mov    0x8(%ebp),%eax
    4aab:	0f b6 00             	movzbl (%eax),%eax
    4aae:	3a 45 fc             	cmp    -0x4(%ebp),%al
    4ab1:	75 05                	jne    4ab8 <strchr+0x1e>
      return (char*)s;
    4ab3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ab6:	eb 13                	jmp    4acb <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    4ab8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    4abc:	8b 45 08             	mov    0x8(%ebp),%eax
    4abf:	0f b6 00             	movzbl (%eax),%eax
    4ac2:	84 c0                	test   %al,%al
    4ac4:	75 e2                	jne    4aa8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    4ac6:	b8 00 00 00 00       	mov    $0x0,%eax
}
    4acb:	c9                   	leave  
    4acc:	c3                   	ret    

00004acd <gets>:

char*
gets(char *buf, int max)
{
    4acd:	55                   	push   %ebp
    4ace:	89 e5                	mov    %esp,%ebp
    4ad0:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4ad3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4ada:	eb 44                	jmp    4b20 <gets+0x53>
    cc = read(0, &c, 1);
    4adc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4ae3:	00 
    4ae4:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4ae7:	89 44 24 04          	mov    %eax,0x4(%esp)
    4aeb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4af2:	e8 3d 01 00 00       	call   4c34 <read>
    4af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    4afa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4afe:	7e 2d                	jle    4b2d <gets+0x60>
      break;
    buf[i++] = c;
    4b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b03:	03 45 08             	add    0x8(%ebp),%eax
    4b06:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    4b0a:	88 10                	mov    %dl,(%eax)
    4b0c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    4b10:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4b14:	3c 0a                	cmp    $0xa,%al
    4b16:	74 16                	je     4b2e <gets+0x61>
    4b18:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4b1c:	3c 0d                	cmp    $0xd,%al
    4b1e:	74 0e                	je     4b2e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4b20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b23:	83 c0 01             	add    $0x1,%eax
    4b26:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4b29:	7c b1                	jl     4adc <gets+0xf>
    4b2b:	eb 01                	jmp    4b2e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    4b2d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4b2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b31:	03 45 08             	add    0x8(%ebp),%eax
    4b34:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4b37:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4b3a:	c9                   	leave  
    4b3b:	c3                   	ret    

00004b3c <stat>:

int
stat(char *n, struct stat *st)
{
    4b3c:	55                   	push   %ebp
    4b3d:	89 e5                	mov    %esp,%ebp
    4b3f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4b42:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4b49:	00 
    4b4a:	8b 45 08             	mov    0x8(%ebp),%eax
    4b4d:	89 04 24             	mov    %eax,(%esp)
    4b50:	e8 07 01 00 00       	call   4c5c <open>
    4b55:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    4b58:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4b5c:	79 07                	jns    4b65 <stat+0x29>
    return -1;
    4b5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b63:	eb 23                	jmp    4b88 <stat+0x4c>
  r = fstat(fd, st);
    4b65:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b68:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b6f:	89 04 24             	mov    %eax,(%esp)
    4b72:	e8 fd 00 00 00       	call   4c74 <fstat>
    4b77:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    4b7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b7d:	89 04 24             	mov    %eax,(%esp)
    4b80:	e8 bf 00 00 00       	call   4c44 <close>
  return r;
    4b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4b88:	c9                   	leave  
    4b89:	c3                   	ret    

00004b8a <atoi>:

int
atoi(const char *s)
{
    4b8a:	55                   	push   %ebp
    4b8b:	89 e5                	mov    %esp,%ebp
    4b8d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    4b90:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    4b97:	eb 24                	jmp    4bbd <atoi+0x33>
    n = n*10 + *s++ - '0';
    4b99:	8b 55 fc             	mov    -0x4(%ebp),%edx
    4b9c:	89 d0                	mov    %edx,%eax
    4b9e:	c1 e0 02             	shl    $0x2,%eax
    4ba1:	01 d0                	add    %edx,%eax
    4ba3:	01 c0                	add    %eax,%eax
    4ba5:	89 c2                	mov    %eax,%edx
    4ba7:	8b 45 08             	mov    0x8(%ebp),%eax
    4baa:	0f b6 00             	movzbl (%eax),%eax
    4bad:	0f be c0             	movsbl %al,%eax
    4bb0:	8d 04 02             	lea    (%edx,%eax,1),%eax
    4bb3:	83 e8 30             	sub    $0x30,%eax
    4bb6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4bb9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    4bbd:	8b 45 08             	mov    0x8(%ebp),%eax
    4bc0:	0f b6 00             	movzbl (%eax),%eax
    4bc3:	3c 2f                	cmp    $0x2f,%al
    4bc5:	7e 0a                	jle    4bd1 <atoi+0x47>
    4bc7:	8b 45 08             	mov    0x8(%ebp),%eax
    4bca:	0f b6 00             	movzbl (%eax),%eax
    4bcd:	3c 39                	cmp    $0x39,%al
    4bcf:	7e c8                	jle    4b99 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4bd1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4bd4:	c9                   	leave  
    4bd5:	c3                   	ret    

00004bd6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    4bd6:	55                   	push   %ebp
    4bd7:	89 e5                	mov    %esp,%ebp
    4bd9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4bdc:	8b 45 08             	mov    0x8(%ebp),%eax
    4bdf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    4be2:	8b 45 0c             	mov    0xc(%ebp),%eax
    4be5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    4be8:	eb 13                	jmp    4bfd <memmove+0x27>
    *dst++ = *src++;
    4bea:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4bed:	0f b6 10             	movzbl (%eax),%edx
    4bf0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4bf3:	88 10                	mov    %dl,(%eax)
    4bf5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4bf9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4bfd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    4c01:	0f 9f c0             	setg   %al
    4c04:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    4c08:	84 c0                	test   %al,%al
    4c0a:	75 de                	jne    4bea <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4c0c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4c0f:	c9                   	leave  
    4c10:	c3                   	ret    
    4c11:	90                   	nop
    4c12:	90                   	nop
    4c13:	90                   	nop

00004c14 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4c14:	b8 01 00 00 00       	mov    $0x1,%eax
    4c19:	cd 40                	int    $0x40
    4c1b:	c3                   	ret    

00004c1c <exit>:
SYSCALL(exit)
    4c1c:	b8 02 00 00 00       	mov    $0x2,%eax
    4c21:	cd 40                	int    $0x40
    4c23:	c3                   	ret    

00004c24 <wait>:
SYSCALL(wait)
    4c24:	b8 03 00 00 00       	mov    $0x3,%eax
    4c29:	cd 40                	int    $0x40
    4c2b:	c3                   	ret    

00004c2c <pipe>:
SYSCALL(pipe)
    4c2c:	b8 04 00 00 00       	mov    $0x4,%eax
    4c31:	cd 40                	int    $0x40
    4c33:	c3                   	ret    

00004c34 <read>:
SYSCALL(read)
    4c34:	b8 05 00 00 00       	mov    $0x5,%eax
    4c39:	cd 40                	int    $0x40
    4c3b:	c3                   	ret    

00004c3c <write>:
SYSCALL(write)
    4c3c:	b8 10 00 00 00       	mov    $0x10,%eax
    4c41:	cd 40                	int    $0x40
    4c43:	c3                   	ret    

00004c44 <close>:
SYSCALL(close)
    4c44:	b8 15 00 00 00       	mov    $0x15,%eax
    4c49:	cd 40                	int    $0x40
    4c4b:	c3                   	ret    

00004c4c <kill>:
SYSCALL(kill)
    4c4c:	b8 06 00 00 00       	mov    $0x6,%eax
    4c51:	cd 40                	int    $0x40
    4c53:	c3                   	ret    

00004c54 <exec>:
SYSCALL(exec)
    4c54:	b8 07 00 00 00       	mov    $0x7,%eax
    4c59:	cd 40                	int    $0x40
    4c5b:	c3                   	ret    

00004c5c <open>:
SYSCALL(open)
    4c5c:	b8 0f 00 00 00       	mov    $0xf,%eax
    4c61:	cd 40                	int    $0x40
    4c63:	c3                   	ret    

00004c64 <mknod>:
SYSCALL(mknod)
    4c64:	b8 11 00 00 00       	mov    $0x11,%eax
    4c69:	cd 40                	int    $0x40
    4c6b:	c3                   	ret    

00004c6c <unlink>:
SYSCALL(unlink)
    4c6c:	b8 12 00 00 00       	mov    $0x12,%eax
    4c71:	cd 40                	int    $0x40
    4c73:	c3                   	ret    

00004c74 <fstat>:
SYSCALL(fstat)
    4c74:	b8 08 00 00 00       	mov    $0x8,%eax
    4c79:	cd 40                	int    $0x40
    4c7b:	c3                   	ret    

00004c7c <link>:
SYSCALL(link)
    4c7c:	b8 13 00 00 00       	mov    $0x13,%eax
    4c81:	cd 40                	int    $0x40
    4c83:	c3                   	ret    

00004c84 <mkdir>:
SYSCALL(mkdir)
    4c84:	b8 14 00 00 00       	mov    $0x14,%eax
    4c89:	cd 40                	int    $0x40
    4c8b:	c3                   	ret    

00004c8c <chdir>:
SYSCALL(chdir)
    4c8c:	b8 09 00 00 00       	mov    $0x9,%eax
    4c91:	cd 40                	int    $0x40
    4c93:	c3                   	ret    

00004c94 <dup>:
SYSCALL(dup)
    4c94:	b8 0a 00 00 00       	mov    $0xa,%eax
    4c99:	cd 40                	int    $0x40
    4c9b:	c3                   	ret    

00004c9c <getpid>:
SYSCALL(getpid)
    4c9c:	b8 0b 00 00 00       	mov    $0xb,%eax
    4ca1:	cd 40                	int    $0x40
    4ca3:	c3                   	ret    

00004ca4 <sbrk>:
SYSCALL(sbrk)
    4ca4:	b8 0c 00 00 00       	mov    $0xc,%eax
    4ca9:	cd 40                	int    $0x40
    4cab:	c3                   	ret    

00004cac <sleep>:
SYSCALL(sleep)
    4cac:	b8 0d 00 00 00       	mov    $0xd,%eax
    4cb1:	cd 40                	int    $0x40
    4cb3:	c3                   	ret    

00004cb4 <uptime>:
SYSCALL(uptime)
    4cb4:	b8 0e 00 00 00       	mov    $0xe,%eax
    4cb9:	cd 40                	int    $0x40
    4cbb:	c3                   	ret    

00004cbc <clone>:
SYSCALL(clone)
    4cbc:	b8 16 00 00 00       	mov    $0x16,%eax
    4cc1:	cd 40                	int    $0x40
    4cc3:	c3                   	ret    

00004cc4 <texit>:
SYSCALL(texit)
    4cc4:	b8 17 00 00 00       	mov    $0x17,%eax
    4cc9:	cd 40                	int    $0x40
    4ccb:	c3                   	ret    

00004ccc <tsleep>:
SYSCALL(tsleep)
    4ccc:	b8 18 00 00 00       	mov    $0x18,%eax
    4cd1:	cd 40                	int    $0x40
    4cd3:	c3                   	ret    

00004cd4 <twakeup>:
SYSCALL(twakeup)
    4cd4:	b8 19 00 00 00       	mov    $0x19,%eax
    4cd9:	cd 40                	int    $0x40
    4cdb:	c3                   	ret    

00004cdc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4cdc:	55                   	push   %ebp
    4cdd:	89 e5                	mov    %esp,%ebp
    4cdf:	83 ec 28             	sub    $0x28,%esp
    4ce2:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ce5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    4ce8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4cef:	00 
    4cf0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4cf3:	89 44 24 04          	mov    %eax,0x4(%esp)
    4cf7:	8b 45 08             	mov    0x8(%ebp),%eax
    4cfa:	89 04 24             	mov    %eax,(%esp)
    4cfd:	e8 3a ff ff ff       	call   4c3c <write>
}
    4d02:	c9                   	leave  
    4d03:	c3                   	ret    

00004d04 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4d04:	55                   	push   %ebp
    4d05:	89 e5                	mov    %esp,%ebp
    4d07:	53                   	push   %ebx
    4d08:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    4d0b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    4d12:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4d16:	74 17                	je     4d2f <printint+0x2b>
    4d18:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4d1c:	79 11                	jns    4d2f <printint+0x2b>
    neg = 1;
    4d1e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4d25:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d28:	f7 d8                	neg    %eax
    4d2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4d2d:	eb 06                	jmp    4d35 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    4d2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d32:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    4d35:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    4d3c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    4d3f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    4d42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d45:	ba 00 00 00 00       	mov    $0x0,%edx
    4d4a:	f7 f3                	div    %ebx
    4d4c:	89 d0                	mov    %edx,%eax
    4d4e:	0f b6 80 d8 6a 00 00 	movzbl 0x6ad8(%eax),%eax
    4d55:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    4d59:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    4d5d:	8b 45 10             	mov    0x10(%ebp),%eax
    4d60:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    4d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d66:	ba 00 00 00 00       	mov    $0x0,%edx
    4d6b:	f7 75 d4             	divl   -0x2c(%ebp)
    4d6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4d71:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4d75:	75 c5                	jne    4d3c <printint+0x38>
  if(neg)
    4d77:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4d7b:	74 28                	je     4da5 <printint+0xa1>
    buf[i++] = '-';
    4d7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4d80:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    4d85:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    4d89:	eb 1a                	jmp    4da5 <printint+0xa1>
    putc(fd, buf[i]);
    4d8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4d8e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    4d93:	0f be c0             	movsbl %al,%eax
    4d96:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d9a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9d:	89 04 24             	mov    %eax,(%esp)
    4da0:	e8 37 ff ff ff       	call   4cdc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    4da5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    4da9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4dad:	79 dc                	jns    4d8b <printint+0x87>
    putc(fd, buf[i]);
}
    4daf:	83 c4 44             	add    $0x44,%esp
    4db2:	5b                   	pop    %ebx
    4db3:	5d                   	pop    %ebp
    4db4:	c3                   	ret    

00004db5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4db5:	55                   	push   %ebp
    4db6:	89 e5                	mov    %esp,%ebp
    4db8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    4dbb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4dc2:	8d 45 0c             	lea    0xc(%ebp),%eax
    4dc5:	83 c0 04             	add    $0x4,%eax
    4dc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    4dcb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    4dd2:	e9 7e 01 00 00       	jmp    4f55 <printf+0x1a0>
    c = fmt[i] & 0xff;
    4dd7:	8b 55 0c             	mov    0xc(%ebp),%edx
    4dda:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4ddd:	8d 04 02             	lea    (%edx,%eax,1),%eax
    4de0:	0f b6 00             	movzbl (%eax),%eax
    4de3:	0f be c0             	movsbl %al,%eax
    4de6:	25 ff 00 00 00       	and    $0xff,%eax
    4deb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    4dee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4df2:	75 2c                	jne    4e20 <printf+0x6b>
      if(c == '%'){
    4df4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    4df8:	75 0c                	jne    4e06 <printf+0x51>
        state = '%';
    4dfa:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    4e01:	e9 4b 01 00 00       	jmp    4f51 <printf+0x19c>
      } else {
        putc(fd, c);
    4e06:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e09:	0f be c0             	movsbl %al,%eax
    4e0c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e10:	8b 45 08             	mov    0x8(%ebp),%eax
    4e13:	89 04 24             	mov    %eax,(%esp)
    4e16:	e8 c1 fe ff ff       	call   4cdc <putc>
    4e1b:	e9 31 01 00 00       	jmp    4f51 <printf+0x19c>
      }
    } else if(state == '%'){
    4e20:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    4e24:	0f 85 27 01 00 00    	jne    4f51 <printf+0x19c>
      if(c == 'd'){
    4e2a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    4e2e:	75 2d                	jne    4e5d <printf+0xa8>
        printint(fd, *ap, 10, 1);
    4e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e33:	8b 00                	mov    (%eax),%eax
    4e35:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4e3c:	00 
    4e3d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    4e44:	00 
    4e45:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e49:	8b 45 08             	mov    0x8(%ebp),%eax
    4e4c:	89 04 24             	mov    %eax,(%esp)
    4e4f:	e8 b0 fe ff ff       	call   4d04 <printint>
        ap++;
    4e54:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    4e58:	e9 ed 00 00 00       	jmp    4f4a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    4e5d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    4e61:	74 06                	je     4e69 <printf+0xb4>
    4e63:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    4e67:	75 2d                	jne    4e96 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    4e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e6c:	8b 00                	mov    (%eax),%eax
    4e6e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4e75:	00 
    4e76:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    4e7d:	00 
    4e7e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4e82:	8b 45 08             	mov    0x8(%ebp),%eax
    4e85:	89 04 24             	mov    %eax,(%esp)
    4e88:	e8 77 fe ff ff       	call   4d04 <printint>
        ap++;
    4e8d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    4e91:	e9 b4 00 00 00       	jmp    4f4a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    4e96:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    4e9a:	75 46                	jne    4ee2 <printf+0x12d>
        s = (char*)*ap;
    4e9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4e9f:	8b 00                	mov    (%eax),%eax
    4ea1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    4ea4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    4ea8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    4eac:	75 27                	jne    4ed5 <printf+0x120>
          s = "(null)";
    4eae:	c7 45 e4 86 6a 00 00 	movl   $0x6a86,-0x1c(%ebp)
        while(*s != 0){
    4eb5:	eb 1f                	jmp    4ed6 <printf+0x121>
          putc(fd, *s);
    4eb7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4eba:	0f b6 00             	movzbl (%eax),%eax
    4ebd:	0f be c0             	movsbl %al,%eax
    4ec0:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ec4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ec7:	89 04 24             	mov    %eax,(%esp)
    4eca:	e8 0d fe ff ff       	call   4cdc <putc>
          s++;
    4ecf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    4ed3:	eb 01                	jmp    4ed6 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4ed5:	90                   	nop
    4ed6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4ed9:	0f b6 00             	movzbl (%eax),%eax
    4edc:	84 c0                	test   %al,%al
    4ede:	75 d7                	jne    4eb7 <printf+0x102>
    4ee0:	eb 68                	jmp    4f4a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    4ee2:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    4ee6:	75 1d                	jne    4f05 <printf+0x150>
        putc(fd, *ap);
    4ee8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4eeb:	8b 00                	mov    (%eax),%eax
    4eed:	0f be c0             	movsbl %al,%eax
    4ef0:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef7:	89 04 24             	mov    %eax,(%esp)
    4efa:	e8 dd fd ff ff       	call   4cdc <putc>
        ap++;
    4eff:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    4f03:	eb 45                	jmp    4f4a <printf+0x195>
      } else if(c == '%'){
    4f05:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    4f09:	75 17                	jne    4f22 <printf+0x16d>
        putc(fd, c);
    4f0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f0e:	0f be c0             	movsbl %al,%eax
    4f11:	89 44 24 04          	mov    %eax,0x4(%esp)
    4f15:	8b 45 08             	mov    0x8(%ebp),%eax
    4f18:	89 04 24             	mov    %eax,(%esp)
    4f1b:	e8 bc fd ff ff       	call   4cdc <putc>
    4f20:	eb 28                	jmp    4f4a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4f22:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    4f29:	00 
    4f2a:	8b 45 08             	mov    0x8(%ebp),%eax
    4f2d:	89 04 24             	mov    %eax,(%esp)
    4f30:	e8 a7 fd ff ff       	call   4cdc <putc>
        putc(fd, c);
    4f35:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4f38:	0f be c0             	movsbl %al,%eax
    4f3b:	89 44 24 04          	mov    %eax,0x4(%esp)
    4f3f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f42:	89 04 24             	mov    %eax,(%esp)
    4f45:	e8 92 fd ff ff       	call   4cdc <putc>
      }
      state = 0;
    4f4a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4f51:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4f55:	8b 55 0c             	mov    0xc(%ebp),%edx
    4f58:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4f5b:	8d 04 02             	lea    (%edx,%eax,1),%eax
    4f5e:	0f b6 00             	movzbl (%eax),%eax
    4f61:	84 c0                	test   %al,%al
    4f63:	0f 85 6e fe ff ff    	jne    4dd7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4f69:	c9                   	leave  
    4f6a:	c3                   	ret    
    4f6b:	90                   	nop

00004f6c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4f6c:	55                   	push   %ebp
    4f6d:	89 e5                	mov    %esp,%ebp
    4f6f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4f72:	8b 45 08             	mov    0x8(%ebp),%eax
    4f75:	83 e8 08             	sub    $0x8,%eax
    4f78:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4f7b:	a1 88 6b 00 00       	mov    0x6b88,%eax
    4f80:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4f83:	eb 24                	jmp    4fa9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4f85:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f88:	8b 00                	mov    (%eax),%eax
    4f8a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4f8d:	77 12                	ja     4fa1 <free+0x35>
    4f8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4f92:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4f95:	77 24                	ja     4fbb <free+0x4f>
    4f97:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4f9a:	8b 00                	mov    (%eax),%eax
    4f9c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4f9f:	77 1a                	ja     4fbb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4fa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fa4:	8b 00                	mov    (%eax),%eax
    4fa6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4fa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4fac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4faf:	76 d4                	jbe    4f85 <free+0x19>
    4fb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fb4:	8b 00                	mov    (%eax),%eax
    4fb6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4fb9:	76 ca                	jbe    4f85 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4fbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4fbe:	8b 40 04             	mov    0x4(%eax),%eax
    4fc1:	c1 e0 03             	shl    $0x3,%eax
    4fc4:	89 c2                	mov    %eax,%edx
    4fc6:	03 55 f8             	add    -0x8(%ebp),%edx
    4fc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fcc:	8b 00                	mov    (%eax),%eax
    4fce:	39 c2                	cmp    %eax,%edx
    4fd0:	75 24                	jne    4ff6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    4fd2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4fd5:	8b 50 04             	mov    0x4(%eax),%edx
    4fd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4fdb:	8b 00                	mov    (%eax),%eax
    4fdd:	8b 40 04             	mov    0x4(%eax),%eax
    4fe0:	01 c2                	add    %eax,%edx
    4fe2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4fe5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4fe8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4feb:	8b 00                	mov    (%eax),%eax
    4fed:	8b 10                	mov    (%eax),%edx
    4fef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4ff2:	89 10                	mov    %edx,(%eax)
    4ff4:	eb 0a                	jmp    5000 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    4ff6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4ff9:	8b 10                	mov    (%eax),%edx
    4ffb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4ffe:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    5000:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5003:	8b 40 04             	mov    0x4(%eax),%eax
    5006:	c1 e0 03             	shl    $0x3,%eax
    5009:	03 45 fc             	add    -0x4(%ebp),%eax
    500c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    500f:	75 20                	jne    5031 <free+0xc5>
    p->s.size += bp->s.size;
    5011:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5014:	8b 50 04             	mov    0x4(%eax),%edx
    5017:	8b 45 f8             	mov    -0x8(%ebp),%eax
    501a:	8b 40 04             	mov    0x4(%eax),%eax
    501d:	01 c2                	add    %eax,%edx
    501f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5022:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    5025:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5028:	8b 10                	mov    (%eax),%edx
    502a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    502d:	89 10                	mov    %edx,(%eax)
    502f:	eb 08                	jmp    5039 <free+0xcd>
  } else
    p->s.ptr = bp;
    5031:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5034:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5037:	89 10                	mov    %edx,(%eax)
  freep = p;
    5039:	8b 45 fc             	mov    -0x4(%ebp),%eax
    503c:	a3 88 6b 00 00       	mov    %eax,0x6b88
}
    5041:	c9                   	leave  
    5042:	c3                   	ret    

00005043 <morecore>:

static Header*
morecore(uint nu)
{
    5043:	55                   	push   %ebp
    5044:	89 e5                	mov    %esp,%ebp
    5046:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    5049:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    5050:	77 07                	ja     5059 <morecore+0x16>
    nu = 4096;
    5052:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    5059:	8b 45 08             	mov    0x8(%ebp),%eax
    505c:	c1 e0 03             	shl    $0x3,%eax
    505f:	89 04 24             	mov    %eax,(%esp)
    5062:	e8 3d fc ff ff       	call   4ca4 <sbrk>
    5067:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    506a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    506e:	75 07                	jne    5077 <morecore+0x34>
    return 0;
    5070:	b8 00 00 00 00       	mov    $0x0,%eax
    5075:	eb 22                	jmp    5099 <morecore+0x56>
  hp = (Header*)p;
    5077:	8b 45 f0             	mov    -0x10(%ebp),%eax
    507a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    507d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5080:	8b 55 08             	mov    0x8(%ebp),%edx
    5083:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    5086:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5089:	83 c0 08             	add    $0x8,%eax
    508c:	89 04 24             	mov    %eax,(%esp)
    508f:	e8 d8 fe ff ff       	call   4f6c <free>
  return freep;
    5094:	a1 88 6b 00 00       	mov    0x6b88,%eax
}
    5099:	c9                   	leave  
    509a:	c3                   	ret    

0000509b <malloc>:

void*
malloc(uint nbytes)
{
    509b:	55                   	push   %ebp
    509c:	89 e5                	mov    %esp,%ebp
    509e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    50a1:	8b 45 08             	mov    0x8(%ebp),%eax
    50a4:	83 c0 07             	add    $0x7,%eax
    50a7:	c1 e8 03             	shr    $0x3,%eax
    50aa:	83 c0 01             	add    $0x1,%eax
    50ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    50b0:	a1 88 6b 00 00       	mov    0x6b88,%eax
    50b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    50b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    50bc:	75 23                	jne    50e1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    50be:	c7 45 f0 80 6b 00 00 	movl   $0x6b80,-0x10(%ebp)
    50c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    50c8:	a3 88 6b 00 00       	mov    %eax,0x6b88
    50cd:	a1 88 6b 00 00       	mov    0x6b88,%eax
    50d2:	a3 80 6b 00 00       	mov    %eax,0x6b80
    base.s.size = 0;
    50d7:	c7 05 84 6b 00 00 00 	movl   $0x0,0x6b84
    50de:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    50e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    50e4:	8b 00                	mov    (%eax),%eax
    50e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    50e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    50ec:	8b 40 04             	mov    0x4(%eax),%eax
    50ef:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    50f2:	72 4d                	jb     5141 <malloc+0xa6>
      if(p->s.size == nunits)
    50f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    50f7:	8b 40 04             	mov    0x4(%eax),%eax
    50fa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    50fd:	75 0c                	jne    510b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    50ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5102:	8b 10                	mov    (%eax),%edx
    5104:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5107:	89 10                	mov    %edx,(%eax)
    5109:	eb 26                	jmp    5131 <malloc+0x96>
      else {
        p->s.size -= nunits;
    510b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    510e:	8b 40 04             	mov    0x4(%eax),%eax
    5111:	89 c2                	mov    %eax,%edx
    5113:	2b 55 f4             	sub    -0xc(%ebp),%edx
    5116:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5119:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    511c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    511f:	8b 40 04             	mov    0x4(%eax),%eax
    5122:	c1 e0 03             	shl    $0x3,%eax
    5125:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    5128:	8b 45 ec             	mov    -0x14(%ebp),%eax
    512b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    512e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    5131:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5134:	a3 88 6b 00 00       	mov    %eax,0x6b88
      return (void*)(p + 1);
    5139:	8b 45 ec             	mov    -0x14(%ebp),%eax
    513c:	83 c0 08             	add    $0x8,%eax
    513f:	eb 38                	jmp    5179 <malloc+0xde>
    }
    if(p == freep)
    5141:	a1 88 6b 00 00       	mov    0x6b88,%eax
    5146:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    5149:	75 1b                	jne    5166 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    514b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    514e:	89 04 24             	mov    %eax,(%esp)
    5151:	e8 ed fe ff ff       	call   5043 <morecore>
    5156:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5159:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    515d:	75 07                	jne    5166 <malloc+0xcb>
        return 0;
    515f:	b8 00 00 00 00       	mov    $0x0,%eax
    5164:	eb 13                	jmp    5179 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    5166:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5169:	89 45 f0             	mov    %eax,-0x10(%ebp)
    516c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    516f:	8b 00                	mov    (%eax),%eax
    5171:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    5174:	e9 70 ff ff ff       	jmp    50e9 <malloc+0x4e>
}
    5179:	c9                   	leave  
    517a:	c3                   	ret    
    517b:	90                   	nop

0000517c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    517c:	55                   	push   %ebp
    517d:	89 e5                	mov    %esp,%ebp
    517f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    5182:	8b 55 08             	mov    0x8(%ebp),%edx
    5185:	8b 45 0c             	mov    0xc(%ebp),%eax
    5188:	8b 4d 08             	mov    0x8(%ebp),%ecx
    518b:	f0 87 02             	lock xchg %eax,(%edx)
    518e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    5191:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    5194:	c9                   	leave  
    5195:	c3                   	ret    

00005196 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    5196:	55                   	push   %ebp
    5197:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    5199:	8b 45 08             	mov    0x8(%ebp),%eax
    519c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    51a2:	5d                   	pop    %ebp
    51a3:	c3                   	ret    

000051a4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    51a4:	55                   	push   %ebp
    51a5:	89 e5                	mov    %esp,%ebp
    51a7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    51aa:	8b 45 08             	mov    0x8(%ebp),%eax
    51ad:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    51b4:	00 
    51b5:	89 04 24             	mov    %eax,(%esp)
    51b8:	e8 bf ff ff ff       	call   517c <xchg>
    51bd:	85 c0                	test   %eax,%eax
    51bf:	75 e9                	jne    51aa <lock_acquire+0x6>
}
    51c1:	c9                   	leave  
    51c2:	c3                   	ret    

000051c3 <lock_release>:
void lock_release(lock_t *lock){
    51c3:	55                   	push   %ebp
    51c4:	89 e5                	mov    %esp,%ebp
    51c6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    51c9:	8b 45 08             	mov    0x8(%ebp),%eax
    51cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    51d3:	00 
    51d4:	89 04 24             	mov    %eax,(%esp)
    51d7:	e8 a0 ff ff ff       	call   517c <xchg>
}
    51dc:	c9                   	leave  
    51dd:	c3                   	ret    

000051de <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    51de:	55                   	push   %ebp
    51df:	89 e5                	mov    %esp,%ebp
    51e1:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    51e4:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    51eb:	e8 ab fe ff ff       	call   509b <malloc>
    51f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    51f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    51f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    51fc:	25 ff 0f 00 00       	and    $0xfff,%eax
    5201:	85 c0                	test   %eax,%eax
    5203:	74 15                	je     521a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    5205:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5208:	89 c2                	mov    %eax,%edx
    520a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    5210:	b8 00 10 00 00       	mov    $0x1000,%eax
    5215:	29 d0                	sub    %edx,%eax
    5217:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    521a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    521e:	75 1b                	jne    523b <thread_create+0x5d>

        printf(1,"malloc fail \n");
    5220:	c7 44 24 04 8d 6a 00 	movl   $0x6a8d,0x4(%esp)
    5227:	00 
    5228:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    522f:	e8 81 fb ff ff       	call   4db5 <printf>
        return 0;
    5234:	b8 00 00 00 00       	mov    $0x0,%eax
    5239:	eb 6f                	jmp    52aa <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    523b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    523e:	8b 55 08             	mov    0x8(%ebp),%edx
    5241:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5244:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    5248:	89 54 24 08          	mov    %edx,0x8(%esp)
    524c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    5253:	00 
    5254:	89 04 24             	mov    %eax,(%esp)
    5257:	e8 60 fa ff ff       	call   4cbc <clone>
    525c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    525f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5263:	79 1b                	jns    5280 <thread_create+0xa2>
        printf(1,"clone fails\n");
    5265:	c7 44 24 04 9b 6a 00 	movl   $0x6a9b,0x4(%esp)
    526c:	00 
    526d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5274:	e8 3c fb ff ff       	call   4db5 <printf>
        return 0;
    5279:	b8 00 00 00 00       	mov    $0x0,%eax
    527e:	eb 2a                	jmp    52aa <thread_create+0xcc>
    }
    if(tid > 0){
    5280:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5284:	7e 05                	jle    528b <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    5286:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5289:	eb 1f                	jmp    52aa <thread_create+0xcc>
    }
    if(tid == 0){
    528b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    528f:	75 14                	jne    52a5 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    5291:	c7 44 24 04 a8 6a 00 	movl   $0x6aa8,0x4(%esp)
    5298:	00 
    5299:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    52a0:	e8 10 fb ff ff       	call   4db5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    52a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    52aa:	c9                   	leave  
    52ab:	c3                   	ret    

000052ac <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    52ac:	55                   	push   %ebp
    52ad:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    52af:	8b 45 08             	mov    0x8(%ebp),%eax
    52b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    52b8:	8b 45 08             	mov    0x8(%ebp),%eax
    52bb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    52c2:	8b 45 08             	mov    0x8(%ebp),%eax
    52c5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    52cc:	5d                   	pop    %ebp
    52cd:	c3                   	ret    

000052ce <add_q>:

void add_q(struct queue *q, int v){
    52ce:	55                   	push   %ebp
    52cf:	89 e5                	mov    %esp,%ebp
    52d1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    52d4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    52db:	e8 bb fd ff ff       	call   509b <malloc>
    52e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    52e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52e6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    52ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52f0:	8b 55 0c             	mov    0xc(%ebp),%edx
    52f3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    52f5:	8b 45 08             	mov    0x8(%ebp),%eax
    52f8:	8b 40 04             	mov    0x4(%eax),%eax
    52fb:	85 c0                	test   %eax,%eax
    52fd:	75 0b                	jne    530a <add_q+0x3c>
        q->head = n;
    52ff:	8b 45 08             	mov    0x8(%ebp),%eax
    5302:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5305:	89 50 04             	mov    %edx,0x4(%eax)
    5308:	eb 0c                	jmp    5316 <add_q+0x48>
    }else{
        q->tail->next = n;
    530a:	8b 45 08             	mov    0x8(%ebp),%eax
    530d:	8b 40 08             	mov    0x8(%eax),%eax
    5310:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5313:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    5316:	8b 45 08             	mov    0x8(%ebp),%eax
    5319:	8b 55 f4             	mov    -0xc(%ebp),%edx
    531c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    531f:	8b 45 08             	mov    0x8(%ebp),%eax
    5322:	8b 00                	mov    (%eax),%eax
    5324:	8d 50 01             	lea    0x1(%eax),%edx
    5327:	8b 45 08             	mov    0x8(%ebp),%eax
    532a:	89 10                	mov    %edx,(%eax)
}
    532c:	c9                   	leave  
    532d:	c3                   	ret    

0000532e <empty_q>:

int empty_q(struct queue *q){
    532e:	55                   	push   %ebp
    532f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    5331:	8b 45 08             	mov    0x8(%ebp),%eax
    5334:	8b 00                	mov    (%eax),%eax
    5336:	85 c0                	test   %eax,%eax
    5338:	75 07                	jne    5341 <empty_q+0x13>
        return 1;
    533a:	b8 01 00 00 00       	mov    $0x1,%eax
    533f:	eb 05                	jmp    5346 <empty_q+0x18>
    else
        return 0;
    5341:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    5346:	5d                   	pop    %ebp
    5347:	c3                   	ret    

00005348 <pop_q>:
int pop_q(struct queue *q){
    5348:	55                   	push   %ebp
    5349:	89 e5                	mov    %esp,%ebp
    534b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    534e:	8b 45 08             	mov    0x8(%ebp),%eax
    5351:	89 04 24             	mov    %eax,(%esp)
    5354:	e8 d5 ff ff ff       	call   532e <empty_q>
    5359:	85 c0                	test   %eax,%eax
    535b:	75 5d                	jne    53ba <pop_q+0x72>
       val = q->head->value; 
    535d:	8b 45 08             	mov    0x8(%ebp),%eax
    5360:	8b 40 04             	mov    0x4(%eax),%eax
    5363:	8b 00                	mov    (%eax),%eax
    5365:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    5368:	8b 45 08             	mov    0x8(%ebp),%eax
    536b:	8b 40 04             	mov    0x4(%eax),%eax
    536e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    5371:	8b 45 08             	mov    0x8(%ebp),%eax
    5374:	8b 40 04             	mov    0x4(%eax),%eax
    5377:	8b 50 04             	mov    0x4(%eax),%edx
    537a:	8b 45 08             	mov    0x8(%ebp),%eax
    537d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    5380:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5383:	89 04 24             	mov    %eax,(%esp)
    5386:	e8 e1 fb ff ff       	call   4f6c <free>
       q->size--;
    538b:	8b 45 08             	mov    0x8(%ebp),%eax
    538e:	8b 00                	mov    (%eax),%eax
    5390:	8d 50 ff             	lea    -0x1(%eax),%edx
    5393:	8b 45 08             	mov    0x8(%ebp),%eax
    5396:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    5398:	8b 45 08             	mov    0x8(%ebp),%eax
    539b:	8b 00                	mov    (%eax),%eax
    539d:	85 c0                	test   %eax,%eax
    539f:	75 14                	jne    53b5 <pop_q+0x6d>
            q->head = 0;
    53a1:	8b 45 08             	mov    0x8(%ebp),%eax
    53a4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    53ab:	8b 45 08             	mov    0x8(%ebp),%eax
    53ae:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    53b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53b8:	eb 05                	jmp    53bf <pop_q+0x77>
    }
    return -1;
    53ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    53bf:	c9                   	leave  
    53c0:	c3                   	ret    
