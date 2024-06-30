; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=i386-unknown-unknown -mcpu=core-avx2 < %s | FileCheck --check-prefix=BMI2 %s
; RUN: llc -mtriple=x86_64-unknown-unknown -mcpu=core-avx2 < %s | FileCheck --check-prefix=BMI264 %s

define i32 @shl32(i32 %x, i32 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: shl32:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %al
; BMI2-NEXT:    shlxl %eax, {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl32:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shlxl %esi, %edi, %eax
; BMI264-NEXT:    retq
  %shl = shl i32 %x, %shamt
  ret i32 %shl
}

define i32 @shl32i(i32 %x) nounwind uwtable readnone {
; BMI2-LABEL: shl32i:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    shll $5, %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl32i:
; BMI264:       # %bb.0:
; BMI264-NEXT:    movl %edi, %eax
; BMI264-NEXT:    shll $5, %eax
; BMI264-NEXT:    retq
  %shl = shl i32 %x, 5
  ret i32 %shl
}

define i32 @shl32p(i32* %p, i32 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: shl32p:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    shlxl %ecx, (%eax), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl32p:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shlxl %esi, (%rdi), %eax
; BMI264-NEXT:    retq
  %x = load i32, i32* %p
  %shl = shl i32 %x, %shamt
  ret i32 %shl
}

define i32 @shl32pi(i32* %p) nounwind uwtable readnone {
; BMI2-LABEL: shl32pi:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl (%eax), %eax
; BMI2-NEXT:    shll $5, %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl32pi:
; BMI264:       # %bb.0:
; BMI264-NEXT:    movl (%rdi), %eax
; BMI264-NEXT:    shll $5, %eax
; BMI264-NEXT:    retq
  %x = load i32, i32* %p
  %shl = shl i32 %x, 5
  ret i32 %shl
}

define i64 @shl64(i64 %x, i64 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: shl64:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 8
; BMI2-NEXT:    .cfi_offset %esi, -8
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shldl %cl, %eax, %edx
; BMI2-NEXT:    shlxl %ecx, %eax, %esi
; BMI2-NEXT:    xorl %eax, %eax
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %edx
; BMI2-NEXT:    cmovel %esi, %eax
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 4
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl64:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shlxq %rsi, %rdi, %rax
; BMI264-NEXT:    retq
  %shl = shl i64 %x, %shamt
  ret i64 %shl
}

define i64 @shl64i(i64 %x) nounwind uwtable readnone {
; BMI2-LABEL: shl64i:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shldl $7, %eax, %edx
; BMI2-NEXT:    shll $7, %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl64i:
; BMI264:       # %bb.0:
; BMI264-NEXT:    movq %rdi, %rax
; BMI264-NEXT:    shlq $7, %rax
; BMI264-NEXT:    retq
  %shl = shl i64 %x, 7
  ret i64 %shl
}

define i64 @shl64p(i64* %p, i64 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: shl64p:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 8
; BMI2-NEXT:    .cfi_offset %esi, -8
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl (%eax), %esi
; BMI2-NEXT:    movl 4(%eax), %edx
; BMI2-NEXT:    shldl %cl, %esi, %edx
; BMI2-NEXT:    shlxl %ecx, %esi, %esi
; BMI2-NEXT:    xorl %eax, %eax
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %edx
; BMI2-NEXT:    cmovel %esi, %eax
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 4
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl64p:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shlxq %rsi, (%rdi), %rax
; BMI264-NEXT:    retq
  %x = load i64, i64* %p
  %shl = shl i64 %x, %shamt
  ret i64 %shl
}

define i64 @shl64pi(i64* %p) nounwind uwtable readnone {
; BMI2-LABEL: shl64pi:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; BMI2-NEXT:    movl (%ecx), %eax
; BMI2-NEXT:    movl 4(%ecx), %edx
; BMI2-NEXT:    shldl $7, %eax, %edx
; BMI2-NEXT:    shll $7, %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl64pi:
; BMI264:       # %bb.0:
; BMI264-NEXT:    movq (%rdi), %rax
; BMI264-NEXT:    shlq $7, %rax
; BMI264-NEXT:    retq
  %x = load i64, i64* %p
  %shl = shl i64 %x, 7
  ret i64 %shl
}

define i32 @lshr32(i32 %x, i32 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: lshr32:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %al
; BMI2-NEXT:    shrxl %eax, {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: lshr32:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shrxl %esi, %edi, %eax
; BMI264-NEXT:    retq
  %shl = lshr i32 %x, %shamt
  ret i32 %shl
}

define i32 @lshr32p(i32* %p, i32 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: lshr32p:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    shrxl %ecx, (%eax), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: lshr32p:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shrxl %esi, (%rdi), %eax
; BMI264-NEXT:    retq
  %x = load i32, i32* %p
  %shl = lshr i32 %x, %shamt
  ret i32 %shl
}

define i64 @lshr64(i64 %x, i64 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: lshr64:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 8
; BMI2-NEXT:    .cfi_offset %esi, -8
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shrdl %cl, %edx, %eax
; BMI2-NEXT:    shrxl %ecx, %edx, %esi
; BMI2-NEXT:    xorl %edx, %edx
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %eax
; BMI2-NEXT:    cmovel %esi, %edx
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 4
; BMI2-NEXT:    retl
;
; BMI264-LABEL: lshr64:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shrxq %rsi, %rdi, %rax
; BMI264-NEXT:    retq
  %shl = lshr i64 %x, %shamt
  ret i64 %shl
}

define i64 @lshr64p(i64* %p, i64 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: lshr64p:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 8
; BMI2-NEXT:    .cfi_offset %esi, -8
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    movl (%edx), %eax
; BMI2-NEXT:    movl 4(%edx), %edx
; BMI2-NEXT:    shrdl %cl, %edx, %eax
; BMI2-NEXT:    shrxl %ecx, %edx, %esi
; BMI2-NEXT:    xorl %edx, %edx
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %eax
; BMI2-NEXT:    cmovel %esi, %edx
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 4
; BMI2-NEXT:    retl
;
; BMI264-LABEL: lshr64p:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shrxq %rsi, (%rdi), %rax
; BMI264-NEXT:    retq
  %x = load i64, i64* %p
  %shl = lshr i64 %x, %shamt
  ret i64 %shl
}

define i32 @ashr32(i32 %x, i32 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: ashr32:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %al
; BMI2-NEXT:    sarxl %eax, {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: ashr32:
; BMI264:       # %bb.0:
; BMI264-NEXT:    sarxl %esi, %edi, %eax
; BMI264-NEXT:    retq
  %shl = ashr i32 %x, %shamt
  ret i32 %shl
}

define i32 @ashr32p(i32* %p, i32 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: ashr32p:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    sarxl %ecx, (%eax), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: ashr32p:
; BMI264:       # %bb.0:
; BMI264-NEXT:    sarxl %esi, (%rdi), %eax
; BMI264-NEXT:    retq
  %x = load i32, i32* %p
  %shl = ashr i32 %x, %shamt
  ret i32 %shl
}

define i64 @ashr64(i64 %x, i64 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: ashr64:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 8
; BMI2-NEXT:    .cfi_offset %esi, -8
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shrdl %cl, %edx, %eax
; BMI2-NEXT:    sarxl %ecx, %edx, %esi
; BMI2-NEXT:    sarl $31, %edx
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %eax
; BMI2-NEXT:    cmovel %esi, %edx
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 4
; BMI2-NEXT:    retl
;
; BMI264-LABEL: ashr64:
; BMI264:       # %bb.0:
; BMI264-NEXT:    sarxq %rsi, %rdi, %rax
; BMI264-NEXT:    retq
  %shl = ashr i64 %x, %shamt
  ret i64 %shl
}

define i64 @ashr64p(i64* %p, i64 %shamt) nounwind uwtable readnone {
; BMI2-LABEL: ashr64p:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 8
; BMI2-NEXT:    .cfi_offset %esi, -8
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    movl (%edx), %eax
; BMI2-NEXT:    movl 4(%edx), %edx
; BMI2-NEXT:    shrdl %cl, %edx, %eax
; BMI2-NEXT:    sarxl %ecx, %edx, %esi
; BMI2-NEXT:    sarl $31, %edx
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %eax
; BMI2-NEXT:    cmovel %esi, %edx
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    .cfi_def_cfa_offset 4
; BMI2-NEXT:    retl
;
; BMI264-LABEL: ashr64p:
; BMI264:       # %bb.0:
; BMI264-NEXT:    sarxq %rsi, (%rdi), %rax
; BMI264-NEXT:    retq
  %x = load i64, i64* %p
  %shl = ashr i64 %x, %shamt
  ret i64 %shl
}

define i32 @shl32and(i32 %t, i32 %val) nounwind {
; BMI2-LABEL: shl32and:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %al
; BMI2-NEXT:    shlxl %eax, {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl32and:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shlxl %edi, %esi, %eax
; BMI264-NEXT:    retq
  %shamt = and i32 %t, 31
  %res = shl i32 %val, %shamt
  ret i32 %res
}

define i64 @shl64and(i64 %t, i64 %val) nounwind {
; BMI2-LABEL: shl64and:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shldl %cl, %eax, %edx
; BMI2-NEXT:    shlxl %ecx, %eax, %esi
; BMI2-NEXT:    xorl %eax, %eax
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %edx
; BMI2-NEXT:    cmovel %esi, %eax
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    retl
;
; BMI264-LABEL: shl64and:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shlxq %rdi, %rsi, %rax
; BMI264-NEXT:    retq
  %shamt = and i64 %t, 63
  %res = shl i64 %val, %shamt
  ret i64 %res
}

define i32 @lshr32and(i32 %t, i32 %val) nounwind {
; BMI2-LABEL: lshr32and:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %al
; BMI2-NEXT:    shrxl %eax, {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: lshr32and:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shrxl %edi, %esi, %eax
; BMI264-NEXT:    retq
  %shamt = and i32 %t, 31
  %res = lshr i32 %val, %shamt
  ret i32 %res
}

define i64 @lshr64and(i64 %t, i64 %val) nounwind {
; BMI2-LABEL: lshr64and:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shrdl %cl, %edx, %eax
; BMI2-NEXT:    shrxl %ecx, %edx, %esi
; BMI2-NEXT:    xorl %edx, %edx
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %eax
; BMI2-NEXT:    cmovel %esi, %edx
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    retl
;
; BMI264-LABEL: lshr64and:
; BMI264:       # %bb.0:
; BMI264-NEXT:    shrxq %rdi, %rsi, %rax
; BMI264-NEXT:    retq
  %shamt = and i64 %t, 63
  %res = lshr i64 %val, %shamt
  ret i64 %res
}

define i32 @ashr32and(i32 %t, i32 %val) nounwind {
; BMI2-LABEL: ashr32and:
; BMI2:       # %bb.0:
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %al
; BMI2-NEXT:    sarxl %eax, {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    retl
;
; BMI264-LABEL: ashr32and:
; BMI264:       # %bb.0:
; BMI264-NEXT:    sarxl %edi, %esi, %eax
; BMI264-NEXT:    retq
  %shamt = and i32 %t, 31
  %res = ashr i32 %val, %shamt
  ret i32 %res
}

define i64 @ashr64and(i64 %t, i64 %val) nounwind {
; BMI2-LABEL: ashr64and:
; BMI2:       # %bb.0:
; BMI2-NEXT:    pushl %esi
; BMI2-NEXT:    movb {{[0-9]+}}(%esp), %cl
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; BMI2-NEXT:    shrdl %cl, %edx, %eax
; BMI2-NEXT:    sarxl %ecx, %edx, %esi
; BMI2-NEXT:    sarl $31, %edx
; BMI2-NEXT:    testb $32, %cl
; BMI2-NEXT:    cmovnel %esi, %eax
; BMI2-NEXT:    cmovel %esi, %edx
; BMI2-NEXT:    popl %esi
; BMI2-NEXT:    retl
;
; BMI264-LABEL: ashr64and:
; BMI264:       # %bb.0:
; BMI264-NEXT:    sarxq %rdi, %rsi, %rax
; BMI264-NEXT:    retq
  %shamt = and i64 %t, 63
  %res = ashr i64 %val, %shamt
  ret i64 %res
}