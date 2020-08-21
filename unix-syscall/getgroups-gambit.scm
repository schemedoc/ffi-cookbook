(c-declare "#include <unistd.h>")

(define getgroups
  (c-lambda () scheme-object #<<c-end
    for (int cap = 2; cap <= 256; cap *= 2) {
        size_t nbytes = cap * sizeof(___S32);
        ___SCMOBJ vector =
            ___EXT(___alloc_scmobj)(NULL, ___sS32VECTOR, nbytes);
        if (___FIXNUMP(vector)) ___return(___FAL);
        ___S32 *gids = ___CAST(___S32 *, ___BODY(vector));
        int len = getgroups(cap, gids);
        ___EXT(___release_scmobj)(vector);
        if (len >= 0) {
            ___S32VECTORSHRINK(vector, ___FIX(len));
            ___return(vector);
        }
    }
    ___return(___FAL);
c-end
))

(define (writeln x) (write x) (newline))

(let ((gs (getgroups)))
  (writeln gs)
  (writeln (s32vector-length gs)))
