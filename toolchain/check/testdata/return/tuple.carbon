// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE


fn Main() -> (i32, i32) {
  return (15, 35);
}

// CHECK:STDOUT: --- tuple.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.loc8_23.1: type = tuple_type (type, type)
// CHECK:STDOUT:   %.loc8_23.2: type = tuple_type (i32, i32)
// CHECK:STDOUT:   %.loc8_23.3: type = ptr_type (i32, i32)
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace {.Main = %Main}
// CHECK:STDOUT:   %Main: <function> = fn_decl @Main
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Main() -> %return: (i32, i32) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc9_11: i32 = int_literal 15
// CHECK:STDOUT:   %.loc9_15: i32 = int_literal 35
// CHECK:STDOUT:   %.loc9_17.1: (i32, i32) = tuple_literal (%.loc9_11, %.loc9_15)
// CHECK:STDOUT:   %.loc9_17.2: ref i32 = tuple_access %return, element0
// CHECK:STDOUT:   %.loc9_17.3: init i32 = initialize_from %.loc9_11 to %.loc9_17.2
// CHECK:STDOUT:   %.loc9_17.4: ref i32 = tuple_access %return, element1
// CHECK:STDOUT:   %.loc9_17.5: init i32 = initialize_from %.loc9_15 to %.loc9_17.4
// CHECK:STDOUT:   %.loc9_17.6: init (i32, i32) = tuple_init (%.loc9_17.3, %.loc9_17.5) to %return
// CHECK:STDOUT:   %.loc9_17.7: init (i32, i32) = converted %.loc9_17.1, %.loc9_17.6
// CHECK:STDOUT:   return %.loc9_17.7
// CHECK:STDOUT: }
// CHECK:STDOUT:
