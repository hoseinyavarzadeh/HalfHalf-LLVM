; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-none-none-eabi -mattr=+mve -verify-machineinstrs %s -o - | FileCheck %s

define arm_aapcs_vfpcc <4 x i32> @vcreate_i32(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: vcreate_i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r1
; CHECK-NEXT:    vmov.32 q0[1], r0
; CHECK-NEXT:    vmov.32 q0[2], r3
; CHECK-NEXT:    vmov.32 q0[3], r2
; CHECK-NEXT:    bx lr
entry:
  %conv = zext i32 %a to i64
  %shl = shl nuw i64 %conv, 32
  %conv1 = zext i32 %b to i64
  %or = or i64 %shl, %conv1
  %0 = insertelement <2 x i64> undef, i64 %or, i64 0
  %conv2 = zext i32 %c to i64
  %shl3 = shl nuw i64 %conv2, 32
  %conv4 = zext i32 %d to i64
  %or5 = or i64 %shl3, %conv4
  %1 = insertelement <2 x i64> %0, i64 %or5, i64 1
  %2 = bitcast <2 x i64> %1 to <4 x i32>
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <4 x i32> @insert_0123(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_0123:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r0
; CHECK-NEXT:    vmov.32 q0[1], r1
; CHECK-NEXT:    vmov.32 q0[2], r2
; CHECK-NEXT:    vmov.32 q0[3], r3
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 0
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 1
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 2
  %v4 = insertelement <4 x i32> %v3, i32 %d, i32 3
  ret <4 x i32> %v4
}

define arm_aapcs_vfpcc <4 x i32> @insert_3210(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_3210:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r3
; CHECK-NEXT:    vmov.32 q0[1], r2
; CHECK-NEXT:    vmov.32 q0[2], r1
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 1
  %v4 = insertelement <4 x i32> %v3, i32 %d, i32 0
  ret <4 x i32> %v4
}

define arm_aapcs_vfpcc <4 x i32> @insert_0213(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_0213:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r0
; CHECK-NEXT:    vmov.32 q0[1], r2
; CHECK-NEXT:    vmov.32 q0[2], r1
; CHECK-NEXT:    vmov.32 q0[3], r3
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 0
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 1
  %v4 = insertelement <4 x i32> %v3, i32 %d, i32 3
  ret <4 x i32> %v4
}

define arm_aapcs_vfpcc <4 x i32> @insert_0220(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_0220:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r3
; CHECK-NEXT:    vmov.32 q0[2], r2
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 0
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 2
  %v4 = insertelement <4 x i32> %v3, i32 %d, i32 0
  ret <4 x i32> %v4
}

define arm_aapcs_vfpcc <4 x i32> @insert_321(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_321:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[1], r2
; CHECK-NEXT:    vmov.32 q0[2], r1
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 1
  ret <4 x i32> %v3
}

define arm_aapcs_vfpcc <4 x i32> @insert_310(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_310:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r2
; CHECK-NEXT:    vmov.32 q0[1], r1
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 1
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 0
  ret <4 x i32> %v3
}

define arm_aapcs_vfpcc <4 x i32> @insert_320(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_320:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r2
; CHECK-NEXT:    vmov.32 q0[2], r1
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 2
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 0
  ret <4 x i32> %v3
}

define arm_aapcs_vfpcc <4 x i32> @insert_31(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_31:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[1], r1
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 1
  ret <4 x i32> %v2
}

define arm_aapcs_vfpcc <4 x i32> @insert_32(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[2], r1
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 2
  ret <4 x i32> %v2
}

define arm_aapcs_vfpcc <4 x i32> @insert_3(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_3:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 3
  ret <4 x i32> %v1
}

define arm_aapcs_vfpcc <4 x i32> @insert_210(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_210:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r2
; CHECK-NEXT:    vmov.32 q0[1], r1
; CHECK-NEXT:    vmov.32 q0[2], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 2
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 1
  %v3 = insertelement <4 x i32> %v2, i32 %c, i32 0
  ret <4 x i32> %v3
}

define arm_aapcs_vfpcc <4 x i32> @insert_20(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_20:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r1
; CHECK-NEXT:    vmov.32 q0[2], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 2
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 0
  ret <4 x i32> %v2
}

define arm_aapcs_vfpcc <4 x i32> @insert_21(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_21:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[1], r1
; CHECK-NEXT:    vmov.32 q0[2], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 2
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 1
  ret <4 x i32> %v2
}

define arm_aapcs_vfpcc <4 x i32> @insert_2(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_2:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[2], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 2
  ret <4 x i32> %v1
}

define arm_aapcs_vfpcc <4 x i32> @insert_10(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_10:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r1
; CHECK-NEXT:    vmov.32 q0[1], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 1
  %v2 = insertelement <4 x i32> %v1, i32 %b, i32 0
  ret <4 x i32> %v2
}

define arm_aapcs_vfpcc <4 x i32> @insert_1(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_1:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[1], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 1
  ret <4 x i32> %v1
}

define arm_aapcs_vfpcc <4 x i32> @insert_0(i32 %a, i32 %b, i32 %c, i32 %d) {
; CHECK-LABEL: insert_0:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.32 q0[0], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <4 x i32> undef, i32 %a, i32 0
  ret <4 x i32> %v1
}

define hidden <8 x i16> @create_i16(i16 zeroext %a, i16 zeroext %b, i16 zeroext %c, i16 zeroext %d, i16 zeroext %a2, i16 zeroext %b2, i16 zeroext %c2, i16 zeroext %d2) local_unnamed_addr #0 {
; CHECK-LABEL: create_i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .save {r4, r5, r7, lr}
; CHECK-NEXT:    push {r4, r5, r7, lr}
; CHECK-NEXT:    movs r5, #0
; CHECK-NEXT:    orr.w r0, r1, r0, lsl #16
; CHECK-NEXT:    lsll r2, r5, #16
; CHECK-NEXT:    ldrd lr, r4, [sp, #16]
; CHECK-NEXT:    orr.w r1, r2, r3
; CHECK-NEXT:    ldr.w r12, [sp, #24]
; CHECK-NEXT:    orrs r0, r5
; CHECK-NEXT:    vmov.32 q0[0], r1
; CHECK-NEXT:    movs r7, #0
; CHECK-NEXT:    vmov.32 q0[1], r0
; CHECK-NEXT:    ldr r0, [sp, #28]
; CHECK-NEXT:    lsll r12, r7, #16
; CHECK-NEXT:    orr.w r4, r4, lr, lsl #16
; CHECK-NEXT:    orr.w r0, r0, r12
; CHECK-NEXT:    orrs r7, r4
; CHECK-NEXT:    vmov.32 q0[2], r0
; CHECK-NEXT:    vmov.32 q0[3], r7
; CHECK-NEXT:    vmov r0, r1, d0
; CHECK-NEXT:    vmov r2, r3, d1
; CHECK-NEXT:    pop {r4, r5, r7, pc}
entry:
  %conv = zext i16 %a to i64
  %shl = shl nuw i64 %conv, 48
  %conv1 = zext i16 %b to i64
  %shl2 = shl nuw nsw i64 %conv1, 32
  %or = or i64 %shl2, %shl
  %conv3 = zext i16 %c to i64
  %shl4 = shl nuw nsw i64 %conv3, 16
  %or5 = or i64 %or, %shl4
  %conv6 = zext i16 %d to i64
  %or7 = or i64 %or5, %conv6
  %0 = insertelement <2 x i64> undef, i64 %or7, i64 0
  %conv8 = zext i16 %a2 to i64
  %shl9 = shl nuw i64 %conv8, 48
  %conv10 = zext i16 %b2 to i64
  %shl11 = shl nuw nsw i64 %conv10, 32
  %or12 = or i64 %shl11, %shl9
  %conv13 = zext i16 %c2 to i64
  %shl14 = shl nuw nsw i64 %conv13, 16
  %or15 = or i64 %or12, %shl14
  %conv16 = zext i16 %d2 to i64
  %or17 = or i64 %or15, %conv16
  %1 = insertelement <2 x i64> %0, i64 %or17, i64 1
  %2 = bitcast <2 x i64> %1 to <8 x i16>
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <8 x i16> @insert_01234567(i16 %a0, i16 %a1, i16 %a2, i16 %a3, i16 %a4, i16 %a5, i16 %a6, i16 %a7) {
; CHECK-LABEL: insert_01234567:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.16 q0[0], r0
; CHECK-NEXT:    ldrh.w r0, [sp]
; CHECK-NEXT:    vmov.16 q0[1], r1
; CHECK-NEXT:    vmov.16 q0[2], r2
; CHECK-NEXT:    vmov.16 q0[3], r3
; CHECK-NEXT:    vmov.16 q0[4], r0
; CHECK-NEXT:    ldrh.w r0, [sp, #4]
; CHECK-NEXT:    vmov.16 q0[5], r0
; CHECK-NEXT:    ldrh.w r0, [sp, #8]
; CHECK-NEXT:    vmov.16 q0[6], r0
; CHECK-NEXT:    ldrh.w r0, [sp, #12]
; CHECK-NEXT:    vmov.16 q0[7], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <8 x i16> undef, i16 %a0, i32 0
  %v2 = insertelement <8 x i16> %v1, i16 %a1, i32 1
  %v3 = insertelement <8 x i16> %v2, i16 %a2, i32 2
  %v4 = insertelement <8 x i16> %v3, i16 %a3, i32 3
  %v5 = insertelement <8 x i16> %v4, i16 %a4, i32 4
  %v6 = insertelement <8 x i16> %v5, i16 %a5, i32 5
  %v7 = insertelement <8 x i16> %v6, i16 %a6, i32 6
  %v8 = insertelement <8 x i16> %v7, i16 %a7, i32 7
  ret <8 x i16> %v8
}

define hidden <16 x i8> @create_i8(i8 zeroext %a1, i8 zeroext %b1, i8 zeroext %c1, i8 zeroext %d1, i8 zeroext %a2, i8 zeroext %b2, i8 zeroext %c2, i8 zeroext %d2, i8 zeroext %a3, i8 zeroext %b3, i8 zeroext %c3, i8 zeroext %d3, i8 zeroext %a4, i8 zeroext %b4, i8 zeroext %c4, i8 zeroext %d4) local_unnamed_addr #0 {
; CHECK-LABEL: create_i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    .save {r4, r5, r7, r9, r11, lr}
; CHECK-NEXT:    push.w {r4, r5, r7, r9, r11, lr}
; CHECK-NEXT:    ldr.w r12, [sp, #28]
; CHECK-NEXT:    mov.w r11, #0
; CHECK-NEXT:    ldr r4, [sp, #24]
; CHECK-NEXT:    movs r5, #0
; CHECK-NEXT:    lsll r12, r11, #16
; CHECK-NEXT:    lsls r1, r1, #16
; CHECK-NEXT:    lsll r4, r5, #24
; CHECK-NEXT:    orr.w r0, r1, r0, lsl #22
; CHECK-NEXT:    orr.w r12, r12, r4
; CHECK-NEXT:    ldr r4, [sp, #32]
; CHECK-NEXT:    movs r7, #0
; CHECK-NEXT:    orr.w r0, r0, r2, lsl #8
; CHECK-NEXT:    lsll r4, r7, #8
; CHECK-NEXT:    add r0, r3
; CHECK-NEXT:    orr.w r12, r12, r4
; CHECK-NEXT:    ldr r4, [sp, #36]
; CHECK-NEXT:    orrs r0, r5
; CHECK-NEXT:    ldr r2, [sp, #56]
; CHECK-NEXT:    orr.w r0, r0, r11
; CHECK-NEXT:    orr.w r4, r4, r12
; CHECK-NEXT:    vmov.32 q0[0], r4
; CHECK-NEXT:    orrs r0, r7
; CHECK-NEXT:    vmov.32 q0[1], r0
; CHECK-NEXT:    ldr r0, [sp, #60]
; CHECK-NEXT:    movs r1, #0
; CHECK-NEXT:    movs r3, #0
; CHECK-NEXT:    lsll r0, r1, #16
; CHECK-NEXT:    lsll r2, r3, #24
; CHECK-NEXT:    orrs r0, r2
; CHECK-NEXT:    ldr r2, [sp, #64]
; CHECK-NEXT:    mov.w r9, #0
; CHECK-NEXT:    lsll r2, r9, #8
; CHECK-NEXT:    orrs r0, r2
; CHECK-NEXT:    ldr r2, [sp, #68]
; CHECK-NEXT:    orrs r0, r2
; CHECK-NEXT:    ldr r2, [sp, #40]
; CHECK-NEXT:    vmov.32 q0[2], r0
; CHECK-NEXT:    ldr r0, [sp, #44]
; CHECK-NEXT:    lsls r0, r0, #16
; CHECK-NEXT:    orr.w r0, r0, r2, lsl #22
; CHECK-NEXT:    ldr r2, [sp, #48]
; CHECK-NEXT:    orr.w r0, r0, r2, lsl #8
; CHECK-NEXT:    ldr r2, [sp, #52]
; CHECK-NEXT:    add r0, r2
; CHECK-NEXT:    orrs r0, r3
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    orr.w r0, r0, r9
; CHECK-NEXT:    vmov.32 q0[3], r0
; CHECK-NEXT:    vmov r0, r1, d0
; CHECK-NEXT:    vmov r2, r3, d1
; CHECK-NEXT:    pop.w {r4, r5, r7, r9, r11, pc}
entry:
  %conv = zext i8 %a1 to i64
  %shl = shl nuw nsw i64 %conv, 54
  %conv1 = zext i8 %b1 to i64
  %shl2 = shl nuw nsw i64 %conv1, 48
  %or = or i64 %shl2, %shl
  %conv3 = zext i8 %c1 to i64
  %shl4 = shl nuw nsw i64 %conv3, 40
  %or5 = or i64 %or, %shl4
  %conv6 = zext i8 %d1 to i64
  %shl7 = shl nuw nsw i64 %conv6, 32
  %or8 = or i64 %or5, %shl7
  %conv9 = zext i8 %a2 to i64
  %shl10 = shl nuw nsw i64 %conv9, 24
  %or11 = or i64 %or8, %shl10
  %conv12 = zext i8 %b2 to i64
  %shl13 = shl nuw nsw i64 %conv12, 16
  %or14 = or i64 %or11, %shl13
  %conv15 = zext i8 %c2 to i64
  %shl16 = shl nuw nsw i64 %conv15, 8
  %or17 = or i64 %or14, %shl16
  %conv18 = zext i8 %d2 to i64
  %or19 = or i64 %or17, %conv18
  %0 = insertelement <2 x i64> undef, i64 %or19, i64 0
  %conv20 = zext i8 %a3 to i64
  %shl21 = shl nuw nsw i64 %conv20, 54
  %conv22 = zext i8 %b3 to i64
  %shl23 = shl nuw nsw i64 %conv22, 48
  %or24 = or i64 %shl23, %shl21
  %conv25 = zext i8 %c3 to i64
  %shl26 = shl nuw nsw i64 %conv25, 40
  %or27 = or i64 %or24, %shl26
  %conv28 = zext i8 %d3 to i64
  %shl29 = shl nuw nsw i64 %conv28, 32
  %or30 = or i64 %or27, %shl29
  %conv31 = zext i8 %a4 to i64
  %shl32 = shl nuw nsw i64 %conv31, 24
  %or33 = or i64 %or30, %shl32
  %conv34 = zext i8 %b4 to i64
  %shl35 = shl nuw nsw i64 %conv34, 16
  %or36 = or i64 %or33, %shl35
  %conv37 = zext i8 %c4 to i64
  %shl38 = shl nuw nsw i64 %conv37, 8
  %or39 = or i64 %or36, %shl38
  %conv40 = zext i8 %d4 to i64
  %or41 = or i64 %or39, %conv40
  %1 = insertelement <2 x i64> %0, i64 %or41, i64 1
  %2 = bitcast <2 x i64> %1 to <16 x i8>
  ret <16 x i8> %2
}

define arm_aapcs_vfpcc <16 x i8> @insert_0123456789101112131415(i8 %a0, i8 %a1, i8 %a2, i8 %a3, i8 %a4, i8 %a5, i8 %a6, i8 %a7, i8 %a8, i8 %a9, i8 %a10, i8 %a11, i8 %a12, i8 %a13, i8 %a14, i8 %a15) {
; CHECK-LABEL: insert_0123456789101112131415:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov.8 q0[0], r0
; CHECK-NEXT:    ldrb.w r0, [sp]
; CHECK-NEXT:    vmov.8 q0[1], r1
; CHECK-NEXT:    vmov.8 q0[2], r2
; CHECK-NEXT:    vmov.8 q0[3], r3
; CHECK-NEXT:    vmov.8 q0[4], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #4]
; CHECK-NEXT:    vmov.8 q0[5], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #8]
; CHECK-NEXT:    vmov.8 q0[6], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #12]
; CHECK-NEXT:    vmov.8 q0[7], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #16]
; CHECK-NEXT:    vmov.8 q0[8], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #20]
; CHECK-NEXT:    vmov.8 q0[9], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #24]
; CHECK-NEXT:    vmov.8 q0[10], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #28]
; CHECK-NEXT:    vmov.8 q0[11], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #32]
; CHECK-NEXT:    vmov.8 q0[12], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #36]
; CHECK-NEXT:    vmov.8 q0[13], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #40]
; CHECK-NEXT:    vmov.8 q0[14], r0
; CHECK-NEXT:    ldrb.w r0, [sp, #44]
; CHECK-NEXT:    vmov.8 q0[15], r0
; CHECK-NEXT:    bx lr
entry:
  %v1 = insertelement <16 x i8> undef, i8 %a0, i32 0
  %v2 = insertelement <16 x i8> %v1, i8 %a1, i32 1
  %v3 = insertelement <16 x i8> %v2, i8 %a2, i32 2
  %v4 = insertelement <16 x i8> %v3, i8 %a3, i32 3
  %v5 = insertelement <16 x i8> %v4, i8 %a4, i32 4
  %v6 = insertelement <16 x i8> %v5, i8 %a5, i32 5
  %v7 = insertelement <16 x i8> %v6, i8 %a6, i32 6
  %v8 = insertelement <16 x i8> %v7, i8 %a7, i32 7
  %v9 = insertelement <16 x i8> %v8, i8 %a8, i32 8
  %v10 = insertelement <16 x i8> %v9, i8 %a9, i32 9
  %v11 = insertelement <16 x i8> %v10, i8 %a10, i32 10
  %v12 = insertelement <16 x i8> %v11, i8 %a11, i32 11
  %v13 = insertelement <16 x i8> %v12, i8 %a12, i32 12
  %v14 = insertelement <16 x i8> %v13, i8 %a13, i32 13
  %v15 = insertelement <16 x i8> %v14, i8 %a14, i32 14
  %v16 = insertelement <16 x i8> %v15, i8 %a15, i32 15
  ret <16 x i8> %v16
}
