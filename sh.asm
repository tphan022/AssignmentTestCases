
_sh:     file format elf32-i386


Disassembly of section .text:

00001000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1006:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    100a:	75 05                	jne    1011 <runcmd+0x11>
    exit();
    100c:	e8 4b 0f 00 00       	call   1f5c <exit>
  
  switch(cmd->type){
    1011:	8b 45 08             	mov    0x8(%ebp),%eax
    1014:	8b 00                	mov    (%eax),%eax
    1016:	83 f8 05             	cmp    $0x5,%eax
    1019:	77 09                	ja     1024 <runcmd+0x24>
    101b:	8b 04 85 30 27 00 00 	mov    0x2730(,%eax,4),%eax
    1022:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
    1024:	c7 04 24 04 27 00 00 	movl   $0x2704,(%esp)
    102b:	e8 29 03 00 00       	call   1359 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    1030:	8b 45 08             	mov    0x8(%ebp),%eax
    1033:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(ecmd->argv[0] == 0)
    1036:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1039:	8b 40 04             	mov    0x4(%eax),%eax
    103c:	85 c0                	test   %eax,%eax
    103e:	75 05                	jne    1045 <runcmd+0x45>
      exit();
    1040:	e8 17 0f 00 00       	call   1f5c <exit>
    exec(ecmd->argv[0], ecmd->argv);
    1045:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1048:	8d 50 04             	lea    0x4(%eax),%edx
    104b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    104e:	8b 40 04             	mov    0x4(%eax),%eax
    1051:	89 54 24 04          	mov    %edx,0x4(%esp)
    1055:	89 04 24             	mov    %eax,(%esp)
    1058:	e8 37 0f 00 00       	call   1f94 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    105d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1060:	8b 40 04             	mov    0x4(%eax),%eax
    1063:	89 44 24 08          	mov    %eax,0x8(%esp)
    1067:	c7 44 24 04 0b 27 00 	movl   $0x270b,0x4(%esp)
    106e:	00 
    106f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1076:	e8 7a 10 00 00       	call   20f5 <printf>
    break;
    107b:	e9 83 01 00 00       	jmp    1203 <runcmd+0x203>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    1080:	8b 45 08             	mov    0x8(%ebp),%eax
    1083:	89 45 f4             	mov    %eax,-0xc(%ebp)
    close(rcmd->fd);
    1086:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1089:	8b 40 14             	mov    0x14(%eax),%eax
    108c:	89 04 24             	mov    %eax,(%esp)
    108f:	e8 f0 0e 00 00       	call   1f84 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    1094:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1097:	8b 50 10             	mov    0x10(%eax),%edx
    109a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    109d:	8b 40 08             	mov    0x8(%eax),%eax
    10a0:	89 54 24 04          	mov    %edx,0x4(%esp)
    10a4:	89 04 24             	mov    %eax,(%esp)
    10a7:	e8 f0 0e 00 00       	call   1f9c <open>
    10ac:	85 c0                	test   %eax,%eax
    10ae:	79 23                	jns    10d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
    10b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b3:	8b 40 08             	mov    0x8(%eax),%eax
    10b6:	89 44 24 08          	mov    %eax,0x8(%esp)
    10ba:	c7 44 24 04 1b 27 00 	movl   $0x271b,0x4(%esp)
    10c1:	00 
    10c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    10c9:	e8 27 10 00 00       	call   20f5 <printf>
      exit();
    10ce:	e8 89 0e 00 00       	call   1f5c <exit>
    }
    runcmd(rcmd->cmd);
    10d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d6:	8b 40 04             	mov    0x4(%eax),%eax
    10d9:	89 04 24             	mov    %eax,(%esp)
    10dc:	e8 1f ff ff ff       	call   1000 <runcmd>
    break;
    10e1:	e9 1d 01 00 00       	jmp    1203 <runcmd+0x203>

  case LIST:
    lcmd = (struct listcmd*)cmd;
    10e6:	8b 45 08             	mov    0x8(%ebp),%eax
    10e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
    10ec:	e8 8e 02 00 00       	call   137f <fork1>
    10f1:	85 c0                	test   %eax,%eax
    10f3:	75 0e                	jne    1103 <runcmd+0x103>
      runcmd(lcmd->left);
    10f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10f8:	8b 40 04             	mov    0x4(%eax),%eax
    10fb:	89 04 24             	mov    %eax,(%esp)
    10fe:	e8 fd fe ff ff       	call   1000 <runcmd>
    wait();
    1103:	e8 5c 0e 00 00       	call   1f64 <wait>
    runcmd(lcmd->right);
    1108:	8b 45 ec             	mov    -0x14(%ebp),%eax
    110b:	8b 40 08             	mov    0x8(%eax),%eax
    110e:	89 04 24             	mov    %eax,(%esp)
    1111:	e8 ea fe ff ff       	call   1000 <runcmd>
    break;
    1116:	e9 e8 00 00 00       	jmp    1203 <runcmd+0x203>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    111b:	8b 45 08             	mov    0x8(%ebp),%eax
    111e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pipe(p) < 0)
    1121:	8d 45 dc             	lea    -0x24(%ebp),%eax
    1124:	89 04 24             	mov    %eax,(%esp)
    1127:	e8 40 0e 00 00       	call   1f6c <pipe>
    112c:	85 c0                	test   %eax,%eax
    112e:	79 0c                	jns    113c <runcmd+0x13c>
      panic("pipe");
    1130:	c7 04 24 2b 27 00 00 	movl   $0x272b,(%esp)
    1137:	e8 1d 02 00 00       	call   1359 <panic>
    if(fork1() == 0){
    113c:	e8 3e 02 00 00       	call   137f <fork1>
    1141:	85 c0                	test   %eax,%eax
    1143:	75 3b                	jne    1180 <runcmd+0x180>
      close(1);
    1145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    114c:	e8 33 0e 00 00       	call   1f84 <close>
      dup(p[1]);
    1151:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1154:	89 04 24             	mov    %eax,(%esp)
    1157:	e8 78 0e 00 00       	call   1fd4 <dup>
      close(p[0]);
    115c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    115f:	89 04 24             	mov    %eax,(%esp)
    1162:	e8 1d 0e 00 00       	call   1f84 <close>
      close(p[1]);
    1167:	8b 45 e0             	mov    -0x20(%ebp),%eax
    116a:	89 04 24             	mov    %eax,(%esp)
    116d:	e8 12 0e 00 00       	call   1f84 <close>
      runcmd(pcmd->left);
    1172:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1175:	8b 40 04             	mov    0x4(%eax),%eax
    1178:	89 04 24             	mov    %eax,(%esp)
    117b:	e8 80 fe ff ff       	call   1000 <runcmd>
    }
    if(fork1() == 0){
    1180:	e8 fa 01 00 00       	call   137f <fork1>
    1185:	85 c0                	test   %eax,%eax
    1187:	75 3b                	jne    11c4 <runcmd+0x1c4>
      close(0);
    1189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1190:	e8 ef 0d 00 00       	call   1f84 <close>
      dup(p[0]);
    1195:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1198:	89 04 24             	mov    %eax,(%esp)
    119b:	e8 34 0e 00 00       	call   1fd4 <dup>
      close(p[0]);
    11a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11a3:	89 04 24             	mov    %eax,(%esp)
    11a6:	e8 d9 0d 00 00       	call   1f84 <close>
      close(p[1]);
    11ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11ae:	89 04 24             	mov    %eax,(%esp)
    11b1:	e8 ce 0d 00 00       	call   1f84 <close>
      runcmd(pcmd->right);
    11b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11b9:	8b 40 08             	mov    0x8(%eax),%eax
    11bc:	89 04 24             	mov    %eax,(%esp)
    11bf:	e8 3c fe ff ff       	call   1000 <runcmd>
    }
    close(p[0]);
    11c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11c7:	89 04 24             	mov    %eax,(%esp)
    11ca:	e8 b5 0d 00 00       	call   1f84 <close>
    close(p[1]);
    11cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
    11d2:	89 04 24             	mov    %eax,(%esp)
    11d5:	e8 aa 0d 00 00       	call   1f84 <close>
    wait();
    11da:	e8 85 0d 00 00       	call   1f64 <wait>
    wait();
    11df:	e8 80 0d 00 00       	call   1f64 <wait>
    break;
    11e4:	eb 1d                	jmp    1203 <runcmd+0x203>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    11e6:	8b 45 08             	mov    0x8(%ebp),%eax
    11e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
    11ec:	e8 8e 01 00 00       	call   137f <fork1>
    11f1:	85 c0                	test   %eax,%eax
    11f3:	75 0e                	jne    1203 <runcmd+0x203>
      runcmd(bcmd->cmd);
    11f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11f8:	8b 40 04             	mov    0x4(%eax),%eax
    11fb:	89 04 24             	mov    %eax,(%esp)
    11fe:	e8 fd fd ff ff       	call   1000 <runcmd>
    break;
  }
  exit();
    1203:	e8 54 0d 00 00       	call   1f5c <exit>

00001208 <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
    1208:	55                   	push   %ebp
    1209:	89 e5                	mov    %esp,%ebp
    120b:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
    120e:	c7 44 24 04 48 27 00 	movl   $0x2748,0x4(%esp)
    1215:	00 
    1216:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    121d:	e8 d3 0e 00 00       	call   20f5 <printf>
  memset(buf, 0, nbuf);
    1222:	8b 45 0c             	mov    0xc(%ebp),%eax
    1225:	89 44 24 08          	mov    %eax,0x8(%esp)
    1229:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1230:	00 
    1231:	8b 45 08             	mov    0x8(%ebp),%eax
    1234:	89 04 24             	mov    %eax,(%esp)
    1237:	e8 7a 0b 00 00       	call   1db6 <memset>
  gets(buf, nbuf);
    123c:	8b 45 0c             	mov    0xc(%ebp),%eax
    123f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1243:	8b 45 08             	mov    0x8(%ebp),%eax
    1246:	89 04 24             	mov    %eax,(%esp)
    1249:	e8 bf 0b 00 00       	call   1e0d <gets>
  if(buf[0] == 0) // EOF
    124e:	8b 45 08             	mov    0x8(%ebp),%eax
    1251:	0f b6 00             	movzbl (%eax),%eax
    1254:	84 c0                	test   %al,%al
    1256:	75 07                	jne    125f <getcmd+0x57>
    return -1;
    1258:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    125d:	eb 05                	jmp    1264 <getcmd+0x5c>
  return 0;
    125f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1264:	c9                   	leave  
    1265:	c3                   	ret    

00001266 <main>:

