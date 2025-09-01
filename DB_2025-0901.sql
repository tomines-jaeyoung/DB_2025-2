--
-- 
-- SELECT * FROM 주문;
--  SELECT 주문고객 FROM 주문;
--   SELECT ALL 주문고객 FROM 주문;
--
--
--
----SELECT DISTINCT 주문고객 FROM 주문;
----
----SELECT 주문고객 AS 고객아이디, 주문제품 제품번호, 배송지, 주문일자 FROM 주문;
----SELECT 주문고객, 주문제품, QOTHDWL, 주문일자 FROM 주문;
----
----
----SELECT 제품명, 단가+500 "조정 단가" FROM 제품



--

--SELECT 주문제품, 수량, 주문일자
--FROM 주문
--WHERE 주문고객= 'APPLE' AND 수량> = 15;
--
--
--SELECT 고객아이디, 고객이름, 나이, 직업
--FROM 고객
--WHERE 직업 = '회사원' AND 나이 < 33;


--SELECT 주문제품, 수량,주문일자, 주문고객
--FROM 주문
--WHERE  주문고객= 'APPLE' OR 수량 >=15

--SELECT 고객이름, 등급, 직업
--FROM 고객
--WHERE 등급 = 'GOLD' OR 직업 = '의사';

--
--SELECT 제품명, 단가, 제조업체
--FROM 제품
--WHERE 단가 >=2000 AND 단가 <= 3000;



SELECT 나이, 등급, 직업 
FROM 고객
WHERE 나이 >=20 AND 나이 <=30 AND (등급='GOLD' OR 등급= 'SLIVER');
