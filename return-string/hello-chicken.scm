(import (chicken foreign))

(define greeting
  (foreign-lambda* c-string () "C_return(\"Hello, world!\");"))

(display (greeting))
(newline)
