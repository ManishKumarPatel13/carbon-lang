// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

// CHECK:STDERR: fail_bound_overflow.carbon:[[@LINE+3]]:32: ERROR: Invalid array expression.
// CHECK:STDERR: var a: [1; 39999999999999999993];
// CHECK:STDERR:                                ^
var a: [1; 39999999999999999993];

// CHECK:STDOUT: --- fail_bound_overflow.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace {.a = %a}
// CHECK:STDOUT:   %.loc10_9: i32 = int_literal 1
// CHECK:STDOUT:   %.loc10_12: i32 = int_literal 39999999999999999993
// CHECK:STDOUT:   %a.var: ref <error> = var a
// CHECK:STDOUT:   %a: ref <error> = bind_name a, %a.var
// CHECK:STDOUT: }
// CHECK:STDOUT:
