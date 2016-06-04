
_frisbee:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
void pass_next(void *arg);
int lookup();



int main(int argc, char *argv[]){
    1000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	ff 71 fc             	pushl  -0x4(%ecx)
    100a:	55                   	push   %ebp
    100b:	89 e5                	mov    %esp,%ebp
    100d:	57                   	push   %edi
    100e:	56                   	push   %esi
    100f:	53                   	push   %ebx
    1010:	51                   	push   %ecx
    1011:	83 ec 58             	sub    $0x58,%esp
    1014:	89 cb                	mov    %ecx,%ebx

    int i;
    struct thread *t;
//    void * sp;

    if(argc != 3){
    1016:	83 3b 03             	cmpl   $0x3,(%ebx)
    1019:	74 19                	je     1034 <main+0x34>
        printf(1,"argc is not match !\n");
    101b:	c7 44 24 04 74 1e 00 	movl   $0x1e74,0x4(%esp)
    1022:	00 
    1023:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    102a:	e8 36 08 00 00       	call   1865 <printf>
        exit();
    102f:	e8 98 06 00 00       	call   16cc <exit>
    }
    numthreads = atoi(argv[1]);
    1034:	8b 43 04             	mov    0x4(%ebx),%eax
    1037:	83 c0 04             	add    $0x4,%eax
    103a:	8b 00                	mov    (%eax),%eax
    103c:	89 04 24             	mov    %eax,(%esp)
    103f:	e8 f6 05 00 00       	call   163a <atoi>
    1044:	a3 a0 1f 00 00       	mov    %eax,0x1fa0
    numpass = atoi(argv[2]);
    1049:	8b 43 04             	mov    0x4(%ebx),%eax
    104c:	83 c0 08             	add    $0x8,%eax
    104f:	8b 00                	mov    (%eax),%eax
    1051:	89 04 24             	mov    %eax,(%esp)
    1054:	e8 e1 05 00 00       	call   163a <atoi>
    1059:	a3 a4 1f 00 00       	mov    %eax,0x1fa4

    void * slist[numthreads];
    105e:	8b 0d a0 1f 00 00    	mov    0x1fa0,%ecx
    1064:	8d 41 ff             	lea    -0x1(%ecx),%eax
    1067:	89 45 d0             	mov    %eax,-0x30(%ebp)
    106a:	89 c8                	mov    %ecx,%eax
    106c:	ba 00 00 00 00       	mov    $0x0,%edx
    1071:	89 c6                	mov    %eax,%esi
    1073:	83 e6 ff             	and    $0xffffffff,%esi
    1076:	89 d7                	mov    %edx,%edi
    1078:	83 e7 0f             	and    $0xf,%edi
    107b:	89 f0                	mov    %esi,%eax
    107d:	89 fa                	mov    %edi,%edx
    107f:	0f a4 c2 05          	shld   $0x5,%eax,%edx
    1083:	c1 e0 05             	shl    $0x5,%eax
    1086:	89 c3                	mov    %eax,%ebx
    1088:	80 e7 ff             	and    $0xff,%bh
    108b:	89 5d c0             	mov    %ebx,-0x40(%ebp)
    108e:	89 d3                	mov    %edx,%ebx
    1090:	83 e3 0f             	and    $0xf,%ebx
    1093:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
    1096:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1099:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    109c:	89 c8                	mov    %ecx,%eax
    109e:	ba 00 00 00 00       	mov    $0x0,%edx
    10a3:	89 c3                	mov    %eax,%ebx
    10a5:	80 e7 ff             	and    $0xff,%bh
    10a8:	89 5d b8             	mov    %ebx,-0x48(%ebp)
    10ab:	89 d3                	mov    %edx,%ebx
    10ad:	83 e3 0f             	and    $0xf,%ebx
    10b0:	89 5d bc             	mov    %ebx,-0x44(%ebp)
    10b3:	8b 45 b8             	mov    -0x48(%ebp),%eax
    10b6:	8b 55 bc             	mov    -0x44(%ebp),%edx
    10b9:	0f a4 c2 05          	shld   $0x5,%eax,%edx
    10bd:	c1 e0 05             	shl    $0x5,%eax
    10c0:	89 c3                	mov    %eax,%ebx
    10c2:	80 e7 ff             	and    $0xff,%bh
    10c5:	89 5d b0             	mov    %ebx,-0x50(%ebp)
    10c8:	89 d3                	mov    %edx,%ebx
    10ca:	83 e3 0f             	and    $0xf,%ebx
    10cd:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
    10d0:	8b 45 b0             	mov    -0x50(%ebp),%eax
    10d3:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    10d6:	89 c8                	mov    %ecx,%eax
    10d8:	c1 e0 02             	shl    $0x2,%eax
    10db:	83 c0 0f             	add    $0xf,%eax
    10de:	83 c0 0f             	add    $0xf,%eax
    10e1:	c1 e8 04             	shr    $0x4,%eax
    10e4:	c1 e0 04             	shl    $0x4,%eax
    10e7:	29 c4                	sub    %eax,%esp
    10e9:	8d 44 24 0c          	lea    0xc(%esp),%eax
    10ed:	83 c0 0f             	add    $0xf,%eax
    10f0:	c1 e8 04             	shr    $0x4,%eax
    10f3:	c1 e0 04             	shl    $0x4,%eax
    10f6:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    //init ttable;
    lock_init(&ttable.lock);
    10f9:	c7 04 24 c0 1f 00 00 	movl   $0x1fc0,(%esp)
    1100:	e8 41 0b 00 00       	call   1c46 <lock_init>
    ttable.total = 0;
    1105:	c7 05 c4 21 00 00 00 	movl   $0x0,0x21c4
    110c:	00 00 00 
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    110f:	c7 45 dc c4 1f 00 00 	movl   $0x1fc4,-0x24(%ebp)
    1116:	eb 0d                	jmp    1125 <main+0x125>
        t->tid = 0;
    1118:	8b 45 dc             	mov    -0x24(%ebp),%eax
    111b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    void * slist[numthreads];

    //init ttable;
    lock_init(&ttable.lock);
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    1121:	83 45 dc 08          	addl   $0x8,-0x24(%ebp)
    1125:	b8 c4 21 00 00       	mov    $0x21c4,%eax
    112a:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    112d:	72 e9                	jb     1118 <main+0x118>
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
    112f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1136:	eb 11                	jmp    1149 <main+0x149>
        slist[i]=0;
    1138:	8b 55 d8             	mov    -0x28(%ebp),%edx
    113b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    113e:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
    1145:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1149:	83 7d d8 3f          	cmpl   $0x3f,-0x28(%ebp)
    114d:	7e e9                	jle    1138 <main+0x138>
        slist[i]=0;
    }
    //init frisbee
    lock_init(&frisbee.lock);
    114f:	c7 04 24 c8 21 00 00 	movl   $0x21c8,(%esp)
    1156:	e8 eb 0a 00 00       	call   1c46 <lock_init>
    frisbee.pass = 0;
    115b:	c7 05 cc 21 00 00 00 	movl   $0x0,0x21cc
    1162:	00 00 00 
    frisbee.holding_thread = 0;
    1165:	c7 05 d0 21 00 00 00 	movl   $0x0,0x21d0
    116c:	00 00 00 

    printf(1,"\nnum of threads %d \n",numthreads);
    116f:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
    1174:	89 44 24 08          	mov    %eax,0x8(%esp)
    1178:	c7 44 24 04 89 1e 00 	movl   $0x1e89,0x4(%esp)
    117f:	00 
    1180:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1187:	e8 d9 06 00 00       	call   1865 <printf>
    printf(1,"num of passes %d \n\n",numpass);
    118c:	a1 a4 1f 00 00       	mov    0x1fa4,%eax
    1191:	89 44 24 08          	mov    %eax,0x8(%esp)
    1195:	c7 44 24 04 9e 1e 00 	movl   $0x1e9e,0x4(%esp)
    119c:	00 
    119d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11a4:	e8 bc 06 00 00       	call   1865 <printf>


    for(i=0; i<numthreads;i++){
    11a9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    11b0:	eb 43                	jmp    11f5 <main+0x1f5>
        void *stack = thread_create(pass_next,(void *)0);      
    11b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b9:	00 
    11ba:	c7 04 24 a0 12 00 00 	movl   $0x12a0,(%esp)
    11c1:	e8 c8 0a 00 00       	call   1c8e <thread_create>
    11c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
        if(stack == 0)
    11c9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    11cd:	75 16                	jne    11e5 <main+0x1e5>
            printf(1,"thread_create fail\n");
    11cf:	c7 44 24 04 b2 1e 00 	movl   $0x1eb2,0x4(%esp)
    11d6:	00 
    11d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11de:	e8 82 06 00 00       	call   1865 <printf>
    11e3:	eb 0c                	jmp    11f1 <main+0x1f1>
        else{
            slist[i] = stack;
    11e5:	8b 55 d8             	mov    -0x28(%ebp),%edx
    11e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    11eb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    11ee:	89 0c 90             	mov    %ecx,(%eax,%edx,4)

    printf(1,"\nnum of threads %d \n",numthreads);
    printf(1,"num of passes %d \n\n",numpass);


    for(i=0; i<numthreads;i++){
    11f1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    11f5:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
    11fa:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    11fd:	7c b3                	jl     11b2 <main+0x1b2>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
    11ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1206:	eb 0e                	jmp    1216 <main+0x216>
        if(wait() == -1)
    1208:	e8 c7 04 00 00       	call   16d4 <wait>
    120d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1210:	74 10                	je     1222 <main+0x222>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
    1212:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1216:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
    121b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    121e:	7c e8                	jl     1208 <main+0x208>
    1220:	eb 01                	jmp    1223 <main+0x223>
        if(wait() == -1)
            break;
    1222:	90                   	nop
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    1223:	c7 45 dc c4 1f 00 00 	movl   $0x1fc4,-0x24(%ebp)
    122a:	eb 2a                	jmp    1256 <main+0x256>
        if(t->tid != 0)
    122c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    122f:	8b 00                	mov    (%eax),%eax
    1231:	85 c0                	test   %eax,%eax
    1233:	74 1d                	je     1252 <main+0x252>
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    1235:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1238:	8b 00                	mov    (%eax),%eax
    123a:	89 44 24 08          	mov    %eax,0x8(%esp)
    123e:	c7 44 24 04 c8 1e 00 	movl   $0x1ec8,0x4(%esp)
    1245:	00 
    1246:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    124d:	e8 13 06 00 00       	call   1865 <printf>
    for(i=0;i<numthreads;i++){
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    1252:	83 45 dc 08          	addl   $0x8,-0x24(%ebp)
    1256:	b8 c4 21 00 00       	mov    $0x21c4,%eax
    125b:	39 45 dc             	cmp    %eax,-0x24(%ebp)
    125e:	72 cc                	jb     122c <main+0x22c>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
    1260:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1267:	eb 28                	jmp    1291 <main+0x291>
        if(slist[i] != 0){
    1269:	8b 55 d8             	mov    -0x28(%ebp),%edx
    126c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    126f:	8b 04 90             	mov    (%eax,%edx,4),%eax
    1272:	85 c0                	test   %eax,%eax
    1274:	74 17                	je     128d <main+0x28d>
            void * f = slist[i];
    1276:	8b 55 d8             	mov    -0x28(%ebp),%edx
    1279:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    127c:	8b 04 90             	mov    (%eax,%edx,4),%eax
    127f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            free(f);
    1282:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1285:	89 04 24             	mov    %eax,(%esp)
    1288:	e8 8f 07 00 00       	call   1a1c <free>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
    128d:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    1291:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
    1296:	39 45 d8             	cmp    %eax,-0x28(%ebp)
    1299:	7c ce                	jl     1269 <main+0x269>
        if(slist[i] != 0){
            void * f = slist[i];
            free(f);
        }
    }
    exit();
    129b:	e8 2c 04 00 00       	call   16cc <exit>

000012a0 <pass_next>:
}

void pass_next(void *arg){
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	83 ec 28             	sub    $0x28,%esp
    struct thread *t;
    int tid;

    tid = getpid();
    12a6:	e8 a1 04 00 00       	call   174c <getpid>
    12ab:	89 45 f4             	mov    %eax,-0xc(%ebp)

    lock_acquire(&ttable.lock);
    12ae:	c7 04 24 c0 1f 00 00 	movl   $0x1fc0,(%esp)
    12b5:	e8 9a 09 00 00       	call   1c54 <lock_acquire>
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    12ba:	c7 45 f0 c4 1f 00 00 	movl   $0x1fc4,-0x10(%ebp)
    12c1:	eb 17                	jmp    12da <pass_next+0x3a>
        if(t->tid == 0){
    12c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12c6:	8b 00                	mov    (%eax),%eax
    12c8:	85 c0                	test   %eax,%eax
    12ca:	75 0a                	jne    12d6 <pass_next+0x36>
            t->tid = tid;
    12cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    12d2:	89 10                	mov    %edx,(%eax)
            break;
    12d4:	eb 0e                	jmp    12e4 <pass_next+0x44>
    int tid;

    tid = getpid();

    lock_acquire(&ttable.lock);
    for(t=ttable.thread;t < &ttable.thread[64];t++){
    12d6:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
    12da:	b8 c4 21 00 00       	mov    $0x21c4,%eax
    12df:	39 45 f0             	cmp    %eax,-0x10(%ebp)
    12e2:	72 df                	jb     12c3 <pass_next+0x23>
        if(t->tid == 0){
            t->tid = tid;
            break;
        } 
    }
    ttable.total++;
    12e4:	a1 c4 21 00 00       	mov    0x21c4,%eax
    12e9:	83 c0 01             	add    $0x1,%eax
    12ec:	a3 c4 21 00 00       	mov    %eax,0x21c4
    lock_release(&ttable.lock);
    12f1:	c7 04 24 c0 1f 00 00 	movl   $0x1fc0,(%esp)
    12f8:	e8 76 09 00 00       	call   1c73 <lock_release>

   for(;;){
        lock_acquire(&ttable.lock);
    12fd:	c7 04 24 c0 1f 00 00 	movl   $0x1fc0,(%esp)
    1304:	e8 4b 09 00 00       	call   1c54 <lock_acquire>
        if(ttable.total == numthreads){
    1309:	8b 15 c4 21 00 00    	mov    0x21c4,%edx
    130f:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
    1314:	39 c2                	cmp    %eax,%edx
    1316:	75 39                	jne    1351 <pass_next+0xb1>
            printf(1," tid %d ready to go\n",t->tid);
    1318:	8b 45 f0             	mov    -0x10(%ebp),%eax
    131b:	8b 00                	mov    (%eax),%eax
    131d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1321:	c7 44 24 04 f0 1e 00 	movl   $0x1ef0,0x4(%esp)
    1328:	00 
    1329:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1330:	e8 30 05 00 00       	call   1865 <printf>
            barrier++;
    1335:	a1 a8 1f 00 00       	mov    0x1fa8,%eax
    133a:	83 c0 01             	add    $0x1,%eax
    133d:	a3 a8 1f 00 00       	mov    %eax,0x1fa8
            goto start;
    1342:	90                   	nop
        lock_release(&ttable.lock);
    }
    
//barriar above
start:
     lock_release(&ttable.lock);
    1343:	c7 04 24 c0 1f 00 00 	movl   $0x1fc0,(%esp)
    134a:	e8 24 09 00 00       	call   1c73 <lock_release>
    134f:	eb 0e                	jmp    135f <pass_next+0xbf>
        if(ttable.total == numthreads){
            printf(1," tid %d ready to go\n",t->tid);
            barrier++;
            goto start;
        }
        lock_release(&ttable.lock);
    1351:	c7 04 24 c0 1f 00 00 	movl   $0x1fc0,(%esp)
    1358:	e8 16 09 00 00       	call   1c73 <lock_release>
    }
    135d:	eb 9e                	jmp    12fd <pass_next+0x5d>
    
//barriar above
start:
     lock_release(&ttable.lock);
     while(barrier != numthreads);
    135f:	8b 15 a8 1f 00 00    	mov    0x1fa8,%edx
    1365:	a1 a0 1f 00 00       	mov    0x1fa0,%eax
    136a:	39 c2                	cmp    %eax,%edx
    136c:	75 f1                	jne    135f <pass_next+0xbf>
    //throw frisbee
    do{
        lock_acquire(&frisbee.lock);
    136e:	c7 04 24 c8 21 00 00 	movl   $0x21c8,(%esp)
    1375:	e8 da 08 00 00       	call   1c54 <lock_acquire>
        if(frisbee.pass > numpass){
    137a:	8b 15 cc 21 00 00    	mov    0x21cc,%edx
    1380:	a1 a4 1f 00 00       	mov    0x1fa4,%eax
    1385:	39 c2                	cmp    %eax,%edx
    1387:	7e 39                	jle    13c2 <pass_next+0x122>
            lock_release(&frisbee.lock);
    1389:	c7 04 24 c8 21 00 00 	movl   $0x21c8,(%esp)
    1390:	e8 de 08 00 00       	call   1c73 <lock_release>
            goto leaving;
    1395:	90                   	nop
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);

leaving: 
    lock_release(&frisbee.lock);
    1396:	c7 04 24 c8 21 00 00 	movl   $0x21c8,(%esp)
    139d:	e8 d1 08 00 00       	call   1c73 <lock_release>
    printf(1,"thread %d out of game\n",tid);
    13a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    13a9:	c7 44 24 04 3c 1f 00 	movl   $0x1f3c,0x4(%esp)
    13b0:	00 
    13b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13b8:	e8 a8 04 00 00       	call   1865 <printf>
    texit();
    13bd:	e8 b2 03 00 00       	call   1774 <texit>
        lock_acquire(&frisbee.lock);
        if(frisbee.pass > numpass){
            lock_release(&frisbee.lock);
            goto leaving;
        }
        if(frisbee.holding_thread == tid){
    13c2:	a1 d0 21 00 00       	mov    0x21d0,%eax
    13c7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    13ca:	75 1b                	jne    13e7 <pass_next+0x147>
            lock_release(&frisbee.lock);
    13cc:	c7 04 24 c8 21 00 00 	movl   $0x21c8,(%esp)
    13d3:	e8 9b 08 00 00       	call   1c73 <lock_release>
            sleep(5);
    13d8:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    13df:	e8 78 03 00 00       	call   175c <sleep>
            continue;
    13e4:	90                   	nop
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
                frisbee.pass, tid);
        frisbee.pass++;
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);
    13e5:	eb 87                	jmp    136e <pass_next+0xce>
        if(frisbee.holding_thread == tid){
            lock_release(&frisbee.lock);
            sleep(5);
            continue;
        }
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
    13e7:	a1 cc 21 00 00       	mov    0x21cc,%eax
    13ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    13ef:	89 54 24 0c          	mov    %edx,0xc(%esp)
    13f3:	89 44 24 08          	mov    %eax,0x8(%esp)
    13f7:	c7 44 24 04 08 1f 00 	movl   $0x1f08,0x4(%esp)
    13fe:	00 
    13ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1406:	e8 5a 04 00 00       	call   1865 <printf>
                frisbee.pass, tid);
        frisbee.pass++;
    140b:	a1 cc 21 00 00       	mov    0x21cc,%eax
    1410:	83 c0 01             	add    $0x1,%eax
    1413:	a3 cc 21 00 00       	mov    %eax,0x21cc
        frisbee.holding_thread = tid;
    1418:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141b:	a3 d0 21 00 00       	mov    %eax,0x21d0
        lock_release(&frisbee.lock);
    1420:	c7 04 24 c8 21 00 00 	movl   $0x21c8,(%esp)
    1427:	e8 47 08 00 00       	call   1c73 <lock_release>
    }while(1);
    142c:	e9 3d ff ff ff       	jmp    136e <pass_next+0xce>

00001431 <lookup>:
    lock_release(&frisbee.lock);
    printf(1,"thread %d out of game\n",tid);
    texit();
}

int lookup(int num_threads){
    1431:	55                   	push   %ebp
    1432:	89 e5                	mov    %esp,%ebp
    1434:	83 ec 10             	sub    $0x10,%esp
    int i;
    struct thread *t;
    i = 0;
    1437:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    for(t=ttable.thread;t<&ttable.thread[64];t++){
    143e:	c7 45 fc c4 1f 00 00 	movl   $0x1fc4,-0x4(%ebp)
    1445:	eb 11                	jmp    1458 <lookup+0x27>
        if(t->tid != 0){
    1447:	8b 45 fc             	mov    -0x4(%ebp),%eax
    144a:	8b 00                	mov    (%eax),%eax
    144c:	85 c0                	test   %eax,%eax
    144e:	74 04                	je     1454 <lookup+0x23>
            i++;
    1450:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)

int lookup(int num_threads){
    int i;
    struct thread *t;
    i = 0;
    for(t=ttable.thread;t<&ttable.thread[64];t++){
    1454:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
    1458:	b8 c4 21 00 00       	mov    $0x21c4,%eax
    145d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    1460:	72 e5                	jb     1447 <lookup+0x16>
        if(t->tid != 0){
            i++;
        }
    }
    return i;
    1462:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
    1465:	c9                   	leave  
    1466:	c3                   	ret    
    1467:	90                   	nop

00001468 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    1468:	55                   	push   %ebp
    1469:	89 e5                	mov    %esp,%ebp
    146b:	57                   	push   %edi
    146c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    146d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1470:	8b 55 10             	mov    0x10(%ebp),%edx
    1473:	8b 45 0c             	mov    0xc(%ebp),%eax
    1476:	89 cb                	mov    %ecx,%ebx
    1478:	89 df                	mov    %ebx,%edi
    147a:	89 d1                	mov    %edx,%ecx
    147c:	fc                   	cld    
    147d:	f3 aa                	rep stos %al,%es:(%edi)
    147f:	89 ca                	mov    %ecx,%edx
    1481:	89 fb                	mov    %edi,%ebx
    1483:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1486:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    1489:	5b                   	pop    %ebx
    148a:	5f                   	pop    %edi
    148b:	5d                   	pop    %ebp
    148c:	c3                   	ret    

0000148d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    148d:	55                   	push   %ebp
    148e:	89 e5                	mov    %esp,%ebp
    1490:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    1493:	8b 45 08             	mov    0x8(%ebp),%eax
    1496:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    1499:	8b 45 0c             	mov    0xc(%ebp),%eax
    149c:	0f b6 10             	movzbl (%eax),%edx
    149f:	8b 45 08             	mov    0x8(%ebp),%eax
    14a2:	88 10                	mov    %dl,(%eax)
    14a4:	8b 45 08             	mov    0x8(%ebp),%eax
    14a7:	0f b6 00             	movzbl (%eax),%eax
    14aa:	84 c0                	test   %al,%al
    14ac:	0f 95 c0             	setne  %al
    14af:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    14b3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    14b7:	84 c0                	test   %al,%al
    14b9:	75 de                	jne    1499 <strcpy+0xc>
    ;
  return os;
    14bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    14be:	c9                   	leave  
    14bf:	c3                   	ret    

000014c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    14c0:	55                   	push   %ebp
    14c1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    14c3:	eb 08                	jmp    14cd <strcmp+0xd>
    p++, q++;
    14c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    14c9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    14cd:	8b 45 08             	mov    0x8(%ebp),%eax
    14d0:	0f b6 00             	movzbl (%eax),%eax
    14d3:	84 c0                	test   %al,%al
    14d5:	74 10                	je     14e7 <strcmp+0x27>
    14d7:	8b 45 08             	mov    0x8(%ebp),%eax
    14da:	0f b6 10             	movzbl (%eax),%edx
    14dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    14e0:	0f b6 00             	movzbl (%eax),%eax
    14e3:	38 c2                	cmp    %al,%dl
    14e5:	74 de                	je     14c5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    14e7:	8b 45 08             	mov    0x8(%ebp),%eax
    14ea:	0f b6 00             	movzbl (%eax),%eax
    14ed:	0f b6 d0             	movzbl %al,%edx
    14f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    14f3:	0f b6 00             	movzbl (%eax),%eax
    14f6:	0f b6 c0             	movzbl %al,%eax
    14f9:	89 d1                	mov    %edx,%ecx
    14fb:	29 c1                	sub    %eax,%ecx
    14fd:	89 c8                	mov    %ecx,%eax
}
    14ff:	5d                   	pop    %ebp
    1500:	c3                   	ret    

00001501 <strlen>:

uint
strlen(char *s)
{
    1501:	55                   	push   %ebp
    1502:	89 e5                	mov    %esp,%ebp
    1504:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    1507:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    150e:	eb 04                	jmp    1514 <strlen+0x13>
    1510:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1514:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1517:	03 45 08             	add    0x8(%ebp),%eax
    151a:	0f b6 00             	movzbl (%eax),%eax
    151d:	84 c0                	test   %al,%al
    151f:	75 ef                	jne    1510 <strlen+0xf>
    ;
  return n;
    1521:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1524:	c9                   	leave  
    1525:	c3                   	ret    

00001526 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1526:	55                   	push   %ebp
    1527:	89 e5                	mov    %esp,%ebp
    1529:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    152c:	8b 45 10             	mov    0x10(%ebp),%eax
    152f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1533:	8b 45 0c             	mov    0xc(%ebp),%eax
    1536:	89 44 24 04          	mov    %eax,0x4(%esp)
    153a:	8b 45 08             	mov    0x8(%ebp),%eax
    153d:	89 04 24             	mov    %eax,(%esp)
    1540:	e8 23 ff ff ff       	call   1468 <stosb>
  return dst;
    1545:	8b 45 08             	mov    0x8(%ebp),%eax
}
    1548:	c9                   	leave  
    1549:	c3                   	ret    

0000154a <strchr>:

char*
strchr(const char *s, char c)
{
    154a:	55                   	push   %ebp
    154b:	89 e5                	mov    %esp,%ebp
    154d:	83 ec 04             	sub    $0x4,%esp
    1550:	8b 45 0c             	mov    0xc(%ebp),%eax
    1553:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    1556:	eb 14                	jmp    156c <strchr+0x22>
    if(*s == c)
    1558:	8b 45 08             	mov    0x8(%ebp),%eax
    155b:	0f b6 00             	movzbl (%eax),%eax
    155e:	3a 45 fc             	cmp    -0x4(%ebp),%al
    1561:	75 05                	jne    1568 <strchr+0x1e>
      return (char*)s;
    1563:	8b 45 08             	mov    0x8(%ebp),%eax
    1566:	eb 13                	jmp    157b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1568:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    156c:	8b 45 08             	mov    0x8(%ebp),%eax
    156f:	0f b6 00             	movzbl (%eax),%eax
    1572:	84 c0                	test   %al,%al
    1574:	75 e2                	jne    1558 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    1576:	b8 00 00 00 00       	mov    $0x0,%eax
}
    157b:	c9                   	leave  
    157c:	c3                   	ret    

0000157d <gets>:

char*
gets(char *buf, int max)
{
    157d:	55                   	push   %ebp
    157e:	89 e5                	mov    %esp,%ebp
    1580:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1583:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    158a:	eb 44                	jmp    15d0 <gets+0x53>
    cc = read(0, &c, 1);
    158c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1593:	00 
    1594:	8d 45 ef             	lea    -0x11(%ebp),%eax
    1597:	89 44 24 04          	mov    %eax,0x4(%esp)
    159b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15a2:	e8 3d 01 00 00       	call   16e4 <read>
    15a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    15aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15ae:	7e 2d                	jle    15dd <gets+0x60>
      break;
    buf[i++] = c;
    15b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15b3:	03 45 08             	add    0x8(%ebp),%eax
    15b6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    15ba:	88 10                	mov    %dl,(%eax)
    15bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    15c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    15c4:	3c 0a                	cmp    $0xa,%al
    15c6:	74 16                	je     15de <gets+0x61>
    15c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    15cc:	3c 0d                	cmp    $0xd,%al
    15ce:	74 0e                	je     15de <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    15d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15d3:	83 c0 01             	add    $0x1,%eax
    15d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
    15d9:	7c b1                	jl     158c <gets+0xf>
    15db:	eb 01                	jmp    15de <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    15dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    15de:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e1:	03 45 08             	add    0x8(%ebp),%eax
    15e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    15e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    15ea:	c9                   	leave  
    15eb:	c3                   	ret    

000015ec <stat>:

int
stat(char *n, struct stat *st)
{
    15ec:	55                   	push   %ebp
    15ed:	89 e5                	mov    %esp,%ebp
    15ef:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    15f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    15f9:	00 
    15fa:	8b 45 08             	mov    0x8(%ebp),%eax
    15fd:	89 04 24             	mov    %eax,(%esp)
    1600:	e8 07 01 00 00       	call   170c <open>
    1605:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    1608:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    160c:	79 07                	jns    1615 <stat+0x29>
    return -1;
    160e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1613:	eb 23                	jmp    1638 <stat+0x4c>
  r = fstat(fd, st);
    1615:	8b 45 0c             	mov    0xc(%ebp),%eax
    1618:	89 44 24 04          	mov    %eax,0x4(%esp)
    161c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    161f:	89 04 24             	mov    %eax,(%esp)
    1622:	e8 fd 00 00 00       	call   1724 <fstat>
    1627:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    162a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    162d:	89 04 24             	mov    %eax,(%esp)
    1630:	e8 bf 00 00 00       	call   16f4 <close>
  return r;
    1635:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    1638:	c9                   	leave  
    1639:	c3                   	ret    

0000163a <atoi>:

int
atoi(const char *s)
{
    163a:	55                   	push   %ebp
    163b:	89 e5                	mov    %esp,%ebp
    163d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1640:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1647:	eb 24                	jmp    166d <atoi+0x33>
    n = n*10 + *s++ - '0';
    1649:	8b 55 fc             	mov    -0x4(%ebp),%edx
    164c:	89 d0                	mov    %edx,%eax
    164e:	c1 e0 02             	shl    $0x2,%eax
    1651:	01 d0                	add    %edx,%eax
    1653:	01 c0                	add    %eax,%eax
    1655:	89 c2                	mov    %eax,%edx
    1657:	8b 45 08             	mov    0x8(%ebp),%eax
    165a:	0f b6 00             	movzbl (%eax),%eax
    165d:	0f be c0             	movsbl %al,%eax
    1660:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1663:	83 e8 30             	sub    $0x30,%eax
    1666:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1669:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    166d:	8b 45 08             	mov    0x8(%ebp),%eax
    1670:	0f b6 00             	movzbl (%eax),%eax
    1673:	3c 2f                	cmp    $0x2f,%al
    1675:	7e 0a                	jle    1681 <atoi+0x47>
    1677:	8b 45 08             	mov    0x8(%ebp),%eax
    167a:	0f b6 00             	movzbl (%eax),%eax
    167d:	3c 39                	cmp    $0x39,%al
    167f:	7e c8                	jle    1649 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    1681:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1684:	c9                   	leave  
    1685:	c3                   	ret    

00001686 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1686:	55                   	push   %ebp
    1687:	89 e5                	mov    %esp,%ebp
    1689:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    168c:	8b 45 08             	mov    0x8(%ebp),%eax
    168f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    1692:	8b 45 0c             	mov    0xc(%ebp),%eax
    1695:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    1698:	eb 13                	jmp    16ad <memmove+0x27>
    *dst++ = *src++;
    169a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    169d:	0f b6 10             	movzbl (%eax),%edx
    16a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    16a3:	88 10                	mov    %dl,(%eax)
    16a5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    16a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    16ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    16b1:	0f 9f c0             	setg   %al
    16b4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    16b8:	84 c0                	test   %al,%al
    16ba:	75 de                	jne    169a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    16bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
    16bf:	c9                   	leave  
    16c0:	c3                   	ret    
    16c1:	90                   	nop
    16c2:	90                   	nop
    16c3:	90                   	nop

000016c4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    16c4:	b8 01 00 00 00       	mov    $0x1,%eax
    16c9:	cd 40                	int    $0x40
    16cb:	c3                   	ret    

000016cc <exit>:
SYSCALL(exit)
    16cc:	b8 02 00 00 00       	mov    $0x2,%eax
    16d1:	cd 40                	int    $0x40
    16d3:	c3                   	ret    

000016d4 <wait>:
SYSCALL(wait)
    16d4:	b8 03 00 00 00       	mov    $0x3,%eax
    16d9:	cd 40                	int    $0x40
    16db:	c3                   	ret    

000016dc <pipe>:
SYSCALL(pipe)
    16dc:	b8 04 00 00 00       	mov    $0x4,%eax
    16e1:	cd 40                	int    $0x40
    16e3:	c3                   	ret    

000016e4 <read>:
SYSCALL(read)
    16e4:	b8 05 00 00 00       	mov    $0x5,%eax
    16e9:	cd 40                	int    $0x40
    16eb:	c3                   	ret    

000016ec <write>:
SYSCALL(write)
    16ec:	b8 10 00 00 00       	mov    $0x10,%eax
    16f1:	cd 40                	int    $0x40
    16f3:	c3                   	ret    

000016f4 <close>:
SYSCALL(close)
    16f4:	b8 15 00 00 00       	mov    $0x15,%eax
    16f9:	cd 40                	int    $0x40
    16fb:	c3                   	ret    

000016fc <kill>:
SYSCALL(kill)
    16fc:	b8 06 00 00 00       	mov    $0x6,%eax
    1701:	cd 40                	int    $0x40
    1703:	c3                   	ret    

00001704 <exec>:
SYSCALL(exec)
    1704:	b8 07 00 00 00       	mov    $0x7,%eax
    1709:	cd 40                	int    $0x40
    170b:	c3                   	ret    

0000170c <open>:
SYSCALL(open)
    170c:	b8 0f 00 00 00       	mov    $0xf,%eax
    1711:	cd 40                	int    $0x40
    1713:	c3                   	ret    

00001714 <mknod>:
SYSCALL(mknod)
    1714:	b8 11 00 00 00       	mov    $0x11,%eax
    1719:	cd 40                	int    $0x40
    171b:	c3                   	ret    

0000171c <unlink>:
SYSCALL(unlink)
    171c:	b8 12 00 00 00       	mov    $0x12,%eax
    1721:	cd 40                	int    $0x40
    1723:	c3                   	ret    

00001724 <fstat>:
SYSCALL(fstat)
    1724:	b8 08 00 00 00       	mov    $0x8,%eax
    1729:	cd 40                	int    $0x40
    172b:	c3                   	ret    

0000172c <link>:
SYSCALL(link)
    172c:	b8 13 00 00 00       	mov    $0x13,%eax
    1731:	cd 40                	int    $0x40
    1733:	c3                   	ret    

00001734 <mkdir>:
SYSCALL(mkdir)
    1734:	b8 14 00 00 00       	mov    $0x14,%eax
    1739:	cd 40                	int    $0x40
    173b:	c3                   	ret    

0000173c <chdir>:
SYSCALL(chdir)
    173c:	b8 09 00 00 00       	mov    $0x9,%eax
    1741:	cd 40                	int    $0x40
    1743:	c3                   	ret    

00001744 <dup>:
SYSCALL(dup)
    1744:	b8 0a 00 00 00       	mov    $0xa,%eax
    1749:	cd 40                	int    $0x40
    174b:	c3                   	ret    

0000174c <getpid>:
SYSCALL(getpid)
    174c:	b8 0b 00 00 00       	mov    $0xb,%eax
    1751:	cd 40                	int    $0x40
    1753:	c3                   	ret    

00001754 <sbrk>:
SYSCALL(sbrk)
    1754:	b8 0c 00 00 00       	mov    $0xc,%eax
    1759:	cd 40                	int    $0x40
    175b:	c3                   	ret    

0000175c <sleep>:
SYSCALL(sleep)
    175c:	b8 0d 00 00 00       	mov    $0xd,%eax
    1761:	cd 40                	int    $0x40
    1763:	c3                   	ret    

00001764 <uptime>:
SYSCALL(uptime)
    1764:	b8 0e 00 00 00       	mov    $0xe,%eax
    1769:	cd 40                	int    $0x40
    176b:	c3                   	ret    

0000176c <clone>:
SYSCALL(clone)
    176c:	b8 16 00 00 00       	mov    $0x16,%eax
    1771:	cd 40                	int    $0x40
    1773:	c3                   	ret    

00001774 <texit>:
SYSCALL(texit)
    1774:	b8 17 00 00 00       	mov    $0x17,%eax
    1779:	cd 40                	int    $0x40
    177b:	c3                   	ret    

0000177c <tsleep>:
SYSCALL(tsleep)
    177c:	b8 18 00 00 00       	mov    $0x18,%eax
    1781:	cd 40                	int    $0x40
    1783:	c3                   	ret    

00001784 <twakeup>:
SYSCALL(twakeup)
    1784:	b8 19 00 00 00       	mov    $0x19,%eax
    1789:	cd 40                	int    $0x40
    178b:	c3                   	ret    

0000178c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    178c:	55                   	push   %ebp
    178d:	89 e5                	mov    %esp,%ebp
    178f:	83 ec 28             	sub    $0x28,%esp
    1792:	8b 45 0c             	mov    0xc(%ebp),%eax
    1795:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1798:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    179f:	00 
    17a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
    17a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    17a7:	8b 45 08             	mov    0x8(%ebp),%eax
    17aa:	89 04 24             	mov    %eax,(%esp)
    17ad:	e8 3a ff ff ff       	call   16ec <write>
}
    17b2:	c9                   	leave  
    17b3:	c3                   	ret    

000017b4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    17b4:	55                   	push   %ebp
    17b5:	89 e5                	mov    %esp,%ebp
    17b7:	53                   	push   %ebx
    17b8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    17bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    17c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    17c6:	74 17                	je     17df <printint+0x2b>
    17c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    17cc:	79 11                	jns    17df <printint+0x2b>
    neg = 1;
    17ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    17d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    17d8:	f7 d8                	neg    %eax
    17da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    17dd:	eb 06                	jmp    17e5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    17df:	8b 45 0c             	mov    0xc(%ebp),%eax
    17e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    17e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    17ec:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    17ef:	8b 5d 10             	mov    0x10(%ebp),%ebx
    17f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17f5:	ba 00 00 00 00       	mov    $0x0,%edx
    17fa:	f7 f3                	div    %ebx
    17fc:	89 d0                	mov    %edx,%eax
    17fe:	0f b6 80 88 1f 00 00 	movzbl 0x1f88(%eax),%eax
    1805:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1809:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    180d:	8b 45 10             	mov    0x10(%ebp),%eax
    1810:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1813:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1816:	ba 00 00 00 00       	mov    $0x0,%edx
    181b:	f7 75 d4             	divl   -0x2c(%ebp)
    181e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1821:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1825:	75 c5                	jne    17ec <printint+0x38>
  if(neg)
    1827:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    182b:	74 28                	je     1855 <printint+0xa1>
    buf[i++] = '-';
    182d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1830:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    1835:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    1839:	eb 1a                	jmp    1855 <printint+0xa1>
    putc(fd, buf[i]);
    183b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    183e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    1843:	0f be c0             	movsbl %al,%eax
    1846:	89 44 24 04          	mov    %eax,0x4(%esp)
    184a:	8b 45 08             	mov    0x8(%ebp),%eax
    184d:	89 04 24             	mov    %eax,(%esp)
    1850:	e8 37 ff ff ff       	call   178c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1855:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    1859:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    185d:	79 dc                	jns    183b <printint+0x87>
    putc(fd, buf[i]);
}
    185f:	83 c4 44             	add    $0x44,%esp
    1862:	5b                   	pop    %ebx
    1863:	5d                   	pop    %ebp
    1864:	c3                   	ret    

00001865 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1865:	55                   	push   %ebp
    1866:	89 e5                	mov    %esp,%ebp
    1868:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    186b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1872:	8d 45 0c             	lea    0xc(%ebp),%eax
    1875:	83 c0 04             	add    $0x4,%eax
    1878:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    187b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    1882:	e9 7e 01 00 00       	jmp    1a05 <printf+0x1a0>
    c = fmt[i] & 0xff;
    1887:	8b 55 0c             	mov    0xc(%ebp),%edx
    188a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    188d:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1890:	0f b6 00             	movzbl (%eax),%eax
    1893:	0f be c0             	movsbl %al,%eax
    1896:	25 ff 00 00 00       	and    $0xff,%eax
    189b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    189e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    18a2:	75 2c                	jne    18d0 <printf+0x6b>
      if(c == '%'){
    18a4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    18a8:	75 0c                	jne    18b6 <printf+0x51>
        state = '%';
    18aa:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    18b1:	e9 4b 01 00 00       	jmp    1a01 <printf+0x19c>
      } else {
        putc(fd, c);
    18b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18b9:	0f be c0             	movsbl %al,%eax
    18bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    18c0:	8b 45 08             	mov    0x8(%ebp),%eax
    18c3:	89 04 24             	mov    %eax,(%esp)
    18c6:	e8 c1 fe ff ff       	call   178c <putc>
    18cb:	e9 31 01 00 00       	jmp    1a01 <printf+0x19c>
      }
    } else if(state == '%'){
    18d0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    18d4:	0f 85 27 01 00 00    	jne    1a01 <printf+0x19c>
      if(c == 'd'){
    18da:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    18de:	75 2d                	jne    190d <printf+0xa8>
        printint(fd, *ap, 10, 1);
    18e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e3:	8b 00                	mov    (%eax),%eax
    18e5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    18ec:	00 
    18ed:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    18f4:	00 
    18f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    18f9:	8b 45 08             	mov    0x8(%ebp),%eax
    18fc:	89 04 24             	mov    %eax,(%esp)
    18ff:	e8 b0 fe ff ff       	call   17b4 <printint>
        ap++;
    1904:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1908:	e9 ed 00 00 00       	jmp    19fa <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    190d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1911:	74 06                	je     1919 <printf+0xb4>
    1913:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    1917:	75 2d                	jne    1946 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    1919:	8b 45 f4             	mov    -0xc(%ebp),%eax
    191c:	8b 00                	mov    (%eax),%eax
    191e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1925:	00 
    1926:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    192d:	00 
    192e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1932:	8b 45 08             	mov    0x8(%ebp),%eax
    1935:	89 04 24             	mov    %eax,(%esp)
    1938:	e8 77 fe ff ff       	call   17b4 <printint>
        ap++;
    193d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1941:	e9 b4 00 00 00       	jmp    19fa <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1946:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    194a:	75 46                	jne    1992 <printf+0x12d>
        s = (char*)*ap;
    194c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    194f:	8b 00                	mov    (%eax),%eax
    1951:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    1954:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    1958:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    195c:	75 27                	jne    1985 <printf+0x120>
          s = "(null)";
    195e:	c7 45 e4 53 1f 00 00 	movl   $0x1f53,-0x1c(%ebp)
        while(*s != 0){
    1965:	eb 1f                	jmp    1986 <printf+0x121>
          putc(fd, *s);
    1967:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    196a:	0f b6 00             	movzbl (%eax),%eax
    196d:	0f be c0             	movsbl %al,%eax
    1970:	89 44 24 04          	mov    %eax,0x4(%esp)
    1974:	8b 45 08             	mov    0x8(%ebp),%eax
    1977:	89 04 24             	mov    %eax,(%esp)
    197a:	e8 0d fe ff ff       	call   178c <putc>
          s++;
    197f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1983:	eb 01                	jmp    1986 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1985:	90                   	nop
    1986:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1989:	0f b6 00             	movzbl (%eax),%eax
    198c:	84 c0                	test   %al,%al
    198e:	75 d7                	jne    1967 <printf+0x102>
    1990:	eb 68                	jmp    19fa <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1992:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    1996:	75 1d                	jne    19b5 <printf+0x150>
        putc(fd, *ap);
    1998:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199b:	8b 00                	mov    (%eax),%eax
    199d:	0f be c0             	movsbl %al,%eax
    19a0:	89 44 24 04          	mov    %eax,0x4(%esp)
    19a4:	8b 45 08             	mov    0x8(%ebp),%eax
    19a7:	89 04 24             	mov    %eax,(%esp)
    19aa:	e8 dd fd ff ff       	call   178c <putc>
        ap++;
    19af:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    19b3:	eb 45                	jmp    19fa <printf+0x195>
      } else if(c == '%'){
    19b5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    19b9:	75 17                	jne    19d2 <printf+0x16d>
        putc(fd, c);
    19bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19be:	0f be c0             	movsbl %al,%eax
    19c1:	89 44 24 04          	mov    %eax,0x4(%esp)
    19c5:	8b 45 08             	mov    0x8(%ebp),%eax
    19c8:	89 04 24             	mov    %eax,(%esp)
    19cb:	e8 bc fd ff ff       	call   178c <putc>
    19d0:	eb 28                	jmp    19fa <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    19d2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    19d9:	00 
    19da:	8b 45 08             	mov    0x8(%ebp),%eax
    19dd:	89 04 24             	mov    %eax,(%esp)
    19e0:	e8 a7 fd ff ff       	call   178c <putc>
        putc(fd, c);
    19e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    19e8:	0f be c0             	movsbl %al,%eax
    19eb:	89 44 24 04          	mov    %eax,0x4(%esp)
    19ef:	8b 45 08             	mov    0x8(%ebp),%eax
    19f2:	89 04 24             	mov    %eax,(%esp)
    19f5:	e8 92 fd ff ff       	call   178c <putc>
      }
      state = 0;
    19fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1a01:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1a05:	8b 55 0c             	mov    0xc(%ebp),%edx
    1a08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a0b:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1a0e:	0f b6 00             	movzbl (%eax),%eax
    1a11:	84 c0                	test   %al,%al
    1a13:	0f 85 6e fe ff ff    	jne    1887 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1a19:	c9                   	leave  
    1a1a:	c3                   	ret    
    1a1b:	90                   	nop

00001a1c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1a1c:	55                   	push   %ebp
    1a1d:	89 e5                	mov    %esp,%ebp
    1a1f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1a22:	8b 45 08             	mov    0x8(%ebp),%eax
    1a25:	83 e8 08             	sub    $0x8,%eax
    1a28:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1a2b:	a1 b4 1f 00 00       	mov    0x1fb4,%eax
    1a30:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1a33:	eb 24                	jmp    1a59 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1a35:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a38:	8b 00                	mov    (%eax),%eax
    1a3a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1a3d:	77 12                	ja     1a51 <free+0x35>
    1a3f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a42:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1a45:	77 24                	ja     1a6b <free+0x4f>
    1a47:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a4a:	8b 00                	mov    (%eax),%eax
    1a4c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1a4f:	77 1a                	ja     1a6b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1a51:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a54:	8b 00                	mov    (%eax),%eax
    1a56:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1a59:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a5c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1a5f:	76 d4                	jbe    1a35 <free+0x19>
    1a61:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a64:	8b 00                	mov    (%eax),%eax
    1a66:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1a69:	76 ca                	jbe    1a35 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1a6b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a6e:	8b 40 04             	mov    0x4(%eax),%eax
    1a71:	c1 e0 03             	shl    $0x3,%eax
    1a74:	89 c2                	mov    %eax,%edx
    1a76:	03 55 f8             	add    -0x8(%ebp),%edx
    1a79:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a7c:	8b 00                	mov    (%eax),%eax
    1a7e:	39 c2                	cmp    %eax,%edx
    1a80:	75 24                	jne    1aa6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    1a82:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a85:	8b 50 04             	mov    0x4(%eax),%edx
    1a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a8b:	8b 00                	mov    (%eax),%eax
    1a8d:	8b 40 04             	mov    0x4(%eax),%eax
    1a90:	01 c2                	add    %eax,%edx
    1a92:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1a95:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1a98:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1a9b:	8b 00                	mov    (%eax),%eax
    1a9d:	8b 10                	mov    (%eax),%edx
    1a9f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1aa2:	89 10                	mov    %edx,(%eax)
    1aa4:	eb 0a                	jmp    1ab0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    1aa6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1aa9:	8b 10                	mov    (%eax),%edx
    1aab:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1aae:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1ab3:	8b 40 04             	mov    0x4(%eax),%eax
    1ab6:	c1 e0 03             	shl    $0x3,%eax
    1ab9:	03 45 fc             	add    -0x4(%ebp),%eax
    1abc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1abf:	75 20                	jne    1ae1 <free+0xc5>
    p->s.size += bp->s.size;
    1ac1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1ac4:	8b 50 04             	mov    0x4(%eax),%edx
    1ac7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1aca:	8b 40 04             	mov    0x4(%eax),%eax
    1acd:	01 c2                	add    %eax,%edx
    1acf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1ad2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1ad5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1ad8:	8b 10                	mov    (%eax),%edx
    1ada:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1add:	89 10                	mov    %edx,(%eax)
    1adf:	eb 08                	jmp    1ae9 <free+0xcd>
  } else
    p->s.ptr = bp;
    1ae1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1ae4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1ae7:	89 10                	mov    %edx,(%eax)
  freep = p;
    1ae9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1aec:	a3 b4 1f 00 00       	mov    %eax,0x1fb4
}
    1af1:	c9                   	leave  
    1af2:	c3                   	ret    

00001af3 <morecore>:

static Header*
morecore(uint nu)
{
    1af3:	55                   	push   %ebp
    1af4:	89 e5                	mov    %esp,%ebp
    1af6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1af9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1b00:	77 07                	ja     1b09 <morecore+0x16>
    nu = 4096;
    1b02:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1b09:	8b 45 08             	mov    0x8(%ebp),%eax
    1b0c:	c1 e0 03             	shl    $0x3,%eax
    1b0f:	89 04 24             	mov    %eax,(%esp)
    1b12:	e8 3d fc ff ff       	call   1754 <sbrk>
    1b17:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    1b1a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    1b1e:	75 07                	jne    1b27 <morecore+0x34>
    return 0;
    1b20:	b8 00 00 00 00       	mov    $0x0,%eax
    1b25:	eb 22                	jmp    1b49 <morecore+0x56>
  hp = (Header*)p;
    1b27:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    1b2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b30:	8b 55 08             	mov    0x8(%ebp),%edx
    1b33:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1b36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b39:	83 c0 08             	add    $0x8,%eax
    1b3c:	89 04 24             	mov    %eax,(%esp)
    1b3f:	e8 d8 fe ff ff       	call   1a1c <free>
  return freep;
    1b44:	a1 b4 1f 00 00       	mov    0x1fb4,%eax
}
    1b49:	c9                   	leave  
    1b4a:	c3                   	ret    

00001b4b <malloc>:

void*
malloc(uint nbytes)
{
    1b4b:	55                   	push   %ebp
    1b4c:	89 e5                	mov    %esp,%ebp
    1b4e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1b51:	8b 45 08             	mov    0x8(%ebp),%eax
    1b54:	83 c0 07             	add    $0x7,%eax
    1b57:	c1 e8 03             	shr    $0x3,%eax
    1b5a:	83 c0 01             	add    $0x1,%eax
    1b5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    1b60:	a1 b4 1f 00 00       	mov    0x1fb4,%eax
    1b65:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1b68:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1b6c:	75 23                	jne    1b91 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1b6e:	c7 45 f0 ac 1f 00 00 	movl   $0x1fac,-0x10(%ebp)
    1b75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b78:	a3 b4 1f 00 00       	mov    %eax,0x1fb4
    1b7d:	a1 b4 1f 00 00       	mov    0x1fb4,%eax
    1b82:	a3 ac 1f 00 00       	mov    %eax,0x1fac
    base.s.size = 0;
    1b87:	c7 05 b0 1f 00 00 00 	movl   $0x0,0x1fb0
    1b8e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b94:	8b 00                	mov    (%eax),%eax
    1b96:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1b99:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1b9c:	8b 40 04             	mov    0x4(%eax),%eax
    1b9f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1ba2:	72 4d                	jb     1bf1 <malloc+0xa6>
      if(p->s.size == nunits)
    1ba4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ba7:	8b 40 04             	mov    0x4(%eax),%eax
    1baa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1bad:	75 0c                	jne    1bbb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1baf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bb2:	8b 10                	mov    (%eax),%edx
    1bb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bb7:	89 10                	mov    %edx,(%eax)
    1bb9:	eb 26                	jmp    1be1 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1bbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bbe:	8b 40 04             	mov    0x4(%eax),%eax
    1bc1:	89 c2                	mov    %eax,%edx
    1bc3:	2b 55 f4             	sub    -0xc(%ebp),%edx
    1bc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bc9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1bcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bcf:	8b 40 04             	mov    0x4(%eax),%eax
    1bd2:	c1 e0 03             	shl    $0x3,%eax
    1bd5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1bd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1bde:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1be1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1be4:	a3 b4 1f 00 00       	mov    %eax,0x1fb4
      return (void*)(p + 1);
    1be9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1bec:	83 c0 08             	add    $0x8,%eax
    1bef:	eb 38                	jmp    1c29 <malloc+0xde>
    }
    if(p == freep)
    1bf1:	a1 b4 1f 00 00       	mov    0x1fb4,%eax
    1bf6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1bf9:	75 1b                	jne    1c16 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1bfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bfe:	89 04 24             	mov    %eax,(%esp)
    1c01:	e8 ed fe ff ff       	call   1af3 <morecore>
    1c06:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1c09:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c0d:	75 07                	jne    1c16 <malloc+0xcb>
        return 0;
    1c0f:	b8 00 00 00 00       	mov    $0x0,%eax
    1c14:	eb 13                	jmp    1c29 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1c16:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c19:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1c1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c1f:	8b 00                	mov    (%eax),%eax
    1c21:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    1c24:	e9 70 ff ff ff       	jmp    1b99 <malloc+0x4e>
}
    1c29:	c9                   	leave  
    1c2a:	c3                   	ret    
    1c2b:	90                   	nop

00001c2c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    1c2c:	55                   	push   %ebp
    1c2d:	89 e5                	mov    %esp,%ebp
    1c2f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1c32:	8b 55 08             	mov    0x8(%ebp),%edx
    1c35:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c38:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1c3b:	f0 87 02             	lock xchg %eax,(%edx)
    1c3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    1c41:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1c44:	c9                   	leave  
    1c45:	c3                   	ret    

00001c46 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    1c46:	55                   	push   %ebp
    1c47:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    1c49:	8b 45 08             	mov    0x8(%ebp),%eax
    1c4c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1c52:	5d                   	pop    %ebp
    1c53:	c3                   	ret    

00001c54 <lock_acquire>:
void lock_acquire(lock_t *lock){
    1c54:	55                   	push   %ebp
    1c55:	89 e5                	mov    %esp,%ebp
    1c57:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    1c5a:	8b 45 08             	mov    0x8(%ebp),%eax
    1c5d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1c64:	00 
    1c65:	89 04 24             	mov    %eax,(%esp)
    1c68:	e8 bf ff ff ff       	call   1c2c <xchg>
    1c6d:	85 c0                	test   %eax,%eax
    1c6f:	75 e9                	jne    1c5a <lock_acquire+0x6>
}
    1c71:	c9                   	leave  
    1c72:	c3                   	ret    

00001c73 <lock_release>:
void lock_release(lock_t *lock){
    1c73:	55                   	push   %ebp
    1c74:	89 e5                	mov    %esp,%ebp
    1c76:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    1c79:	8b 45 08             	mov    0x8(%ebp),%eax
    1c7c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1c83:	00 
    1c84:	89 04 24             	mov    %eax,(%esp)
    1c87:	e8 a0 ff ff ff       	call   1c2c <xchg>
}
    1c8c:	c9                   	leave  
    1c8d:	c3                   	ret    

00001c8e <thread_create>:

void *thread_create(void(*start_routine)(void*), void *arg){
    1c8e:	55                   	push   %ebp
    1c8f:	89 e5                	mov    %esp,%ebp
    1c91:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    1c94:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    1c9b:	e8 ab fe ff ff       	call   1b4b <malloc>
    1ca0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
    1ca3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ca6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    1ca9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cac:	25 ff 0f 00 00       	and    $0xfff,%eax
    1cb1:	85 c0                	test   %eax,%eax
    1cb3:	74 15                	je     1cca <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
    1cb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cb8:	89 c2                	mov    %eax,%edx
    1cba:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    1cc0:	b8 00 10 00 00       	mov    $0x1000,%eax
    1cc5:	29 d0                	sub    %edx,%eax
    1cc7:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
    1cca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1cce:	75 1b                	jne    1ceb <thread_create+0x5d>

        printf(1,"malloc fail \n");
    1cd0:	c7 44 24 04 5a 1f 00 	movl   $0x1f5a,0x4(%esp)
    1cd7:	00 
    1cd8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cdf:	e8 81 fb ff ff       	call   1865 <printf>
        return 0;
    1ce4:	b8 00 00 00 00       	mov    $0x0,%eax
    1ce9:	eb 6f                	jmp    1d5a <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    1ceb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1cee:	8b 55 08             	mov    0x8(%ebp),%edx
    1cf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cf4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1cf8:	89 54 24 08          	mov    %edx,0x8(%esp)
    1cfc:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    1d03:	00 
    1d04:	89 04 24             	mov    %eax,(%esp)
    1d07:	e8 60 fa ff ff       	call   176c <clone>
    1d0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    1d0f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d13:	79 1b                	jns    1d30 <thread_create+0xa2>
        printf(1,"clone fails\n");
    1d15:	c7 44 24 04 68 1f 00 	movl   $0x1f68,0x4(%esp)
    1d1c:	00 
    1d1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d24:	e8 3c fb ff ff       	call   1865 <printf>
        return 0;
    1d29:	b8 00 00 00 00       	mov    $0x0,%eax
    1d2e:	eb 2a                	jmp    1d5a <thread_create+0xcc>
    }
    if(tid > 0){
    1d30:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d34:	7e 05                	jle    1d3b <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
    1d36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d39:	eb 1f                	jmp    1d5a <thread_create+0xcc>
    }
    if(tid == 0){
    1d3b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d3f:	75 14                	jne    1d55 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
    1d41:	c7 44 24 04 75 1f 00 	movl   $0x1f75,0x4(%esp)
    1d48:	00 
    1d49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d50:	e8 10 fb ff ff       	call   1865 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    1d55:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1d5a:	c9                   	leave  
    1d5b:	c3                   	ret    

00001d5c <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    1d5c:	55                   	push   %ebp
    1d5d:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    1d5f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d62:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    1d68:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    1d72:	8b 45 08             	mov    0x8(%ebp),%eax
    1d75:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    1d7c:	5d                   	pop    %ebp
    1d7d:	c3                   	ret    

00001d7e <add_q>:

void add_q(struct queue *q, int v){
    1d7e:	55                   	push   %ebp
    1d7f:	89 e5                	mov    %esp,%ebp
    1d81:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    1d84:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1d8b:	e8 bb fd ff ff       	call   1b4b <malloc>
    1d90:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1d93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d96:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1d9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1da0:	8b 55 0c             	mov    0xc(%ebp),%edx
    1da3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    1da5:	8b 45 08             	mov    0x8(%ebp),%eax
    1da8:	8b 40 04             	mov    0x4(%eax),%eax
    1dab:	85 c0                	test   %eax,%eax
    1dad:	75 0b                	jne    1dba <add_q+0x3c>
        q->head = n;
    1daf:	8b 45 08             	mov    0x8(%ebp),%eax
    1db2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1db5:	89 50 04             	mov    %edx,0x4(%eax)
    1db8:	eb 0c                	jmp    1dc6 <add_q+0x48>
    }else{
        q->tail->next = n;
    1dba:	8b 45 08             	mov    0x8(%ebp),%eax
    1dbd:	8b 40 08             	mov    0x8(%eax),%eax
    1dc0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1dc3:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    1dc6:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1dcc:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1dcf:	8b 45 08             	mov    0x8(%ebp),%eax
    1dd2:	8b 00                	mov    (%eax),%eax
    1dd4:	8d 50 01             	lea    0x1(%eax),%edx
    1dd7:	8b 45 08             	mov    0x8(%ebp),%eax
    1dda:	89 10                	mov    %edx,(%eax)
}
    1ddc:	c9                   	leave  
    1ddd:	c3                   	ret    

00001dde <empty_q>:

int empty_q(struct queue *q){
    1dde:	55                   	push   %ebp
    1ddf:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1de1:	8b 45 08             	mov    0x8(%ebp),%eax
    1de4:	8b 00                	mov    (%eax),%eax
    1de6:	85 c0                	test   %eax,%eax
    1de8:	75 07                	jne    1df1 <empty_q+0x13>
        return 1;
    1dea:	b8 01 00 00 00       	mov    $0x1,%eax
    1def:	eb 05                	jmp    1df6 <empty_q+0x18>
    else
        return 0;
    1df1:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    1df6:	5d                   	pop    %ebp
    1df7:	c3                   	ret    

00001df8 <pop_q>:
int pop_q(struct queue *q){
    1df8:	55                   	push   %ebp
    1df9:	89 e5                	mov    %esp,%ebp
    1dfb:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1dfe:	8b 45 08             	mov    0x8(%ebp),%eax
    1e01:	89 04 24             	mov    %eax,(%esp)
    1e04:	e8 d5 ff ff ff       	call   1dde <empty_q>
    1e09:	85 c0                	test   %eax,%eax
    1e0b:	75 5d                	jne    1e6a <pop_q+0x72>
       val = q->head->value; 
    1e0d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e10:	8b 40 04             	mov    0x4(%eax),%eax
    1e13:	8b 00                	mov    (%eax),%eax
    1e15:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
    1e18:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1b:	8b 40 04             	mov    0x4(%eax),%eax
    1e1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
    1e21:	8b 45 08             	mov    0x8(%ebp),%eax
    1e24:	8b 40 04             	mov    0x4(%eax),%eax
    1e27:	8b 50 04             	mov    0x4(%eax),%edx
    1e2a:	8b 45 08             	mov    0x8(%ebp),%eax
    1e2d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    1e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e33:	89 04 24             	mov    %eax,(%esp)
    1e36:	e8 e1 fb ff ff       	call   1a1c <free>
       q->size--;
    1e3b:	8b 45 08             	mov    0x8(%ebp),%eax
    1e3e:	8b 00                	mov    (%eax),%eax
    1e40:	8d 50 ff             	lea    -0x1(%eax),%edx
    1e43:	8b 45 08             	mov    0x8(%ebp),%eax
    1e46:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    1e48:	8b 45 08             	mov    0x8(%ebp),%eax
    1e4b:	8b 00                	mov    (%eax),%eax
    1e4d:	85 c0                	test   %eax,%eax
    1e4f:	75 14                	jne    1e65 <pop_q+0x6d>
            q->head = 0;
    1e51:	8b 45 08             	mov    0x8(%ebp),%eax
    1e54:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    1e5b:	8b 45 08             	mov    0x8(%ebp),%eax
    1e5e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    1e65:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e68:	eb 05                	jmp    1e6f <pop_q+0x77>
    }
    return -1;
    1e6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    1e6f:	c9                   	leave  
    1e70:	c3                   	ret    
