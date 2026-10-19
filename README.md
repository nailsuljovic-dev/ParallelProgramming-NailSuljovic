# ParallelProgramming-NailSuljovic
##gcc -Wall -Wextra -g -std=c99 -o program main.c
main.c: In function ‘main’:
main.c:7:44: warning: ‘ipos’ may be used uninitialized [-Wmaybe-uninitialized]
    7 |     for (int i = 0; i<=10; i++){ iarray[i] = ipos; }
      |                                  ~~~~~~~~~~^~~~~~
main.c:4:9: note: ‘ipos’ was declared here
    4 |     int ipos, ival;
      |         ^~~~
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./program 5
==6928== Memcheck, a memory error detector
==6928== Copyright (C) 2002-2024, and GNU GPL'd, by Julian Seward et al.
==6928== Using Valgrind-3.24.0 and LibVEX; rerun with -h for copyright info
==6928== Command: ./program 5
==6928== 
==6928== Invalid write of size 4
==6928==    at 0x1091A2: main (main.c:7)
==6928==  Address 0x4a6e068 is 0 bytes after a block of size 40 alloc'd
==6928==    at 0x4844818: malloc (vg_replace_malloc.c:446)
==6928==    by 0x109161: main (main.c:5)
==6928== 
==6928== Conditional jump or move depends on uninitialised value(s)
==6928==    at 0x1091D0: main (main.c:9)
==6928==  Uninitialised value was created by a stack allocation
==6928==    at 0x109149: main (main.c:3)
==6928== 
==6928== Invalid read of size 4
==6928==    at 0x1091CB: main (main.c:9)
==6928==  Address 0x4a6e068 is 0 bytes after a block of size 40 alloc'd
==6928==    at 0x4844818: malloc (vg_replace_malloc.c:446)
==6928==    by 0x109161: main (main.c:5)
==6928== 
==6928== 
==6928== HEAP SUMMARY:
==6928==     in use at exit: 40 bytes in 1 blocks
==6928==   total heap usage: 1 allocs, 0 frees, 40 bytes allocated
==6928== 
==6928== 40 bytes in 1 blocks are definitely lost in loss record 1 of 1
==6928==    at 0x4844818: malloc (vg_replace_malloc.c:446)
==6928==    by 0x109161: main (main.c:5)
==6928== 
==6928== LEAK SUMMARY:
==6928==    definitely lost: 40 bytes in 1 blocks
==6928==    indirectly lost: 0 bytes in 0 blocks
==6928==      possibly lost: 0 bytes in 0 blocks
==6928==    still reachable: 0 bytes in 0 blocks
==6928==         suppressed: 0 bytes in 0 blocks
==6928== 
==6928== For lists of detected and suppressed errors, rerun with: -s
==6928== ERROR SUMMARY: 13 errors from 4 contexts (suppressed: 0 from 0)
