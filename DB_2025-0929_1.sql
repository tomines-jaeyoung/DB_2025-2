-- 고영석 고객이 주문한 제품의 고객아이디, 제품명, 단가를 검색하시오

select c.고객아이디, p.제품명, p.단가 from 고객 c, 주문 o, 제품 p
                                    where c.고객이름 = '고명석' and c.고객아이디 = o.주문고객 and p.제품번호 = o.주문제품;
                                    
-- 자연조인
--나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 검색하시오.

select 주문제품, 주문일자 from 고객, 주문
                        where 나이 >= 30 and 고객아이디 =주문고객;
                        
--내부조인
select 주문제품, 주문일자 from 고객 inner join 주문 on 고객아이디 = 주문고객
                                where 나이 >= 30;
                                
                                
--외부조인
--주문하지 않은 고객도 포함해서 고객이름과 주문제품, 주문일자를 검색하시오.
-- 왼쪽 외부조인(left outerjoin)
select 고객이름, 주문제품, 주문일자 from 고객 left outer join 주문 on 고객아이디 = 주문고객;
--오른쪽 외부조인(right outerjoin)
select 고객이름, 주문제품, 주문일자 from 고객 right outer join 주문 on 고객아이디 = 주문고객;


--sub query
--달콤비스킷을 생산한 제조업체가 만든 제품들의 제품명과 단가를 검색하시오.
select 제품명, 단가 from 제품
                        where 제품명  = '달콤비스킷';

select 제품명, 단가 from 제품
                    where 제조업체 = (
                                        select 제조업체 from 제품
                                                where 제품명 = '달콤비스킷'
                    
                    );
                    
                    
--주문 테이블에서 쿵떡파이를 주문한 주문고객, 주문제품, 수량을 검색하시오.

select 주문고객, 주문제품, 수량 from 주문
                where 주문제품 =  (
                                        select 제품번호 from 제품
                                            where 제품명 = '쿵떡파이'
                    );
                       select * from 제품
                       select * from 주문
                       
                       
                       
                       
--적립금이 가장 많은 고객의 고객이름과 적립금을 검색하시오

select max(적립금) from 고객;
select 고객이름, 적립금 from 고객;
                        where 적립금 = (
                                        select max(적립금 from 고객
                        );
                        
--적립금이 가장 적은 고객의 고객이름과 적립금을 검색하시오.

select * from 고객;
select mix(적립금) from 고객;
select 고객이름, 적립금 from 고객 
                    where 적립금 =(
                                    select min(적립금) from 고객
                    );
                    

select * from 주문;
select * from 주문

                where 주문고객 = 'banana';
                


select 제품번호, 제품명, 제조업체 from 제품
                            where 제품번호 in(
                                    select 주문제품 from 주문
                                        where 주문고객 = 'banana'
                                    );
 
 --김씨 성을 가진 고객이 주문한 고객의 고객아이디, 나이 ,적립금, 제품명, 단가를 검색하시오
 select 고객이름, 고객아이디 from 고객 where 고객이름 like '김%';
 
 select 고객아이디, 나이, 적립금, 제품명, 단가 from 고객, 제품, 주문
                                        where 고객아이디 =주문고객
                                                        and 제품번호= 주문제품
                                                            and 주문고객 in(
                                                                            select 고객아이디 from 고객 where 고객이름 like '김%'
                                                    );
                                                    


--SUBQUERY 다중행 결과에 사용하는 NOT IN 연산자
--BANANA 고객이 주문하지 않은 제품의 제품명, 제조업체를 검색하시오

SELECT 주문고객, 주문제품 FROM 주문;
SELECT 제품명, 제조업체 FROM 제품;

SELECT 주문제품 FROM 주문 WHERE 주문고객 = 'BANANA'; 
SELECT 제품번호, 제품명, 제조업체 FROM 제품
                                WHERE 제품번호 NOT IN(select 주문제품 from 주문 where 주문고객 = 'banana');
                                
--대한 식품이 제조한 모든제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체를 검색하시오.

select 제품명, 단가, 제조업체 from 제품 where 제조업체 = '대한식품';
select 제품명, 단가, 제조업체 from 제품;
select 제품명, 단가 ,제조업체 from 제품 where 단가 > all(select 단가 from 제품 where 제조업체 = '대한식품');
                                                        

-- 2022년 3월 15일에 제품을 주문한 고객의 고객이름을 검색해보자.
SELECT * FROM 주문;
SELECT 주문고객 FROM 주문 WHERE 주문일자 = '2022-03-15'; 

SELECT 고객이름 FROM 고객
                WHERE 고객아이디 =(
                                SELECT 주문고객 FROM 주문 WHERE 주문일자 = '2022-03-15'
                );
--2022년 1월 1일에 주문한 고객의 고객이름을 검색해보자(한명인경우)
SELECT 고객이름 FROM 고객
                    WHERE EXISTS(
                                SELECT 주문고객 FROM 주문 WHERE 주문일자 = '2022-01-01' AND 주문고객 =고객아이디 
                    );
--2022년 1월 1일에 주문한 고객의 고객이름을 검색해보자(여러명인경우)
SELECT 고객이름 FROM 고객
                    WHERE NOT EXISTS(
                                SELECT 주문고객 FROM 주문 WHERE 주문일자 = '2022-01-01' AND 주문고객 =고객아이디 
                    );


 
                    
                    