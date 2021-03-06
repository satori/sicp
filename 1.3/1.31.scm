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

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))

  (iter a 1))

(define (inc x)
  (+ x 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(factorial 5)
;Value: 120

(define (factorial n)
  (product-iter identity 1 inc n))

(factorial 5)
;Value: 120

(define (wallis-pi n)
  (define (inc x)
    (+ x 1))

  (define (term k)
    (cond ((odd? k)
           (/ (+ k 1)
              (+ k 2)))
          (else
            (/ (+ k 2)
               (+ k 1)))))

  (* 4 (product term 1.0 inc n)))

(wallis-pi 1000)
;Value: 3.143160705532257
