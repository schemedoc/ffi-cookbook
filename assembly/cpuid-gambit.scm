(define (writeln x) (write x) (newline))

(define %cpuid
  (c-lambda (int) scheme-object #<<c-lambda-end
            unsigned int abcd[4];
            ___SCMOBJ vs, v;

            asm("cpuid;"
                "mov %%eax, (%0);"
                "mov %%ebx, 4(%0);"
                "mov %%ecx, 8(%0);"
                "mov %%edx, 12(%0);"
                :
                : "D"(abcd), "a"(___arg1)
                : "%ebx", "%ecx", "%edx");
            vs = ___make_vector(___PSTATE, 4, ___FAL);
            ___U32_to_SCMOBJ(___PSTATE, abcd[0], &v, ___RETURN_POS);
            ___VECTORSET(vs, 0, v);
            ___U32_to_SCMOBJ(___PSTATE, abcd[1], &v, ___RETURN_POS);
            ___VECTORSET(vs, 4, v);
            ___U32_to_SCMOBJ(___PSTATE, abcd[2], &v, ___RETURN_POS);
            ___VECTORSET(vs, 8, v);
            ___U32_to_SCMOBJ(___PSTATE, abcd[3], &v, ___RETURN_POS);
            ___VECTORSET(vs, 12, v);
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
  (with-output-to-string
    (lambda ()
      (define (chars u32)
        (write-char (integer->char (extract-bit-field 8 0 u32)))
        (write-char (integer->char (extract-bit-field 8 8 u32)))
        (write-char (integer->char (extract-bit-field 8 16 u32)))
        (write-char (integer->char (extract-bit-field 8 24 u32))))
      (chars b)
      (chars d)
      (chars c))))

(receive (a b c d) (cpuid 0)
  (writeln a)
  (writeln (cpuname b c d)))
