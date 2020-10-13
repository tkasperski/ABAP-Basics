REPORT z_employee_list_03.
TABLES: zemployess.

DATA: BEGIN OF itab01 OCCURS 0,
        employee LIKE zemployess-employee,
        surname  LIKE zemployess-surname,
        forename LIKE zemployess-forename,
        title    LIKE zemployess-title,
        dob      LIKE zemployess-dob,
        los      TYPE i VALUE 3,

      END OF itab01.

DATA line_cnt TYPE i.

SELECT * FROM zemployess.
  MOVE zemployess-employee TO itab01-employee.
  MOVE zemployess-surname  TO itab01-surname.
  MOVE zemployess-forename TO itab01-forename.
  MOVE zemployess-title    TO itab01-title.
  MOVE zemployess-dob      TO itab01-dob.

  APPEND itab01.
ENDSELECT.

LOOP AT itab01.
  IF itab01-surname = 'ASHRAF'.
    itab01-surname = 'ESLAM'.
    MODIFY itab01.
  ENDIF.
ENDLOOP.

DESCRIBE TABLE itab01 LINES line_cnt.

INSERT itab01 INDEX line_cnt.

LOOP AT itab01.
  WRITE itab01-surname.
ENDLOOP.

SKIP 2.
***********************************************
*Move Corresponding

DATA: BEGIN OF itab02 OCCURS 0,
        employee LIKE zemployess-employee,
        surname  LIKE zemployess-surname,
        forename LIKE zemployess-forename,
        title    LIKE zemployess-title,
        dob      LIKE zemployess-dob,
        los      TYPE i VALUE 3,

      END OF itab02.

SELECT * FROM zemployess.
  MOVE-CORRESPONDING zemployess TO itab02.
ENDSELECT.

LOOP AT itab02.
  WRITE itab02-surname.
ENDLOOP.

************************************************
*Header Line

DATA: BEGIN OF itab03 OCCURS 0.
  INCLUDE STRUCTURE zemployess.
DATA END OF itab03.

SELECT * FROM zemployess INTO CORRESPONDING FIELDS OF TABLE itab03.
  
READ TABLE itab01 INDEX 5.

READ TABLE itab01 WITH KEY
 employee = 0000000001.

DELETE itab01 WHERE surname = 'Kowalski'.

SORT itab02 DESCENDING AS TEXT BY surname.

DATA wa_itab01 LIKE itab01.

LOOP AT itab01 INTO wa_itab01.
  WRITE wa_itab01-surname.
ENDLOOP.

********************************************
LOOP AT itab01 INTO wa_itab01.
  IF wa_itab01-surname = 'Nowak'.
    wa_itab01-surname = 'Kowalski'.
    MODIFY itab01 FROM wa_itab01.
  ENDIF.
ENDLOOP.

CLEAR itab01.
CLEAR wa_itab01.

REFRESH itab01.
CLEAR wa_itab01.

FREE itab01.
CLEAR wa_itab01.
