(define-library (hello-chibi)
  (export get-greeting)
  (import (scheme base))
  (cond-expand (chibi (include-shared "hello-chibi"))))
