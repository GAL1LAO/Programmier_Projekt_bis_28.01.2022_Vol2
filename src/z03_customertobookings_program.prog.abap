*&---------------------------------------------------------------------*
*& Report z03_customertobookings_program
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_customertobookings_program.

PARAMETERS ContryTO type s_countr.
PARAMETERS CityFR type s_city.
PARAMETERS CityTO type s_city.

SELECT * FROM zi_03_booking_flDate

 WHERE zi_03_booking_flDate~cityto = @CityTO
 or zi_03_booking_flDate~countryto = @ContryTO
 or zi_03_booking_flDate~cityfrom = @CityFR

 into table @data(total_Table).

 cl_demo_output=>display_data( total_table ).
