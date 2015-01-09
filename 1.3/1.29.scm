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
; NONINFRINGMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))

  (define (inc x)
    (+ x 1))

  (define (y k)
    (f (+ a (* k h))))

  (define (term k)
    (* (cond ((odd? k) 4)
             ((or (= k 0) (= k n)) 1)
             (else 2))
       (y k)))

  (* (sum term 0.0 inc n)
     (/ h 3.0)))

(integral cube 0 1 0.01)
;Value: .24998750000000042

(integral cube 0 1 0.001)
;Value: .249999875000001

(simpson cube 0 1 100)
;Value: .24999999999999992

(simpson cube 0 1 1000)
;Value: .2500000000000003
