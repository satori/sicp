; Copyright (C) 2015 by Maxim Bublis <b@codemonkey.ru>
;
; Permission is hereby granted, free of charge, to any person obtaining
; a copy of this software and associated documentation files (the
; "Software"), to deal in the Software without restriction, including
; without limitation the rights to use, copy, modify, merge, publish,
; distribute, sublicense, and/or sell copies of the Software, and to
; permit persons to whom the Software is furnished to do so, subject to
; the following conditions:
;
; The above copyright notice and this permission notice shall be
; included in all copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
; NONINFRINGMENT. IN NOT EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(load "1.2/1.24.scm")

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; It will significantly slow expmod procedure
; The original expmod implementation is faster as described in book footnote 46
; as the reduction steps in the cases where the exponent e is greater than 1
; are based on the fact that, for any integers x, y, and m,
; we can find the remainder of x times y modulo m by computing separately
; the remainders of x modulo m and y modulo m, multiplying these, and then
; taking the remainder of the result modulo m. For instance, in the case where
; e is even, we compute the remainder of b^(e/2) modulo m, square this, and
; take the remainder modulo m. This technique is useful because it means we can
; perform our computation without ever having to deal with numbers much larger
; than m. 

(search-for-primes 1000 1020)

(search-for-primes 10000 10038)

(search-for-primes 100000 100045)

(search-for-primes 1000000 1000038)
