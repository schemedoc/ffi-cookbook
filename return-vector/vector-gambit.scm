(define get-vector
  (c-lambda () scheme-object "
    size_t n = 32;
    size_t i;
    ___SCMOBJ v = ___make_vector(___PSTATE, n, ___FAL);
    for (i = 0; i < n; i++) {
        ___VECTORSET(v, ___FIX(i), ___FIX((i % 2) ? -i : i));
    }
    ___return(v);
"))

(write (get-vector))
(newline)
