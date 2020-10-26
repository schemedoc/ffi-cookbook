(define (writeln x) (write x) (newline))

(define %cpuid
  (c-lambda (int) scheme-object #<<c-lambda-end
            unsigned int abcd[4];
            asm("cpuid;"
                "mov %%eax, (%0);"
                "mov %%ebx, 4(%0);"
                "mov %%ecx, 8(%0);"
                "mov %%edx, 12(%0);"
                :
                : "D"(abcd), "a"(___arg1)
                : "%ebx", "%ecx", "%edx");
            ___SCMOBJ vs = ___make_vector(___PSTATE, 4, ___FAL);
            for (size_t i = 0; i < 4; i++) {
              ___SCMOBJ v;
              ___U32_to_SCMOBJ(___PSTATE, abcd[i], &v, ___RETURN_POS);
              ___VECTORSET(vs, ___FIX(i), v);
            }
            ___return(vs);
c-lambda-end
))

(define (cpuid which)
  (let ((vs (%cpuid which)))
    (values (vector-ref vs 0)
            (vector-ref vs 1)
            (vector-ref vs 2)
            (vector-ref vs 3))))

(define (cpuname b c d)
  (let ((string (make-string 12 #\space)))
    (define (unpack-1-char! u32 to i)
      (let ((char (integer->char (extract-bit-field 8 (* 8 i) u32))))
        (string-set! string (+ to i) char)))
    (define (unpack-4-chars! u32 to)
      (unpack-1-char! u32 to 0)
      (unpack-1-char! u32 to 1)
      (unpack-1-char! u32 to 2)
      (unpack-1-char! u32 to 3))
    (unpack-4-chars! b 0)
    (unpack-4-chars! d 4)
    (unpack-4-chars! c 8)
    string))

(receive (a b c d) (cpuid 0)
  (writeln a)
  (writeln (cpuname b c d)))
