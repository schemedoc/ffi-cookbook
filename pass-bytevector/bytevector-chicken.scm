(import (chicken foreign)
        (srfi 4))

(foreign-declare "#include <string.h>")

(define (disp . xs) (for-each display xs) (newline))

(define (byte-after-first-null byte-vector)
  ((foreign-lambda* scheme-object ([u8vector bytes]
                                   [size_t n])
                    "unsigned char* where = memchr(bytes, 0, n);
                     if (where != NULL && where < bytes + n - 1) {
                         C_return(C_fix(where[1]));
                     } else {
                         C_return(C_SCHEME_FALSE);
                     }")
   byte-vector (u8vector-length byte-vector)))

(let ([bytes (make-u8vector 1024 1)])
  (disp (byte-after-first-null bytes))
  (u8vector-set! bytes 1000 0)
  (u8vector-set! bytes 1001 42)
  (disp (byte-after-first-null bytes)))
