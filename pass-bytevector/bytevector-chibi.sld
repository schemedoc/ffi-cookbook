(define-library (bytevector-chibi)
  (export byte-after-first-null)
  (import (scheme base))
  (cond-expand (chibi (include-shared "bytevector-chibi"))))
