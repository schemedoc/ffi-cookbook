(import (chicken foreign))

(define iota
  (foreign-primitive scheme-object ((int n)) "
    C_word* ptr = C_alloc(C_SIZEOF_LIST(n));
    C_word list = C_list(&ptr, 0);
    while (n > 0) {
        n--;
        list = C_a_i_cons(&ptr, 2, C_fix(n), list);
    }
    C_return(list);
    "))

(display (iota 100))
(newline)
