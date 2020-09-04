(import (scheme base)
        (scheme write))

(define-c greeting
          "(void* data, int argc, closure _, object k)"
          "make_string(str, \"Hello world\");
           return_closcall1(data, k, &str);")

(display (greeting))
(newline)
