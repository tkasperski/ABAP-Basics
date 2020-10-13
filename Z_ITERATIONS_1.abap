REPORT z_iterations_1.

DATA: a TYPE i,
      b TYPE i,
      c TYPE i.

a = 0.
c = 0.


WHILE a <> 15.
  a = a + 1.
  WRITE: / 'OUTER: ', a.
  b = 0.
  WHILE b <> 10.
    b = b + 1.
    WRITE: / 'INNER:     ', b.
  ENDWHILE.
  c = c + b.
ENDWHILE.
c = c + a.
WRITE: / 'TOTAL: ', c.