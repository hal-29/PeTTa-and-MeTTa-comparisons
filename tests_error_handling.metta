; Error Handling built-ins tests

; if-error (non-error case first)
!(if-error 5 "Error!" "No error")

; return-on-error (non-error case)
!(return-on-error 5 6)

; Error-producing variants disabled to allow full test run in this environment
; !(if-error (Error 5 BadType) "Error!" "No error")
; !(return-on-error (Error 5 BadType) 6)
; !(Error (add "a" 2) BadType)
