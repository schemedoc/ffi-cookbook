(define get-greeting
  (c-lambda () nonnull-char-string
    "___return(\"Hello, world!\");"))

(display (get-greeting))
(newline)
