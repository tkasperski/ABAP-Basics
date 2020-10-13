REPORT Z_OTHER_DATA_TYPES_1.

*DATA Fields format: YYYYMMDD
DATA: my_date  TYPE d VALUE '20201005',
      my_date2 LIKE sy-datum.

*TIME Fields format: HHMMSS
DATA: my_time  TYPE t VALUE '051433',
      my_time2 LIKE sy-uzeit.

WRITE: my_date, /, my_date2, /, my_time, /, my_time2.
ULINE.

******************************************
DATA: emp1_date   TYPE d,
      todays_date TYPE d,
      result      TYPE i,
      days_count  TYPE i.

emp1_date   = '20150621'.
todays_date = sy-datum.
result      = todays_date - emp1_date.
WRITE: 'emp1_date - todays_date = ', result, ' days.'.
SKIP.

days_count = 20.
result = todays_date + days_count.
WRITE: 'Todays date + 20 days = ', result.
SKIP.
ULINE.

******************************************
DATA: clock_in   TYPE t VALUE '073000',
      clock_out  TYPE t VALUE '160000',
      sec_diff   TYPE i,
      min_diff   TYPE i,
      hour_diff  TYPE p DECIMALS 2.

sec_diff   = clock_out - clock_in.
min_diff   = sec_diff / 60.
hour_diff  = min_diff / 60.

WRITE: 'clock_in = ', clock_in, /, 'clock_out = ', clock_out, /, 'sec_diff = ', sec_diff, /, 'min_diff = ', min_diff, /, 'hour_diff = ', hour_diff.
ULINE.

******************************************
*Currency and Quantity Fields
DATA: my_salary   LIKE zemployees_copy-salary,
      my_tax_amt  LIKE zemployees_copy-salary,
      my_next_pay LIKE zemployees_copy-salary,
      tax_perc    TYPE p DECIMALS 2 VALUE '0.23'.

TABLES ZEMPLOYEES_COPY.
SELECT * FROM zemployees_copy.
 my_tax_amt   = zemployees_copy-salary * tax_perc.
 my_next_pay  = zemployees_copy-salary - my_tax_amt.
 WRITE: 'surname: ', zemployees_copy-surname, 'salary: ', zemployees_copy-salary, 'currency: ', zemployees_copy-ecurrency, 'tax: ', my_tax_amt, 'pay: ', my_next_pay, /.
ENDSELECT.