REPORT Z_EMPLOYEE_LIST_1.
TABLES zemployees.

SELECT * FROM zemployees.
  WRITE / zemployees.
ENDSELECT.

ULINE.

SELECT * FROM zemployees.
  WRITE / zemployees-title.
  WRITE / zemployees-forename.
  WRITE / zemployees-surname.
  WRITE /.
ENDSELECT.

*Chain Statement
SELECT * FROM zemployees.
  WRITE: zemployees-title, zemployees-forename, zemployees-surname, /.
ENDSELECT.