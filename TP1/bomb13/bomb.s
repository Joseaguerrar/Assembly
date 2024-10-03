
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 3f 00 00 	mov    0x3fc5(%rip),%rax        # 4fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <getenv@plt-0x10>:
    1020:	ff 35 ca 3f 00 00    	push   0x3fca(%rip)        # 4ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 3f 00 00    	jmp    *0x3fcc(%rip)        # 4ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <getenv@plt>:
    1030:	ff 25 ca 3f 00 00    	jmp    *0x3fca(%rip)        # 5000 <getenv@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <__errno_location@plt>:
    1040:	ff 25 c2 3f 00 00    	jmp    *0x3fc2(%rip)        # 5008 <__errno_location@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <strcpy@plt>:
    1050:	ff 25 ba 3f 00 00    	jmp    *0x3fba(%rip)        # 5010 <strcpy@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <puts@plt>:
    1060:	ff 25 b2 3f 00 00    	jmp    *0x3fb2(%rip)        # 5018 <puts@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001070 <write@plt>:
    1070:	ff 25 aa 3f 00 00    	jmp    *0x3faa(%rip)        # 5020 <write@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001080 <strlen@plt>:
    1080:	ff 25 a2 3f 00 00    	jmp    *0x3fa2(%rip)        # 5028 <strlen@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001090 <printf@plt>:
    1090:	ff 25 9a 3f 00 00    	jmp    *0x3f9a(%rip)        # 5030 <printf@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010a0 <alarm@plt>:
    10a0:	ff 25 92 3f 00 00    	jmp    *0x3f92(%rip)        # 5038 <alarm@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	push   $0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010b0 <close@plt>:
    10b0:	ff 25 8a 3f 00 00    	jmp    *0x3f8a(%rip)        # 5040 <close@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	push   $0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010c0 <read@plt>:
    10c0:	ff 25 82 3f 00 00    	jmp    *0x3f82(%rip)        # 5048 <read@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	push   $0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010d0 <fgets@plt>:
    10d0:	ff 25 7a 3f 00 00    	jmp    *0x3f7a(%rip)        # 5050 <fgets@GLIBC_2.2.5>
    10d6:	68 0a 00 00 00       	push   $0xa
    10db:	e9 40 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010e0 <strcmp@plt>:
    10e0:	ff 25 72 3f 00 00    	jmp    *0x3f72(%rip)        # 5058 <strcmp@GLIBC_2.2.5>
    10e6:	68 0b 00 00 00       	push   $0xb
    10eb:	e9 30 ff ff ff       	jmp    1020 <_init+0x20>

00000000000010f0 <signal@plt>:
    10f0:	ff 25 6a 3f 00 00    	jmp    *0x3f6a(%rip)        # 5060 <signal@GLIBC_2.2.5>
    10f6:	68 0c 00 00 00       	push   $0xc
    10fb:	e9 20 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001100 <gethostbyname@plt>:
    1100:	ff 25 62 3f 00 00    	jmp    *0x3f62(%rip)        # 5068 <gethostbyname@GLIBC_2.2.5>
    1106:	68 0d 00 00 00       	push   $0xd
    110b:	e9 10 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001110 <fprintf@plt>:
    1110:	ff 25 5a 3f 00 00    	jmp    *0x3f5a(%rip)        # 5070 <fprintf@GLIBC_2.2.5>
    1116:	68 0e 00 00 00       	push   $0xe
    111b:	e9 00 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001120 <strtol@plt>:
    1120:	ff 25 52 3f 00 00    	jmp    *0x3f52(%rip)        # 5078 <strtol@GLIBC_2.2.5>
    1126:	68 0f 00 00 00       	push   $0xf
    112b:	e9 f0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001130 <fflush@plt>:
    1130:	ff 25 4a 3f 00 00    	jmp    *0x3f4a(%rip)        # 5080 <fflush@GLIBC_2.2.5>
    1136:	68 10 00 00 00       	push   $0x10
    113b:	e9 e0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001140 <__isoc99_sscanf@plt>:
    1140:	ff 25 42 3f 00 00    	jmp    *0x3f42(%rip)        # 5088 <__isoc99_sscanf@GLIBC_2.7>
    1146:	68 11 00 00 00       	push   $0x11
    114b:	e9 d0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001150 <memmove@plt>:
    1150:	ff 25 3a 3f 00 00    	jmp    *0x3f3a(%rip)        # 5090 <memmove@GLIBC_2.2.5>
    1156:	68 12 00 00 00       	push   $0x12
    115b:	e9 c0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001160 <fopen@plt>:
    1160:	ff 25 32 3f 00 00    	jmp    *0x3f32(%rip)        # 5098 <fopen@GLIBC_2.2.5>
    1166:	68 13 00 00 00       	push   $0x13
    116b:	e9 b0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001170 <sprintf@plt>:
    1170:	ff 25 2a 3f 00 00    	jmp    *0x3f2a(%rip)        # 50a0 <sprintf@GLIBC_2.2.5>
    1176:	68 14 00 00 00       	push   $0x14
    117b:	e9 a0 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001180 <exit@plt>:
    1180:	ff 25 22 3f 00 00    	jmp    *0x3f22(%rip)        # 50a8 <exit@GLIBC_2.2.5>
    1186:	68 15 00 00 00       	push   $0x15
    118b:	e9 90 fe ff ff       	jmp    1020 <_init+0x20>

0000000000001190 <connect@plt>:
    1190:	ff 25 1a 3f 00 00    	jmp    *0x3f1a(%rip)        # 50b0 <connect@GLIBC_2.2.5>
    1196:	68 16 00 00 00       	push   $0x16
    119b:	e9 80 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011a0 <sleep@plt>:
    11a0:	ff 25 12 3f 00 00    	jmp    *0x3f12(%rip)        # 50b8 <sleep@GLIBC_2.2.5>
    11a6:	68 17 00 00 00       	push   $0x17
    11ab:	e9 70 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011b0 <__ctype_b_loc@plt>:
    11b0:	ff 25 0a 3f 00 00    	jmp    *0x3f0a(%rip)        # 50c0 <__ctype_b_loc@GLIBC_2.3>
    11b6:	68 18 00 00 00       	push   $0x18
    11bb:	e9 60 fe ff ff       	jmp    1020 <_init+0x20>

00000000000011c0 <socket@plt>:
    11c0:	ff 25 02 3f 00 00    	jmp    *0x3f02(%rip)        # 50c8 <socket@GLIBC_2.2.5>
    11c6:	68 19 00 00 00       	push   $0x19
    11cb:	e9 50 fe ff ff       	jmp    1020 <_init+0x20>

Disassembly of section .plt.got:

00000000000011d0 <__cxa_finalize@plt>:
    11d0:	ff 25 0a 3e 00 00    	jmp    *0x3e0a(%rip)        # 4fe0 <__cxa_finalize@GLIBC_2.2.5>
    11d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000011e0 <_start>:
    11e0:	31 ed                	xor    %ebp,%ebp
    11e2:	49 89 d1             	mov    %rdx,%r9
    11e5:	5e                   	pop    %rsi
    11e6:	48 89 e2             	mov    %rsp,%rdx
    11e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    11ed:	50                   	push   %rax
    11ee:	54                   	push   %rsp
    11ef:	45 31 c0             	xor    %r8d,%r8d
    11f2:	31 c9                	xor    %ecx,%ecx
    11f4:	48 8d 3d ce 00 00 00 	lea    0xce(%rip),%rdi        # 12c9 <main>
    11fb:	ff 15 bf 3d 00 00    	call   *0x3dbf(%rip)        # 4fc0 <__libc_start_main@GLIBC_2.34>
    1201:	f4                   	hlt    
    1202:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1209:	00 00 00 
    120c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001210 <deregister_tm_clones>:
    1210:	48 8d 3d 49 45 00 00 	lea    0x4549(%rip),%rdi        # 5760 <stdout@GLIBC_2.2.5>
    1217:	48 8d 05 42 45 00 00 	lea    0x4542(%rip),%rax        # 5760 <stdout@GLIBC_2.2.5>
    121e:	48 39 f8             	cmp    %rdi,%rax
    1221:	74 15                	je     1238 <deregister_tm_clones+0x28>
    1223:	48 8b 05 9e 3d 00 00 	mov    0x3d9e(%rip),%rax        # 4fc8 <_ITM_deregisterTMCloneTable@Base>
    122a:	48 85 c0             	test   %rax,%rax
    122d:	74 09                	je     1238 <deregister_tm_clones+0x28>
    122f:	ff e0                	jmp    *%rax
    1231:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1238:	c3                   	ret    
    1239:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001240 <register_tm_clones>:
    1240:	48 8d 3d 19 45 00 00 	lea    0x4519(%rip),%rdi        # 5760 <stdout@GLIBC_2.2.5>
    1247:	48 8d 35 12 45 00 00 	lea    0x4512(%rip),%rsi        # 5760 <stdout@GLIBC_2.2.5>
    124e:	48 29 fe             	sub    %rdi,%rsi
    1251:	48 89 f0             	mov    %rsi,%rax
    1254:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1258:	48 c1 f8 03          	sar    $0x3,%rax
    125c:	48 01 c6             	add    %rax,%rsi
    125f:	48 d1 fe             	sar    %rsi
    1262:	74 14                	je     1278 <register_tm_clones+0x38>
    1264:	48 8b 05 6d 3d 00 00 	mov    0x3d6d(%rip),%rax        # 4fd8 <_ITM_registerTMCloneTable@Base>
    126b:	48 85 c0             	test   %rax,%rax
    126e:	74 08                	je     1278 <register_tm_clones+0x38>
    1270:	ff e0                	jmp    *%rax
    1272:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1278:	c3                   	ret    
    1279:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001280 <__do_global_dtors_aux>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	80 3d fd 44 00 00 00 	cmpb   $0x0,0x44fd(%rip)        # 5788 <completed.0>
    128b:	75 2b                	jne    12b8 <__do_global_dtors_aux+0x38>
    128d:	55                   	push   %rbp
    128e:	48 83 3d 4a 3d 00 00 	cmpq   $0x0,0x3d4a(%rip)        # 4fe0 <__cxa_finalize@GLIBC_2.2.5>
    1295:	00 
    1296:	48 89 e5             	mov    %rsp,%rbp
    1299:	74 0c                	je     12a7 <__do_global_dtors_aux+0x27>
    129b:	48 8b 3d 46 3e 00 00 	mov    0x3e46(%rip),%rdi        # 50e8 <__dso_handle>
    12a2:	e8 29 ff ff ff       	call   11d0 <__cxa_finalize@plt>
    12a7:	e8 64 ff ff ff       	call   1210 <deregister_tm_clones>
    12ac:	c6 05 d5 44 00 00 01 	movb   $0x1,0x44d5(%rip)        # 5788 <completed.0>
    12b3:	5d                   	pop    %rbp
    12b4:	c3                   	ret    
    12b5:	0f 1f 00             	nopl   (%rax)
    12b8:	c3                   	ret    
    12b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012c0 <frame_dummy>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	e9 77 ff ff ff       	jmp    1240 <register_tm_clones>

