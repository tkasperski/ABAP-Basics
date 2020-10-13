REPORT z_screens_1.
TABLES zemployess.

DATA: wa_employees LIKE zemployess-employee.

SELECTION-SCREEN SKIP.
PARAMETER: my_ee    LIKE zemployess-employee DEFAULT '0000000001' OBLIGATORY,
           my_fname LIKE zemployess-forename,
           my_box1  AS CHECKBOX.

SELECTION-SCREEN ULINE.
SELECT-OPTIONS: my_dob FOR zemployess-dob NO-EXTENSION.
SELECTION-SCREEN ULINE.

SELECTION-SCREEN BEGIN OF BLOCK myblock1 WITH FRAME TITLE text-001.
  PARAMETER: wa_green RADIOBUTTON GROUP grpl,
             wa_blue  RADIOBUTTON GROUP grpl,
             wa_red   RADIOBUTTON GROUP grpl.
SELECTION-SCREEN END OF BLOCK myblock1.


SELECT * FROM zemployess.
 IF zemployess-dob IN my_dob.
   WRITE: /, zemployess.
 ENDIF.
ENDSELECT.