; Copyright (C) 2013-2015 by Maxim Bublis <b@codemonkey.ru>
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

(define (cont-frac n d k)
  (define (fraction i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (fraction (+ i 1))))))
  (fraction 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  
  (iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           5)
;Value: .625

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
;Value: .6179775280898876

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           40)
;Value: .6180339887498948

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                5)
;Value: .625 

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                10)
;Value: .6179775280898876

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                40)
;Value: .6180339887498948
