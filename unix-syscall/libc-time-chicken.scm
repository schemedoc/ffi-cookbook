(import (chicken foreign))

(define (libc-time)
  ((foreign-lambda unsigned-long "time" (c-pointer void)) #f))

(display (libc-time))
(newline)
