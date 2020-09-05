(c-declare "#include <string.h>")  ; For memchr()

(define (disp . xs) (for-each display xs) (newline))

(define (byte-after-first-null bytevector)
  ((c-lambda (scheme-object size_t) scheme-object
     "___U8 *bytes = ___CAST(___U8 *, ___BODY(___arg1));
      size_t nbytes = ___arg2;
      ___U8 *where = memchr(bytes, 0, nbytes);
      if ((where != NULL) && (where < bytes + nbytes - 1))
        ___return(___FIX(where[1]));
      else
        ___return(___FAL);")
   bytevector
   (bytevector-length bytevector)))

(let ((bytes (make-bytevector 1024 1)))
  (disp (byte-after-first-null bytes))
  (bytevector-u8-set! bytes 1000 0)
  (bytevector-u8-set! bytes 1001 42)
  (disp (byte-after-first-null bytes)))
