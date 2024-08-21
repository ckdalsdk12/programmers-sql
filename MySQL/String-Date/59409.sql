-- 코드를 입력하세요
SELECT ANIMAL_ID, NAME, CASE
                            WHEN SEX_UPON_INTAKE LIKE "Neutered%" 
                            OR SEX_UPON_INTAKE LIKE "Spayed%" THEN "O"
                            -- LIKE "ABC" OR "DEF"와 같은 문장은 제대로 된 문법이 아닌것 같다.
                            -- CASE WHEN문과 LIKE를 조합할시에는 LIKE문을 여러번 사용해주어야 할 것 같다.
                            ELSE "X"
                        END AS 중성화
FROM ANIMAL_INS
ORDER BY ANIMAL_ID