int
main(void)
{
    1266:	55                   	push   %ebp
    1267:	89 e5                	mov    %esp,%ebp
    1269:	83 e4 f0             	and    $0xfffffff0,%esp
    126c:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    126f:	eb 19                	jmp    128a <main+0x24>
    if(fd >= 3){
    1271:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
    1276:	7e 12                	jle    128a <main+0x24>
      close(fd);
    1278:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    127c:	89 04 24             	mov    %eax,(%esp)
    127f:	e8 00 0d 00 00       	call   1f84 <close>
      break;
    1284:	90                   	nop
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    1285:	e9 ae 00 00 00       	jmp    1338 <main+0xd2>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    128a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1291:	00 
    1292:	c7 04 24 4b 27 00 00 	movl   $0x274b,(%esp)
    1299:	e8 fe 0c 00 00       	call   1f9c <open>
    129e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    12a2:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    12a7:	79 c8                	jns    1271 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    12a9:	e9 8a 00 00 00       	jmp    1338 <main+0xd2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    12ae:	0f b6 05 60 28 00 00 	movzbl 0x2860,%eax
    12b5:	3c 63                	cmp    $0x63,%al
    12b7:	75 5a                	jne    1313 <main+0xad>
    12b9:	0f b6 05 61 28 00 00 	movzbl 0x2861,%eax
    12c0:	3c 64                	cmp    $0x64,%al
    12c2:	75 4f                	jne    1313 <main+0xad>
    12c4:	0f b6 05 62 28 00 00 	movzbl 0x2862,%eax
    12cb:	3c 20                	cmp    $0x20,%al
    12cd:	75 44                	jne    1313 <main+0xad>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
    12cf:	c7 04 24 60 28 00 00 	movl   $0x2860,(%esp)
    12d6:	e8 b6 0a 00 00       	call   1d91 <strlen>
    12db:	83 e8 01             	sub    $0x1,%eax
    12de:	c6 80 60 28 00 00 00 	movb   $0x0,0x2860(%eax)
      if(chdir(buf+3) < 0)
    12e5:	c7 04 24 63 28 00 00 	movl   $0x2863,(%esp)
    12ec:	e8 db 0c 00 00       	call   1fcc <chdir>
    12f1:	85 c0                	test   %eax,%eax
    12f3:	79 42                	jns    1337 <main+0xd1>
        printf(2, "cannot cd %s\n", buf+3);
    12f5:	c7 44 24 08 63 28 00 	movl   $0x2863,0x8(%esp)
    12fc:	00 
    12fd:	c7 44 24 04 53 27 00 	movl   $0x2753,0x4(%esp)
    1304:	00 
    1305:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    130c:	e8 e4 0d 00 00       	call   20f5 <printf>
      continue;
    1311:	eb 25                	jmp    1338 <main+0xd2>
    }
    if(fork1() == 0)
    1313:	e8 67 00 00 00       	call   137f <fork1>
    1318:	85 c0                	test   %eax,%eax
    131a:	75 14                	jne    1330 <main+0xca>
      runcmd(parsecmd(buf));
    131c:	c7 04 24 60 28 00 00 	movl   $0x2860,(%esp)
    1323:	e8 c6 03 00 00       	call   16ee <parsecmd>
    1328:	89 04 24             	mov    %eax,(%esp)
    132b:	e8 d0 fc ff ff       	call   1000 <runcmd>
    wait();
    1330:	e8 2f 0c 00 00       	call   1f64 <wait>
    1335:	eb 01                	jmp    1338 <main+0xd2>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    1337:	90                   	nop
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    1338:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
    133f:	00 
    1340:	c7 04 24 60 28 00 00 	movl   $0x2860,(%esp)
    1347:	e8 bc fe ff ff       	call   1208 <getcmd>
    134c:	85 c0                	test   %eax,%eax
    134e:	0f 89 5a ff ff ff    	jns    12ae <main+0x48>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
    1354:	e8 03 0c 00 00       	call   1f5c <exit>

00001359 <panic>:
}

void
panic(char *s)
{
    1359:	55                   	push   %ebp
    135a:	89 e5                	mov    %esp,%ebp
    135c:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
    135f:	8b 45 08             	mov    0x8(%ebp),%eax
    1362:	89 44 24 08          	mov    %eax,0x8(%esp)
    1366:	c7 44 24 04 61 27 00 	movl   $0x2761,0x4(%esp)
    136d:	00 
    136e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1375:	e8 7b 0d 00 00       	call   20f5 <printf>
  exit();
    137a:	e8 dd 0b 00 00       	call   1f5c <exit>

0000137f <fork1>:
}

