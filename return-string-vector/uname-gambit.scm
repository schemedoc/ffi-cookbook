(c-declare "#include <sys/utsname.h>")

(define uname
  (c-lambda () scheme-object #<<c-end
    struct utsname names;
    ___SCMOBJ v, s;

    uname(&names);
    v = ___make_vector(___PSTATE, 5, ___FAL);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.sysname, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 0, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.nodename, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 4, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.release, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 8, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.version, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 12, s);
    ___NONNULLCHARSTRING_to_SCMOBJ(___PSTATE, names.machine, &s,
                                   ___RETURN_POS);
    ___VECTORSET(v, 16, s);
    ___return(v);
c-end
))

(define (displayln x) (display x) (newline))

(vector-for-each displayln (uname))
