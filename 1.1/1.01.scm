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

10
;Value: 10

(+ 5 3 4)
;Value: 12

(- 9 1)
;Value: 8

(/ 6 2)
;Value: 3

(+ (* 2 4) (- 4 6))
;Value: 6

(define a 3)
;Value: a

(define b (+ a 1))
;Value: b

(+ a b (* a b))
;Value: 19

(= a b)
;Value: #f

(if (and (> b a) (< b (* a b)))
  b
  a)
;Value: 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;Value: 16

(+ 2 (if (> b a) b a))
;Value: 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;Value: 16
