(import (scheme base) (scheme write) (bytevector-chibi))

(define (disp . xs) (for-each display xs) (newline))

(let ((bytes (make-bytevector 1024 1)))
  (disp (byte-after-first-null bytes))
  (bytevector-u8-set! bytes 1000 0)
  (bytevector-u8-set! bytes 1001 42)
  (disp (byte-after-first-null bytes)))
