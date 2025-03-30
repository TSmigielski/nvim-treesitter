; Handles most indent cases
[
  (block)
  (declaration_list)
  (switch_body)
  (switch_expression)
] @indent.begin

; Indent immediately after a case statement
((switch_section) @indent.begin
   (#set! indent.immediate 1))

; Dedent after break statement
(switch_section
  (break_statement) @indent.dedent)

; Fixes double indentation
(switch_expression "{" @indent.branch)

; Fixes indentation during switch expression creation
; ((ERROR "switch") @indent.begin
;  (#set! indent.immediate 1))


("}" @indent.end)
("}" @indent.branch)

; [
;  (block)
;  (switch_statement)
;  ] "}" @indent.end


; (expression_statement ";" @indent.end)
; (local_function_statement ";" @indent.end)
; (local_declaration_statement ";" @indent.end)


(comment) @indent.auto
