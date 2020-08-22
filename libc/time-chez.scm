(case (machine-type)
  [(i3le ti3le a6le ta6le) (load-shared-object "libc.so.6")]
  [(i3osx ti3osx a6osx ta6osx) (load-shared-object "libc.dylib")]
  [else (load-shared-object "libc.so")])

(define (libc-time)
  ((foreign-procedure "time" (void*) unsigned-long) 0))

(display (libc-time))
(newline)
