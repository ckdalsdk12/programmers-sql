SELECT FLAVOR
FROM
(
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
    FROM
    (
        (SELECT FLAVOR, TOTAL_ORDER
        FROM FIRST_HALF)
        UNION
        (SELECT FLAVOR, TOTAL_ORDER
        FROM JULY)
    )
    GROUP BY FLAVOR
    ORDER BY TOTAL_ORDER DESC
)
WHERE ROWNUM <= 3
/*
WHERE절이 ORDER BY보다 먼저 실행되기 때문에
서브쿼리를 이용하지 않으면 3개의 ROW만 조회하고 그 ROW를 정렬한다.
서브쿼리를 이용하여 모든 ROW 조회 후 ORDER BY하고 3개의 ROW를 조회해야 한다.
*/
