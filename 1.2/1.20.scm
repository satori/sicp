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

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; applicative order evaluation

(gcd 206 40)

(gcd 40 (remainder 206 40))

(gcd 40 6)

(gcd 6 (remainder 40 6))

(gcd 6 4)

(gcd 4 (remainder 6 4))

(gcd 4 2)

(gcd 2 (remainder 4 2))

(gcd 2 0)

; total 4 calls of remainder

; normal order evaluation

(gcd 206 40)

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0) ; 6
  40
  (gcd (remainder 206 40) ; 6
       (remainder 40 (remainder 206 40)))) ; 4

(if (= (remainder 206 40) 0) ; 6
  40
  (if (= (remainder 40 (remainder 206 40)) 0) ; 4
    (remainder 206 40) ; 6
    (gcd (remainder 40 (remainder 206 40)) ; 4
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))) ; 2

(if (= (remainder 206 40) 0) ; 6
  40
  (if (= (remainder 40 (remainder 206 40)) 0) ; 4
    (remainder 206 40) ; 6
    (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 2
      (remainder 40 (remainder 206 40)) ; 4
      (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 2
           (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))) ; 0


(if (= (remainder 206 40) 0) ; 6
  40
  (if (= (remainder 40 (remainder 206 40)) 0) ;4
    (remainder 206 40) ; 6 - not evaluated
    (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 2
      (remainder 40 (remainder 206 40)) ; 4 - not evaluated
      (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ; 0
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 2
        (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) ; not evaluated
             (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; not evaluated
                        (remainder (remainder 40 (206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))))) ; not evaluated

; total 18 calls of remainder
