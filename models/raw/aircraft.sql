SELECT DISTINCT
       tailnum AS tail_num,
       TO_DATE(year||to_char(month, '00')||TO_CHAR(dayofmonth, '00'), 'yyyymmdd') AS aircraft_date,
       a.serial_number,
       a.mfr_mdl_code,
       a.eng_mfr_mdl,
       a.year_mfr
  FROM {{ source('src_flight', 'flights') }}
  LEFT JOIN {{ source('src_flight', 'aircraft') }} a
    ON tailnum = 'N' || TRIM(n_number)
 ORDER BY tail_num ASC