REPORT z_opensql_1.

****************************************************
*Insert
DATA wa_employees LIKE zemployess.

wa_employees-employee = '00000006'.
wa_employees-surname = 'Krawczyk' .
wa_employees-forename = 'Karolina' .
wa_employees-title = 'Mrs'.
wa_employees-dob = '19860213'.

INSERT zemployess FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Success.'.
ELSE.
  WRITE: 'Error code: ' , sy-subrc.
ENDIF.
ULINE.


***************************************************
*Update

wa_employees-employee = '00000006'.
wa_employees-surname = 'Stefaniak' .
wa_employees-forename = 'Karolina' .
wa_employees-title = 'Mrs'.
wa_employees-dob = '19860213'.

UPDATE zemployess FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Success.'.
ELSE.
  WRITE: 'Error code: ' , sy-subrc.
ENDIF.
ULINE.

***************************************************
*Modify

wa_employees-employee = '10000006'.
wa_employees-surname = 'ANNA' .
wa_employees-forename = 'LOTFY' .
wa_employees-title = 'MR'.
wa_employees-dob = '19921213'.

MODIFY zemployess FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Success.'.
ELSE.
  WRITE: 'Error code: ' , sy-subrc.
ENDIF.
ULINE.

wa_employees-employee = '10000007'.
wa_employees-surname = 'MONA' .
wa_employees-forename = 'LOTFY' .
wa_employees-title = 'MRS'.
wa_employees-dob = '19921213'.

MODIFY zemployess FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Success.'.
ELSE.
  WRITE: 'Error code: ' , sy-subrc.
ENDIF.
ULINE.


***************************************************
*Delete

CLEAR wa_employees.

wa_employees-employee = '10000007'.

DELETE zemployess FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Success.'.
ELSE.
  WRITE: 'Error code: ' , sy-subrc.
ENDIF.

CLEAR wa_employees.
ULINE.

CLEAR wa_employees.

DELETE FROM zemployess WHERE surname = 'AHMED'.

IF sy-subrc = 0.
  WRITE 'Success.'.
ELSE.
  WRITE: 'Error code: ' , sy-subrc.
ENDIF.

CLEAR wa_employees.

ULINE.

***************************************************
DATA: surname(15)  TYPE c VALUE 'Nowak',
      integer(1)   TYPE i VALUE 5.

IF surname = 'Nowak'.
  WRITE '1'.
ELSEIF surname = 'Kowalski'.
  WRITE '2'.
ELSE.
  WRITE '3'.
ENDIF.

ULINE.

IF integer > 4.
  WRITE '1'.
  IF integer = 5.
    WRITE '11'.
    ENDIF.
ELSEIF integer < 4.
  WRITE '2'.
ELSE.
  WRITE '3'.
ENDIF.

ULINE.

***********************************
*Case
CASE surname.
  WHEN 'Nowak'.
    WRITE '1'.
  WHEN 'Kowalski' OR 'Kowalska'.
    WRITE '2'.
  WHEN OTHERS.
    WRITE '3'.
ENDCASE.