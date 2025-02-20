// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

class Inner {
  var a: i32;
  var b: i32;
}

fn MakeInner() -> Inner;

class Outer {
  var c: Inner;
  var d: Inner;
}

fn MakeOuter() -> Outer {
  return {.c = MakeInner(), .d = MakeInner()};
}

// CHECK:STDOUT: --- init_nested.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.loc10_1.1: type = struct_type {.a: i32, .b: i32}
// CHECK:STDOUT:   %.loc10_1.2: type = ptr_type {.a: i32, .b: i32}
// CHECK:STDOUT:   %.loc17_1.1: type = struct_type {.c: Inner, .d: Inner}
// CHECK:STDOUT:   %.loc17_1.2: type = struct_type {.c: {.a: i32, .b: i32}*, .d: {.a: i32, .b: i32}*}
// CHECK:STDOUT:   %.loc17_1.3: type = ptr_type {.c: {.a: i32, .b: i32}*, .d: {.a: i32, .b: i32}*}
// CHECK:STDOUT:   %.loc14: type = ptr_type {.c: Inner, .d: Inner}
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace {.Inner = %Inner.decl, .MakeInner = %MakeInner, .Outer = %Outer.decl, .MakeOuter = %MakeOuter}
// CHECK:STDOUT:   %Inner.decl = class_decl @Inner, ()
// CHECK:STDOUT:   %Inner: type = class_type @Inner
// CHECK:STDOUT:   %MakeInner: <function> = fn_decl @MakeInner
// CHECK:STDOUT:   %Outer.decl = class_decl @Outer, ()
// CHECK:STDOUT:   %Outer: type = class_type @Outer
// CHECK:STDOUT:   %MakeOuter: <function> = fn_decl @MakeOuter
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Inner {
// CHECK:STDOUT:   %.loc8_8.1: type = unbound_element_type Inner, i32
// CHECK:STDOUT:   %.loc8_8.2: <unbound element of class Inner> = field_decl a, element0
// CHECK:STDOUT:   %a: <unbound element of class Inner> = bind_name a, %.loc8_8.2
// CHECK:STDOUT:   %.loc9_8.1: type = unbound_element_type Inner, i32
// CHECK:STDOUT:   %.loc9_8.2: <unbound element of class Inner> = field_decl b, element1
// CHECK:STDOUT:   %b: <unbound element of class Inner> = bind_name b, %.loc9_8.2
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .a = %a
// CHECK:STDOUT:   .b = %b
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Outer {
// CHECK:STDOUT:   %Inner.ref.loc15: type = name_ref Inner, file.%Inner
// CHECK:STDOUT:   %.loc15_8.1: type = unbound_element_type Outer, Inner
// CHECK:STDOUT:   %.loc15_8.2: <unbound element of class Outer> = field_decl c, element0
// CHECK:STDOUT:   %c: <unbound element of class Outer> = bind_name c, %.loc15_8.2
// CHECK:STDOUT:   %Inner.ref.loc16: type = name_ref Inner, file.%Inner
// CHECK:STDOUT:   %.loc16_8.1: type = unbound_element_type Outer, Inner
// CHECK:STDOUT:   %.loc16_8.2: <unbound element of class Outer> = field_decl d, element1
// CHECK:STDOUT:   %d: <unbound element of class Outer> = bind_name d, %.loc16_8.2
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .c = %c
// CHECK:STDOUT:   .d = %d
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @MakeInner() -> %return: Inner;
// CHECK:STDOUT:
// CHECK:STDOUT: fn @MakeOuter() -> %return: Outer {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %MakeInner.ref.loc20_16: <function> = name_ref MakeInner, file.%MakeInner
// CHECK:STDOUT:   %.loc20_45.1: ref Inner = class_element_access %return, element0
// CHECK:STDOUT:   %.loc20_25: init Inner = call %MakeInner.ref.loc20_16() to %.loc20_45.1
// CHECK:STDOUT:   %MakeInner.ref.loc20_34: <function> = name_ref MakeInner, file.%MakeInner
// CHECK:STDOUT:   %.loc20_45.2: ref Inner = class_element_access %return, element1
// CHECK:STDOUT:   %.loc20_43: init Inner = call %MakeInner.ref.loc20_34() to %.loc20_45.2
// CHECK:STDOUT:   %.loc20_45.3: {.c: Inner, .d: Inner} = struct_literal (%.loc20_25, %.loc20_43)
// CHECK:STDOUT:   %.loc20_45.4: init Outer = class_init (%.loc20_25, %.loc20_43), %return
// CHECK:STDOUT:   %.loc20_45.5: init Outer = converted %.loc20_45.3, %.loc20_45.4
// CHECK:STDOUT:   return %.loc20_45.5
// CHECK:STDOUT: }
// CHECK:STDOUT:
