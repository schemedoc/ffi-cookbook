(define get-numeric-vector
  (c-lambda () scheme-object #<<c-end
    size_t n = 32;
    size_t nbytes = n * sizeof(___S64);
    size_t i;
    ___SCMOBJ vector = ___EXT(___alloc_scmobj)(___PSTATE, ___sS64VECTOR, nbytes);
    if (___FIXNUMP(vector)) ___return(___FAL);
    ___S64 *elements = ___CAST(___S64 *, ___BODY(vector));
    for (i = 0; i < n; i += 2) elements[i] = i;
    for (i = 1; i < n; i += 2) elements[i] = -i;
    ___EXT(___release_scmobj)(vector);
    ___return(vector);
c-end
))

(write (get-numeric-vector))
(newline)
