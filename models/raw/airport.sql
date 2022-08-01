WITH airports AS (
    SELECT origin AS airport
      FROM {{ source('src_flight', 'flights') }}
    UNION
    SELECT dest AS airport
      FROM {{ source('src_flight', 'flights') }}
)

SELECT DISTINCT
       airport
  FROM airports