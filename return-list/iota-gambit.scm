;; TODO: Are we using still vs movable objects correctly?
;;
;; Relevant example from the manual:
;; http://www.iro.umontreal.ca/~gambit/doc/gambit.html#c_002ddefine_002dtype

(define c-iota
  (c-lambda (int) scheme-object "
___SCMOBJ list = ___NUL;
___SCMOBJ new_list;
int n = ___arg1;

while (n > 0) {
    n--;
    new_list = ___EXT(___make_pair) (___PSTATE, ___FIX(n), list);
    ___EXT(___release_scmobj) (list);
    list = new_list;
    if (___FIXNUMP(list)) return ___FAL; /* allocation failed */
}
___return(list);
"))

(display (c-iota 100))
(newline)
