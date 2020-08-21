(define-library (iota-chibi)
  (export iota)
  (import (scheme base))
  (cond-expand (chibi (include-shared "iota-chibi"))))
