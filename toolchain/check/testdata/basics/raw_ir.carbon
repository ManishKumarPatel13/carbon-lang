// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// ARGS: compile --phase=check --dump-raw-sem-ir %s
//
// Check that raw IR dumping works as expected.
//
// AUTOUPDATE

fn Foo(n: i32) -> (i32, i32, f64) {
  return (n, 2, 3.4);
}

// CHECK:STDOUT: ---
// CHECK:STDOUT: filename:        raw_ir.carbon
// CHECK:STDOUT: sem_ir:
// CHECK:STDOUT:   cross_ref_irs_size: 1
// CHECK:STDOUT:   functions:
// CHECK:STDOUT:     function0:       {name: name0, param_refs: block1, return_type: type4, return_slot: inst+6, body: [block4]}
// CHECK:STDOUT:   classes:         {}
// CHECK:STDOUT:   types:
// CHECK:STDOUT:     type0:           {inst: instNamespaceType, value_rep: {kind: copy, type: type0}}
// CHECK:STDOUT:     type1:           {inst: instIntType, value_rep: {kind: copy, type: type1}}
// CHECK:STDOUT:     type2:           {inst: inst+2, value_rep: {kind: unknown, type: type<invalid>}}
// CHECK:STDOUT:     type3:           {inst: instFloatType, value_rep: {kind: copy, type: type3}}
// CHECK:STDOUT:     type4:           {inst: inst+4, value_rep: {kind: pointer, type: type5}}
// CHECK:STDOUT:     type5:           {inst: inst+7, value_rep: {kind: copy, type: type5}}
// CHECK:STDOUT:     type6:           {inst: instFunctionType, value_rep: {kind: copy, type: type6}}
// CHECK:STDOUT:   type_blocks:
// CHECK:STDOUT:     typeBlock0:
// CHECK:STDOUT:       0:               typeTypeType
// CHECK:STDOUT:       1:               typeTypeType
// CHECK:STDOUT:       2:               typeTypeType
// CHECK:STDOUT:     typeBlock1:
// CHECK:STDOUT:       0:               type1
// CHECK:STDOUT:       1:               type1
// CHECK:STDOUT:       2:               type3
// CHECK:STDOUT:   insts:
// CHECK:STDOUT:     inst+0:          {kind: Namespace, arg0: name_scope0, type: type0}
// CHECK:STDOUT:     inst+1:          {kind: Param, arg0: name1, type: type1}
// CHECK:STDOUT:     inst+2:          {kind: TupleType, arg0: typeBlock0, type: typeTypeType}
// CHECK:STDOUT:     inst+3:          {kind: TupleLiteral, arg0: block2, type: type2}
// CHECK:STDOUT:     inst+4:          {kind: TupleType, arg0: typeBlock1, type: typeTypeType}
// CHECK:STDOUT:     inst+5:          {kind: Converted, arg0: inst+3, arg1: inst+4, type: typeTypeType}
// CHECK:STDOUT:     inst+6:          {kind: VarStorage, arg0: nameReturnSlot, type: type4}
// CHECK:STDOUT:     inst+7:          {kind: PointerType, arg0: type4, type: typeTypeType}
// CHECK:STDOUT:     inst+8:          {kind: FunctionDecl, arg0: function0, type: type6}
// CHECK:STDOUT:     inst+9:          {kind: NameRef, arg0: name1, arg1: inst+1, type: type1}
// CHECK:STDOUT:     inst+10:         {kind: IntLiteral, arg0: int4, type: type1}
// CHECK:STDOUT:     inst+11:         {kind: RealLiteral, arg0: real0, type: type3}
// CHECK:STDOUT:     inst+12:         {kind: TupleLiteral, arg0: block5, type: type4}
// CHECK:STDOUT:     inst+13:         {kind: TupleAccess, arg0: inst+6, arg1: element0, type: type1}
// CHECK:STDOUT:     inst+14:         {kind: InitializeFrom, arg0: inst+9, arg1: inst+13, type: type1}
// CHECK:STDOUT:     inst+15:         {kind: TupleAccess, arg0: inst+6, arg1: element1, type: type1}
// CHECK:STDOUT:     inst+16:         {kind: InitializeFrom, arg0: inst+10, arg1: inst+15, type: type1}
// CHECK:STDOUT:     inst+17:         {kind: TupleAccess, arg0: inst+6, arg1: element2, type: type3}
// CHECK:STDOUT:     inst+18:         {kind: InitializeFrom, arg0: inst+11, arg1: inst+17, type: type3}
// CHECK:STDOUT:     inst+19:         {kind: TupleInit, arg0: block6, arg1: inst+6, type: type4}
// CHECK:STDOUT:     inst+20:         {kind: Converted, arg0: inst+12, arg1: inst+19, type: type4}
// CHECK:STDOUT:     inst+21:         {kind: ReturnExpr, arg0: inst+20}
// CHECK:STDOUT:   inst_blocks:
// CHECK:STDOUT:     block0:          {}
// CHECK:STDOUT:     block1:
// CHECK:STDOUT:       0:               inst+1
// CHECK:STDOUT:     block2:
// CHECK:STDOUT:       0:               instIntType
// CHECK:STDOUT:       1:               instIntType
// CHECK:STDOUT:       2:               instFloatType
// CHECK:STDOUT:     block3:
// CHECK:STDOUT:       0:               inst+1
// CHECK:STDOUT:       1:               inst+3
// CHECK:STDOUT:       2:               inst+5
// CHECK:STDOUT:       3:               inst+6
// CHECK:STDOUT:     block4:
// CHECK:STDOUT:       0:               inst+9
// CHECK:STDOUT:       1:               inst+10
// CHECK:STDOUT:       2:               inst+11
// CHECK:STDOUT:       3:               inst+12
// CHECK:STDOUT:       4:               inst+13
// CHECK:STDOUT:       5:               inst+14
// CHECK:STDOUT:       6:               inst+15
// CHECK:STDOUT:       7:               inst+16
// CHECK:STDOUT:       8:               inst+17
// CHECK:STDOUT:       9:               inst+18
// CHECK:STDOUT:       10:              inst+19
// CHECK:STDOUT:       11:              inst+20
// CHECK:STDOUT:       12:              inst+21
// CHECK:STDOUT:     block5:
// CHECK:STDOUT:       0:               inst+9
// CHECK:STDOUT:       1:               inst+10
// CHECK:STDOUT:       2:               inst+11
// CHECK:STDOUT:     block6:
// CHECK:STDOUT:       0:               inst+14
// CHECK:STDOUT:       1:               inst+16
// CHECK:STDOUT:       2:               inst+18
// CHECK:STDOUT:     block7:
// CHECK:STDOUT:       0:               inst+0
// CHECK:STDOUT:       1:               inst+8
// CHECK:STDOUT: ...
