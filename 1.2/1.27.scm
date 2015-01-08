; Copyright (C) 2013, 2015 by Maxim Bublis <b@codemonkey.ru>
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

(define (fermat-test n)
  (define (fermat-test-iter a)
    (cond ((= a 1) #t)
          ((not (= (expmod a n n) a)) #f)
          (else (fermat-test-iter (- a 1)))))

  (fermat-test-iter (- n 1)))

(fermat-test 561)
;Value: #t

(fermat-test 1105)
;Value: #t

(fermat-test 1729)
;Value: #t

(fermat-test 2465)
;Value: #t

(fermat-test 2821)
;Value: #t

(fermat-test 6601)
;Value: #t
