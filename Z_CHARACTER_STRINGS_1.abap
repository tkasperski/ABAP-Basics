REPORT Z_CHARACTER_STRINGS_1.
TABLES zemployees.

DATA: title(15)             TYPE c VALUE 'Mrs',
      surname(40)           TYPE c VALUE 'Kowalska',
      forename(40)          TYPE c VALUE 'Paulina',
      sep,
      destination(200)      TYPE c,
      spaced_name(50)       TYPE c VALUE 'Mrs       Paulina      Kowalska',
      surname2(40),
      emp1_num(10),
      len TYPE i,
      mystring(30)          TYPE c,
      a1(10)                TYPE c,
      a2(10)                TYPE c,
      a3(10)                TYPE c,
      sep2(2)               TYPE c VALUE '**',
      int_telephone_num(12) TYPE c,
      country_code(3)       TYPE c,
      telephone_num(9)      TYPE c.

*Concatenate f1 f2 into dl [separated by sep]
CONCATENATE title surname forename INTO destination.
WRITE destination.

ULINE.

CONCATENATE title surname forename INTO destination SEPARATED BY sep.
WRITE destination.

ULINE.

*Condensing character strings, CONDENSE c [No-GAPS]
CONDENSE spaced_name.
WRITE spaced_name.

CONDENSE spaced_name NO-GAPS.
WRITE / spaced_name.
ULINE.

*Length of the string
len = strlen( surname ).
WRITE: 'Surname length is equal ', len.
ULINE.

*Replacing character strings
surname2 = 'Mr, Jan, Kowalski'.
REPLACE ',' WITH '.' INTO surname2.
WRITE: 'One line REPLACE command: ', surname2, /.

WHILE sy-subrc = 0.
  REPLACE ',' WITH '.' INTO surname2.
ENDWHILE.
WRITE: 'After replace in while loop: ', surname2.

ULINE.

**********************************************
*Searching
surname2 = 'Mr Jan Kowalski'.
WRITE 'Searching: "Mr Jan Kowalski"'.
SKIP.

SEARCH surname2 FOR 'Jan'.
WRITE / 'Searching for "Jan"'.
WRITE: /, 'sy-subrc: ', sy-subrc, /, 'sy-fdpos: ', sy-fdpos, /.

SEARCH surname2 FOR '. Jan   .'.
WRITE / 'Searching for ".Jan   ."'.
WRITE: /, 'sy-subrc: ', sy-subrc, /, 'sy-fdpos: ', sy-fdpos, /.

SEARCH surname2 FOR '*ski'.
WRITE / 'Searching for "*ski"'.
WRITE: /, 'sy-subrc: ', sy-subrc, /, 'sy-fdpos: ', sy-fdpos, /.

SEARCH surname2 FOR 'Kow*'.
WRITE / 'Searching for "Kow*"'.
WRITE: /, 'sy-subrc: ', sy-subrc, /, 'sy-fdpos: ', sy-fdpos, /.

ULINE.

************************************************
*SHIFT
emp1_num = '0000000321'.
WRITE: 'emp1_num = 0000000321', /.

SHIFT emp1_num LEFT DELETING LEADING '0'.
WRITE: 'SHIFT LEFT DELETING LEADING: ', emp1_num, /.

emp1_num = '0000000321'.
SHIFT emp1_num.
WRITE: 'SHIFT                      : ', emp1_num.

emp1_num = '0000000321'.
SHIFT emp1_num CIRCULAR.
WRITE: /, 'SHIFT CIRCULAR          : ', emp1_num.

ULINE.

*************************************************
*SPLIT - Splitting character string
mystring = '1111** AAAA  **2222'.
WRITE: 'STRING = "1111** AAAA  **2222"', /.

SPLIT mystring AT sep2 INTO a1 a2 a3.

WRITE: 'a1 = ', a1, /.
WRITE: 'a2 = ', a2, /.
WRITE: 'a3 = ', a3, /.

ULINE.

*************************************************
*SubFields
int_telephone_num = '+48123456789'.

country_code  = int_telephone_num(3).
telephone_num = int_telephone_num+3(9).

WRITE: 'COUNTRY CODE: ', country_code, /.
WRITE: 'PHONE NUMBER: ', telephone_num.

ULINE.