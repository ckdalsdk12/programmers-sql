/*
서브쿼리를 사용하여 2022년 10월 16일에 대여 되었던 자동차 ID를 찾고 
CASE문과 서브쿼리에서 찾은 자동차 ID를 사용하여 '대여중' 과 '대여 가능'을 처리
*/
SELECT CAR_ID, CASE WHEN CAR_ID IN (SELECT CAR_ID
                                    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                                    WHERE '2022-10-16' BETWEEN START_DATE AND END_DATE)
                                    THEN '대여중'
                    ELSE '대여 가능'
                    END
                    AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC