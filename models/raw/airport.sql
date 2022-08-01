WITH airports AS (
    SELECT origin AS airport,
           TO_DATE(year||to_char(month, '00')||TO_CHAR(dayofmonth, '00'), 'yyyymmdd') AS airport_date
      FROM {{ source('src_flight', 'flights') }}
    UNION
    SELECT dest AS airport,
           TO_DATE(year||to_char(month, '00')||TO_CHAR(dayofmonth, '00'), 'yyyymmdd') AS airport_date
      FROM {{ source('src_flight', 'flights') }}
)

SELECT DISTINCT
       airport,
       airport_date
  FROM airports