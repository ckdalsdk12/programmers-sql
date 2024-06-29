-- 코드를 입력하세요
SELECT HISTORY_ID, CAR_ID, DATE_FORMAT(START_DATE, "%Y-%m-%d") AS START_DATE,
-- 날짜간의 기간을 구할때는 - 연산이 아닌 DATEDIFF 함수를 사용해야 한다.
-- 또한 당일 반납해도 1일 대여한 것으로 처리해야하므로 + 1 처리 해준다.
DATE_FORMAT(END_DATE, "%Y-%m-%d") AS END_DATE, CASE (DATEDIFF(END_DATE, START_DATE) + 1) >= 30
                                                   WHEN TRUE THEN "장기 대여"
                                                   WHEN FALSE THEN "단기 대여"
                                               END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE LIKE "2022-09-%"
ORDER BY HISTORY_ID DESC;
