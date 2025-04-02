; Handles most indent cases
[
  (block)
  (declaration_list)
  (switch_body)
  (switch_expression)
  (initializer_expression)
  (enum_member_declaration_list)
  (accessor_list)
] @indent.begin

; Indent if without braces
; I have only a slight clue what this does
; I've copied it from a C indent query
((if_statement
  consequence: (_) @_body)@indent.begin
  (#not-kind-eq? @_body "block"))

; Outdent if without braces
(if_statement
  consequence: (_ ";" @indent.end))

; The same cases with a for loop
((for_statement
  body: (_) @_body)@indent.begin
  (#not-kind-eq? @_body "block"))
(for_statement
  body: (_ ";" @indent.end))

; Indent immediately after a case statement
((switch_section) @indent.begin
   (#set! indent.immediate 1))

; Dedent after break statement
(switch_section
  (break_statement) @indent.dedent)

; Fixes double indentation
(switch_expression "{" @indent.branch)

("}" @indent.end)
("}" @indent.branch)

(comment) @indent.auto
