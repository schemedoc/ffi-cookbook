#lang racket

(require ffi/unsafe)

(define libc (ffi-lib "libc"))

(define (libc-time)
  ((get-ffi-obj "time" libc (_fun _uintptr -> _ulong)) 0))

(display (libc-time))
(newline)
