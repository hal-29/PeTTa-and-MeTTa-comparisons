; List Manipulation built-ins tests

; format-args (disabled: requires proper formatting context and string literal)
; !(format-args "Probability of {} is {}%" (head 50))

; foldl-atom
!(foldl-atom (1 2 3 4) 0 $acc $x (+ $acc $x))

; map-atom
!(map-atom (1 2 3) $x (+ $x 1))

; filter-atom (disabled in this MeTTa build: NoReturn)
; !(filter-atom (1 2 3 4 5) $x (> $x 3))
