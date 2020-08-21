(import (scheme base) (scheme write) (getgroups-chibi))

(define (displayln x) (display x) (newline))

(vector-for-each displayln (getgroups))