int
fork1(void)
{
    137f:	55                   	push   %ebp
    1380:	89 e5                	mov    %esp,%ebp
    1382:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
    1385:	e8 ca 0b 00 00       	call   1f54 <fork>
    138a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
    138d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    1391:	75 0c                	jne    139f <fork1+0x20>
    panic("fork");
    1393:	c7 04 24 65 27 00 00 	movl   $0x2765,(%esp)
    139a:	e8 ba ff ff ff       	call   1359 <panic>
  return pid;
    139f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    13a2:	c9                   	leave  
    13a3:	c3                   	ret    

000013a4 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    13a4:	55                   	push   %ebp
    13a5:	89 e5                	mov    %esp,%ebp
    13a7:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13aa:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
    13b1:	e8 25 10 00 00       	call   23db <malloc>
    13b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    13b9:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
    13c0:	00 
    13c1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    13c8:	00 
    13c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13cc:	89 04 24             	mov    %eax,(%esp)
    13cf:	e8 e2 09 00 00       	call   1db6 <memset>
  cmd->type = EXEC;
    13d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13d7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
    13dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    13e0:	c9                   	leave  
    13e1:	c3                   	ret    

000013e2 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    13e2:	55                   	push   %ebp
    13e3:	89 e5                	mov    %esp,%ebp
    13e5:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13e8:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    13ef:	e8 e7 0f 00 00       	call   23db <malloc>
    13f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    13f7:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
    13fe:	00 
    13ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1406:	00 
    1407:	8b 45 f4             	mov    -0xc(%ebp),%eax
    140a:	89 04 24             	mov    %eax,(%esp)
    140d:	e8 a4 09 00 00       	call   1db6 <memset>
  cmd->type = REDIR;
    1412:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1415:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
    141b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141e:	8b 55 08             	mov    0x8(%ebp),%edx
    1421:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
    1424:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1427:	8b 55 0c             	mov    0xc(%ebp),%edx
    142a:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
    142d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1430:	8b 55 10             	mov    0x10(%ebp),%edx
    1433:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
    1436:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1439:	8b 55 14             	mov    0x14(%ebp),%edx
    143c:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
    143f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1442:	8b 55 18             	mov    0x18(%ebp),%edx
    1445:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
    1448:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    144b:	c9                   	leave  
    144c:	c3                   	ret    

0000144d <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    144d:	55                   	push   %ebp
    144e:	89 e5                	mov    %esp,%ebp
    1450:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    1453:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    145a:	e8 7c 0f 00 00       	call   23db <malloc>
    145f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1462:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
    1469:	00 
    146a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1471:	00 
    1472:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1475:	89 04 24             	mov    %eax,(%esp)
    1478:	e8 39 09 00 00       	call   1db6 <memset>
  cmd->type = PIPE;
    147d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1480:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
    1486:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1489:	8b 55 08             	mov    0x8(%ebp),%edx
    148c:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    148f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1492:	8b 55 0c             	mov    0xc(%ebp),%edx
    1495:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    1498:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    149b:	c9                   	leave  
    149c:	c3                   	ret    

0000149d <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    149d:	55                   	push   %ebp
    149e:	89 e5                	mov    %esp,%ebp
    14a0:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    14a3:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    14aa:	e8 2c 0f 00 00       	call   23db <malloc>
    14af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    14b2:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
    14b9:	00 
    14ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    14c1:	00 
    14c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c5:	89 04 24             	mov    %eax,(%esp)
    14c8:	e8 e9 08 00 00       	call   1db6 <memset>
  cmd->type = LIST;
    14cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14d0:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
    14d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14d9:	8b 55 08             	mov    0x8(%ebp),%edx
    14dc:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
    14df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e2:	8b 55 0c             	mov    0xc(%ebp),%edx
    14e5:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
    14e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    14eb:	c9                   	leave  
    14ec:	c3                   	ret    

000014ed <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    14ed:	55                   	push   %ebp
    14ee:	89 e5                	mov    %esp,%ebp
    14f0:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    14f3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    14fa:	e8 dc 0e 00 00       	call   23db <malloc>
    14ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
    1502:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
    1509:	00 
    150a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1511:	00 
    1512:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1515:	89 04 24             	mov    %eax,(%esp)
    1518:	e8 99 08 00 00       	call   1db6 <memset>
  cmd->type = BACK;
    151d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1520:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
    1526:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1529:	8b 55 08             	mov    0x8(%ebp),%edx
    152c:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
    152f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1532:	c9                   	leave  
    1533:	c3                   	ret    

00001534 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    1534:	55                   	push   %ebp
    1535:	89 e5                	mov    %esp,%ebp
    1537:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
    153a:	8b 45 08             	mov    0x8(%ebp),%eax
    153d:	8b 00                	mov    (%eax),%eax
    153f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(s < es && strchr(whitespace, *s))
    1542:	eb 04                	jmp    1548 <gettoken+0x14>
    s++;
    1544:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    1548:	8b 45 f0             	mov    -0x10(%ebp),%eax
    154b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    154e:	73 1d                	jae    156d <gettoken+0x39>
    1550:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1553:	0f b6 00             	movzbl (%eax),%eax
    1556:	0f be c0             	movsbl %al,%eax
    1559:	89 44 24 04          	mov    %eax,0x4(%esp)
    155d:	c7 04 24 28 28 00 00 	movl   $0x2828,(%esp)
    1564:	e8 71 08 00 00       	call   1dda <strchr>
    1569:	85 c0                	test   %eax,%eax
    156b:	75 d7                	jne    1544 <gettoken+0x10>
    s++;
  if(q)
    156d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1571:	74 08                	je     157b <gettoken+0x47>
    *q = s;
    1573:	8b 45 10             	mov    0x10(%ebp),%eax
    1576:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1579:	89 10                	mov    %edx,(%eax)
  ret = *s;
    157b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    157e:	0f b6 00             	movzbl (%eax),%eax
    1581:	0f be c0             	movsbl %al,%eax
    1584:	89 45 f4             	mov    %eax,-0xc(%ebp)
  switch(*s){
    1587:	8b 45 f0             	mov    -0x10(%ebp),%eax
    158a:	0f b6 00             	movzbl (%eax),%eax
    158d:	0f be c0             	movsbl %al,%eax
    1590:	83 f8 3c             	cmp    $0x3c,%eax
    1593:	7f 1e                	jg     15b3 <gettoken+0x7f>
    1595:	83 f8 3b             	cmp    $0x3b,%eax
    1598:	7d 23                	jge    15bd <gettoken+0x89>
    159a:	83 f8 29             	cmp    $0x29,%eax
    159d:	7f 3f                	jg     15de <gettoken+0xaa>
    159f:	83 f8 28             	cmp    $0x28,%eax
    15a2:	7d 19                	jge    15bd <gettoken+0x89>
    15a4:	85 c0                	test   %eax,%eax
    15a6:	0f 84 83 00 00 00    	je     162f <gettoken+0xfb>
    15ac:	83 f8 26             	cmp    $0x26,%eax
    15af:	74 0c                	je     15bd <gettoken+0x89>
    15b1:	eb 2b                	jmp    15de <gettoken+0xaa>
    15b3:	83 f8 3e             	cmp    $0x3e,%eax
    15b6:	74 0b                	je     15c3 <gettoken+0x8f>
    15b8:	83 f8 7c             	cmp    $0x7c,%eax
    15bb:	75 21                	jne    15de <gettoken+0xaa>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    15bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    break;
    15c1:	eb 70                	jmp    1633 <gettoken+0xff>
  case '>':
    s++;
    15c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(*s == '>'){
    15c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15ca:	0f b6 00             	movzbl (%eax),%eax
    15cd:	3c 3e                	cmp    $0x3e,%al
    15cf:	75 61                	jne    1632 <gettoken+0xfe>
      ret = '+';
    15d1:	c7 45 f4 2b 00 00 00 	movl   $0x2b,-0xc(%ebp)
      s++;
    15d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    break;
    15dc:	eb 55                	jmp    1633 <gettoken+0xff>
  default:
    ret = 'a';
    15de:	c7 45 f4 61 00 00 00 	movl   $0x61,-0xc(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    15e5:	eb 04                	jmp    15eb <gettoken+0xb7>
      s++;
    15e7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    15eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15ee:	3b 45 0c             	cmp    0xc(%ebp),%eax
    15f1:	73 40                	jae    1633 <gettoken+0xff>
    15f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15f6:	0f b6 00             	movzbl (%eax),%eax
    15f9:	0f be c0             	movsbl %al,%eax
    15fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1600:	c7 04 24 28 28 00 00 	movl   $0x2828,(%esp)
    1607:	e8 ce 07 00 00       	call   1dda <strchr>
    160c:	85 c0                	test   %eax,%eax
    160e:	75 23                	jne    1633 <gettoken+0xff>
    1610:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1613:	0f b6 00             	movzbl (%eax),%eax
    1616:	0f be c0             	movsbl %al,%eax
    1619:	89 44 24 04          	mov    %eax,0x4(%esp)
    161d:	c7 04 24 2e 28 00 00 	movl   $0x282e,(%esp)
    1624:	e8 b1 07 00 00       	call   1dda <strchr>
    1629:	85 c0                	test   %eax,%eax
    162b:	74 ba                	je     15e7 <gettoken+0xb3>
    162d:	eb 04                	jmp    1633 <gettoken+0xff>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
    162f:	90                   	nop
    1630:	eb 01                	jmp    1633 <gettoken+0xff>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
    1632:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    1633:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    1637:	74 0e                	je     1647 <gettoken+0x113>
    *eq = s;
    1639:	8b 45 14             	mov    0x14(%ebp),%eax
    163c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    163f:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
    1641:	eb 04                	jmp    1647 <gettoken+0x113>
    s++;
    1643:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    1647:	8b 45 f0             	mov    -0x10(%ebp),%eax
    164a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    164d:	73 1d                	jae    166c <gettoken+0x138>
    164f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1652:	0f b6 00             	movzbl (%eax),%eax
    1655:	0f be c0             	movsbl %al,%eax
    1658:	89 44 24 04          	mov    %eax,0x4(%esp)
    165c:	c7 04 24 28 28 00 00 	movl   $0x2828,(%esp)
    1663:	e8 72 07 00 00       	call   1dda <strchr>
    1668:	85 c0                	test   %eax,%eax
    166a:	75 d7                	jne    1643 <gettoken+0x10f>
    s++;
  *ps = s;
    166c:	8b 45 08             	mov    0x8(%ebp),%eax
    166f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1672:	89 10                	mov    %edx,(%eax)
  return ret;
    1674:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1677:	c9                   	leave  
    1678:	c3                   	ret    

00001679 <peek>:

int
peek(char **ps, char *es, char *toks)
{
    1679:	55                   	push   %ebp
    167a:	89 e5                	mov    %esp,%ebp
    167c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
    167f:	8b 45 08             	mov    0x8(%ebp),%eax
    1682:	8b 00                	mov    (%eax),%eax
    1684:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
    1687:	eb 04                	jmp    168d <peek+0x14>
    s++;
    1689:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    168d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1690:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1693:	73 1d                	jae    16b2 <peek+0x39>
    1695:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1698:	0f b6 00             	movzbl (%eax),%eax
    169b:	0f be c0             	movsbl %al,%eax
    169e:	89 44 24 04          	mov    %eax,0x4(%esp)
    16a2:	c7 04 24 28 28 00 00 	movl   $0x2828,(%esp)
    16a9:	e8 2c 07 00 00       	call   1dda <strchr>
    16ae:	85 c0                	test   %eax,%eax
    16b0:	75 d7                	jne    1689 <peek+0x10>
    s++;
  *ps = s;
    16b2:	8b 45 08             	mov    0x8(%ebp),%eax
    16b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    16b8:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
    16ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16bd:	0f b6 00             	movzbl (%eax),%eax
    16c0:	84 c0                	test   %al,%al
    16c2:	74 23                	je     16e7 <peek+0x6e>
    16c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16c7:	0f b6 00             	movzbl (%eax),%eax
    16ca:	0f be c0             	movsbl %al,%eax
    16cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    16d1:	8b 45 10             	mov    0x10(%ebp),%eax
    16d4:	89 04 24             	mov    %eax,(%esp)
    16d7:	e8 fe 06 00 00       	call   1dda <strchr>
    16dc:	85 c0                	test   %eax,%eax
    16de:	74 07                	je     16e7 <peek+0x6e>
    16e0:	b8 01 00 00 00       	mov    $0x1,%eax
    16e5:	eb 05                	jmp    16ec <peek+0x73>
    16e7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    16ec:	c9                   	leave  
    16ed:	c3                   	ret    

000016ee <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
    16ee:	55                   	push   %ebp
    16ef:	89 e5                	mov    %esp,%ebp
    16f1:	53                   	push   %ebx
    16f2:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
    16f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16f8:	8b 45 08             	mov    0x8(%ebp),%eax
    16fb:	89 04 24             	mov    %eax,(%esp)
    16fe:	e8 8e 06 00 00       	call   1d91 <strlen>
    1703:	8d 04 03             	lea    (%ebx,%eax,1),%eax
    1706:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = parseline(&s, es);
    1709:	8b 45 f0             	mov    -0x10(%ebp),%eax
    170c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1710:	8d 45 08             	lea    0x8(%ebp),%eax
    1713:	89 04 24             	mov    %eax,(%esp)
    1716:	e8 60 00 00 00       	call   177b <parseline>
    171b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  peek(&s, es, "");
    171e:	c7 44 24 08 6a 27 00 	movl   $0x276a,0x8(%esp)
    1725:	00 
    1726:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1729:	89 44 24 04          	mov    %eax,0x4(%esp)
    172d:	8d 45 08             	lea    0x8(%ebp),%eax
    1730:	89 04 24             	mov    %eax,(%esp)
    1733:	e8 41 ff ff ff       	call   1679 <peek>
  if(s != es){
    1738:	8b 45 08             	mov    0x8(%ebp),%eax
    173b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    173e:	74 27                	je     1767 <parsecmd+0x79>
    printf(2, "leftovers: %s\n", s);
    1740:	8b 45 08             	mov    0x8(%ebp),%eax
    1743:	89 44 24 08          	mov    %eax,0x8(%esp)
    1747:	c7 44 24 04 6b 27 00 	movl   $0x276b,0x4(%esp)
    174e:	00 
    174f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1756:	e8 9a 09 00 00       	call   20f5 <printf>
    panic("syntax");
    175b:	c7 04 24 7a 27 00 00 	movl   $0x277a,(%esp)
    1762:	e8 f2 fb ff ff       	call   1359 <panic>
  }
  nulterminate(cmd);
    1767:	8b 45 f4             	mov    -0xc(%ebp),%eax
    176a:	89 04 24             	mov    %eax,(%esp)
    176d:	e8 a4 04 00 00       	call   1c16 <nulterminate>
  return cmd;
    1772:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1775:	83 c4 24             	add    $0x24,%esp
    1778:	5b                   	pop    %ebx
    1779:	5d                   	pop    %ebp
    177a:	c3                   	ret    

0000177b <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
    177b:	55                   	push   %ebp
    177c:	89 e5                	mov    %esp,%ebp
    177e:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
    1781:	8b 45 0c             	mov    0xc(%ebp),%eax
    1784:	89 44 24 04          	mov    %eax,0x4(%esp)
    1788:	8b 45 08             	mov    0x8(%ebp),%eax
    178b:	89 04 24             	mov    %eax,(%esp)
    178e:	e8 bc 00 00 00       	call   184f <parsepipe>
    1793:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
    1796:	eb 30                	jmp    17c8 <parseline+0x4d>
    gettoken(ps, es, 0, 0);
    1798:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    179f:	00 
    17a0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    17a7:	00 
    17a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    17ab:	89 44 24 04          	mov    %eax,0x4(%esp)
    17af:	8b 45 08             	mov    0x8(%ebp),%eax
    17b2:	89 04 24             	mov    %eax,(%esp)
    17b5:	e8 7a fd ff ff       	call   1534 <gettoken>
    cmd = backcmd(cmd);
    17ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17bd:	89 04 24             	mov    %eax,(%esp)
    17c0:	e8 28 fd ff ff       	call   14ed <backcmd>
    17c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    17c8:	c7 44 24 08 81 27 00 	movl   $0x2781,0x8(%esp)
    17cf:	00 
    17d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    17d3:	89 44 24 04          	mov    %eax,0x4(%esp)
    17d7:	8b 45 08             	mov    0x8(%ebp),%eax
    17da:	89 04 24             	mov    %eax,(%esp)
    17dd:	e8 97 fe ff ff       	call   1679 <peek>
    17e2:	85 c0                	test   %eax,%eax
    17e4:	75 b2                	jne    1798 <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    17e6:	c7 44 24 08 83 27 00 	movl   $0x2783,0x8(%esp)
    17ed:	00 
    17ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    17f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    17f5:	8b 45 08             	mov    0x8(%ebp),%eax
    17f8:	89 04 24             	mov    %eax,(%esp)
    17fb:	e8 79 fe ff ff       	call   1679 <peek>
    1800:	85 c0                	test   %eax,%eax
    1802:	74 46                	je     184a <parseline+0xcf>
    gettoken(ps, es, 0, 0);
    1804:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    180b:	00 
    180c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1813:	00 
    1814:	8b 45 0c             	mov    0xc(%ebp),%eax
    1817:	89 44 24 04          	mov    %eax,0x4(%esp)
    181b:	8b 45 08             	mov    0x8(%ebp),%eax
    181e:	89 04 24             	mov    %eax,(%esp)
    1821:	e8 0e fd ff ff       	call   1534 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    1826:	8b 45 0c             	mov    0xc(%ebp),%eax
    1829:	89 44 24 04          	mov    %eax,0x4(%esp)
    182d:	8b 45 08             	mov    0x8(%ebp),%eax
    1830:	89 04 24             	mov    %eax,(%esp)
    1833:	e8 43 ff ff ff       	call   177b <parseline>
    1838:	89 44 24 04          	mov    %eax,0x4(%esp)
    183c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    183f:	89 04 24             	mov    %eax,(%esp)
    1842:	e8 56 fc ff ff       	call   149d <listcmd>
    1847:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    184a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    184d:	c9                   	leave  
    184e:	c3                   	ret    

0000184f <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
    184f:	55                   	push   %ebp
    1850:	89 e5                	mov    %esp,%ebp
    1852:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
    1855:	8b 45 0c             	mov    0xc(%ebp),%eax
    1858:	89 44 24 04          	mov    %eax,0x4(%esp)
    185c:	8b 45 08             	mov    0x8(%ebp),%eax
    185f:	89 04 24             	mov    %eax,(%esp)
    1862:	e8 67 02 00 00       	call   1ace <parseexec>
    1867:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
    186a:	c7 44 24 08 85 27 00 	movl   $0x2785,0x8(%esp)
    1871:	00 
    1872:	8b 45 0c             	mov    0xc(%ebp),%eax
    1875:	89 44 24 04          	mov    %eax,0x4(%esp)
    1879:	8b 45 08             	mov    0x8(%ebp),%eax
    187c:	89 04 24             	mov    %eax,(%esp)
    187f:	e8 f5 fd ff ff       	call   1679 <peek>
    1884:	85 c0                	test   %eax,%eax
    1886:	74 46                	je     18ce <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
    1888:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    188f:	00 
    1890:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1897:	00 
    1898:	8b 45 0c             	mov    0xc(%ebp),%eax
    189b:	89 44 24 04          	mov    %eax,0x4(%esp)
    189f:	8b 45 08             	mov    0x8(%ebp),%eax
    18a2:	89 04 24             	mov    %eax,(%esp)
    18a5:	e8 8a fc ff ff       	call   1534 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    18aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    18ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    18b1:	8b 45 08             	mov    0x8(%ebp),%eax
    18b4:	89 04 24             	mov    %eax,(%esp)
    18b7:	e8 93 ff ff ff       	call   184f <parsepipe>
    18bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    18c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18c3:	89 04 24             	mov    %eax,(%esp)
    18c6:	e8 82 fb ff ff       	call   144d <pipecmd>
    18cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
    18ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    18d1:	c9                   	leave  
    18d2:	c3                   	ret    

000018d3 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    18d3:	55                   	push   %ebp
    18d4:	89 e5                	mov    %esp,%ebp
    18d6:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    18d9:	e9 f5 00 00 00       	jmp    19d3 <parseredirs+0x100>
    tok = gettoken(ps, es, 0, 0);
    18de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    18e5:	00 
    18e6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    18ed:	00 
    18ee:	8b 45 10             	mov    0x10(%ebp),%eax
    18f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    18f5:	8b 45 0c             	mov    0xc(%ebp),%eax
    18f8:	89 04 24             	mov    %eax,(%esp)
    18fb:	e8 34 fc ff ff       	call   1534 <gettoken>
    1900:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
    1903:	8d 45 ec             	lea    -0x14(%ebp),%eax
    1906:	89 44 24 0c          	mov    %eax,0xc(%esp)
    190a:	8d 45 f0             	lea    -0x10(%ebp),%eax
    190d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1911:	8b 45 10             	mov    0x10(%ebp),%eax
    1914:	89 44 24 04          	mov    %eax,0x4(%esp)
    1918:	8b 45 0c             	mov    0xc(%ebp),%eax
    191b:	89 04 24             	mov    %eax,(%esp)
    191e:	e8 11 fc ff ff       	call   1534 <gettoken>
    1923:	83 f8 61             	cmp    $0x61,%eax
    1926:	74 0c                	je     1934 <parseredirs+0x61>
      panic("missing file for redirection");
    1928:	c7 04 24 87 27 00 00 	movl   $0x2787,(%esp)
    192f:	e8 25 fa ff ff       	call   1359 <panic>
    switch(tok){
    1934:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1937:	83 f8 3c             	cmp    $0x3c,%eax
    193a:	74 0f                	je     194b <parseredirs+0x78>
    193c:	83 f8 3e             	cmp    $0x3e,%eax
    193f:	74 38                	je     1979 <parseredirs+0xa6>
    1941:	83 f8 2b             	cmp    $0x2b,%eax
    1944:	74 61                	je     19a7 <parseredirs+0xd4>
    1946:	e9 88 00 00 00       	jmp    19d3 <parseredirs+0x100>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    194b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    194e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1951:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1958:	00 
    1959:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1960:	00 
    1961:	89 54 24 08          	mov    %edx,0x8(%esp)
    1965:	89 44 24 04          	mov    %eax,0x4(%esp)
    1969:	8b 45 08             	mov    0x8(%ebp),%eax
    196c:	89 04 24             	mov    %eax,(%esp)
    196f:	e8 6e fa ff ff       	call   13e2 <redircmd>
    1974:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    1977:	eb 5a                	jmp    19d3 <parseredirs+0x100>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    1979:	8b 55 ec             	mov    -0x14(%ebp),%edx
    197c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    197f:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1986:	00 
    1987:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
    198e:	00 
    198f:	89 54 24 08          	mov    %edx,0x8(%esp)
    1993:	89 44 24 04          	mov    %eax,0x4(%esp)
    1997:	8b 45 08             	mov    0x8(%ebp),%eax
    199a:	89 04 24             	mov    %eax,(%esp)
    199d:	e8 40 fa ff ff       	call   13e2 <redircmd>
    19a2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    19a5:	eb 2c                	jmp    19d3 <parseredirs+0x100>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    19a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    19aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19ad:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    19b4:	00 
    19b5:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
    19bc:	00 
    19bd:	89 54 24 08          	mov    %edx,0x8(%esp)
    19c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    19c5:	8b 45 08             	mov    0x8(%ebp),%eax
    19c8:	89 04 24             	mov    %eax,(%esp)
    19cb:	e8 12 fa ff ff       	call   13e2 <redircmd>
    19d0:	89 45 08             	mov    %eax,0x8(%ebp)
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    19d3:	c7 44 24 08 a4 27 00 	movl   $0x27a4,0x8(%esp)
    19da:	00 
    19db:	8b 45 10             	mov    0x10(%ebp),%eax
    19de:	89 44 24 04          	mov    %eax,0x4(%esp)
    19e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    19e5:	89 04 24             	mov    %eax,(%esp)
    19e8:	e8 8c fc ff ff       	call   1679 <peek>
    19ed:	85 c0                	test   %eax,%eax
    19ef:	0f 85 e9 fe ff ff    	jne    18de <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
    19f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    19f8:	c9                   	leave  
    19f9:	c3                   	ret    

000019fa <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
    19fa:	55                   	push   %ebp
    19fb:	89 e5                	mov    %esp,%ebp
    19fd:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    1a00:	c7 44 24 08 a7 27 00 	movl   $0x27a7,0x8(%esp)
    1a07:	00 
    1a08:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a0f:	8b 45 08             	mov    0x8(%ebp),%eax
    1a12:	89 04 24             	mov    %eax,(%esp)
    1a15:	e8 5f fc ff ff       	call   1679 <peek>
    1a1a:	85 c0                	test   %eax,%eax
    1a1c:	75 0c                	jne    1a2a <parseblock+0x30>
    panic("parseblock");
    1a1e:	c7 04 24 a9 27 00 00 	movl   $0x27a9,(%esp)
    1a25:	e8 2f f9 ff ff       	call   1359 <panic>
  gettoken(ps, es, 0, 0);
    1a2a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1a31:	00 
    1a32:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a39:	00 
    1a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a3d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a41:	8b 45 08             	mov    0x8(%ebp),%eax
    1a44:	89 04 24             	mov    %eax,(%esp)
    1a47:	e8 e8 fa ff ff       	call   1534 <gettoken>
  cmd = parseline(ps, es);
    1a4c:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a4f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a53:	8b 45 08             	mov    0x8(%ebp),%eax
    1a56:	89 04 24             	mov    %eax,(%esp)
    1a59:	e8 1d fd ff ff       	call   177b <parseline>
    1a5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
    1a61:	c7 44 24 08 b4 27 00 	movl   $0x27b4,0x8(%esp)
    1a68:	00 
    1a69:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a6c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a70:	8b 45 08             	mov    0x8(%ebp),%eax
    1a73:	89 04 24             	mov    %eax,(%esp)
    1a76:	e8 fe fb ff ff       	call   1679 <peek>
    1a7b:	85 c0                	test   %eax,%eax
    1a7d:	75 0c                	jne    1a8b <parseblock+0x91>
    panic("syntax - missing )");
    1a7f:	c7 04 24 b6 27 00 00 	movl   $0x27b6,(%esp)
    1a86:	e8 ce f8 ff ff       	call   1359 <panic>
  gettoken(ps, es, 0, 0);
    1a8b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1a92:	00 
    1a93:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a9a:	00 
    1a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
    1a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1aa2:	8b 45 08             	mov    0x8(%ebp),%eax
    1aa5:	89 04 24             	mov    %eax,(%esp)
    1aa8:	e8 87 fa ff ff       	call   1534 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    1aad:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ab0:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ab4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ab7:	89 44 24 04          	mov    %eax,0x4(%esp)
    1abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1abe:	89 04 24             	mov    %eax,(%esp)
    1ac1:	e8 0d fe ff ff       	call   18d3 <parseredirs>
    1ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
    1ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1acc:	c9                   	leave  
    1acd:	c3                   	ret    

00001ace <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
    1ace:	55                   	push   %ebp
    1acf:	89 e5                	mov    %esp,%ebp
    1ad1:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    1ad4:	c7 44 24 08 a7 27 00 	movl   $0x27a7,0x8(%esp)
    1adb:	00 
    1adc:	8b 45 0c             	mov    0xc(%ebp),%eax
    1adf:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ae3:	8b 45 08             	mov    0x8(%ebp),%eax
    1ae6:	89 04 24             	mov    %eax,(%esp)
    1ae9:	e8 8b fb ff ff       	call   1679 <peek>
    1aee:	85 c0                	test   %eax,%eax
    1af0:	74 17                	je     1b09 <parseexec+0x3b>
    return parseblock(ps, es);
    1af2:	8b 45 0c             	mov    0xc(%ebp),%eax
    1af5:	89 44 24 04          	mov    %eax,0x4(%esp)
    1af9:	8b 45 08             	mov    0x8(%ebp),%eax
    1afc:	89 04 24             	mov    %eax,(%esp)
    1aff:	e8 f6 fe ff ff       	call   19fa <parseblock>
    1b04:	e9 0b 01 00 00       	jmp    1c14 <parseexec+0x146>

  ret = execcmd();
    1b09:	e8 96 f8 ff ff       	call   13a4 <execcmd>
    1b0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = (struct execcmd*)ret;
    1b11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b14:	89 45 f0             	mov    %eax,-0x10(%ebp)

  argc = 0;
    1b17:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ret = parseredirs(ret, ps, es);
    1b1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b21:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b25:	8b 45 08             	mov    0x8(%ebp),%eax
    1b28:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b2f:	89 04 24             	mov    %eax,(%esp)
    1b32:	e8 9c fd ff ff       	call   18d3 <parseredirs>
    1b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(!peek(ps, es, "|)&;")){
    1b3a:	e9 8e 00 00 00       	jmp    1bcd <parseexec+0xff>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    1b3f:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1b42:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b46:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1b49:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b50:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b54:	8b 45 08             	mov    0x8(%ebp),%eax
    1b57:	89 04 24             	mov    %eax,(%esp)
    1b5a:	e8 d5 f9 ff ff       	call   1534 <gettoken>
    1b5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1b62:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1b66:	0f 84 85 00 00 00    	je     1bf1 <parseexec+0x123>
      break;
    if(tok != 'a')
    1b6c:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
    1b70:	74 0c                	je     1b7e <parseexec+0xb0>
      panic("syntax");
    1b72:	c7 04 24 7a 27 00 00 	movl   $0x277a,(%esp)
    1b79:	e8 db f7 ff ff       	call   1359 <panic>
    cmd->argv[argc] = q;
    1b7e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1b81:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1b84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b87:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
    1b8b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1b8e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b94:	83 c1 08             	add    $0x8,%ecx
    1b97:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
    1b9b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    if(argc >= MAXARGS)
    1b9f:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
    1ba3:	7e 0c                	jle    1bb1 <parseexec+0xe3>
      panic("too many args");
    1ba5:	c7 04 24 c9 27 00 00 	movl   $0x27c9,(%esp)
    1bac:	e8 a8 f7 ff ff       	call   1359 <panic>
    ret = parseredirs(ret, ps, es);
    1bb1:	8b 45 0c             	mov    0xc(%ebp),%eax
    1bb4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bb8:	8b 45 08             	mov    0x8(%ebp),%eax
    1bbb:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bc2:	89 04 24             	mov    %eax,(%esp)
    1bc5:	e8 09 fd ff ff       	call   18d3 <parseredirs>
    1bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    1bcd:	c7 44 24 08 d7 27 00 	movl   $0x27d7,0x8(%esp)
    1bd4:	00 
    1bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
    1bd8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bdc:	8b 45 08             	mov    0x8(%ebp),%eax
    1bdf:	89 04 24             	mov    %eax,(%esp)
    1be2:	e8 92 fa ff ff       	call   1679 <peek>
    1be7:	85 c0                	test   %eax,%eax
    1be9:	0f 84 50 ff ff ff    	je     1b3f <parseexec+0x71>
    1bef:	eb 01                	jmp    1bf2 <parseexec+0x124>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    1bf1:	90                   	nop
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
    1bf2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1bf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bf8:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
    1bff:	00 
  cmd->eargv[argc] = 0;
    1c00:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c06:	83 c2 08             	add    $0x8,%edx
    1c09:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
    1c10:	00 
  return ret;
    1c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1c14:	c9                   	leave  
    1c15:	c3                   	ret    

00001c16 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    1c16:	55                   	push   %ebp
    1c17:	89 e5                	mov    %esp,%ebp
    1c19:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1c1c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    1c20:	75 0a                	jne    1c2c <nulterminate+0x16>
    return 0;
    1c22:	b8 00 00 00 00       	mov    $0x0,%eax
    1c27:	e9 c8 00 00 00       	jmp    1cf4 <nulterminate+0xde>
  
  switch(cmd->type){
    1c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1c2f:	8b 00                	mov    (%eax),%eax
    1c31:	83 f8 05             	cmp    $0x5,%eax
    1c34:	0f 87 b7 00 00 00    	ja     1cf1 <nulterminate+0xdb>
    1c3a:	8b 04 85 dc 27 00 00 	mov    0x27dc(,%eax,4),%eax
    1c41:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    1c43:	8b 45 08             	mov    0x8(%ebp),%eax
    1c46:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(i=0; ecmd->argv[i]; i++)
    1c49:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1c50:	eb 14                	jmp    1c66 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
    1c52:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1c55:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c58:	83 c2 08             	add    $0x8,%edx
    1c5b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
    1c5f:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
    1c62:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    1c66:	8b 55 e0             	mov    -0x20(%ebp),%edx
    1c69:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c6c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
    1c70:	85 c0                	test   %eax,%eax
    1c72:	75 de                	jne    1c52 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
    1c74:	eb 7b                	jmp    1cf1 <nulterminate+0xdb>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    1c76:	8b 45 08             	mov    0x8(%ebp),%eax
    1c79:	89 45 f4             	mov    %eax,-0xc(%ebp)
    nulterminate(rcmd->cmd);
    1c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c7f:	8b 40 04             	mov    0x4(%eax),%eax
    1c82:	89 04 24             	mov    %eax,(%esp)
    1c85:	e8 8c ff ff ff       	call   1c16 <nulterminate>
    *rcmd->efile = 0;
    1c8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c8d:	8b 40 0c             	mov    0xc(%eax),%eax
    1c90:	c6 00 00             	movb   $0x0,(%eax)
    break;
    1c93:	eb 5c                	jmp    1cf1 <nulterminate+0xdb>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    1c95:	8b 45 08             	mov    0x8(%ebp),%eax
    1c98:	89 45 f0             	mov    %eax,-0x10(%ebp)
    nulterminate(pcmd->left);
    1c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c9e:	8b 40 04             	mov    0x4(%eax),%eax
    1ca1:	89 04 24             	mov    %eax,(%esp)
    1ca4:	e8 6d ff ff ff       	call   1c16 <nulterminate>
    nulterminate(pcmd->right);
    1ca9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cac:	8b 40 08             	mov    0x8(%eax),%eax
    1caf:	89 04 24             	mov    %eax,(%esp)
    1cb2:	e8 5f ff ff ff       	call   1c16 <nulterminate>
    break;
    1cb7:	eb 38                	jmp    1cf1 <nulterminate+0xdb>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    1cb9:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(lcmd->left);
    1cbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1cc2:	8b 40 04             	mov    0x4(%eax),%eax
    1cc5:	89 04 24             	mov    %eax,(%esp)
    1cc8:	e8 49 ff ff ff       	call   1c16 <nulterminate>
    nulterminate(lcmd->right);
    1ccd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1cd0:	8b 40 08             	mov    0x8(%eax),%eax
    1cd3:	89 04 24             	mov    %eax,(%esp)
    1cd6:	e8 3b ff ff ff       	call   1c16 <nulterminate>
    break;
    1cdb:	eb 14                	jmp    1cf1 <nulterminate+0xdb>

  case BACK:
    bcmd = (struct backcmd*)cmd;
    1cdd:	8b 45 08             	mov    0x8(%ebp),%eax
    1ce0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(bcmd->cmd);
    1ce3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ce6:	8b 40 04             	mov    0x4(%eax),%eax
    1ce9:	89 04 24             	mov    %eax,(%esp)
    1cec:	e8 25 ff ff ff       	call   1c16 <nulterminate>
    break;
  }
  return cmd;
    1cf1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1cf4:	c9                   	leave  
    1cf5:	c3                   	ret    
    1cf6:	90                   	nop
    1cf7:	90                   	nop

00001cf8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1cf8:	55                   	push   %ebp
    1cf9:	89 e5                	mov    %esp,%ebp
    1cfb:	57                   	push   %edi
    1cfc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    1cfd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1d00:	8b 55 10             	mov    0x10(%ebp),%edx
    1d03:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d06:	89 cb                	mov    %ecx,%ebx
    1d08:	89 df                	mov    %ebx,%edi
    1d0a:	89 d1                	mov    %edx,%ecx
    1d0c:	fc                   	cld    
    1d0d:	f3 aa                	rep stos %al,%es:(%edi)
    1d0f:	89 ca                	mov    %ecx,%edx
    1d11:	89 fb                	mov    %edi,%ebx
    1d13:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1d16:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1d19:	5b                   	pop    %ebx
    1d1a:	5f                   	pop    %edi
    1d1b:	5d                   	pop    %ebp
    1d1c:	c3                   	ret    

00001d1d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1d1d:	55                   	push   %ebp
    1d1e:	89 e5                	mov    %esp,%ebp
    1d20:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1d23:	8b 45 08             	mov    0x8(%ebp),%eax
    1d26:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1d29:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d2c:	0f b6 10             	movzbl (%eax),%edx
    1d2f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d32:	88 10                	mov    %dl,(%eax)
    1d34:	8b 45 08             	mov    0x8(%ebp),%eax
    1d37:	0f b6 00             	movzbl (%eax),%eax
    1d3a:	84 c0                	test   %al,%al
    1d3c:	0f 95 c0             	setne  %al
    1d3f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1d43:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    1d47:	84 c0                	test   %al,%al
    1d49:	75 de                	jne    1d29 <strcpy+0xc>
    ;
  return os;
    1d4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1d4e:	c9                   	leave  
    1d4f:	c3                   	ret    

00001d50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1d50:	55                   	push   %ebp
    1d51:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    1d53:	eb 08                	jmp    1d5d <strcmp+0xd>
    p++, q++;
    1d55:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1d59:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1d5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1d60:	0f b6 00             	movzbl (%eax),%eax
    1d63:	84 c0                	test   %al,%al
    1d65:	74 10                	je     1d77 <strcmp+0x27>
    1d67:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6a:	0f b6 10             	movzbl (%eax),%edx
    1d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d70:	0f b6 00             	movzbl (%eax),%eax
    1d73:	38 c2                	cmp    %al,%dl
    1d75:	74 de                	je     1d55 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1d77:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7a:	0f b6 00             	movzbl (%eax),%eax
    1d7d:	0f b6 d0             	movzbl %al,%edx
    1d80:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d83:	0f b6 00             	movzbl (%eax),%eax
    1d86:	0f b6 c0             	movzbl %al,%eax
    1d89:	89 d1                	mov    %edx,%ecx
    1d8b:	29 c1                	sub    %eax,%ecx
    1d8d:	89 c8                	mov    %ecx,%eax
}
    1d8f:	5d                   	pop    %ebp
    1d90:	c3                   	ret    

00001d91 <strlen>:

uint
strlen(char *s)
{
    1d91:	55                   	push   %ebp
    1d92:	89 e5                	mov    %esp,%ebp
    1d94:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1d97:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    1d9e:	eb 04                	jmp    1da4 <strlen+0x13>
    1da0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1da4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1da7:	03 45 08             	add    0x8(%ebp),%eax
    1daa:	0f b6 00             	movzbl (%eax),%eax
    1dad:	84 c0                	test   %al,%al
    1daf:	75 ef                	jne    1da0 <strlen+0xf>
    ;
  return n;
    1db1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1db4:	c9                   	leave  
    1db5:	c3                   	ret    

00001db6 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1db6:	55                   	push   %ebp
    1db7:	89 e5                	mov    %esp,%ebp
    1db9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    1dbc:	8b 45 10             	mov    0x10(%ebp),%eax
    1dbf:	89 44 24 08          	mov    %eax,0x8(%esp)
    1dc3:	8b 45 0c             	mov    0xc(%ebp),%eax
    1dc6:	89 44 24 04          	mov    %eax,0x4(%esp)
    1dca:	8b 45 08             	mov    0x8(%ebp),%eax
    1dcd:	89 04 24             	mov    %eax,(%esp)
    1dd0:	e8 23 ff ff ff       	call   1cf8 <stosb>
  return dst;
    1dd5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1dd8:	c9                   	leave  
    1dd9:	c3                   	ret    

00001dda <strchr>:

char*
strchr(const char *s, char c)
{
    1dda:	55                   	push   %ebp
    1ddb:	89 e5                	mov    %esp,%ebp
    1ddd:	83 ec 04             	sub    $0x4,%esp
    1de0:	8b 45 0c             	mov    0xc(%ebp),%eax
    1de3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1de6:	eb 14                	jmp    1dfc <strchr+0x22>
    if(*s == c)
    1de8:	8b 45 08             	mov    0x8(%ebp),%eax
    1deb:	0f b6 00             	movzbl (%eax),%eax
    1dee:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1df1:	75 05                	jne    1df8 <strchr+0x1e>
      return (char*)s;
    1df3:	8b 45 08             	mov    0x8(%ebp),%eax
    1df6:	eb 13                	jmp    1e0b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1df8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    1dfc:	8b 45 08             	mov    0x8(%ebp),%eax
    1dff:	0f b6 00             	movzbl (%eax),%eax
    1e02:	84 c0                	test   %al,%al
    1e04:	75 e2                	jne    1de8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1e06:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1e0b:	c9                   	leave  
    1e0c:	c3                   	ret    

00001e0d <gets>:

char*
gets(char *buf, int max)
{
    1e0d:	55                   	push   %ebp
    1e0e:	89 e5                	mov    %esp,%ebp
    1e10:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1e13:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1e1a:	eb 44                	jmp    1e60 <gets+0x53>
    cc = read(0, &c, 1);
    1e1c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1e23:	00 
    1e24:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1e27:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e32:	e8 3d 01 00 00       	call   1f74 <read>
    1e37:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    1e3a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e3e:	7e 2d                	jle    1e6d <gets+0x60>
      break;
    buf[i++] = c;
    1e40:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e43:	03 45 08             	add    0x8(%ebp),%eax
    1e46:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    1e4a:	88 10                	mov    %dl,(%eax)
    1e4c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    1e50:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1e54:	3c 0a                	cmp    $0xa,%al
    1e56:	74 16                	je     1e6e <gets+0x61>
    1e58:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1e5c:	3c 0d                	cmp    $0xd,%al
    1e5e:	74 0e                	je     1e6e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1e60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e63:	83 c0 01             	add    $0x1,%eax
    1e66:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1e69:	7c b1                	jl     1e1c <gets+0xf>
    1e6b:	eb 01                	jmp    1e6e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    1e6d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1e6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e71:	03 45 08             	add    0x8(%ebp),%eax
    1e74:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    1e77:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1e7a:	c9                   	leave  
    1e7b:	c3                   	ret    

00001e7c <stat>:

int
stat(char *n, struct stat *st)
{
    1e7c:	55                   	push   %ebp
    1e7d:	89 e5                	mov    %esp,%ebp
    1e7f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1e82:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e89:	00 
    1e8a:	8b 45 08             	mov    0x8(%ebp),%eax
    1e8d:	89 04 24             	mov    %eax,(%esp)
    1e90:	e8 07 01 00 00       	call   1f9c <open>
    1e95:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1e98:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e9c:	79 07                	jns    1ea5 <stat+0x29>
    return -1;
    1e9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ea3:	eb 23                	jmp    1ec8 <stat+0x4c>
  r = fstat(fd, st);
    1ea5:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ea8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1eac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eaf:	89 04 24             	mov    %eax,(%esp)
    1eb2:	e8 fd 00 00 00       	call   1fb4 <fstat>
    1eb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    1eba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ebd:	89 04 24             	mov    %eax,(%esp)
    1ec0:	e8 bf 00 00 00       	call   1f84 <close>
  return r;
    1ec5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1ec8:	c9                   	leave  
    1ec9:	c3                   	ret    

00001eca <atoi>:

int
atoi(const char *s)
{
    1eca:	55                   	push   %ebp
    1ecb:	89 e5                	mov    %esp,%ebp
    1ecd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1ed0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1ed7:	eb 24                	jmp    1efd <atoi+0x33>
    n = n*10 + *s++ - '0';
    1ed9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    1edc:	89 d0                	mov    %edx,%eax
    1ede:	c1 e0 02             	shl    $0x2,%eax
    1ee1:	01 d0                	add    %edx,%eax
    1ee3:	01 c0                	add    %eax,%eax
    1ee5:	89 c2                	mov    %eax,%edx
    1ee7:	8b 45 08             	mov    0x8(%ebp),%eax
    1eea:	0f b6 00             	movzbl (%eax),%eax
    1eed:	0f be c0             	movsbl %al,%eax
    1ef0:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1ef3:	83 e8 30             	sub    $0x30,%eax
    1ef6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1ef9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1efd:	8b 45 08             	mov    0x8(%ebp),%eax
    1f00:	0f b6 00             	movzbl (%eax),%eax
    1f03:	3c 2f                	cmp    $0x2f,%al
    1f05:	7e 0a                	jle    1f11 <atoi+0x47>
    1f07:	8b 45 08             	mov    0x8(%ebp),%eax
    1f0a:	0f b6 00             	movzbl (%eax),%eax
    1f0d:	3c 39                	cmp    $0x39,%al
    1f0f:	7e c8                	jle    1ed9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1f11:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1f14:	c9                   	leave  
    1f15:	c3                   	ret    

00001f16 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1f16:	55                   	push   %ebp
    1f17:	89 e5                	mov    %esp,%ebp
    1f19:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    1f1c:	8b 45 08             	mov    0x8(%ebp),%eax
    1f1f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    1f22:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f25:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1f28:	eb 13                	jmp    1f3d <memmove+0x27>
    *dst++ = *src++;
    1f2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f2d:	0f b6 10             	movzbl (%eax),%edx
    1f30:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1f33:	88 10                	mov    %dl,(%eax)
    1f35:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1f39:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1f3d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    1f41:	0f 9f c0             	setg   %al
    1f44:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    1f48:	84 c0                	test   %al,%al
    1f4a:	75 de                	jne    1f2a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    1f4c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1f4f:	c9                   	leave  
    1f50:	c3                   	ret    
    1f51:	90                   	nop
    1f52:	90                   	nop
    1f53:	90                   	nop

00001f54 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1f54:	b8 01 00 00 00       	mov    $0x1,%eax
    1f59:	cd 40                	int    $0x40
    1f5b:	c3                   	ret    

00001f5c <exit>:
SYSCALL(exit)
    1f5c:	b8 02 00 00 00       	mov    $0x2,%eax
    1f61:	cd 40                	int    $0x40
    1f63:	c3                   	ret    

00001f64 <wait>:
SYSCALL(wait)
    1f64:	b8 03 00 00 00       	mov    $0x3,%eax
    1f69:	cd 40                	int    $0x40
    1f6b:	c3                   	ret    

00001f6c <pipe>:
SYSCALL(pipe)
    1f6c:	b8 04 00 00 00       	mov    $0x4,%eax
    1f71:	cd 40                	int    $0x40
    1f73:	c3                   	ret    

00001f74 <read>:
SYSCALL(read)
    1f74:	b8 05 00 00 00       	mov    $0x5,%eax
    1f79:	cd 40                	int    $0x40
    1f7b:	c3                   	ret    

00001f7c <write>:
SYSCALL(write)
    1f7c:	b8 10 00 00 00       	mov    $0x10,%eax
    1f81:	cd 40                	int    $0x40
    1f83:	c3                   	ret    

00001f84 <close>:
SYSCALL(close)
    1f84:	b8 15 00 00 00       	mov    $0x15,%eax
    1f89:	cd 40                	int    $0x40
    1f8b:	c3                   	ret    

00001f8c <kill>:
SYSCALL(kill)
    1f8c:	b8 06 00 00 00       	mov    $0x6,%eax
    1f91:	cd 40                	int    $0x40
    1f93:	c3                   	ret    

00001f94 <exec>:
SYSCALL(exec)
    1f94:	b8 07 00 00 00       	mov    $0x7,%eax
    1f99:	cd 40                	int    $0x40
    1f9b:	c3                   	ret    

00001f9c <open>:
SYSCALL(open)
    1f9c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1fa1:	cd 40                	int    $0x40
    1fa3:	c3                   	ret    

00001fa4 <mknod>:
SYSCALL(mknod)
    1fa4:	b8 11 00 00 00       	mov    $0x11,%eax
    1fa9:	cd 40                	int    $0x40
    1fab:	c3                   	ret    

00001fac <unlink>:
SYSCALL(unlink)
    1fac:	b8 12 00 00 00       	mov    $0x12,%eax
    1fb1:	cd 40                	int    $0x40
    1fb3:	c3                   	ret    

00001fb4 <fstat>:
SYSCALL(fstat)
    1fb4:	b8 08 00 00 00       	mov    $0x8,%eax
    1fb9:	cd 40                	int    $0x40
    1fbb:	c3                   	ret    

00001fbc <link>:
SYSCALL(link)
    1fbc:	b8 13 00 00 00       	mov    $0x13,%eax
    1fc1:	cd 40                	int    $0x40
    1fc3:	c3                   	ret    

00001fc4 <mkdir>:
SYSCALL(mkdir)
    1fc4:	b8 14 00 00 00       	mov    $0x14,%eax
    1fc9:	cd 40                	int    $0x40
    1fcb:	c3                   	ret    

00001fcc <chdir>:
SYSCALL(chdir)
    1fcc:	b8 09 00 00 00       	mov    $0x9,%eax
    1fd1:	cd 40                	int    $0x40
    1fd3:	c3                   	ret    

00001fd4 <dup>:
SYSCALL(dup)
    1fd4:	b8 0a 00 00 00       	mov    $0xa,%eax
    1fd9:	cd 40                	int    $0x40
    1fdb:	c3                   	ret    

00001fdc <getpid>:
SYSCALL(getpid)
    1fdc:	b8 0b 00 00 00       	mov    $0xb,%eax
    1fe1:	cd 40                	int    $0x40
    1fe3:	c3                   	ret    

00001fe4 <sbrk>:
SYSCALL(sbrk)
    1fe4:	b8 0c 00 00 00       	mov    $0xc,%eax
    1fe9:	cd 40                	int    $0x40
    1feb:	c3                   	ret    

00001fec <sleep>:
SYSCALL(sleep)
    1fec:	b8 0d 00 00 00       	mov    $0xd,%eax
    1ff1:	cd 40                	int    $0x40
    1ff3:	c3                   	ret    

00001ff4 <uptime>:
SYSCALL(uptime)
    1ff4:	b8 0e 00 00 00       	mov    $0xe,%eax
    1ff9:	cd 40                	int    $0x40
    1ffb:	c3                   	ret    

00001ffc <clone>:
SYSCALL(clone)
    1ffc:	b8 16 00 00 00       	mov    $0x16,%eax
    2001:	cd 40                	int    $0x40
    2003:	c3                   	ret    

00002004 <texit>:
SYSCALL(texit)
    2004:	b8 17 00 00 00       	mov    $0x17,%eax
    2009:	cd 40                	int    $0x40
    200b:	c3                   	ret    

0000200c <tsleep>:
SYSCALL(tsleep)
    200c:	b8 18 00 00 00       	mov    $0x18,%eax
    2011:	cd 40                	int    $0x40
    2013:	c3                   	ret    

00002014 <twakeup>:
SYSCALL(twakeup)
    2014:	b8 19 00 00 00       	mov    $0x19,%eax
    2019:	cd 40                	int    $0x40
    201b:	c3                   	ret    

0000201c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    201c:	55                   	push   %ebp
    201d:	89 e5                	mov    %esp,%ebp
    201f:	83 ec 28             	sub    $0x28,%esp
    2022:	8b 45 0c             	mov    0xc(%ebp),%eax
    2025:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    2028:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    202f:	00 
    2030:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2033:	89 44 24 04          	mov    %eax,0x4(%esp)
    2037:	8b 45 08             	mov    0x8(%ebp),%eax
    203a:	89 04 24             	mov    %eax,(%esp)
    203d:	e8 3a ff ff ff       	call   1f7c <write>
}
    2042:	c9                   	leave  
    2043:	c3                   	ret    

00002044 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    2044:	55                   	push   %ebp
    2045:	89 e5                	mov    %esp,%ebp
    2047:	53                   	push   %ebx
    2048:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    204b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2052:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2056:	74 17                	je     206f <printint+0x2b>
    2058:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    205c:	79 11                	jns    206f <printint+0x2b>
    neg = 1;
    205e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2065:	8b 45 0c             	mov    0xc(%ebp),%eax
    2068:	f7 d8                	neg    %eax
    206a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    206d:	eb 06                	jmp    2075 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    206f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2072:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    2075:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    207c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    207f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    2082:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2085:	ba 00 00 00 00       	mov    $0x0,%edx
    208a:	f7 f3                	div    %ebx
    208c:	89 d0                	mov    %edx,%eax
    208e:	0f b6 80 38 28 00 00 	movzbl 0x2838(%eax),%eax
    2095:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    2099:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    209d:	8b 45 10             	mov    0x10(%ebp),%eax
    20a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    20a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20a6:	ba 00 00 00 00       	mov    $0x0,%edx
    20ab:	f7 75 d4             	divl   -0x2c(%ebp)
    20ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    20b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20b5:	75 c5                	jne    207c <printint+0x38>
  if(neg)
    20b7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    20bb:	74 28                	je     20e5 <printint+0xa1>
    buf[i++] = '-';
    20bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20c0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    20c5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    20c9:	eb 1a                	jmp    20e5 <printint+0xa1>
    putc(fd, buf[i]);
    20cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20ce:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    20d3:	0f be c0             	movsbl %al,%eax
    20d6:	89 44 24 04          	mov    %eax,0x4(%esp)
    20da:	8b 45 08             	mov    0x8(%ebp),%eax
    20dd:	89 04 24             	mov    %eax,(%esp)
    20e0:	e8 37 ff ff ff       	call   201c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    20e5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    20e9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    20ed:	79 dc                	jns    20cb <printint+0x87>
    putc(fd, buf[i]);
}
    20ef:	83 c4 44             	add    $0x44,%esp
    20f2:	5b                   	pop    %ebx
    20f3:	5d                   	pop    %ebp
    20f4:	c3                   	ret    

000020f5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    20f5:	55                   	push   %ebp
    20f6:	89 e5                	mov    %esp,%ebp
    20f8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    20fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2102:	8d 45 0c             	lea    0xc(%ebp),%eax
    2105:	83 c0 04             	add    $0x4,%eax
    2108:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    210b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    2112:	e9 7e 01 00 00       	jmp    2295 <printf+0x1a0>
    c = fmt[i] & 0xff;
    2117:	8b 55 0c             	mov    0xc(%ebp),%edx
    211a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    211d:	8d 04 02             	lea    (%edx,%eax,1),%eax
    2120:	0f b6 00             	movzbl (%eax),%eax
    2123:	0f be c0             	movsbl %al,%eax
    2126:	25 ff 00 00 00       	and    $0xff,%eax
    212b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    212e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2132:	75 2c                	jne    2160 <printf+0x6b>
      if(c == '%'){
    2134:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    2138:	75 0c                	jne    2146 <printf+0x51>
        state = '%';
    213a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    2141:	e9 4b 01 00 00       	jmp    2291 <printf+0x19c>
      } else {
        putc(fd, c);
    2146:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2149:	0f be c0             	movsbl %al,%eax
    214c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2150:	8b 45 08             	mov    0x8(%ebp),%eax
    2153:	89 04 24             	mov    %eax,(%esp)
    2156:	e8 c1 fe ff ff       	call   201c <putc>
    215b:	e9 31 01 00 00       	jmp    2291 <printf+0x19c>
      }
    } else if(state == '%'){
    2160:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    2164:	0f 85 27 01 00 00    	jne    2291 <printf+0x19c>
      if(c == 'd'){
    216a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    216e:	75 2d                	jne    219d <printf+0xa8>
        printint(fd, *ap, 10, 1);
    2170:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2173:	8b 00                	mov    (%eax),%eax
    2175:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    217c:	00 
    217d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    2184:	00 
    2185:	89 44 24 04          	mov    %eax,0x4(%esp)
    2189:	8b 45 08             	mov    0x8(%ebp),%eax
    218c:	89 04 24             	mov    %eax,(%esp)
    218f:	e8 b0 fe ff ff       	call   2044 <printint>
        ap++;
    2194:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    2198:	e9 ed 00 00 00       	jmp    228a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    219d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    21a1:	74 06                	je     21a9 <printf+0xb4>
    21a3:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    21a7:	75 2d                	jne    21d6 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    21a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21ac:	8b 00                	mov    (%eax),%eax
    21ae:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    21b5:	00 
    21b6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    21bd:	00 
    21be:	89 44 24 04          	mov    %eax,0x4(%esp)
    21c2:	8b 45 08             	mov    0x8(%ebp),%eax
    21c5:	89 04 24             	mov    %eax,(%esp)
    21c8:	e8 77 fe ff ff       	call   2044 <printint>
        ap++;
    21cd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    21d1:	e9 b4 00 00 00       	jmp    228a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    21d6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    21da:	75 46                	jne    2222 <printf+0x12d>
        s = (char*)*ap;
    21dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21df:	8b 00                	mov    (%eax),%eax
    21e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    21e4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    21e8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    21ec:	75 27                	jne    2215 <printf+0x120>
          s = "(null)";
    21ee:	c7 45 e4 f4 27 00 00 	movl   $0x27f4,-0x1c(%ebp)
        while(*s != 0){
    21f5:	eb 1f                	jmp    2216 <printf+0x121>
          putc(fd, *s);
    21f7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    21fa:	0f b6 00             	movzbl (%eax),%eax
    21fd:	0f be c0             	movsbl %al,%eax
    2200:	89 44 24 04          	mov    %eax,0x4(%esp)
    2204:	8b 45 08             	mov    0x8(%ebp),%eax
    2207:	89 04 24             	mov    %eax,(%esp)
    220a:	e8 0d fe ff ff       	call   201c <putc>
          s++;
    220f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    2213:	eb 01                	jmp    2216 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2215:	90                   	nop
    2216:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2219:	0f b6 00             	movzbl (%eax),%eax
    221c:	84 c0                	test   %al,%al
    221e:	75 d7                	jne    21f7 <printf+0x102>
    2220:	eb 68                	jmp    228a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    2222:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    2226:	75 1d                	jne    2245 <printf+0x150>
        putc(fd, *ap);
    2228:	8b 45 f4             	mov    -0xc(%ebp),%eax
    222b:	8b 00                	mov    (%eax),%eax
    222d:	0f be c0             	movsbl %al,%eax
    2230:	89 44 24 04          	mov    %eax,0x4(%esp)
    2234:	8b 45 08             	mov    0x8(%ebp),%eax
    2237:	89 04 24             	mov    %eax,(%esp)
    223a:	e8 dd fd ff ff       	call   201c <putc>
        ap++;
    223f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    2243:	eb 45                	jmp    228a <printf+0x195>
      } else if(c == '%'){
    2245:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    2249:	75 17                	jne    2262 <printf+0x16d>
        putc(fd, c);
    224b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    224e:	0f be c0             	movsbl %al,%eax
    2251:	89 44 24 04          	mov    %eax,0x4(%esp)
    2255:	8b 45 08             	mov    0x8(%ebp),%eax
    2258:	89 04 24             	mov    %eax,(%esp)
    225b:	e8 bc fd ff ff       	call   201c <putc>
    2260:	eb 28                	jmp    228a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    2262:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    2269:	00 
    226a:	8b 45 08             	mov    0x8(%ebp),%eax
    226d:	89 04 24             	mov    %eax,(%esp)
    2270:	e8 a7 fd ff ff       	call   201c <putc>
        putc(fd, c);
    2275:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2278:	0f be c0             	movsbl %al,%eax
    227b:	89 44 24 04          	mov    %eax,0x4(%esp)
    227f:	8b 45 08             	mov    0x8(%ebp),%eax
    2282:	89 04 24             	mov    %eax,(%esp)
    2285:	e8 92 fd ff ff       	call   201c <putc>
      }
      state = 0;
    228a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2291:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    2295:	8b 55 0c             	mov    0xc(%ebp),%edx
    2298:	8b 45 ec             	mov    -0x14(%ebp),%eax
    229b:	8d 04 02             	lea    (%edx,%eax,1),%eax
    229e:	0f b6 00             	movzbl (%eax),%eax
    22a1:	84 c0                	test   %al,%al
    22a3:	0f 85 6e fe ff ff    	jne    2117 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    22a9:	c9                   	leave  
    22aa:	c3                   	ret    
    22ab:	90                   	nop

000022ac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    22ac:	55                   	push   %ebp
    22ad:	89 e5                	mov    %esp,%ebp
    22af:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    22b2:	8b 45 08             	mov    0x8(%ebp),%eax
    22b5:	83 e8 08             	sub    $0x8,%eax
    22b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    22bb:	a1 cc 28 00 00       	mov    0x28cc,%eax
    22c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    22c3:	eb 24                	jmp    22e9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    22c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22c8:	8b 00                	mov    (%eax),%eax
    22ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    22cd:	77 12                	ja     22e1 <free+0x35>
    22cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    22d5:	77 24                	ja     22fb <free+0x4f>
    22d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22da:	8b 00                	mov    (%eax),%eax
    22dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    22df:	77 1a                	ja     22fb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    22e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22e4:	8b 00                	mov    (%eax),%eax
    22e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    22e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    22ef:	76 d4                	jbe    22c5 <free+0x19>
    22f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    22f4:	8b 00                	mov    (%eax),%eax
    22f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    22f9:	76 ca                	jbe    22c5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    22fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22fe:	8b 40 04             	mov    0x4(%eax),%eax
    2301:	c1 e0 03             	shl    $0x3,%eax
    2304:	89 c2                	mov    %eax,%edx
    2306:	03 55 f8             	add    -0x8(%ebp),%edx
    2309:	8b 45 fc             	mov    -0x4(%ebp),%eax
    230c:	8b 00                	mov    (%eax),%eax
    230e:	39 c2                	cmp    %eax,%edx
    2310:	75 24                	jne    2336 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    2312:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2315:	8b 50 04             	mov    0x4(%eax),%edx
    2318:	8b 45 fc             	mov    -0x4(%ebp),%eax
    231b:	8b 00                	mov    (%eax),%eax
    231d:	8b 40 04             	mov    0x4(%eax),%eax
    2320:	01 c2                	add    %eax,%edx
    2322:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2325:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    2328:	8b 45 fc             	mov    -0x4(%ebp),%eax
    232b:	8b 00                	mov    (%eax),%eax
    232d:	8b 10                	mov    (%eax),%edx
    232f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2332:	89 10                	mov    %edx,(%eax)
    2334:	eb 0a                	jmp    2340 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    2336:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2339:	8b 10                	mov    (%eax),%edx
    233b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    233e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    2340:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2343:	8b 40 04             	mov    0x4(%eax),%eax
    2346:	c1 e0 03             	shl    $0x3,%eax
    2349:	03 45 fc             	add    -0x4(%ebp),%eax
    234c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    234f:	75 20                	jne    2371 <free+0xc5>
    p->s.size += bp->s.size;
    2351:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2354:	8b 50 04             	mov    0x4(%eax),%edx
    2357:	8b 45 f8             	mov    -0x8(%ebp),%eax
    235a:	8b 40 04             	mov    0x4(%eax),%eax
    235d:	01 c2                	add    %eax,%edx
    235f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2362:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2365:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2368:	8b 10                	mov    (%eax),%edx
    236a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    236d:	89 10                	mov    %edx,(%eax)
    236f:	eb 08                	jmp    2379 <free+0xcd>
  } else
    p->s.ptr = bp;
    2371:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2374:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2377:	89 10                	mov    %edx,(%eax)
  freep = p;
    2379:	8b 45 fc             	mov    -0x4(%ebp),%eax
    237c:	a3 cc 28 00 00       	mov    %eax,0x28cc
}
    2381:	c9                   	leave  
    2382:	c3                   	ret    

00002383 <morecore>:

static Header*
morecore(uint nu)
{
    2383:	55                   	push   %ebp
    2384:	89 e5                	mov    %esp,%ebp
    2386:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    2389:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    2390:	77 07                	ja     2399 <morecore+0x16>
    nu = 4096;
    2392:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    2399:	8b 45 08             	mov    0x8(%ebp),%eax
    239c:	c1 e0 03             	shl    $0x3,%eax
    239f:	89 04 24             	mov    %eax,(%esp)
    23a2:	e8 3d fc ff ff       	call   1fe4 <sbrk>
    23a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    23aa:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    23ae:	75 07                	jne    23b7 <morecore+0x34>
    return 0;
    23b0:	b8 00 00 00 00       	mov    $0x0,%eax
    23b5:	eb 22                	jmp    23d9 <morecore+0x56>
  hp = (Header*)p;
    23b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    23bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23c0:	8b 55 08             	mov    0x8(%ebp),%edx
    23c3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    23c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23c9:	83 c0 08             	add    $0x8,%eax
    23cc:	89 04 24             	mov    %eax,(%esp)
    23cf:	e8 d8 fe ff ff       	call   22ac <free>
  return freep;
    23d4:	a1 cc 28 00 00       	mov    0x28cc,%eax
}
    23d9:	c9                   	leave  
    23da:	c3                   	ret    

000023db <malloc>:

void*
malloc(uint nbytes)
{
    23db:	55                   	push   %ebp
    23dc:	89 e5                	mov    %esp,%ebp
    23de:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    23e1:	8b 45 08             	mov    0x8(%ebp),%eax
    23e4:	83 c0 07             	add    $0x7,%eax
    23e7:	c1 e8 03             	shr    $0x3,%eax
    23ea:	83 c0 01             	add    $0x1,%eax
    23ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    23f0:	a1 cc 28 00 00       	mov    0x28cc,%eax
    23f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    23f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    23fc:	75 23                	jne    2421 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    23fe:	c7 45 f0 c4 28 00 00 	movl   $0x28c4,-0x10(%ebp)
    2405:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2408:	a3 cc 28 00 00       	mov    %eax,0x28cc
    240d:	a1 cc 28 00 00       	mov    0x28cc,%eax
    2412:	a3 c4 28 00 00       	mov    %eax,0x28c4
    base.s.size = 0;
    2417:	c7 05 c8 28 00 00 00 	movl   $0x0,0x28c8
    241e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2421:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2424:	8b 00                	mov    (%eax),%eax
    2426:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    2429:	8b 45 ec             	mov    -0x14(%ebp),%eax
    242c:	8b 40 04             	mov    0x4(%eax),%eax
    242f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2432:	72 4d                	jb     2481 <malloc+0xa6>
      if(p->s.size == nunits)
    2434:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2437:	8b 40 04             	mov    0x4(%eax),%eax
    243a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    243d:	75 0c                	jne    244b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    243f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2442:	8b 10                	mov    (%eax),%edx
    2444:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2447:	89 10                	mov    %edx,(%eax)
    2449:	eb 26                	jmp    2471 <malloc+0x96>
      else {
        p->s.size -= nunits;
    244b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    244e:	8b 40 04             	mov    0x4(%eax),%eax
    2451:	89 c2                	mov    %eax,%edx
    2453:	2b 55 f4             	sub    -0xc(%ebp),%edx
    2456:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2459:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    245c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    245f:	8b 40 04             	mov    0x4(%eax),%eax
    2462:	c1 e0 03             	shl    $0x3,%eax
    2465:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    2468:	8b 45 ec             	mov    -0x14(%ebp),%eax
    246b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    246e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    2471:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2474:	a3 cc 28 00 00       	mov    %eax,0x28cc
      return (void*)(p + 1);
    2479:	8b 45 ec             	mov    -0x14(%ebp),%eax
    247c:	83 c0 08             	add    $0x8,%eax
    247f:	eb 38                	jmp    24b9 <malloc+0xde>
    }
    if(p == freep)
    2481:	a1 cc 28 00 00       	mov    0x28cc,%eax
    2486:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    2489:	75 1b                	jne    24a6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    248b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    248e:	89 04 24             	mov    %eax,(%esp)
    2491:	e8 ed fe ff ff       	call   2383 <morecore>
    2496:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2499:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    249d:	75 07                	jne    24a6 <malloc+0xcb>
        return 0;
    249f:	b8 00 00 00 00       	mov    $0x0,%eax
    24a4:	eb 13                	jmp    24b9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    24a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    24ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24af:	8b 00                	mov    (%eax),%eax
    24b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    24b4:	e9 70 ff ff ff       	jmp    2429 <malloc+0x4e>
}
    24b9:	c9                   	leave  
    24ba:	c3                   	ret    
    24bb:	90                   	nop

000024bc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    24bc:	55                   	push   %ebp
    24bd:	89 e5                	mov    %esp,%ebp
    24bf:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    24c2:	8b 55 08             	mov    0x8(%ebp),%edx
    24c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    24c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    24cb:	f0 87 02             	lock xchg %eax,(%edx)
    24ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    24d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    24d4:	c9                   	leave  
    24d5:	c3                   	ret    

000024d6 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    24d6:	55                   	push   %ebp
    24d7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    24d9:	8b 45 08             	mov    0x8(%ebp),%eax
    24dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    24e2:	5d                   	pop    %ebp
    24e3:	c3                   	ret    

000024e4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    24e4:	55                   	push   %ebp
    24e5:	89 e5                	mov    %esp,%ebp
    24e7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    24ea:	8b 45 08             	mov    0x8(%ebp),%eax
    24ed:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    24f4:	00 
    24f5:	89 04 24             	mov    %eax,(%esp)
    24f8:	e8 bf ff ff ff       	call   24bc <xchg>
    24fd:	85 c0                	test   %eax,%eax
    24ff:	75 e9                	jne    24ea <lock_acquire+0x6>
}
    2501:	c9                   	leave  
    2502:	c3                   	ret    

00002503 <lock_release>:
void lock_release(lock_t *lock){
    2503:	55                   	push   %ebp
    2504:	89 e5                	mov    %esp,%ebp
    2506:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    2509:	8b 45 08             	mov    0x8(%ebp),%eax
    250c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2513:	00 
    2514:	89 04 24             	mov    %eax,(%esp)
    2517:	e8 a0 ff ff ff       	call   24bc <xchg>
}
    251c:	c9                   	leave  
    251d:	c3                   	ret    

0000251e <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    251e:	55                   	push   %ebp
    251f:	89 e5                	mov    %esp,%ebp
    2521:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    2524:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    252b:	e8 ab fe ff ff       	call   23db <malloc>
    2530:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    2533:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2536:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    2539:	8b 45 f0             	mov    -0x10(%ebp),%eax
    253c:	25 ff 0f 00 00       	and    $0xfff,%eax
    2541:	85 c0                	test   %eax,%eax
    2543:	74 15                	je     255a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    2545:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2548:	89 c2                	mov    %eax,%edx
    254a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    2550:	b8 00 10 00 00       	mov    $0x1000,%eax
    2555:	29 d0                	sub    %edx,%eax
    2557:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    255a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    255e:	75 1b                	jne    257b <thread_create+0x5d>

        printf(1,"malloc fail \n");
    2560:	c7 44 24 04 fb 27 00 	movl   $0x27fb,0x4(%esp)
    2567:	00 
    2568:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    256f:	e8 81 fb ff ff       	call   20f5 <printf>
        return 0;
    2574:	b8 00 00 00 00       	mov    $0x0,%eax
    2579:	eb 6f                	jmp    25ea <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    257b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    257e:	8b 55 08             	mov    0x8(%ebp),%edx
    2581:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2584:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2588:	89 54 24 08          	mov    %edx,0x8(%esp)
    258c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    2593:	00 
    2594:	89 04 24             	mov    %eax,(%esp)
    2597:	e8 60 fa ff ff       	call   1ffc <clone>
    259c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    259f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25a3:	79 1b                	jns    25c0 <thread_create+0xa2>
        printf(1,"clone fails\n");
    25a5:	c7 44 24 04 09 28 00 	movl   $0x2809,0x4(%esp)
    25ac:	00 
    25ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25b4:	e8 3c fb ff ff       	call   20f5 <printf>
        return 0;
    25b9:	b8 00 00 00 00       	mov    $0x0,%eax
    25be:	eb 2a                	jmp    25ea <thread_create+0xcc>
    }
    if(tid > 0){
    25c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25c4:	7e 05                	jle    25cb <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    25c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25c9:	eb 1f                	jmp    25ea <thread_create+0xcc>
    }
    if(tid == 0){
    25cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    25cf:	75 14                	jne    25e5 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    25d1:	c7 44 24 04 16 28 00 	movl   $0x2816,0x4(%esp)
    25d8:	00 
    25d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25e0:	e8 10 fb ff ff       	call   20f5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    25e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    25ea:	c9                   	leave  
    25eb:	c3                   	ret    

000025ec <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    25ec:	55                   	push   %ebp
    25ed:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    25ef:	8b 45 08             	mov    0x8(%ebp),%eax
    25f2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    25f8:	8b 45 08             	mov    0x8(%ebp),%eax
    25fb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    2602:	8b 45 08             	mov    0x8(%ebp),%eax
    2605:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    260c:	5d                   	pop    %ebp
    260d:	c3                   	ret    

0000260e <add_q>:

void add_q(struct queue *q, int v){
    260e:	55                   	push   %ebp
    260f:	89 e5                	mov    %esp,%ebp
    2611:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    2614:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    261b:	e8 bb fd ff ff       	call   23db <malloc>
    2620:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    2623:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2626:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    262d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2630:	8b 55 0c             	mov    0xc(%ebp),%edx
    2633:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    2635:	8b 45 08             	mov    0x8(%ebp),%eax
    2638:	8b 40 04             	mov    0x4(%eax),%eax
    263b:	85 c0                	test   %eax,%eax
    263d:	75 0b                	jne    264a <add_q+0x3c>
        q->head = n;
    263f:	8b 45 08             	mov    0x8(%ebp),%eax
    2642:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2645:	89 50 04             	mov    %edx,0x4(%eax)
    2648:	eb 0c                	jmp    2656 <add_q+0x48>
    }else{
        q->tail->next = n;
    264a:	8b 45 08             	mov    0x8(%ebp),%eax
    264d:	8b 40 08             	mov    0x8(%eax),%eax
    2650:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2653:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    2656:	8b 45 08             	mov    0x8(%ebp),%eax
    2659:	8b 55 f4             	mov    -0xc(%ebp),%edx
    265c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    265f:	8b 45 08             	mov    0x8(%ebp),%eax
    2662:	8b 00                	mov    (%eax),%eax
    2664:	8d 50 01             	lea    0x1(%eax),%edx
    2667:	8b 45 08             	mov    0x8(%ebp),%eax
    266a:	89 10                	mov    %edx,(%eax)
}
    266c:	c9                   	leave  
    266d:	c3                   	ret    

0000266e <empty_q>:

int empty_q(struct queue *q){
    266e:	55                   	push   %ebp
    266f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    2671:	8b 45 08             	mov    0x8(%ebp),%eax
    2674:	8b 00                	mov    (%eax),%eax
    2676:	85 c0                	test   %eax,%eax
    2678:	75 07                	jne    2681 <empty_q+0x13>
        return 1;
    267a:	b8 01 00 00 00       	mov    $0x1,%eax
    267f:	eb 05                	jmp    2686 <empty_q+0x18>
    else
        return 0;
    2681:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    2686:	5d                   	pop    %ebp
    2687:	c3                   	ret    

00002688 <pop_q>:
int pop_q(struct queue *q){
    2688:	55                   	push   %ebp
    2689:	89 e5                	mov    %esp,%ebp
    268b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    268e:	8b 45 08             	mov    0x8(%ebp),%eax
    2691:	89 04 24             	mov    %eax,(%esp)
    2694:	e8 d5 ff ff ff       	call   266e <empty_q>
    2699:	85 c0                	test   %eax,%eax
    269b:	75 5d                	jne    26fa <pop_q+0x72>
       val = q->head->value; 
    269d:	8b 45 08             	mov    0x8(%ebp),%eax
    26a0:	8b 40 04             	mov    0x4(%eax),%eax
    26a3:	8b 00                	mov    (%eax),%eax
    26a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    26a8:	8b 45 08             	mov    0x8(%ebp),%eax
    26ab:	8b 40 04             	mov    0x4(%eax),%eax
    26ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    26b1:	8b 45 08             	mov    0x8(%ebp),%eax
    26b4:	8b 40 04             	mov    0x4(%eax),%eax
    26b7:	8b 50 04             	mov    0x4(%eax),%edx
    26ba:	8b 45 08             	mov    0x8(%ebp),%eax
    26bd:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    26c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26c3:	89 04 24             	mov    %eax,(%esp)
    26c6:	e8 e1 fb ff ff       	call   22ac <free>
       q->size--;
    26cb:	8b 45 08             	mov    0x8(%ebp),%eax
    26ce:	8b 00                	mov    (%eax),%eax
    26d0:	8d 50 ff             	lea    -0x1(%eax),%edx
    26d3:	8b 45 08             	mov    0x8(%ebp),%eax
    26d6:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    26d8:	8b 45 08             	mov    0x8(%ebp),%eax
    26db:	8b 00                	mov    (%eax),%eax
    26dd:	85 c0                	test   %eax,%eax
    26df:	75 14                	jne    26f5 <pop_q+0x6d>
            q->head = 0;
    26e1:	8b 45 08             	mov    0x8(%ebp),%eax
    26e4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    26eb:	8b 45 08             	mov    0x8(%ebp),%eax
    26ee:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    26f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    26f8:	eb 05                	jmp    26ff <pop_q+0x77>
    }
    return -1;
    26fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    26ff:	c9                   	leave  
    2700:	c3                   	ret    