00000000000012c9 <main>:
    12c9:	53                   	push   %rbx
    12ca:	83 ff 01             	cmp    $0x1,%edi
    12cd:	0f 84 f8 00 00 00    	je     13cb <main+0x102>
    12d3:	48 89 f3             	mov    %rsi,%rbx
    12d6:	83 ff 02             	cmp    $0x2,%edi
    12d9:	0f 85 1c 01 00 00    	jne    13fb <main+0x132>
    12df:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    12e3:	48 8d 35 1a 1d 00 00 	lea    0x1d1a(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    12ea:	e8 71 fe ff ff       	call   1160 <fopen@plt>
    12ef:	48 89 05 9a 44 00 00 	mov    %rax,0x449a(%rip)        # 5790 <infile>
    12f6:	48 85 c0             	test   %rax,%rax
    12f9:	0f 84 df 00 00 00    	je     13de <main+0x115>
    12ff:	e8 b8 05 00 00       	call   18bc <initialize_bomb>
    1304:	48 8d 3d 7d 1d 00 00 	lea    0x1d7d(%rip),%rdi        # 3088 <_IO_stdin_used+0x88>
    130b:	e8 50 fd ff ff       	call   1060 <puts@plt>
    1310:	48 8d 3d b1 1d 00 00 	lea    0x1db1(%rip),%rdi        # 30c8 <_IO_stdin_used+0xc8>
    1317:	e8 44 fd ff ff       	call   1060 <puts@plt>
    131c:	e8 57 07 00 00       	call   1a78 <read_line>
    1321:	48 89 c7             	mov    %rax,%rdi
    1324:	e8 f0 00 00 00       	call   1419 <phase_1>
    1329:	e8 7e 08 00 00       	call   1bac <phase_defused>
    132e:	48 8d 3d c3 1d 00 00 	lea    0x1dc3(%rip),%rdi        # 30f8 <_IO_stdin_used+0xf8>
    1335:	e8 26 fd ff ff       	call   1060 <puts@plt>
    133a:	e8 39 07 00 00       	call   1a78 <read_line>
    133f:	48 89 c7             	mov    %rax,%rdi
    1342:	e8 f2 00 00 00       	call   1439 <phase_2>
    1347:	e8 60 08 00 00       	call   1bac <phase_defused>
    134c:	48 8d 3d ea 1c 00 00 	lea    0x1cea(%rip),%rdi        # 303d <_IO_stdin_used+0x3d>
    1353:	e8 08 fd ff ff       	call   1060 <puts@plt>
    1358:	e8 1b 07 00 00       	call   1a78 <read_line>
    135d:	48 89 c7             	mov    %rax,%rdi
    1360:	e8 1f 01 00 00       	call   1484 <phase_3>
    1365:	e8 42 08 00 00       	call   1bac <phase_defused>
    136a:	48 8d 3d ea 1c 00 00 	lea    0x1cea(%rip),%rdi        # 305b <_IO_stdin_used+0x5b>
    1371:	e8 ea fc ff ff       	call   1060 <puts@plt>
    1376:	e8 fd 06 00 00       	call   1a78 <read_line>
    137b:	48 89 c7             	mov    %rax,%rdi
    137e:	e8 f9 01 00 00       	call   157c <phase_4>
    1383:	e8 24 08 00 00       	call   1bac <phase_defused>
    1388:	48 8d 3d 99 1d 00 00 	lea    0x1d99(%rip),%rdi        # 3128 <_IO_stdin_used+0x128>
    138f:	e8 cc fc ff ff       	call   1060 <puts@plt>
    1394:	e8 df 06 00 00       	call   1a78 <read_line>
    1399:	48 89 c7             	mov    %rax,%rdi
    139c:	e8 34 02 00 00       	call   15d5 <phase_5>
    13a1:	e8 06 08 00 00       	call   1bac <phase_defused>
    13a6:	48 8d 3d bd 1c 00 00 	lea    0x1cbd(%rip),%rdi        # 306a <_IO_stdin_used+0x6a>
    13ad:	e8 ae fc ff ff       	call   1060 <puts@plt>
    13b2:	e8 c1 06 00 00       	call   1a78 <read_line>
    13b7:	48 89 c7             	mov    %rax,%rdi
    13ba:	e8 5e 02 00 00       	call   161d <phase_6>
    13bf:	e8 e8 07 00 00       	call   1bac <phase_defused>
    13c4:	b8 00 00 00 00       	mov    $0x0,%eax
    13c9:	5b                   	pop    %rbx
    13ca:	c3                   	ret    
    13cb:	48 8b 05 9e 43 00 00 	mov    0x439e(%rip),%rax        # 5770 <stdin@GLIBC_2.2.5>
    13d2:	48 89 05 b7 43 00 00 	mov    %rax,0x43b7(%rip)        # 5790 <infile>
    13d9:	e9 21 ff ff ff       	jmp    12ff <main+0x36>
    13de:	48 8b 53 08          	mov    0x8(%rbx),%rdx
    13e2:	48 8b 33             	mov    (%rbx),%rsi
    13e5:	48 8d 3d 1a 1c 00 00 	lea    0x1c1a(%rip),%rdi        # 3006 <_IO_stdin_used+0x6>
    13ec:	e8 9f fc ff ff       	call   1090 <printf@plt>
    13f1:	bf 08 00 00 00       	mov    $0x8,%edi
    13f6:	e8 85 fd ff ff       	call   1180 <exit@plt>
    13fb:	48 8b 36             	mov    (%rsi),%rsi
    13fe:	48 8d 3d 1e 1c 00 00 	lea    0x1c1e(%rip),%rdi        # 3023 <_IO_stdin_used+0x23>
    1405:	b8 00 00 00 00       	mov    $0x0,%eax
    140a:	e8 81 fc ff ff       	call   1090 <printf@plt>
    140f:	bf 08 00 00 00       	mov    $0x8,%edi
    1414:	e8 67 fd ff ff       	call   1180 <exit@plt>

0000000000001419 <phase_1>:
    1419:	48 83 ec 08          	sub    $0x8,%rsp
    141d:	48 8d 35 2c 1d 00 00 	lea    0x1d2c(%rip),%rsi        # 3150 <_IO_stdin_used+0x150>
    1424:	e8 37 04 00 00       	call   1860 <strings_not_equal>
    1429:	85 c0                	test   %eax,%eax
    142b:	75 05                	jne    1432 <phase_1+0x19>
    142d:	48 83 c4 08          	add    $0x8,%rsp
    1431:	c3                   	ret    
    1432:	e8 c4 05 00 00       	call   19fb <explode_bomb>
    1437:	eb f4                	jmp    142d <phase_1+0x14>

0000000000001439 <phase_2>:
    1439:	55                   	push   %rbp
    143a:	53                   	push   %rbx
    143b:	48 83 ec 28          	sub    $0x28,%rsp
    143f:	48 89 e6             	mov    %rsp,%rsi
    1442:	e8 f0 05 00 00       	call   1a37 <read_six_numbers>
    1447:	83 3c 24 00          	cmpl   $0x0,(%rsp)
    144b:	75 07                	jne    1454 <phase_2+0x1b>
    144d:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
    1452:	74 05                	je     1459 <phase_2+0x20>
    1454:	e8 a2 05 00 00       	call   19fb <explode_bomb>
    1459:	48 89 e3             	mov    %rsp,%rbx
    145c:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
    1461:	eb 09                	jmp    146c <phase_2+0x33>
    1463:	48 83 c3 04          	add    $0x4,%rbx
    1467:	48 39 eb             	cmp    %rbp,%rbx
    146a:	74 11                	je     147d <phase_2+0x44>
    146c:	8b 43 04             	mov    0x4(%rbx),%eax
    146f:	03 03                	add    (%rbx),%eax
    1471:	39 43 08             	cmp    %eax,0x8(%rbx)
    1474:	74 ed                	je     1463 <phase_2+0x2a>
    1476:	e8 80 05 00 00       	call   19fb <explode_bomb>
    147b:	eb e6                	jmp    1463 <phase_2+0x2a>
    147d:	48 83 c4 28          	add    $0x28,%rsp
    1481:	5b                   	pop    %rbx
    1482:	5d                   	pop    %rbp
    1483:	c3                   	ret    

0000000000001484 <phase_3>:
    1484:	48 83 ec 18          	sub    $0x18,%rsp
    1488:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    148d:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    1492:	48 8d 35 22 1f 00 00 	lea    0x1f22(%rip),%rsi        # 33bb <array.0+0x1db>
    1499:	b8 00 00 00 00       	mov    $0x0,%eax
    149e:	e8 9d fc ff ff       	call   1140 <__isoc99_sscanf@plt>
    14a3:	83 f8 01             	cmp    $0x1,%eax
    14a6:	7e 1f                	jle    14c7 <phase_3+0x43>
    14a8:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
    14ad:	0f 87 8b 00 00 00    	ja     153e <phase_3+0xba>
    14b3:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    14b7:	48 8d 15 02 1d 00 00 	lea    0x1d02(%rip),%rdx        # 31c0 <_IO_stdin_used+0x1c0>
    14be:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    14c2:	48 01 d0             	add    %rdx,%rax
    14c5:	ff e0                	jmp    *%rax
    14c7:	e8 2f 05 00 00       	call   19fb <explode_bomb>
    14cc:	eb da                	jmp    14a8 <phase_3+0x24>
    14ce:	b8 00 00 00 00       	mov    $0x0,%eax
    14d3:	2d 2c 01 00 00       	sub    $0x12c,%eax
    14d8:	05 7c 02 00 00       	add    $0x27c,%eax
    14dd:	2d 7e 01 00 00       	sub    $0x17e,%eax
    14e2:	05 7e 01 00 00       	add    $0x17e,%eax
    14e7:	2d 7e 01 00 00       	sub    $0x17e,%eax
    14ec:	05 7e 01 00 00       	add    $0x17e,%eax
    14f1:	2d 7e 01 00 00       	sub    $0x17e,%eax
    14f6:	83 7c 24 0c 05       	cmpl   $0x5,0xc(%rsp)
    14fb:	7f 06                	jg     1503 <phase_3+0x7f>
    14fd:	39 44 24 08          	cmp    %eax,0x8(%rsp)
    1501:	74 05                	je     1508 <phase_3+0x84>
    1503:	e8 f3 04 00 00       	call   19fb <explode_bomb>
    1508:	48 83 c4 18          	add    $0x18,%rsp
    150c:	c3                   	ret    
    150d:	b8 35 00 00 00       	mov    $0x35,%eax
    1512:	eb bf                	jmp    14d3 <phase_3+0x4f>
    1514:	b8 00 00 00 00       	mov    $0x0,%eax
    1519:	eb bd                	jmp    14d8 <phase_3+0x54>
    151b:	b8 00 00 00 00       	mov    $0x0,%eax
    1520:	eb bb                	jmp    14dd <phase_3+0x59>
    1522:	b8 00 00 00 00       	mov    $0x0,%eax
    1527:	eb b9                	jmp    14e2 <phase_3+0x5e>
    1529:	b8 00 00 00 00       	mov    $0x0,%eax
    152e:	eb b7                	jmp    14e7 <phase_3+0x63>
    1530:	b8 00 00 00 00       	mov    $0x0,%eax
    1535:	eb b5                	jmp    14ec <phase_3+0x68>
    1537:	b8 00 00 00 00       	mov    $0x0,%eax
    153c:	eb b3                	jmp    14f1 <phase_3+0x6d>
    153e:	e8 b8 04 00 00       	call   19fb <explode_bomb>
    1543:	b8 00 00 00 00       	mov    $0x0,%eax
    1548:	eb ac                	jmp    14f6 <phase_3+0x72>

000000000000154a <func4>:
    154a:	53                   	push   %rbx
    154b:	89 d0                	mov    %edx,%eax
    154d:	29 f0                	sub    %esi,%eax
    154f:	89 c3                	mov    %eax,%ebx
    1551:	c1 eb 1f             	shr    $0x1f,%ebx
    1554:	01 c3                	add    %eax,%ebx
    1556:	d1 fb                	sar    %ebx
    1558:	01 f3                	add    %esi,%ebx
    155a:	39 fb                	cmp    %edi,%ebx
    155c:	7f 06                	jg     1564 <func4+0x1a>
    155e:	7c 10                	jl     1570 <func4+0x26>
    1560:	89 d8                	mov    %ebx,%eax
    1562:	5b                   	pop    %rbx
    1563:	c3                   	ret    
    1564:	8d 53 ff             	lea    -0x1(%rbx),%edx
    1567:	e8 de ff ff ff       	call   154a <func4>
    156c:	01 c3                	add    %eax,%ebx
    156e:	eb f0                	jmp    1560 <func4+0x16>
    1570:	8d 73 01             	lea    0x1(%rbx),%esi
    1573:	e8 d2 ff ff ff       	call   154a <func4>
    1578:	01 c3                	add    %eax,%ebx
    157a:	eb e4                	jmp    1560 <func4+0x16>

000000000000157c <phase_4>:
    157c:	48 83 ec 18          	sub    $0x18,%rsp
    1580:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    1585:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    158a:	48 8d 35 2a 1e 00 00 	lea    0x1e2a(%rip),%rsi        # 33bb <array.0+0x1db>
    1591:	b8 00 00 00 00       	mov    $0x0,%eax
    1596:	e8 a5 fb ff ff       	call   1140 <__isoc99_sscanf@plt>
    159b:	83 f8 02             	cmp    $0x2,%eax
    159e:	75 07                	jne    15a7 <phase_4+0x2b>
    15a0:	83 7c 24 0c 0e       	cmpl   $0xe,0xc(%rsp)
    15a5:	76 05                	jbe    15ac <phase_4+0x30>
    15a7:	e8 4f 04 00 00       	call   19fb <explode_bomb>
    15ac:	ba 0e 00 00 00       	mov    $0xe,%edx
    15b1:	be 00 00 00 00       	mov    $0x0,%esi
    15b6:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    15ba:	e8 8b ff ff ff       	call   154a <func4>
    15bf:	83 f8 23             	cmp    $0x23,%eax
    15c2:	75 07                	jne    15cb <phase_4+0x4f>
    15c4:	83 7c 24 08 23       	cmpl   $0x23,0x8(%rsp)
    15c9:	74 05                	je     15d0 <phase_4+0x54>
    15cb:	e8 2b 04 00 00       	call   19fb <explode_bomb>
    15d0:	48 83 c4 18          	add    $0x18,%rsp
    15d4:	c3                   	ret    

00000000000015d5 <phase_5>:
    15d5:	53                   	push   %rbx
    15d6:	48 89 fb             	mov    %rdi,%rbx
    15d9:	e8 65 02 00 00       	call   1843 <string_length>
    15de:	83 f8 06             	cmp    $0x6,%eax
    15e1:	75 2c                	jne    160f <phase_5+0x3a>
    15e3:	48 89 d8             	mov    %rbx,%rax
    15e6:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
    15ea:	b9 00 00 00 00       	mov    $0x0,%ecx
    15ef:	48 8d 35 ea 1b 00 00 	lea    0x1bea(%rip),%rsi        # 31e0 <array.0>
    15f6:	0f b6 10             	movzbl (%rax),%edx
    15f9:	83 e2 0f             	and    $0xf,%edx
    15fc:	03 0c 96             	add    (%rsi,%rdx,4),%ecx
    15ff:	48 83 c0 01          	add    $0x1,%rax
    1603:	48 39 f8             	cmp    %rdi,%rax
    1606:	75 ee                	jne    15f6 <phase_5+0x21>
    1608:	83 f9 37             	cmp    $0x37,%ecx
    160b:	75 09                	jne    1616 <phase_5+0x41>
    160d:	5b                   	pop    %rbx
    160e:	c3                   	ret    
    160f:	e8 e7 03 00 00       	call   19fb <explode_bomb>
    1614:	eb cd                	jmp    15e3 <phase_5+0xe>
    1616:	e8 e0 03 00 00       	call   19fb <explode_bomb>
    161b:	eb f0                	jmp    160d <phase_5+0x38>

000000000000161d <phase_6>:
    161d:	41 56                	push   %r14
    161f:	41 55                	push   %r13
    1621:	41 54                	push   %r12
    1623:	55                   	push   %rbp
    1624:	53                   	push   %rbx
    1625:	48 83 ec 50          	sub    $0x50,%rsp
    1629:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
    162e:	4c 89 f6             	mov    %r14,%rsi
    1631:	e8 01 04 00 00       	call   1a37 <read_six_numbers>
    1636:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    163c:	4d 89 f4             	mov    %r14,%r12
    163f:	e9 ad 00 00 00       	jmp    16f1 <phase_6+0xd4>
    1644:	e8 b2 03 00 00       	call   19fb <explode_bomb>
    1649:	41 83 fd 05          	cmp    $0x5,%r13d
    164d:	0f 8e b6 00 00 00    	jle    1709 <phase_6+0xec>
    1653:	be 00 00 00 00       	mov    $0x0,%esi
    1658:	8b 4c b4 30          	mov    0x30(%rsp,%rsi,4),%ecx
    165c:	b8 01 00 00 00       	mov    $0x1,%eax
    1661:	48 8d 15 98 3c 00 00 	lea    0x3c98(%rip),%rdx        # 5300 <node1>
    1668:	83 f9 01             	cmp    $0x1,%ecx
    166b:	7e 0b                	jle    1678 <phase_6+0x5b>
    166d:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    1671:	83 c0 01             	add    $0x1,%eax
    1674:	39 c8                	cmp    %ecx,%eax
    1676:	75 f5                	jne    166d <phase_6+0x50>
    1678:	48 89 14 f4          	mov    %rdx,(%rsp,%rsi,8)
    167c:	48 83 c6 01          	add    $0x1,%rsi
    1680:	48 83 fe 06          	cmp    $0x6,%rsi
    1684:	75 d2                	jne    1658 <phase_6+0x3b>
    1686:	48 8b 1c 24          	mov    (%rsp),%rbx
    168a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    168f:	48 89 43 08          	mov    %rax,0x8(%rbx)
    1693:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    1698:	48 89 50 08          	mov    %rdx,0x8(%rax)
    169c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    16a1:	48 89 42 08          	mov    %rax,0x8(%rdx)
    16a5:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    16aa:	48 89 50 08          	mov    %rdx,0x8(%rax)
    16ae:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    16b3:	48 89 42 08          	mov    %rax,0x8(%rdx)
    16b7:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    16be:	00 
    16bf:	bd 05 00 00 00       	mov    $0x5,%ebp
    16c4:	eb 51                	jmp    1717 <phase_6+0xfa>
    16c6:	48 83 c3 01          	add    $0x1,%rbx
    16ca:	83 fb 05             	cmp    $0x5,%ebx
    16cd:	7f 10                	jg     16df <phase_6+0xc2>
    16cf:	41 8b 04 9c          	mov    (%r12,%rbx,4),%eax
    16d3:	39 45 00             	cmp    %eax,0x0(%rbp)
    16d6:	75 ee                	jne    16c6 <phase_6+0xa9>
    16d8:	e8 1e 03 00 00       	call   19fb <explode_bomb>
    16dd:	eb e7                	jmp    16c6 <phase_6+0xa9>
    16df:	49 83 c6 04          	add    $0x4,%r14
    16e3:	49 83 c5 01          	add    $0x1,%r13
    16e7:	49 83 fd 07          	cmp    $0x7,%r13
    16eb:	0f 84 62 ff ff ff    	je     1653 <phase_6+0x36>
    16f1:	4c 89 f5             	mov    %r14,%rbp
    16f4:	41 8b 06             	mov    (%r14),%eax
    16f7:	83 e8 01             	sub    $0x1,%eax
    16fa:	83 f8 05             	cmp    $0x5,%eax
    16fd:	0f 87 41 ff ff ff    	ja     1644 <phase_6+0x27>
    1703:	41 83 fd 05          	cmp    $0x5,%r13d
    1707:	7f d6                	jg     16df <phase_6+0xc2>
    1709:	4c 89 eb             	mov    %r13,%rbx
    170c:	eb c1                	jmp    16cf <phase_6+0xb2>
    170e:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    1712:	83 ed 01             	sub    $0x1,%ebp
    1715:	74 11                	je     1728 <phase_6+0x10b>
    1717:	48 8b 43 08          	mov    0x8(%rbx),%rax
    171b:	8b 00                	mov    (%rax),%eax
    171d:	39 03                	cmp    %eax,(%rbx)
    171f:	7d ed                	jge    170e <phase_6+0xf1>
    1721:	e8 d5 02 00 00       	call   19fb <explode_bomb>
    1726:	eb e6                	jmp    170e <phase_6+0xf1>
    1728:	48 83 c4 50          	add    $0x50,%rsp
    172c:	5b                   	pop    %rbx
    172d:	5d                   	pop    %rbp
    172e:	41 5c                	pop    %r12
    1730:	41 5d                	pop    %r13
    1732:	41 5e                	pop    %r14
    1734:	c3                   	ret    

0000000000001735 <fun7>:
    1735:	48 85 ff             	test   %rdi,%rdi
    1738:	74 32                	je     176c <fun7+0x37>
    173a:	48 83 ec 08          	sub    $0x8,%rsp
    173e:	8b 17                	mov    (%rdi),%edx
    1740:	39 f2                	cmp    %esi,%edx
    1742:	7f 0c                	jg     1750 <fun7+0x1b>
    1744:	b8 00 00 00 00       	mov    $0x0,%eax
    1749:	75 12                	jne    175d <fun7+0x28>
    174b:	48 83 c4 08          	add    $0x8,%rsp
    174f:	c3                   	ret    
    1750:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    1754:	e8 dc ff ff ff       	call   1735 <fun7>
    1759:	01 c0                	add    %eax,%eax
    175b:	eb ee                	jmp    174b <fun7+0x16>
    175d:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    1761:	e8 cf ff ff ff       	call   1735 <fun7>
    1766:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    176a:	eb df                	jmp    174b <fun7+0x16>
    176c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1771:	c3                   	ret    

0000000000001772 <secret_phase>:
    1772:	53                   	push   %rbx
    1773:	e8 00 03 00 00       	call   1a78 <read_line>
    1778:	48 89 c7             	mov    %rax,%rdi
    177b:	ba 0a 00 00 00       	mov    $0xa,%edx
    1780:	be 00 00 00 00       	mov    $0x0,%esi
    1785:	e8 96 f9 ff ff       	call   1120 <strtol@plt>
    178a:	89 c3                	mov    %eax,%ebx
    178c:	83 e8 01             	sub    $0x1,%eax
    178f:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    1794:	77 26                	ja     17bc <secret_phase+0x4a>
    1796:	89 de                	mov    %ebx,%esi
    1798:	48 8d 3d 81 3a 00 00 	lea    0x3a81(%rip),%rdi        # 5220 <n1>
    179f:	e8 91 ff ff ff       	call   1735 <fun7>
    17a4:	83 f8 07             	cmp    $0x7,%eax
    17a7:	75 1a                	jne    17c3 <secret_phase+0x51>
    17a9:	48 8d 3d d8 19 00 00 	lea    0x19d8(%rip),%rdi        # 3188 <_IO_stdin_used+0x188>
    17b0:	e8 ab f8 ff ff       	call   1060 <puts@plt>
    17b5:	e8 f2 03 00 00       	call   1bac <phase_defused>
    17ba:	5b                   	pop    %rbx
    17bb:	c3                   	ret    
    17bc:	e8 3a 02 00 00       	call   19fb <explode_bomb>
    17c1:	eb d3                	jmp    1796 <secret_phase+0x24>
    17c3:	e8 33 02 00 00       	call   19fb <explode_bomb>
    17c8:	eb df                	jmp    17a9 <secret_phase+0x37>

00000000000017ca <sig_handler>:
    17ca:	48 83 ec 08          	sub    $0x8,%rsp
    17ce:	48 8d 3d 4b 1a 00 00 	lea    0x1a4b(%rip),%rdi        # 3220 <array.0+0x40>
    17d5:	e8 86 f8 ff ff       	call   1060 <puts@plt>
    17da:	bf 03 00 00 00       	mov    $0x3,%edi
    17df:	e8 bc f9 ff ff       	call   11a0 <sleep@plt>
    17e4:	48 8d 3d 66 1b 00 00 	lea    0x1b66(%rip),%rdi        # 3351 <array.0+0x171>
    17eb:	b8 00 00 00 00       	mov    $0x0,%eax
    17f0:	e8 9b f8 ff ff       	call   1090 <printf@plt>
    17f5:	48 8b 3d 64 3f 00 00 	mov    0x3f64(%rip),%rdi        # 5760 <stdout@GLIBC_2.2.5>
    17fc:	e8 2f f9 ff ff       	call   1130 <fflush@plt>
    1801:	bf 01 00 00 00       	mov    $0x1,%edi
    1806:	e8 95 f9 ff ff       	call   11a0 <sleep@plt>
    180b:	48 8d 3d 47 1b 00 00 	lea    0x1b47(%rip),%rdi        # 3359 <array.0+0x179>
    1812:	e8 49 f8 ff ff       	call   1060 <puts@plt>
    1817:	bf 10 00 00 00       	mov    $0x10,%edi
    181c:	e8 5f f9 ff ff       	call   1180 <exit@plt>

0000000000001821 <invalid_phase>:
    1821:	48 83 ec 08          	sub    $0x8,%rsp
    1825:	48 89 fe             	mov    %rdi,%rsi
    1828:	48 8d 3d 32 1b 00 00 	lea    0x1b32(%rip),%rdi        # 3361 <array.0+0x181>
    182f:	b8 00 00 00 00       	mov    $0x0,%eax
    1834:	e8 57 f8 ff ff       	call   1090 <printf@plt>
    1839:	bf 08 00 00 00       	mov    $0x8,%edi
    183e:	e8 3d f9 ff ff       	call   1180 <exit@plt>

0000000000001843 <string_length>:
    1843:	80 3f 00             	cmpb   $0x0,(%rdi)
    1846:	74 12                	je     185a <string_length+0x17>
    1848:	b8 00 00 00 00       	mov    $0x0,%eax
    184d:	48 83 c7 01          	add    $0x1,%rdi
    1851:	83 c0 01             	add    $0x1,%eax
    1854:	80 3f 00             	cmpb   $0x0,(%rdi)
    1857:	75 f4                	jne    184d <string_length+0xa>
    1859:	c3                   	ret    
    185a:	b8 00 00 00 00       	mov    $0x0,%eax
    185f:	c3                   	ret    

0000000000001860 <strings_not_equal>:
    1860:	41 54                	push   %r12
    1862:	55                   	push   %rbp
    1863:	53                   	push   %rbx
    1864:	48 89 fb             	mov    %rdi,%rbx
    1867:	48 89 f5             	mov    %rsi,%rbp
    186a:	e8 d4 ff ff ff       	call   1843 <string_length>
    186f:	41 89 c4             	mov    %eax,%r12d
    1872:	48 89 ef             	mov    %rbp,%rdi
    1875:	e8 c9 ff ff ff       	call   1843 <string_length>
    187a:	89 c2                	mov    %eax,%edx
    187c:	b8 01 00 00 00       	mov    $0x1,%eax
    1881:	41 39 d4             	cmp    %edx,%r12d
    1884:	75 31                	jne    18b7 <strings_not_equal+0x57>
    1886:	0f b6 13             	movzbl (%rbx),%edx
    1889:	84 d2                	test   %dl,%dl
    188b:	74 1e                	je     18ab <strings_not_equal+0x4b>
    188d:	b8 00 00 00 00       	mov    $0x0,%eax
    1892:	38 54 05 00          	cmp    %dl,0x0(%rbp,%rax,1)
    1896:	75 1a                	jne    18b2 <strings_not_equal+0x52>
    1898:	48 83 c0 01          	add    $0x1,%rax
    189c:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    18a0:	84 d2                	test   %dl,%dl
    18a2:	75 ee                	jne    1892 <strings_not_equal+0x32>
    18a4:	b8 00 00 00 00       	mov    $0x0,%eax
    18a9:	eb 0c                	jmp    18b7 <strings_not_equal+0x57>
    18ab:	b8 00 00 00 00       	mov    $0x0,%eax
    18b0:	eb 05                	jmp    18b7 <strings_not_equal+0x57>
    18b2:	b8 01 00 00 00       	mov    $0x1,%eax
    18b7:	5b                   	pop    %rbx
    18b8:	5d                   	pop    %rbp
    18b9:	41 5c                	pop    %r12
    18bb:	c3                   	ret    

00000000000018bc <initialize_bomb>:
    18bc:	48 83 ec 08          	sub    $0x8,%rsp
    18c0:	48 8d 35 03 ff ff ff 	lea    -0xfd(%rip),%rsi        # 17ca <sig_handler>
    18c7:	bf 02 00 00 00       	mov    $0x2,%edi
    18cc:	e8 1f f8 ff ff       	call   10f0 <signal@plt>
    18d1:	48 83 c4 08          	add    $0x8,%rsp
    18d5:	c3                   	ret    

00000000000018d6 <initialize_bomb_solve>:
    18d6:	c3                   	ret    

00000000000018d7 <blank_line>:
    18d7:	55                   	push   %rbp
    18d8:	53                   	push   %rbx
    18d9:	48 83 ec 08          	sub    $0x8,%rsp
    18dd:	48 89 fd             	mov    %rdi,%rbp
    18e0:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    18e4:	84 db                	test   %bl,%bl
    18e6:	74 1e                	je     1906 <blank_line+0x2f>
    18e8:	e8 c3 f8 ff ff       	call   11b0 <__ctype_b_loc@plt>
    18ed:	48 83 c5 01          	add    $0x1,%rbp
    18f1:	48 0f be db          	movsbq %bl,%rbx
    18f5:	48 8b 00             	mov    (%rax),%rax
    18f8:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    18fd:	75 e1                	jne    18e0 <blank_line+0x9>
    18ff:	b8 00 00 00 00       	mov    $0x0,%eax
    1904:	eb 05                	jmp    190b <blank_line+0x34>
    1906:	b8 01 00 00 00       	mov    $0x1,%eax
    190b:	48 83 c4 08          	add    $0x8,%rsp
    190f:	5b                   	pop    %rbx
    1910:	5d                   	pop    %rbp
    1911:	c3                   	ret    

0000000000001912 <skip>:
    1912:	55                   	push   %rbp
    1913:	53                   	push   %rbx
    1914:	48 83 ec 08          	sub    $0x8,%rsp
    1918:	48 8d 2d e1 3e 00 00 	lea    0x3ee1(%rip),%rbp        # 5800 <input_strings>
    191f:	48 63 05 ca 3e 00 00 	movslq 0x3eca(%rip),%rax        # 57f0 <num_input_strings>
    1926:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    192a:	48 c1 e7 04          	shl    $0x4,%rdi
    192e:	48 01 ef             	add    %rbp,%rdi
    1931:	48 8b 15 58 3e 00 00 	mov    0x3e58(%rip),%rdx        # 5790 <infile>
    1938:	be 50 00 00 00       	mov    $0x50,%esi
    193d:	e8 8e f7 ff ff       	call   10d0 <fgets@plt>
    1942:	48 89 c3             	mov    %rax,%rbx
    1945:	48 85 c0             	test   %rax,%rax
    1948:	74 0c                	je     1956 <skip+0x44>
    194a:	48 89 c7             	mov    %rax,%rdi
    194d:	e8 85 ff ff ff       	call   18d7 <blank_line>
    1952:	85 c0                	test   %eax,%eax
    1954:	75 c9                	jne    191f <skip+0xd>
    1956:	48 89 d8             	mov    %rbx,%rax
    1959:	48 83 c4 08          	add    $0x8,%rsp
    195d:	5b                   	pop    %rbx
    195e:	5d                   	pop    %rbp
    195f:	c3                   	ret    

0000000000001960 <send_msg>:
    1960:	53                   	push   %rbx
    1961:	48 81 ec 00 40 00 00 	sub    $0x4000,%rsp
    1968:	44 8b 05 81 3e 00 00 	mov    0x3e81(%rip),%r8d        # 57f0 <num_input_strings>
    196f:	41 8d 40 ff          	lea    -0x1(%r8),%eax
    1973:	48 98                	cltq   
    1975:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    1979:	48 c1 e0 04          	shl    $0x4,%rax
    197d:	85 ff                	test   %edi,%edi
    197f:	48 8d 0d f4 19 00 00 	lea    0x19f4(%rip),%rcx        # 337a <array.0+0x19a>
    1986:	48 8d 15 e5 19 00 00 	lea    0x19e5(%rip),%rdx        # 3372 <array.0+0x192>
    198d:	48 0f 45 ca          	cmovne %rdx,%rcx
    1991:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
    1998:	00 
    1999:	48 8d 15 60 3e 00 00 	lea    0x3e60(%rip),%rdx        # 5800 <input_strings>
    19a0:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
    19a4:	8b 15 72 38 00 00    	mov    0x3872(%rip),%edx        # 521c <bomb_id>
    19aa:	48 8d 35 d2 19 00 00 	lea    0x19d2(%rip),%rsi        # 3383 <array.0+0x1a3>
    19b1:	48 89 df             	mov    %rbx,%rdi
    19b4:	b8 00 00 00 00       	mov    $0x0,%eax
    19b9:	e8 b2 f7 ff ff       	call   1170 <sprintf@plt>
    19be:	49 89 e0             	mov    %rsp,%r8
    19c1:	b9 00 00 00 00       	mov    $0x0,%ecx
    19c6:	48 89 da             	mov    %rbx,%rdx
    19c9:	48 8d 35 30 38 00 00 	lea    0x3830(%rip),%rsi        # 5200 <user_password>
    19d0:	48 8d 3d 3e 38 00 00 	lea    0x383e(%rip),%rdi        # 5215 <userid>
    19d7:	e8 c9 0c 00 00       	call   26a5 <driver_post>
    19dc:	85 c0                	test   %eax,%eax
    19de:	78 09                	js     19e9 <send_msg+0x89>
    19e0:	48 81 c4 00 40 00 00 	add    $0x4000,%rsp
    19e7:	5b                   	pop    %rbx
    19e8:	c3                   	ret    
    19e9:	48 89 e7             	mov    %rsp,%rdi
    19ec:	e8 6f f6 ff ff       	call   1060 <puts@plt>
    19f1:	bf 00 00 00 00       	mov    $0x0,%edi
    19f6:	e8 85 f7 ff ff       	call   1180 <exit@plt>

00000000000019fb <explode_bomb>:
    19fb:	48 83 ec 08          	sub    $0x8,%rsp
    19ff:	48 8d 3d 89 19 00 00 	lea    0x1989(%rip),%rdi        # 338f <array.0+0x1af>
    1a06:	e8 55 f6 ff ff       	call   1060 <puts@plt>
    1a0b:	48 8d 3d 86 19 00 00 	lea    0x1986(%rip),%rdi        # 3398 <array.0+0x1b8>
    1a12:	e8 49 f6 ff ff       	call   1060 <puts@plt>
    1a17:	bf 00 00 00 00       	mov    $0x0,%edi
    1a1c:	e8 3f ff ff ff       	call   1960 <send_msg>
    1a21:	48 8d 3d 30 18 00 00 	lea    0x1830(%rip),%rdi        # 3258 <array.0+0x78>
    1a28:	e8 33 f6 ff ff       	call   1060 <puts@plt>
    1a2d:	bf 08 00 00 00       	mov    $0x8,%edi
    1a32:	e8 49 f7 ff ff       	call   1180 <exit@plt>

0000000000001a37 <read_six_numbers>:
    1a37:	48 83 ec 08          	sub    $0x8,%rsp
    1a3b:	48 89 f2             	mov    %rsi,%rdx
    1a3e:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1a42:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1a46:	50                   	push   %rax
    1a47:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1a4b:	50                   	push   %rax
    1a4c:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1a50:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1a54:	48 8d 35 54 19 00 00 	lea    0x1954(%rip),%rsi        # 33af <array.0+0x1cf>
    1a5b:	b8 00 00 00 00       	mov    $0x0,%eax
    1a60:	e8 db f6 ff ff       	call   1140 <__isoc99_sscanf@plt>
    1a65:	48 83 c4 10          	add    $0x10,%rsp
    1a69:	83 f8 05             	cmp    $0x5,%eax
    1a6c:	7e 05                	jle    1a73 <read_six_numbers+0x3c>
    1a6e:	48 83 c4 08          	add    $0x8,%rsp
    1a72:	c3                   	ret    
    1a73:	e8 83 ff ff ff       	call   19fb <explode_bomb>

0000000000001a78 <read_line>:
    1a78:	55                   	push   %rbp
    1a79:	53                   	push   %rbx
    1a7a:	48 83 ec 08          	sub    $0x8,%rsp
    1a7e:	b8 00 00 00 00       	mov    $0x0,%eax
    1a83:	e8 8a fe ff ff       	call   1912 <skip>
    1a88:	48 85 c0             	test   %rax,%rax
    1a8b:	74 5d                	je     1aea <read_line+0x72>
    1a8d:	8b 2d 5d 3d 00 00    	mov    0x3d5d(%rip),%ebp        # 57f0 <num_input_strings>
    1a93:	48 63 c5             	movslq %ebp,%rax
    1a96:	48 8d 1c 80          	lea    (%rax,%rax,4),%rbx
    1a9a:	48 c1 e3 04          	shl    $0x4,%rbx
    1a9e:	48 8d 05 5b 3d 00 00 	lea    0x3d5b(%rip),%rax        # 5800 <input_strings>
    1aa5:	48 01 c3             	add    %rax,%rbx
    1aa8:	48 89 df             	mov    %rbx,%rdi
    1aab:	e8 d0 f5 ff ff       	call   1080 <strlen@plt>
    1ab0:	83 f8 4e             	cmp    $0x4e,%eax
    1ab3:	0f 8f a9 00 00 00    	jg     1b62 <read_line+0xea>
    1ab9:	83 e8 01             	sub    $0x1,%eax
    1abc:	48 98                	cltq   
    1abe:	48 63 d5             	movslq %ebp,%rdx
    1ac1:	48 8d 0c 92          	lea    (%rdx,%rdx,4),%rcx
    1ac5:	48 c1 e1 04          	shl    $0x4,%rcx
    1ac9:	48 8d 15 30 3d 00 00 	lea    0x3d30(%rip),%rdx        # 5800 <input_strings>
    1ad0:	48 01 ca             	add    %rcx,%rdx
    1ad3:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    1ad7:	83 c5 01             	add    $0x1,%ebp
    1ada:	89 2d 10 3d 00 00    	mov    %ebp,0x3d10(%rip)        # 57f0 <num_input_strings>
    1ae0:	48 89 d8             	mov    %rbx,%rax
    1ae3:	48 83 c4 08          	add    $0x8,%rsp
    1ae7:	5b                   	pop    %rbx
    1ae8:	5d                   	pop    %rbp
    1ae9:	c3                   	ret    
    1aea:	48 8b 05 7f 3c 00 00 	mov    0x3c7f(%rip),%rax        # 5770 <stdin@GLIBC_2.2.5>
    1af1:	48 39 05 98 3c 00 00 	cmp    %rax,0x3c98(%rip)        # 5790 <infile>
    1af8:	74 1b                	je     1b15 <read_line+0x9d>
    1afa:	48 8d 3d de 18 00 00 	lea    0x18de(%rip),%rdi        # 33df <array.0+0x1ff>
    1b01:	e8 2a f5 ff ff       	call   1030 <getenv@plt>
    1b06:	48 85 c0             	test   %rax,%rax
    1b09:	74 20                	je     1b2b <read_line+0xb3>
    1b0b:	bf 00 00 00 00       	mov    $0x0,%edi
    1b10:	e8 6b f6 ff ff       	call   1180 <exit@plt>
    1b15:	48 8d 3d a5 18 00 00 	lea    0x18a5(%rip),%rdi        # 33c1 <array.0+0x1e1>
    1b1c:	e8 3f f5 ff ff       	call   1060 <puts@plt>
    1b21:	bf 08 00 00 00       	mov    $0x8,%edi
    1b26:	e8 55 f6 ff ff       	call   1180 <exit@plt>
    1b2b:	48 8b 05 3e 3c 00 00 	mov    0x3c3e(%rip),%rax        # 5770 <stdin@GLIBC_2.2.5>
    1b32:	48 89 05 57 3c 00 00 	mov    %rax,0x3c57(%rip)        # 5790 <infile>
    1b39:	b8 00 00 00 00       	mov    $0x0,%eax
    1b3e:	e8 cf fd ff ff       	call   1912 <skip>
    1b43:	48 85 c0             	test   %rax,%rax
    1b46:	0f 85 41 ff ff ff    	jne    1a8d <read_line+0x15>
    1b4c:	48 8d 3d 6e 18 00 00 	lea    0x186e(%rip),%rdi        # 33c1 <array.0+0x1e1>
    1b53:	e8 08 f5 ff ff       	call   1060 <puts@plt>
    1b58:	bf 00 00 00 00       	mov    $0x0,%edi
    1b5d:	e8 1e f6 ff ff       	call   1180 <exit@plt>
    1b62:	48 8d 3d 81 18 00 00 	lea    0x1881(%rip),%rdi        # 33ea <array.0+0x20a>
    1b69:	e8 f2 f4 ff ff       	call   1060 <puts@plt>
    1b6e:	8b 05 7c 3c 00 00    	mov    0x3c7c(%rip),%eax        # 57f0 <num_input_strings>
    1b74:	8d 50 01             	lea    0x1(%rax),%edx
    1b77:	89 15 73 3c 00 00    	mov    %edx,0x3c73(%rip)        # 57f0 <num_input_strings>
    1b7d:	48 98                	cltq   
    1b7f:	48 6b c0 50          	imul   $0x50,%rax,%rax
    1b83:	48 8d 15 76 3c 00 00 	lea    0x3c76(%rip),%rdx        # 5800 <input_strings>
    1b8a:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    1b91:	75 6e 63 
    1b94:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    1b9b:	2a 2a 00 
    1b9e:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    1ba2:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    1ba7:	e8 4f fe ff ff       	call   19fb <explode_bomb>

0000000000001bac <phase_defused>:
    1bac:	48 83 ec 68          	sub    $0x68,%rsp
    1bb0:	bf 01 00 00 00       	mov    $0x1,%edi
    1bb5:	e8 a6 fd ff ff       	call   1960 <send_msg>
    1bba:	83 3d 2f 3c 00 00 06 	cmpl   $0x6,0x3c2f(%rip)        # 57f0 <num_input_strings>
    1bc1:	74 05                	je     1bc8 <phase_defused+0x1c>
    1bc3:	48 83 c4 68          	add    $0x68,%rsp
    1bc7:	c3                   	ret    
    1bc8:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    1bcd:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    1bd2:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    1bd7:	48 8d 35 27 18 00 00 	lea    0x1827(%rip),%rsi        # 3405 <array.0+0x225>
    1bde:	48 8d 3d 0b 3d 00 00 	lea    0x3d0b(%rip),%rdi        # 58f0 <input_strings+0xf0>
    1be5:	b8 00 00 00 00       	mov    $0x0,%eax
    1bea:	e8 51 f5 ff ff       	call   1140 <__isoc99_sscanf@plt>
    1bef:	83 f8 03             	cmp    $0x3,%eax
    1bf2:	74 1a                	je     1c0e <phase_defused+0x62>
    1bf4:	48 8d 3d e5 16 00 00 	lea    0x16e5(%rip),%rdi        # 32e0 <array.0+0x100>
    1bfb:	e8 60 f4 ff ff       	call   1060 <puts@plt>
    1c00:	48 8d 3d 09 17 00 00 	lea    0x1709(%rip),%rdi        # 3310 <array.0+0x130>
    1c07:	e8 54 f4 ff ff       	call   1060 <puts@plt>
    1c0c:	eb b5                	jmp    1bc3 <phase_defused+0x17>
    1c0e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    1c13:	48 8d 35 f4 17 00 00 	lea    0x17f4(%rip),%rsi        # 340e <array.0+0x22e>
    1c1a:	e8 41 fc ff ff       	call   1860 <strings_not_equal>
    1c1f:	85 c0                	test   %eax,%eax
    1c21:	75 d1                	jne    1bf4 <phase_defused+0x48>
    1c23:	48 8d 3d 56 16 00 00 	lea    0x1656(%rip),%rdi        # 3280 <array.0+0xa0>
    1c2a:	e8 31 f4 ff ff       	call   1060 <puts@plt>
    1c2f:	48 8d 3d 72 16 00 00 	lea    0x1672(%rip),%rdi        # 32a8 <array.0+0xc8>
    1c36:	e8 25 f4 ff ff       	call   1060 <puts@plt>
    1c3b:	b8 00 00 00 00       	mov    $0x0,%eax
    1c40:	e8 2d fb ff ff       	call   1772 <secret_phase>
    1c45:	eb ad                	jmp    1bf4 <phase_defused+0x48>

0000000000001c47 <sigalrm_handler>:
    1c47:	48 83 ec 08          	sub    $0x8,%rsp
    1c4b:	ba 00 00 00 00       	mov    $0x0,%edx
    1c50:	48 8d 35 d1 17 00 00 	lea    0x17d1(%rip),%rsi        # 3428 <array.0+0x248>
    1c57:	48 8b 3d 22 3b 00 00 	mov    0x3b22(%rip),%rdi        # 5780 <stderr@GLIBC_2.2.5>
    1c5e:	b8 00 00 00 00       	mov    $0x0,%eax
    1c63:	e8 a8 f4 ff ff       	call   1110 <fprintf@plt>
    1c68:	bf 01 00 00 00       	mov    $0x1,%edi
    1c6d:	e8 0e f5 ff ff       	call   1180 <exit@plt>

0000000000001c72 <rio_readlineb>:
    1c72:	41 56                	push   %r14
    1c74:	41 55                	push   %r13
    1c76:	41 54                	push   %r12
    1c78:	55                   	push   %rbp
    1c79:	53                   	push   %rbx
    1c7a:	49 89 f4             	mov    %rsi,%r12
    1c7d:	48 83 fa 01          	cmp    $0x1,%rdx
    1c81:	0f 86 90 00 00 00    	jbe    1d17 <rio_readlineb+0xa5>
    1c87:	48 89 fb             	mov    %rdi,%rbx
    1c8a:	4c 8d 74 16 ff       	lea    -0x1(%rsi,%rdx,1),%r14
    1c8f:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1c95:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
    1c99:	eb 54                	jmp    1cef <rio_readlineb+0x7d>
    1c9b:	e8 a0 f3 ff ff       	call   1040 <__errno_location@plt>
    1ca0:	83 38 04             	cmpl   $0x4,(%rax)
    1ca3:	75 53                	jne    1cf8 <rio_readlineb+0x86>
    1ca5:	8b 3b                	mov    (%rbx),%edi
    1ca7:	ba 00 20 00 00       	mov    $0x2000,%edx
    1cac:	48 89 ee             	mov    %rbp,%rsi
    1caf:	e8 0c f4 ff ff       	call   10c0 <read@plt>
    1cb4:	89 c2                	mov    %eax,%edx
    1cb6:	89 43 04             	mov    %eax,0x4(%rbx)
    1cb9:	85 c0                	test   %eax,%eax
    1cbb:	78 de                	js     1c9b <rio_readlineb+0x29>
    1cbd:	74 42                	je     1d01 <rio_readlineb+0x8f>
    1cbf:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    1cc3:	48 8b 43 08          	mov    0x8(%rbx),%rax
    1cc7:	0f b6 08             	movzbl (%rax),%ecx
    1cca:	48 83 c0 01          	add    $0x1,%rax
    1cce:	48 89 43 08          	mov    %rax,0x8(%rbx)
    1cd2:	83 ea 01             	sub    $0x1,%edx
    1cd5:	89 53 04             	mov    %edx,0x4(%rbx)
    1cd8:	49 83 c4 01          	add    $0x1,%r12
    1cdc:	41 88 4c 24 ff       	mov    %cl,-0x1(%r12)
    1ce1:	80 f9 0a             	cmp    $0xa,%cl
    1ce4:	74 3c                	je     1d22 <rio_readlineb+0xb0>
    1ce6:	41 83 c5 01          	add    $0x1,%r13d
    1cea:	4d 39 f4             	cmp    %r14,%r12
    1ced:	74 30                	je     1d1f <rio_readlineb+0xad>
    1cef:	8b 53 04             	mov    0x4(%rbx),%edx
    1cf2:	85 d2                	test   %edx,%edx
    1cf4:	7e af                	jle    1ca5 <rio_readlineb+0x33>
    1cf6:	eb cb                	jmp    1cc3 <rio_readlineb+0x51>
    1cf8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1cff:	eb 05                	jmp    1d06 <rio_readlineb+0x94>
    1d01:	b8 00 00 00 00       	mov    $0x0,%eax
    1d06:	85 c0                	test   %eax,%eax
    1d08:	75 29                	jne    1d33 <rio_readlineb+0xc1>
    1d0a:	b8 00 00 00 00       	mov    $0x0,%eax
    1d0f:	41 83 fd 01          	cmp    $0x1,%r13d
    1d13:	75 0d                	jne    1d22 <rio_readlineb+0xb0>
    1d15:	eb 13                	jmp    1d2a <rio_readlineb+0xb8>
    1d17:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1d1d:	eb 03                	jmp    1d22 <rio_readlineb+0xb0>
    1d1f:	4d 89 f4             	mov    %r14,%r12
    1d22:	41 c6 04 24 00       	movb   $0x0,(%r12)
    1d27:	49 63 c5             	movslq %r13d,%rax
    1d2a:	5b                   	pop    %rbx
    1d2b:	5d                   	pop    %rbp
    1d2c:	41 5c                	pop    %r12
    1d2e:	41 5d                	pop    %r13
    1d30:	41 5e                	pop    %r14
    1d32:	c3                   	ret    
    1d33:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1d3a:	eb ee                	jmp    1d2a <rio_readlineb+0xb8>

0000000000001d3c <submitr>:
    1d3c:	41 57                	push   %r15
    1d3e:	41 56                	push   %r14
    1d40:	41 55                	push   %r13
    1d42:	41 54                	push   %r12
    1d44:	55                   	push   %rbp
    1d45:	53                   	push   %rbx
    1d46:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
    1d4d:	48 89 fd             	mov    %rdi,%rbp
    1d50:	41 89 f5             	mov    %esi,%r13d
    1d53:	48 89 14 24          	mov    %rdx,(%rsp)
    1d57:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    1d5c:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    1d61:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    1d66:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
    1d6d:	00 
    1d6e:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
    1d75:	00 
    1d76:	c7 84 24 3c 20 00 00 	movl   $0x0,0x203c(%rsp)
    1d7d:	00 00 00 00 
    1d81:	ba 00 00 00 00       	mov    $0x0,%edx
    1d86:	be 01 00 00 00       	mov    $0x1,%esi
    1d8b:	bf 02 00 00 00       	mov    $0x2,%edi
    1d90:	e8 2b f4 ff ff       	call   11c0 <socket@plt>
    1d95:	85 c0                	test   %eax,%eax
    1d97:	0f 88 13 01 00 00    	js     1eb0 <submitr+0x174>
    1d9d:	41 89 c4             	mov    %eax,%r12d
    1da0:	48 89 ef             	mov    %rbp,%rdi
    1da3:	e8 58 f3 ff ff       	call   1100 <gethostbyname@plt>
    1da8:	48 85 c0             	test   %rax,%rax
    1dab:	0f 84 4e 01 00 00    	je     1eff <submitr+0x1c3>
    1db1:	48 8d ac 24 50 a0 00 	lea    0xa050(%rsp),%rbp
    1db8:	00 
    1db9:	48 c7 84 24 52 a0 00 	movq   $0x0,0xa052(%rsp)
    1dc0:	00 00 00 00 00 
    1dc5:	48 c7 84 24 58 a0 00 	movq   $0x0,0xa058(%rsp)
    1dcc:	00 00 00 00 00 
    1dd1:	66 c7 84 24 50 a0 00 	movw   $0x2,0xa050(%rsp)
    1dd8:	00 02 00 
    1ddb:	48 63 50 14          	movslq 0x14(%rax),%rdx
    1ddf:	48 8b 40 18          	mov    0x18(%rax),%rax
    1de3:	48 8b 30             	mov    (%rax),%rsi
    1de6:	48 8d bc 24 54 a0 00 	lea    0xa054(%rsp),%rdi
    1ded:	00 
    1dee:	e8 5d f3 ff ff       	call   1150 <memmove@plt>
    1df3:	66 41 c1 c5 08       	rol    $0x8,%r13w
    1df8:	66 44 89 ac 24 52 a0 	mov    %r13w,0xa052(%rsp)
    1dff:	00 00 
    1e01:	ba 10 00 00 00       	mov    $0x10,%edx
    1e06:	48 89 ee             	mov    %rbp,%rsi
    1e09:	44 89 e7             	mov    %r12d,%edi
    1e0c:	e8 7f f3 ff ff       	call   1190 <connect@plt>
    1e11:	85 c0                	test   %eax,%eax
    1e13:	0f 88 4b 01 00 00    	js     1f64 <submitr+0x228>
    1e19:	48 89 df             	mov    %rbx,%rdi
    1e1c:	e8 5f f2 ff ff       	call   1080 <strlen@plt>
    1e21:	48 89 c5             	mov    %rax,%rbp
    1e24:	48 8b 3c 24          	mov    (%rsp),%rdi
    1e28:	e8 53 f2 ff ff       	call   1080 <strlen@plt>
    1e2d:	49 89 c6             	mov    %rax,%r14
    1e30:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1e35:	e8 46 f2 ff ff       	call   1080 <strlen@plt>
    1e3a:	49 89 c5             	mov    %rax,%r13
    1e3d:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    1e42:	e8 39 f2 ff ff       	call   1080 <strlen@plt>
    1e47:	48 89 c2             	mov    %rax,%rdx
    1e4a:	4b 8d 84 2e 80 00 00 	lea    0x80(%r14,%r13,1),%rax
    1e51:	00 
    1e52:	48 01 d0             	add    %rdx,%rax
    1e55:	48 8d 54 6d 00       	lea    0x0(%rbp,%rbp,2),%rdx
    1e5a:	48 01 d0             	add    %rdx,%rax
    1e5d:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    1e63:	0f 87 52 01 00 00    	ja     1fbb <submitr+0x27f>
    1e69:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
    1e70:	00 
    1e71:	b9 00 04 00 00       	mov    $0x400,%ecx
    1e76:	b8 00 00 00 00       	mov    $0x0,%eax
    1e7b:	48 89 d7             	mov    %rdx,%rdi
    1e7e:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    1e81:	48 89 df             	mov    %rbx,%rdi
    1e84:	e8 f7 f1 ff ff       	call   1080 <strlen@plt>
    1e89:	85 c0                	test   %eax,%eax
    1e8b:	0f 84 1f 02 00 00    	je     20b0 <submitr+0x374>
    1e91:	8d 40 ff             	lea    -0x1(%rax),%eax
    1e94:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
    1e99:	48 8d ac 24 40 40 00 	lea    0x4040(%rsp),%rbp
    1ea0:	00 
    1ea1:	49 be d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r14
    1ea8:	00 20 00 
    1eab:	e9 94 01 00 00       	jmp    2044 <submitr+0x308>
    1eb0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    1eb7:	3a 20 43 
    1eba:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    1ec1:	20 75 6e 
    1ec4:	49 89 07             	mov    %rax,(%r15)
    1ec7:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1ecb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1ed2:	74 6f 20 
    1ed5:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    1edc:	65 20 73 
    1edf:	49 89 47 10          	mov    %rax,0x10(%r15)
    1ee3:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1ee7:	48 b8 20 73 6f 63 6b 	movabs $0x74656b636f7320,%rax
    1eee:	65 74 00 
    1ef1:	49 89 47 1e          	mov    %rax,0x1e(%r15)
    1ef5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1efa:	e9 b6 04 00 00       	jmp    23b5 <submitr+0x679>
    1eff:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    1f06:	3a 20 44 
    1f09:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    1f10:	20 75 6e 
    1f13:	49 89 07             	mov    %rax,(%r15)
    1f16:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1f1a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1f21:	74 6f 20 
    1f24:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    1f2b:	76 65 20 
    1f2e:	49 89 47 10          	mov    %rax,0x10(%r15)
    1f32:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1f36:	48 b8 20 73 65 72 76 	movabs $0x2072657672657320,%rax
    1f3d:	65 72 20 
    1f40:	48 ba 61 64 64 72 65 	movabs $0x73736572646461,%rdx
    1f47:	73 73 00 
    1f4a:	49 89 47 1f          	mov    %rax,0x1f(%r15)
    1f4e:	49 89 57 27          	mov    %rdx,0x27(%r15)
    1f52:	44 89 e7             	mov    %r12d,%edi
    1f55:	e8 56 f1 ff ff       	call   10b0 <close@plt>
    1f5a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f5f:	e9 51 04 00 00       	jmp    23b5 <submitr+0x679>
    1f64:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    1f6b:	3a 20 55 
    1f6e:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    1f75:	20 74 6f 
    1f78:	49 89 07             	mov    %rax,(%r15)
    1f7b:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1f7f:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    1f86:	65 63 74 
    1f89:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    1f90:	68 65 20 
    1f93:	49 89 47 10          	mov    %rax,0x10(%r15)
    1f97:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1f9b:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    1fa2:	65 72 00 
    1fa5:	49 89 47 1f          	mov    %rax,0x1f(%r15)
    1fa9:	44 89 e7             	mov    %r12d,%edi
    1fac:	e8 ff f0 ff ff       	call   10b0 <close@plt>
    1fb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fb6:	e9 fa 03 00 00       	jmp    23b5 <submitr+0x679>
    1fbb:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    1fc2:	3a 20 52 
    1fc5:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    1fcc:	20 73 74 
    1fcf:	49 89 07             	mov    %rax,(%r15)
    1fd2:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1fd6:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    1fdd:	74 6f 6f 
    1fe0:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    1fe7:	65 2e 20 
    1fea:	49 89 47 10          	mov    %rax,0x10(%r15)
    1fee:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1ff2:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    1ff9:	61 73 65 
    1ffc:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    2003:	49 54 52 
    2006:	49 89 47 20          	mov    %rax,0x20(%r15)
    200a:	49 89 57 28          	mov    %rdx,0x28(%r15)
    200e:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    2015:	55 46 00 
    2018:	49 89 47 30          	mov    %rax,0x30(%r15)
    201c:	44 89 e7             	mov    %r12d,%edi
    201f:	e8 8c f0 ff ff       	call   10b0 <close@plt>
    2024:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2029:	e9 87 03 00 00       	jmp    23b5 <submitr+0x679>
    202e:	49 0f a3 c6          	bt     %rax,%r14
    2032:	73 1a                	jae    204e <submitr+0x312>
    2034:	88 55 00             	mov    %dl,0x0(%rbp)
    2037:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    203b:	48 83 c3 01          	add    $0x1,%rbx
    203f:	49 39 dd             	cmp    %rbx,%r13
    2042:	74 6c                	je     20b0 <submitr+0x374>
    2044:	0f b6 13             	movzbl (%rbx),%edx
    2047:	8d 42 d6             	lea    -0x2a(%rdx),%eax
    204a:	3c 35                	cmp    $0x35,%al
    204c:	76 e0                	jbe    202e <submitr+0x2f2>
    204e:	89 d0                	mov    %edx,%eax
    2050:	83 e0 df             	and    $0xffffffdf,%eax
    2053:	83 e8 41             	sub    $0x41,%eax
    2056:	3c 19                	cmp    $0x19,%al
    2058:	76 da                	jbe    2034 <submitr+0x2f8>
    205a:	80 fa 20             	cmp    $0x20,%dl
    205d:	74 47                	je     20a6 <submitr+0x36a>
    205f:	8d 42 e0             	lea    -0x20(%rdx),%eax
    2062:	3c 5f                	cmp    $0x5f,%al
    2064:	76 09                	jbe    206f <submitr+0x333>
    2066:	80 fa 09             	cmp    $0x9,%dl
    2069:	0f 85 cb 03 00 00    	jne    243a <submitr+0x6fe>
    206f:	0f b6 d2             	movzbl %dl,%edx
    2072:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    2077:	48 8d 35 80 14 00 00 	lea    0x1480(%rip),%rsi        # 34fe <array.0+0x31e>
    207e:	b8 00 00 00 00       	mov    $0x0,%eax
    2083:	e8 e8 f0 ff ff       	call   1170 <sprintf@plt>
    2088:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
    208d:	88 45 00             	mov    %al,0x0(%rbp)
    2090:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
    2095:	88 45 01             	mov    %al,0x1(%rbp)
    2098:	0f b6 44 24 2a       	movzbl 0x2a(%rsp),%eax
    209d:	88 45 02             	mov    %al,0x2(%rbp)
    20a0:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    20a4:	eb 95                	jmp    203b <submitr+0x2ff>
    20a6:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    20aa:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    20ae:	eb 8b                	jmp    203b <submitr+0x2ff>
    20b0:	48 8d 9c 24 40 60 00 	lea    0x6040(%rsp),%rbx
    20b7:	00 
    20b8:	48 83 ec 08          	sub    $0x8,%rsp
    20bc:	48 8d 84 24 48 40 00 	lea    0x4048(%rsp),%rax
    20c3:	00 
    20c4:	50                   	push   %rax
    20c5:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
    20ca:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    20cf:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    20d4:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    20d9:	48 8d 35 70 13 00 00 	lea    0x1370(%rip),%rsi        # 3450 <array.0+0x270>
    20e0:	48 89 df             	mov    %rbx,%rdi
    20e3:	b8 00 00 00 00       	mov    $0x0,%eax
    20e8:	e8 83 f0 ff ff       	call   1170 <sprintf@plt>
    20ed:	48 89 df             	mov    %rbx,%rdi
    20f0:	e8 8b ef ff ff       	call   1080 <strlen@plt>
    20f5:	48 89 c3             	mov    %rax,%rbx
    20f8:	48 83 c4 10          	add    $0x10,%rsp
    20fc:	48 85 c0             	test   %rax,%rax
    20ff:	74 3e                	je     213f <submitr+0x403>
    2101:	48 8d ac 24 40 60 00 	lea    0x6040(%rsp),%rbp
    2108:	00 
    2109:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    210f:	eb 08                	jmp    2119 <submitr+0x3dd>
    2111:	48 01 c5             	add    %rax,%rbp
    2114:	48 29 c3             	sub    %rax,%rbx
    2117:	74 26                	je     213f <submitr+0x403>
    2119:	48 89 da             	mov    %rbx,%rdx
    211c:	48 89 ee             	mov    %rbp,%rsi
    211f:	44 89 e7             	mov    %r12d,%edi
    2122:	e8 49 ef ff ff       	call   1070 <write@plt>
    2127:	48 85 c0             	test   %rax,%rax
    212a:	7f e5                	jg     2111 <submitr+0x3d5>
    212c:	e8 0f ef ff ff       	call   1040 <__errno_location@plt>
    2131:	83 38 04             	cmpl   $0x4,(%rax)
    2134:	0f 85 34 01 00 00    	jne    226e <submitr+0x532>
    213a:	4c 89 e8             	mov    %r13,%rax
    213d:	eb d2                	jmp    2111 <submitr+0x3d5>
    213f:	44 89 a4 24 40 80 00 	mov    %r12d,0x8040(%rsp)
    2146:	00 
    2147:	c7 84 24 44 80 00 00 	movl   $0x0,0x8044(%rsp)
    214e:	00 00 00 00 
    2152:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
    2159:	00 
    215a:	48 8d 84 24 50 80 00 	lea    0x8050(%rsp),%rax
    2161:	00 
    2162:	48 89 84 24 48 80 00 	mov    %rax,0x8048(%rsp)
    2169:	00 
    216a:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    2171:	00 
    2172:	ba 00 20 00 00       	mov    $0x2000,%edx
    2177:	e8 f6 fa ff ff       	call   1c72 <rio_readlineb>
    217c:	48 85 c0             	test   %rax,%rax
    217f:	0f 8e 4e 01 00 00    	jle    22d3 <submitr+0x597>
    2185:	48 8d 8c 24 3c 20 00 	lea    0x203c(%rsp),%rcx
    218c:	00 
    218d:	48 8d 94 24 40 20 00 	lea    0x2040(%rsp),%rdx
    2194:	00 
    2195:	48 8d bc 24 40 60 00 	lea    0x6040(%rsp),%rdi
    219c:	00 
    219d:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
    21a2:	48 8d 35 5c 13 00 00 	lea    0x135c(%rip),%rsi        # 3505 <array.0+0x325>
    21a9:	b8 00 00 00 00       	mov    $0x0,%eax
    21ae:	e8 8d ef ff ff       	call   1140 <__isoc99_sscanf@plt>
    21b3:	8b 94 24 3c 20 00 00 	mov    0x203c(%rsp),%edx
    21ba:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
    21c0:	0f 85 7d 01 00 00    	jne    2343 <submitr+0x607>
    21c6:	48 8d 1d 49 13 00 00 	lea    0x1349(%rip),%rbx        # 3516 <array.0+0x336>
    21cd:	48 8d bc 24 40 60 00 	lea    0x6040(%rsp),%rdi
    21d4:	00 
    21d5:	48 89 de             	mov    %rbx,%rsi
    21d8:	e8 03 ef ff ff       	call   10e0 <strcmp@plt>
    21dd:	85 c0                	test   %eax,%eax
    21df:	0f 84 86 01 00 00    	je     236b <submitr+0x62f>
    21e5:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    21ec:	00 
    21ed:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
    21f4:	00 
    21f5:	ba 00 20 00 00       	mov    $0x2000,%edx
    21fa:	e8 73 fa ff ff       	call   1c72 <rio_readlineb>
    21ff:	48 85 c0             	test   %rax,%rax
    2202:	7f c9                	jg     21cd <submitr+0x491>
    2204:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    220b:	3a 20 43 
    220e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2215:	20 75 6e 
    2218:	49 89 07             	mov    %rax,(%r15)
    221b:	49 89 57 08          	mov    %rdx,0x8(%r15)
    221f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2226:	74 6f 20 
    2229:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2230:	68 65 61 
    2233:	49 89 47 10          	mov    %rax,0x10(%r15)
    2237:	49 89 57 18          	mov    %rdx,0x18(%r15)
    223b:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    2242:	66 72 6f 
    2245:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    224c:	76 65 72 
    224f:	49 89 47 20          	mov    %rax,0x20(%r15)
    2253:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2257:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    225c:	44 89 e7             	mov    %r12d,%edi
    225f:	e8 4c ee ff ff       	call   10b0 <close@plt>
    2264:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2269:	e9 47 01 00 00       	jmp    23b5 <submitr+0x679>
    226e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2275:	3a 20 43 
    2278:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    227f:	20 75 6e 
    2282:	49 89 07             	mov    %rax,(%r15)
    2285:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2289:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2290:	74 6f 20 
    2293:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    229a:	20 74 6f 
    229d:	49 89 47 10          	mov    %rax,0x10(%r15)
    22a1:	49 89 57 18          	mov    %rdx,0x18(%r15)
    22a5:	48 b8 65 20 74 6f 20 	movabs $0x656874206f742065,%rax
    22ac:	74 68 65 
    22af:	48 ba 20 73 65 72 76 	movabs $0x72657672657320,%rdx
    22b6:	65 72 00 
    22b9:	49 89 47 1c          	mov    %rax,0x1c(%r15)
    22bd:	49 89 57 24          	mov    %rdx,0x24(%r15)
    22c1:	44 89 e7             	mov    %r12d,%edi
    22c4:	e8 e7 ed ff ff       	call   10b0 <close@plt>
    22c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    22ce:	e9 e2 00 00 00       	jmp    23b5 <submitr+0x679>
    22d3:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    22da:	3a 20 43 
    22dd:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    22e4:	20 75 6e 
    22e7:	49 89 07             	mov    %rax,(%r15)
    22ea:	49 89 57 08          	mov    %rdx,0x8(%r15)
    22ee:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    22f5:	74 6f 20 
    22f8:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    22ff:	66 69 72 
    2302:	49 89 47 10          	mov    %rax,0x10(%r15)
    2306:	49 89 57 18          	mov    %rdx,0x18(%r15)
    230a:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    2311:	61 64 65 
    2314:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    231b:	6d 20 73 
    231e:	49 89 47 20          	mov    %rax,0x20(%r15)
    2322:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2326:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    232d:	65 72 00 
    2330:	49 89 47 2e          	mov    %rax,0x2e(%r15)
    2334:	44 89 e7             	mov    %r12d,%edi
    2337:	e8 74 ed ff ff       	call   10b0 <close@plt>
    233c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2341:	eb 72                	jmp    23b5 <submitr+0x679>
    2343:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
    2348:	48 8d 35 59 11 00 00 	lea    0x1159(%rip),%rsi        # 34a8 <array.0+0x2c8>
    234f:	4c 89 ff             	mov    %r15,%rdi
    2352:	b8 00 00 00 00       	mov    $0x0,%eax
    2357:	e8 14 ee ff ff       	call   1170 <sprintf@plt>
    235c:	44 89 e7             	mov    %r12d,%edi
    235f:	e8 4c ed ff ff       	call   10b0 <close@plt>
    2364:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2369:	eb 4a                	jmp    23b5 <submitr+0x679>
    236b:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    2372:	00 
    2373:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
    237a:	00 
    237b:	ba 00 20 00 00       	mov    $0x2000,%edx
    2380:	e8 ed f8 ff ff       	call   1c72 <rio_readlineb>
    2385:	48 85 c0             	test   %rax,%rax
    2388:	7e 3d                	jle    23c7 <submitr+0x68b>
    238a:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    2391:	00 
    2392:	4c 89 ff             	mov    %r15,%rdi
    2395:	e8 b6 ec ff ff       	call   1050 <strcpy@plt>
    239a:	44 89 e7             	mov    %r12d,%edi
    239d:	e8 0e ed ff ff       	call   10b0 <close@plt>
    23a2:	48 8d 35 70 11 00 00 	lea    0x1170(%rip),%rsi        # 3519 <array.0+0x339>
    23a9:	4c 89 ff             	mov    %r15,%rdi
    23ac:	e8 2f ed ff ff       	call   10e0 <strcmp@plt>
    23b1:	f7 d8                	neg    %eax
    23b3:	19 c0                	sbb    %eax,%eax
    23b5:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    23bc:	5b                   	pop    %rbx
    23bd:	5d                   	pop    %rbp
    23be:	41 5c                	pop    %r12
    23c0:	41 5d                	pop    %r13
    23c2:	41 5e                	pop    %r14
    23c4:	41 5f                	pop    %r15
    23c6:	c3                   	ret    
    23c7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    23ce:	3a 20 43 
    23d1:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    23d8:	20 75 6e 
    23db:	49 89 07             	mov    %rax,(%r15)
    23de:	49 89 57 08          	mov    %rdx,0x8(%r15)
    23e2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    23e9:	74 6f 20 
    23ec:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    23f3:	73 74 61 
    23f6:	49 89 47 10          	mov    %rax,0x10(%r15)
    23fa:	49 89 57 18          	mov    %rdx,0x18(%r15)
    23fe:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    2405:	65 73 73 
    2408:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    240f:	72 6f 6d 
    2412:	49 89 47 20          	mov    %rax,0x20(%r15)
    2416:	49 89 57 28          	mov    %rdx,0x28(%r15)
    241a:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    2421:	65 72 00 
    2424:	49 89 47 30          	mov    %rax,0x30(%r15)
    2428:	44 89 e7             	mov    %r12d,%edi
    242b:	e8 80 ec ff ff       	call   10b0 <close@plt>
    2430:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2435:	e9 7b ff ff ff       	jmp    23b5 <submitr+0x679>
    243a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    2441:	3a 20 52 
    2444:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    244b:	20 73 74 
    244e:	49 89 07             	mov    %rax,(%r15)
    2451:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2455:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    245c:	63 6f 6e 
    245f:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    2466:	20 61 6e 
    2469:	49 89 47 10          	mov    %rax,0x10(%r15)
    246d:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2471:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    2478:	67 61 6c 
    247b:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    2482:	6e 70 72 
    2485:	49 89 47 20          	mov    %rax,0x20(%r15)
    2489:	49 89 57 28          	mov    %rdx,0x28(%r15)
    248d:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    2494:	6c 65 20 
    2497:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    249e:	63 74 65 
    24a1:	49 89 47 30          	mov    %rax,0x30(%r15)
    24a5:	49 89 57 38          	mov    %rdx,0x38(%r15)
    24a9:	41 c7 47 3f 65 72 2e 	movl   $0x2e7265,0x3f(%r15)
    24b0:	00 
    24b1:	44 89 e7             	mov    %r12d,%edi
    24b4:	e8 f7 eb ff ff       	call   10b0 <close@plt>
    24b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24be:	e9 f2 fe ff ff       	jmp    23b5 <submitr+0x679>

00000000000024c3 <init_timeout>:
    24c3:	85 ff                	test   %edi,%edi
    24c5:	75 01                	jne    24c8 <init_timeout+0x5>
    24c7:	c3                   	ret    
    24c8:	53                   	push   %rbx
    24c9:	89 fb                	mov    %edi,%ebx
    24cb:	48 8d 35 75 f7 ff ff 	lea    -0x88b(%rip),%rsi        # 1c47 <sigalrm_handler>
    24d2:	bf 0e 00 00 00       	mov    $0xe,%edi
    24d7:	e8 14 ec ff ff       	call   10f0 <signal@plt>
    24dc:	85 db                	test   %ebx,%ebx
    24de:	b8 00 00 00 00       	mov    $0x0,%eax
    24e3:	0f 49 c3             	cmovns %ebx,%eax
    24e6:	89 c7                	mov    %eax,%edi
    24e8:	e8 b3 eb ff ff       	call   10a0 <alarm@plt>
    24ed:	5b                   	pop    %rbx
    24ee:	c3                   	ret    

00000000000024ef <init_driver>:
    24ef:	41 54                	push   %r12
    24f1:	55                   	push   %rbp
    24f2:	53                   	push   %rbx
    24f3:	48 83 ec 10          	sub    $0x10,%rsp
    24f7:	48 89 fd             	mov    %rdi,%rbp
    24fa:	be 01 00 00 00       	mov    $0x1,%esi
    24ff:	bf 0d 00 00 00       	mov    $0xd,%edi
    2504:	e8 e7 eb ff ff       	call   10f0 <signal@plt>
    2509:	be 01 00 00 00       	mov    $0x1,%esi
    250e:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2513:	e8 d8 eb ff ff       	call   10f0 <signal@plt>
    2518:	be 01 00 00 00       	mov    $0x1,%esi
    251d:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2522:	e8 c9 eb ff ff       	call   10f0 <signal@plt>
    2527:	ba 00 00 00 00       	mov    $0x0,%edx
    252c:	be 01 00 00 00       	mov    $0x1,%esi
    2531:	bf 02 00 00 00       	mov    $0x2,%edi
    2536:	e8 85 ec ff ff       	call   11c0 <socket@plt>
    253b:	85 c0                	test   %eax,%eax
    253d:	0f 88 84 00 00 00    	js     25c7 <init_driver+0xd8>
    2543:	89 c3                	mov    %eax,%ebx
    2545:	48 8d 3d d0 0f 00 00 	lea    0xfd0(%rip),%rdi        # 351c <array.0+0x33c>
    254c:	e8 af eb ff ff       	call   1100 <gethostbyname@plt>
    2551:	48 85 c0             	test   %rax,%rax
    2554:	0f 84 ba 00 00 00    	je     2614 <init_driver+0x125>
    255a:	49 89 e4             	mov    %rsp,%r12
    255d:	48 c7 44 24 02 00 00 	movq   $0x0,0x2(%rsp)
    2564:	00 00 
    2566:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    256d:	00 00 
    256f:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    2575:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2579:	48 8b 40 18          	mov    0x18(%rax),%rax
    257d:	48 8b 30             	mov    (%rax),%rsi
    2580:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    2585:	e8 c6 eb ff ff       	call   1150 <memmove@plt>
    258a:	66 c7 44 24 02 1f 91 	movw   $0x911f,0x2(%rsp)
    2591:	ba 10 00 00 00       	mov    $0x10,%edx
    2596:	4c 89 e6             	mov    %r12,%rsi
    2599:	89 df                	mov    %ebx,%edi
    259b:	e8 f0 eb ff ff       	call   1190 <connect@plt>
    25a0:	85 c0                	test   %eax,%eax
    25a2:	0f 88 d1 00 00 00    	js     2679 <init_driver+0x18a>
    25a8:	89 df                	mov    %ebx,%edi
    25aa:	e8 01 eb ff ff       	call   10b0 <close@plt>
    25af:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    25b5:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    25b9:	b8 00 00 00 00       	mov    $0x0,%eax
    25be:	48 83 c4 10          	add    $0x10,%rsp
    25c2:	5b                   	pop    %rbx
    25c3:	5d                   	pop    %rbp
    25c4:	41 5c                	pop    %r12
    25c6:	c3                   	ret    
    25c7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    25ce:	3a 20 43 
    25d1:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    25d8:	20 75 6e 
    25db:	48 89 45 00          	mov    %rax,0x0(%rbp)
    25df:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    25e3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    25ea:	74 6f 20 
    25ed:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    25f4:	65 20 73 
    25f7:	48 89 45 10          	mov    %rax,0x10(%rbp)
    25fb:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    25ff:	48 b8 20 73 6f 63 6b 	movabs $0x74656b636f7320,%rax
    2606:	65 74 00 
    2609:	48 89 45 1e          	mov    %rax,0x1e(%rbp)
    260d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2612:	eb aa                	jmp    25be <init_driver+0xcf>
    2614:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    261b:	3a 20 44 
    261e:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2625:	20 75 6e 
    2628:	48 89 45 00          	mov    %rax,0x0(%rbp)
    262c:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    2630:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2637:	74 6f 20 
    263a:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    2641:	76 65 20 
    2644:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2648:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    264c:	48 b8 20 73 65 72 76 	movabs $0x2072657672657320,%rax
    2653:	65 72 20 
    2656:	48 ba 61 64 64 72 65 	movabs $0x73736572646461,%rdx
    265d:	73 73 00 
    2660:	48 89 45 1f          	mov    %rax,0x1f(%rbp)
    2664:	48 89 55 27          	mov    %rdx,0x27(%rbp)
    2668:	89 df                	mov    %ebx,%edi
    266a:	e8 41 ea ff ff       	call   10b0 <close@plt>
    266f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2674:	e9 45 ff ff ff       	jmp    25be <init_driver+0xcf>
    2679:	48 8d 15 9c 0e 00 00 	lea    0xe9c(%rip),%rdx        # 351c <array.0+0x33c>
    2680:	48 8d 35 51 0e 00 00 	lea    0xe51(%rip),%rsi        # 34d8 <array.0+0x2f8>
    2687:	48 89 ef             	mov    %rbp,%rdi
    268a:	b8 00 00 00 00       	mov    $0x0,%eax
    268f:	e8 dc ea ff ff       	call   1170 <sprintf@plt>
    2694:	89 df                	mov    %ebx,%edi
    2696:	e8 15 ea ff ff       	call   10b0 <close@plt>
    269b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    26a0:	e9 19 ff ff ff       	jmp    25be <init_driver+0xcf>

00000000000026a5 <driver_post>:
    26a5:	53                   	push   %rbx
    26a6:	4c 89 c3             	mov    %r8,%rbx
    26a9:	85 c9                	test   %ecx,%ecx
    26ab:	75 17                	jne    26c4 <driver_post+0x1f>
    26ad:	48 85 ff             	test   %rdi,%rdi
    26b0:	74 05                	je     26b7 <driver_post+0x12>
    26b2:	80 3f 00             	cmpb   $0x0,(%rdi)
    26b5:	75 31                	jne    26e8 <driver_post+0x43>
    26b7:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    26bc:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    26c0:	89 c8                	mov    %ecx,%eax
    26c2:	5b                   	pop    %rbx
    26c3:	c3                   	ret    
    26c4:	48 89 d6             	mov    %rdx,%rsi
    26c7:	48 8d 3d 5a 0e 00 00 	lea    0xe5a(%rip),%rdi        # 3528 <array.0+0x348>
    26ce:	b8 00 00 00 00       	mov    $0x0,%eax
    26d3:	e8 b8 e9 ff ff       	call   1090 <printf@plt>
    26d8:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    26dd:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    26e1:	b8 00 00 00 00       	mov    $0x0,%eax
    26e6:	eb da                	jmp    26c2 <driver_post+0x1d>
    26e8:	41 50                	push   %r8
    26ea:	52                   	push   %rdx
    26eb:	4c 8d 0d 4d 0e 00 00 	lea    0xe4d(%rip),%r9        # 353f <array.0+0x35f>
    26f2:	49 89 f0             	mov    %rsi,%r8
    26f5:	48 89 f9             	mov    %rdi,%rcx
    26f8:	48 8d 15 44 0e 00 00 	lea    0xe44(%rip),%rdx        # 3543 <array.0+0x363>
    26ff:	be 91 1f 00 00       	mov    $0x1f91,%esi
    2704:	48 8d 3d 11 0e 00 00 	lea    0xe11(%rip),%rdi        # 351c <array.0+0x33c>
    270b:	e8 2c f6 ff ff       	call   1d3c <submitr>
    2710:	48 83 c4 10          	add    $0x10,%rsp
    2714:	eb ac                	jmp    26c2 <driver_post+0x1d>

Disassembly of section .fini:

0000000000002718 <_fini>:
    2718:	48 83 ec 08          	sub    $0x8,%rsp
    271c:	48 83 c4 08          	add    $0x8,%rsp
    2720:	c3                   	ret    
