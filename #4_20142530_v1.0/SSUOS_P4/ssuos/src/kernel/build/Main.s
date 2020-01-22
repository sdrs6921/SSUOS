	.file	"Main.c"
	.text
.Ltext0:
	.comm	Glob_x,4,4
	.comm	Glob_y,4,4
	.globl	VERSION
	.section	.rodata
.LC0:
	.string	"0.1.02"
	.section	.data.rel.local,"aw",@progbits
	.align 4
	.type	VERSION, @object
	.size	VERSION, 4
VERSION:
	.long	.LC0
	.globl	AUTHOR
	.section	.rodata
.LC1:
	.string	"OSLAB"
	.section	.data.rel.local
	.align 4
	.type	AUTHOR, @object
	.size	AUTHOR, 4
AUTHOR:
	.long	.LC1
	.globl	MODIFIER
	.section	.rodata
.LC2:
	.string	"You"
	.section	.data.rel.local
	.align 4
	.type	MODIFIER, @object
	.size	MODIFIER, 4
MODIFIER:
	.long	.LC2
	.text
	.globl	ssuos_main
	.type	ssuos_main, @function
ssuos_main:
.LFB3:
	.file 1 "arch/Main.c"
	.loc 1 29 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	.loc 1 30 0
	call	main_init
	.loc 1 32 0
	subl	$12, %esp
	pushl	$0
	call	idle@PLT
	addl	$16, %esp
	.loc 1 34 0
	nop
	.loc 1 35 0
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	ssuos_main, .-ssuos_main
	.section	.rodata
.LC3:
	.string	"Memory Detecting\n"
.LC4:
	.string	"%s"
.LC5:
	.string	"PIT Initialization\n"
.LC6:
	.string	"System call Initialization\n"
.LC7:
	.string	"Interrupt Initialization\n"
.LC8:
	.string	"%sPalloc Initialization\n"
.LC9:
	.string	"Paging Initialization\n"
.LC10:
	.string	"Process Initialization\n"
	.align 4
.LC11:
	.string	"========== initialization complete ==========\n\n"
	.text
	.globl	main_init
	.type	main_init, @function
main_init:
.LFB4:
	.loc 1 38 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	.loc 1 39 0
	call	intr_disable@PLT
	.loc 1 41 0
	call	init_console@PLT
	.loc 1 43 0
	call	print_contributors
	.loc 1 45 0
	call	detect_mem@PLT
	.loc 1 46 0
	subl	$8, %esp
	leal	.LC3@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 48 0
	call	init_pit@PLT
	.loc 1 49 0
	subl	$8, %esp
	leal	.LC5@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 51 0
	call	init_syscall@PLT
	.loc 1 52 0
	subl	$8, %esp
	leal	.LC6@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 54 0
	call	init_intr@PLT
	.loc 1 55 0
	subl	$8, %esp
	leal	.LC7@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 57 0
	call	init_kbd@PLT
	.loc 1 59 0
	call	init_palloc@PLT
	.loc 1 60 0
	subl	$12, %esp
	leal	.LC8@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 62 0
	call	init_paging@PLT
	.loc 1 63 0
	subl	$8, %esp
	leal	.LC9@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 65 0
	call	init_proc@PLT
	.loc 1 66 0
	subl	$8, %esp
	leal	.LC10@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 68 0
	call	intr_enable@PLT
	.loc 1 70 0
	subl	$12, %esp
	leal	.LC11@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 76 0
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	main_init, .-main_init
	.section	.rodata
.LC12:
	.string	"SSUOS main start!!!!\n"
	.align 4
.LC13:
	.string	"          ______    ______   __    __         ______    ______  \n"
	.align 4
.LC14:
	.string	"         /      \\  /      \\ /  |  /  |       /      \\  /      \\ \n"
	.align 4
.LC15:
	.string	"        /$$$$$$  |/$$$$$$  |$$ |  $$ |      /$$$$$$  |/$$$$$$  |\n"
	.align 4
.LC16:
	.string	"        $$ \\__$$/ $$ \\__$$/ $$ |  $$ |      $$ |  $$ |$$ \\__$$/ \n"
	.align 4
.LC17:
	.string	"        $$      \\ $$      \\ $$ |  $$ |      $$ |  $$ |$$      \\ \n"
	.align 4
.LC18:
	.string	"         $$$$$$  | $$$$$$  |$$ |  $$ |      $$ |  $$ | $$$$$$  |\n"
	.align 4
.LC19:
	.string	"        /  \\__$$ |/  \\__$$ |$$ \\__$$ |      $$ \\__$$ |/  \\__$$ |\n"
	.align 4
.LC20:
	.string	"        $$    $$/ $$    $$/ $$    $$/       $$    $$/ $$    $$/ \n"
	.align 4
.LC21:
	.string	"         $$$$$$/   $$$$$$/   $$$$$$/         $$$$$$/   $$$$$$/  \n"
.LC22:
	.string	"\n"
	.align 4
.LC23:
	.string	"****************Made by OSLAB in SoongSil University*********************\n"
	.align 4
.LC24:
	.string	"contributors : Yunkyu Lee  , Minwoo Jang  , Sanghun Choi , Eunseok Choi\n"
	.align 4
.LC25:
	.string	"               Hyunho Ji   , Giwook Kang  , Kisu Kim     , Seonguk Lee \n"
	.align 4
.LC26:
	.string	"               Gibeom Byeon, Jeonghwan Lee, Kyoungmin Kim, Myungjoon Shon\n"
	.align 4
.LC27:
	.string	"               Jinwoo Lee, Hansol Lee, Mhanwoo Heo, Jeongwoo Choi, Yongmin Kim\n"
	.align 4
.LC28:
	.string	"************************  Professor. Jiman Hong  ************************\n"
	.align 4
.LC29:
	.string	"                                                                  \n"
	.text
	.globl	print_contributors
	.type	print_contributors, @function
print_contributors:
.LFB5:
	.loc 1 79 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	.loc 1 80 0
	subl	$8, %esp
	leal	.LC12@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	.LC4@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 81 0
	subl	$12, %esp
	leal	.LC13@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 82 0
	subl	$12, %esp
	leal	.LC14@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 83 0
	subl	$12, %esp
	leal	.LC15@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 84 0
	subl	$12, %esp
	leal	.LC16@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 85 0
	subl	$12, %esp
	leal	.LC17@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 86 0
	subl	$12, %esp
	leal	.LC18@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 87 0
	subl	$12, %esp
	leal	.LC19@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 88 0
	subl	$12, %esp
	leal	.LC20@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 89 0
	subl	$12, %esp
	leal	.LC21@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 90 0
	subl	$12, %esp
	leal	.LC22@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 91 0
	subl	$12, %esp
	leal	.LC23@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 92 0
	subl	$12, %esp
	leal	.LC22@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 93 0
	subl	$12, %esp
	leal	.LC24@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 94 0
	subl	$12, %esp
	leal	.LC25@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 95 0
	subl	$12, %esp
	leal	.LC26@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 96 0
	subl	$12, %esp
	leal	.LC27@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 97 0
	subl	$12, %esp
	leal	.LC22@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 98 0
	subl	$12, %esp
	leal	.LC28@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 99 0
	subl	$12, %esp
	leal	.LC29@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printk@PLT
	addl	$16, %esp
	.loc 1 100 0
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	print_contributors, .-print_contributors
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB6:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE6:
	.text
.Letext0:
	.file 2 "./include/device/console.h"
	.file 3 "./include/list.h"
	.file 4 "./include/type.h"
	.file 5 "./include/proc/proc.h"
	.file 6 "./include/syscall.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2d1
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF56
	.byte	0xc
	.long	.LASF57
	.long	.LASF58
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1
	.uleb128 0x3
	.long	0x2c
	.uleb128 0x4
	.long	.LASF12
	.byte	0x4
	.byte	0x8
	.long	0x2c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x7
	.long	.LASF8
	.byte	0x2
	.byte	0xc
	.long	0x5f
	.uleb128 0x5
	.byte	0x3
	.long	Glob_x
	.uleb128 0x7
	.long	.LASF9
	.byte	0x2
	.byte	0xd
	.long	0x5f
	.uleb128 0x5
	.byte	0x3
	.long	Glob_y
	.uleb128 0x8
	.long	.LASF19
	.byte	0x8
	.byte	0x3
	.byte	0x59
	.long	0xbd
	.uleb128 0x9
	.long	.LASF10
	.byte	0x3
	.byte	0x5b
	.long	0xbd
	.byte	0
	.uleb128 0x9
	.long	.LASF11
	.byte	0x3
	.byte	0x5c
	.long	0xbd
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x98
	.uleb128 0x4
	.long	.LASF13
	.byte	0x5
	.byte	0x8
	.long	0x5f
	.uleb128 0xb
	.long	.LASF41
	.byte	0x7
	.byte	0x4
	.long	0x43
	.byte	0x5
	.byte	0xa
	.long	0xfe
	.uleb128 0xc
	.long	.LASF14
	.byte	0
	.uleb128 0xc
	.long	.LASF15
	.byte	0x1
	.uleb128 0xc
	.long	.LASF16
	.byte	0x2
	.uleb128 0xc
	.long	.LASF17
	.byte	0x3
	.uleb128 0xc
	.long	.LASF18
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.long	.LASF20
	.byte	0x50
	.byte	0x5
	.byte	0x1b
	.long	0x1ee
	.uleb128 0xd
	.string	"pid"
	.byte	0x5
	.byte	0x1d
	.long	0xc3
	.byte	0
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.byte	0x1e
	.long	0x74
	.byte	0x4
	.uleb128 0xd
	.string	"pd"
	.byte	0x5
	.byte	0x1f
	.long	0x74
	.byte	0x8
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.byte	0x20
	.long	0xce
	.byte	0xc
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.byte	0x21
	.long	0x6d
	.byte	0x10
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.byte	0x22
	.long	0x1ee
	.byte	0x18
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.byte	0x23
	.long	0x5f
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.byte	0x24
	.long	0x5f
	.byte	0x20
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.byte	0x25
	.long	0x5f
	.byte	0x24
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.byte	0x26
	.long	0x5f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.byte	0x28
	.long	0x25
	.byte	0x2c
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.byte	0x29
	.long	0x25
	.byte	0x2d
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.byte	0x2a
	.long	0x25
	.byte	0x2e
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.byte	0x2c
	.long	0x38
	.byte	0x2f
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.byte	0x2d
	.long	0x43
	.byte	0x30
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.byte	0x2e
	.long	0x43
	.byte	0x34
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.byte	0x2f
	.long	0x6d
	.byte	0x38
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.byte	0x32
	.long	0x98
	.byte	0x40
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.byte	0x33
	.long	0x98
	.byte	0x48
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0xfe
	.uleb128 0xe
	.long	.LASF38
	.byte	0x5
	.byte	0x38
	.long	0x1ee
	.uleb128 0xe
	.long	.LASF39
	.byte	0x5
	.byte	0x39
	.long	0x20a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF40
	.uleb128 0xb
	.long	.LASF42
	.byte	0x7
	.byte	0x4
	.long	0x43
	.byte	0x6
	.byte	0x4
	.long	0x247
	.uleb128 0xc
	.long	.LASF43
	.byte	0
	.uleb128 0xc
	.long	.LASF44
	.byte	0x1
	.uleb128 0xc
	.long	.LASF45
	.byte	0x2
	.uleb128 0xc
	.long	.LASF46
	.byte	0x3
	.uleb128 0xc
	.long	.LASF47
	.byte	0x4
	.uleb128 0xc
	.long	.LASF48
	.byte	0x5
	.byte	0
	.uleb128 0xf
	.long	0x5f
	.long	0x25d
	.uleb128 0x10
	.long	0x43
	.byte	0x4
	.uleb128 0x10
	.long	0x43
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.long	.LASF49
	.byte	0x6
	.byte	0x16
	.long	0x247
	.uleb128 0x7
	.long	.LASF50
	.byte	0x1
	.byte	0x18
	.long	0x279
	.uleb128 0x5
	.byte	0x3
	.long	VERSION
	.uleb128 0xa
	.byte	0x4
	.long	0x33
	.uleb128 0x7
	.long	.LASF51
	.byte	0x1
	.byte	0x19
	.long	0x279
	.uleb128 0x5
	.byte	0x3
	.long	AUTHOR
	.uleb128 0x7
	.long	.LASF52
	.byte	0x1
	.byte	0x1a
	.long	0x279
	.uleb128 0x5
	.byte	0x3
	.long	MODIFIER
	.uleb128 0x11
	.long	.LASF53
	.byte	0x1
	.byte	0x4e
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.long	.LASF54
	.byte	0x1
	.byte	0x25
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.long	.LASF55
	.byte	0x1
	.byte	0x1c
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF56:
	.string	"GNU C11 7.3.0 -m32 -mtune=generic -march=i686 -g -O0 -ffreestanding -fno-stack-protector"
.LASF29:
	.string	"priority"
.LASF27:
	.string	"exit_status"
.LASF45:
	.string	"SYS_WAIT"
.LASF22:
	.string	"state"
.LASF5:
	.string	"short int"
.LASF48:
	.string	"SYS_NUM"
.LASF14:
	.string	"PROC_UNUSED"
.LASF49:
	.string	"syscall_tbl"
.LASF58:
	.string	"/home/heesang/\353\260\224\355\203\225\355\231\224\353\251\264/\354\232\264\354\230\201\354\262\264\354\240\234_2018/SSUOS_P4/ssuos/src/kernel"
.LASF46:
	.string	"SYS_SSUREAD"
.LASF24:
	.string	"parent"
.LASF47:
	.string	"SYS_SHUTDOWN"
.LASF12:
	.string	"bool"
.LASF20:
	.string	"process"
.LASF26:
	.string	"child_pid"
.LASF33:
	.string	"member"
.LASF28:
	.string	"que_level"
.LASF3:
	.string	"long long int"
.LASF54:
	.string	"main_init"
.LASF51:
	.string	"AUTHOR"
.LASF32:
	.string	"old_proc"
.LASF43:
	.string	"SYS_FORK"
.LASF37:
	.string	"elem_stat"
.LASF0:
	.string	"unsigned char"
.LASF35:
	.string	"time_used"
.LASF57:
	.string	"arch/Main.c"
.LASF4:
	.string	"signed char"
.LASF30:
	.string	"rt_priority"
.LASF7:
	.string	"long long unsigned int"
.LASF2:
	.string	"unsigned int"
.LASF18:
	.string	"PROC_BLOCK"
.LASF21:
	.string	"stack"
.LASF19:
	.string	"list_elem"
.LASF55:
	.string	"ssuos_main"
.LASF16:
	.string	"PROC_STOP"
.LASF6:
	.string	"short unsigned int"
.LASF1:
	.string	"char"
.LASF41:
	.string	"p_state"
.LASF36:
	.string	"elem_all"
.LASF53:
	.string	"print_contributors"
.LASF38:
	.string	"cur_process"
.LASF34:
	.string	"time_slice"
.LASF50:
	.string	"VERSION"
.LASF52:
	.string	"MODIFIER"
.LASF23:
	.string	"time_sleep"
.LASF15:
	.string	"PROC_RUN"
.LASF40:
	.string	"long unsigned int"
.LASF44:
	.string	"SYS_EXIT"
.LASF13:
	.string	"pid_t"
.LASF25:
	.string	"simple_lock"
.LASF31:
	.string	"nice"
.LASF17:
	.string	"PROC_ZOMBIE"
.LASF10:
	.string	"prev"
.LASF8:
	.string	"Glob_x"
.LASF9:
	.string	"Glob_y"
.LASF42:
	.string	"SYS_LIST"
.LASF39:
	.string	"proc_ticks"
.LASF11:
	.string	"next"
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
