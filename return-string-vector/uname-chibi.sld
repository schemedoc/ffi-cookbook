(define-library (uname-chibi)
  (export uname)
  (import (scheme base))
  (cond-expand (chibi (include-shared "uname-chibi"))))
