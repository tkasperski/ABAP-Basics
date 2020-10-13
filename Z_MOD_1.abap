REPORT z_mod_1.

INCLUDE z_employee_definition.
TABLES zemployess.

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
  WRITE: '1. LOOP:', itab01-surname, /.
ENDLOOP.

*DATA: BEGIN OF itab02 OCCURS 0.
*        INCLUDE STRUCTURE itab01.
*DATA END OF itab02.

DATA: BEGIN OF itab03 OCCURS 0.
        INCLUDE STRUCTURE zemployess.
DATA END OF itab03.

DATA: BEGIN OF itab04 OCCURS 0.
        INCLUDE STRUCTURE itab01.
DATA END OF itab04.

SELECT * FROM zemployess.
  MOVE-CORRESPONDING zemployess TO itab01.
  APPEND itab01.
ENDSELECT.

WRITE itab01-surname.

TYPES: BEGIN OF line01_typ,
        surname LIKE zemployess-surname,
        dob LIKE zemployess-dob,
       END OF line01_typ.

TYPES itab02_typ TYPE STANDARD TABLE OF line01_typ.

DATA: itab02    TYPE itab02_typ,
      wa_itab02 TYPE line01_typ.



SELECT surname dob FROM zemployess
  INTO wa_itab02.
  APPEND wa_itab02 TO itab02.
ENDSELECT.

DATA z_field1 LIKE zemployess-surname.
DATA z_field2 LIKE zemployess-forename.

z_field1 = 'ahmed'.
z_field2 = 'susan'.

PERFORM: itab02_fill USING z_field1 z_field2,
         itab02_fill_again,
         itab02_write TABLES itab02.

*SELECT * FROM zemployess
*  INTO CORRESPONDING FIELDS OF TABLE itab02.

LOOP AT itab02 INTO wa_itab02.
  WRITE: '2. LOOP:', wa_itab02-surname, /.
ENDLOOP.

FORM itab02_fill USING p_zsurname p_zforename.

  WRITE:'1. FORM SURNAME :', p_zsurname.
  WRITE:'1. FORM FORENAME:', p_zforename, /.

  p_zsurname = 'abcde'.

ENDFORM.                "itab02_fill

FORM itab02_fill_again.

  SELECT * FROM zemployess
  INTO CORRESPONDING FIELDS OF TABLE itab02.

ENDFORM.          "itab02_fill_again.

FORM itab02_write TABLES p_itab02.

  DATA wa_tmp TYPE line01_typ.

  LOOP AT p_itab02 INTO wa_tmp.
    WRITE:'3. LOOP:', wa_tmp-surname, /.
  ENDLOOP.

ENDFORM.             "itab02_write