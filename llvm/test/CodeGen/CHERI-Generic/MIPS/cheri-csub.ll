; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; DO NOT EDIT -- This file was generated from test/CodeGen/CHERI-Generic/Inputs/cheri-csub.ll
; RUN: %cheri128_llc %s -o - | FileCheck %s --check-prefix=HYBRID
; RUN: %cheri128_purecap_llc %s -o - | FileCheck %s --check-prefix=PURECAP

define i64 @subp(i8 addrspace(200)* readnone %a, i8 addrspace(200)* readnone %b) nounwind {
; HYBRID-LABEL: subp:
; HYBRID:       # %bb.0: # %entry
; HYBRID-NEXT:    jr $ra
; HYBRID-NEXT:    csub $2, $c3, $c4
;
; PURECAP-LABEL: subp:
; PURECAP:       # %bb.0: # %entry
; PURECAP-NEXT:    cjr $c17
; PURECAP-NEXT:    csub $2, $c3, $c4
entry:
  %0 = tail call i64 @llvm.cheri.cap.diff.i64(i8 addrspace(200)* %a, i8 addrspace(200)* %b)
  ret i64 %0
}

declare i64 @llvm.cheri.cap.diff.i64(i8 addrspace(200)*, i8 addrspace(200)*)
