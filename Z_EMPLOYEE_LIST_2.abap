REPORT z_employee_list_2.
TABLES zemployees.

**Chain Statement
*SELECT * FROM zemployees.
*  WRITE: zemployees-title, zemployees-forename, zemployees-surname, /.
*ENDSELECT.

DATA integer01 TYPE i VALUE 16.
DATA packed_decimal01 TYPE p DECIMALS 2 VALUE '8'.

DATA packed_decimal02 LIKE packed_decimal01.
DATA packed_decimal03 LIKE packed_decimal01.
DATA packed_decimal04 LIKE packed_decimal01.

DATA new_surname LIKE zemployees-surname.

CONSTANTS myconstant01 TYPE p DECIMALS 1 VALUE '4.2'.
CONSTANTS myconstant02 TYPE i VALUE 6.

DATA result LIKE packed_decimal01.

result = integer01 + packed_decimal01.
WRITE: integer01, ' + ', packed_decimal01, ' = ', result.
result = integer01 - packed_decimal01.
WRITE: /, integer01, ' - ', packed_decimal01, ' = ', result.
result = integer01 / packed_decimal01.
WRITE: /, integer01, ' / ', packed_decimal01, ' = ', result.
result = integer01 * packed_decimal01.
WRITE: /, integer01, ' * ', packed_decimal01, ' = ', result.

ULINE.

*ADD, SUBTRACT, MULTIPLY, DIVIDE
DATA integer02 TYPE i VALUE 2.

ADD 2 TO integer02.
WRITE:    'ADD      2 TO   integer02 = ', integer02.
SUBTRACT 2 FROM integer02.
WRITE: /, 'SUBTRACT 2 FROM integer02 = ', integer02.
MULTIPLY integer02 BY 10.
WRITE: /, 'MULTIPLY integer02 BY 10  = ', integer02.
DIVIDE integer02 BY 5.
WRITE: /, 'DIVIDE   integer02 BY  5  = ', integer02.

ULINE.
DATA int1 TYPE i VALUE 0.
DATA dec1 TYPE p VALUE '1.55' DECIMALS 2.
int1 = dec1.
WRITE: 'DECIMAL (1.55) CONVERTED INTO INTEGER = ', int1.

ULINE.
*Division types
DATA dec2    TYPE p DECIMALS 2 VALUE '5.45'.
DATA dec3    TYPE p DECIMALS 2 VALUE '1.48'.
DATA result2 TYPE p DECIMALS 2.

*Standard division
result2 = dec2 / dec3.
WRITE:    'Standard division  5.45  /  1.48 = ', result2.
*Integer division
result2 = dec2 DIV dec3.
WRITE: /, 'Integer division   5.45 DIV 1.48 = ', result2.
*Remainder division
result2 = dec2 MOD dec3.
WRITE: /, 'Remainder division 5.45 MOD 1.48 = ', result2.