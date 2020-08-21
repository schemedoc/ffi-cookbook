(import (scheme base) (scheme write) (getgroups-chibi))

(define (writeln x) (write x) (newline))

(let ((gs (getgroups)))
  (writeln gs)
  (writeln (vector-length gs)))
