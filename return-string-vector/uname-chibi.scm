(import (scheme base) (scheme write) (uname-chibi))

(define (displayln x) (display x) (newline))

(vector-for-each displayln (uname))
