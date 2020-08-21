(define-library (getgroups-chibi)
  (export getgroups)
  (import (scheme base))
  (cond-expand (chibi (include-shared "getgroups-chibi"))))
