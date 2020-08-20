(import (chicken foreign) (srfi 133))

(foreign-declare "#include <sys/utsname.h>")

; NOTE: There is probably a better way to do this
(define uname
  (foreign-primitive scheme-object () "
    struct utsname buf;
    C_word* ptr;
    C_word vec;
    if (uname(&buf) == 0) {
        /* The entries in the `utsname` struct have an undefined length, but */
        /* we need a length in order to allocate the right amount of data, so */
        /* we'll go with 256. This is the value used internally on FreeBSD and */
        /* macOS. */
        ptr = C_alloc(C_SIZEOF_VECTOR(5) + 5 * C_SIZEOF_STRING(256));
        vec = C_vector(&ptr, 5,
                       C_string2(&ptr, buf.sysname),
                       C_string2(&ptr, buf.nodename),
                       C_string2(&ptr, buf.release),
                       C_string2(&ptr, buf.version),
                       C_string2(&ptr, buf.machine));
    } else {
        ptr = C_alloc(C_SIZEOF_VECTOR(0));
        vec = C_vector(&ptr, 0);
    }
    C_return(vec);"))

(vector-for-each (lambda (x) (display x) (newline))
                 (uname))
