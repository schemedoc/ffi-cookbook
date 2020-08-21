(import (chicken foreign) (srfi 133))

(foreign-declare "#include <sys/utsname.h>")

(define uname
  (foreign-primitive scheme-object () "
    struct utsname buf;
    C_word* ptr;
    C_word vec;
    if (uname(&buf) == 0) {
        ptr = C_alloc(C_SIZEOF_VECTOR(5) +
                      5 +  /* One null terminator for each string */
                      strlen(buf.sysname) +
                      strlen(buf.nodename) +
                      strlen(buf.release) +
                      strlen(buf.version) +
                      strlen(buf.machine));
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
