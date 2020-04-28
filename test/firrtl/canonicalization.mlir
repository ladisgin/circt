// RUN: spt-opt -canonicalize %s | FileCheck %s


// CHECK-LABEL: firrtl.module @And
firrtl.module @And(%in: !firrtl.uint<4>,
                   %out: !firrtl.flip<uint<4>>) {
  // CHECK: firrtl.connect %out, %c1_ui4
  %c1_ui4 = firrtl.constant(1 : ui4) : !firrtl.uint<4>
  %c3_ui4 = firrtl.constant(3 : ui4) : !firrtl.uint<4>
  %0 = firrtl.and %c3_ui4, %c1_ui4 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %0 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %in
  %c1_ui15 = firrtl.constant(15 : ui4) : !firrtl.uint<4>
  %1 = firrtl.and %in, %c1_ui15 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %1 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %c0_ui4
  %c1_ui0 = firrtl.constant(0 : ui4) : !firrtl.uint<4>
  %2 = firrtl.and %in, %c1_ui0 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %2 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %in
  %3 = firrtl.and %in, %in : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %3 : !firrtl.flip<uint<4>>, !firrtl.uint<4>
}

// CHECK-LABEL: firrtl.module @Or
firrtl.module @Or(%in: !firrtl.uint<4>,
                   %out: !firrtl.flip<uint<4>>) {
  // CHECK: firrtl.connect %out, %c7_ui4
  %c4_ui4 = firrtl.constant(4 : ui4) : !firrtl.uint<4>
  %c3_ui4 = firrtl.constant(3 : ui4) : !firrtl.uint<4>
  %0 = firrtl.or %c3_ui4, %c4_ui4 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %0 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %c15_ui4
  %c1_ui15 = firrtl.constant(15 : ui4) : !firrtl.uint<4>
  %1 = firrtl.or %in, %c1_ui15 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %1 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %in
  %c1_ui0 = firrtl.constant(0 : ui4) : !firrtl.uint<4>
  %2 = firrtl.or %in, %c1_ui0 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %2 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %in
  %3 = firrtl.or %in, %in : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %3 : !firrtl.flip<uint<4>>, !firrtl.uint<4>
}

// CHECK-LABEL: firrtl.module @Xor
firrtl.module @Xor(%in: !firrtl.uint<4>,
                   %out: !firrtl.flip<uint<4>>) {
  // CHECK: firrtl.connect %out, %c2_ui4
  %c1_ui4 = firrtl.constant(1 : ui4) : !firrtl.uint<4>
  %c3_ui4 = firrtl.constant(3 : ui4) : !firrtl.uint<4>
  %0 = firrtl.xor %c3_ui4, %c1_ui4 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %0 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %in
  %c1_ui0 = firrtl.constant(0 : ui4) : !firrtl.uint<4>
  %2 = firrtl.xor %in, %c1_ui0 : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %2 : !firrtl.flip<uint<4>>, !firrtl.uint<4>

  // CHECK: firrtl.connect %out, %c0_ui4
  %3 = firrtl.xor %in, %in : (!firrtl.uint<4>, !firrtl.uint<4>) -> !firrtl.uint<4>
  firrtl.connect %out, %3 : !firrtl.flip<uint<4>>, !firrtl.uint<4>
}
