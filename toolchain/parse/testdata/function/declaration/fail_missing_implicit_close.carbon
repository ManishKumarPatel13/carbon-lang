// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

// Fix and uncomment this to test error handling.
// CHECK:STDERR: fail_missing_implicit_close.carbon:[[@LINE+6]]:7: ERROR: Closing symbol does not match most recent opening symbol.
// CHECK:STDERR: fn Div[();
// CHECK:STDERR:       ^
// CHECK:STDERR: fail_missing_implicit_close.carbon:[[@LINE+3]]:8: ERROR: Expected binding pattern.
// CHECK:STDERR: fn Div[();
// CHECK:STDERR:        ^
fn Div[();

// CHECK:STDERR: fail_missing_implicit_close.carbon:[[@LINE+15]]:21: ERROR: A `(` for parameters is required after implicit parameters.
// CHECK:STDERR: // CHECK:STDOUT:   ]
// CHECK:STDERR:                     ^
// CHECK:STDOUT: - filename: fail_missing_implicit_close.carbon
// CHECK:STDOUT:   parse_tree: [
// CHECK:STDOUT:     {kind: 'FileStart', text: ''},
// CHECK:STDOUT:       {kind: 'FunctionIntroducer', text: 'fn'},
// CHECK:STDOUT:       {kind: 'IdentifierName', text: 'Div'},
// CHECK:STDOUT:         {kind: 'ImplicitParamListStart', text: '['},
// CHECK:STDOUT:           {kind: 'IdentifierName', text: '(', has_error: yes},
// CHECK:STDOUT:           {kind: 'InvalidParse', text: '(', has_error: yes},
// CHECK:STDOUT:         {kind: 'BindingPattern', text: '(', has_error: yes, subtree_size: 3},
// CHECK:STDOUT:       {kind: 'ImplicitParamList', text: ']', has_error: yes, subtree_size: 5},
// CHECK:STDOUT:     {kind: 'FunctionDecl', text: 'fn', has_error: yes, subtree_size: 8},
// CHECK:STDOUT:     {kind: 'FileEnd', text: ''},
// CHECK:STDOUT:   ]
