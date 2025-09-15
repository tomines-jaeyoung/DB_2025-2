select 제조업체 from 제품;

select count(distinct 제조업체) "제조업체의 수" from 제품; 

select count(DISTINCT 주문고객) "주문고객의 수" FROM 주문;

SELECT 주문고객 FROM 주문;


SELECT * FROM 주문;



SELECT 주문제품, SUM(수량) FROM 주문
                            GROUP BY 주문제품
                            ORDER BY 주문제품;
                            
select 주문고객,round(avg(수량), 1) "수량의 평균" from 주문
                            group by 주문고객
                            order by 주문고객 desc;
                            
                
                
                --고객 테이블에서 등급별 적립금의 평균을 고객아이디를 기준으로 오름차순으로 검색하시오
select 등급, round(avg(적립금),2) "등급별 적립금의 평균" from 고객 
                                group by 등급, 직업
                                order by 등급 desc;
                                          
select * from 제품;
-- 제품 테이블에서 제조업체별로 제조한 제품의 개수와 제품중 가장 비싼 단가를 검색하시오.
select 제조업체, count(*) 제품수, max(단가) 최고가 from 제품
                                                    group by 제조업체;
                                                    
                                                    
-- 고객테이블에서 직업별 나이의 평균과 고객의 적립금중 가장작은 적립금을 검색하시오) 
select 직업, avg(나이) 평균나이, min(적립금) 최저적립금 from 고객
                                                            group by 직업;
                                                            
                                                            
--제품테이블에서 제조업체별로 제조한 제품의 개수와 제품중 가장비싼단가를 검색하시오                                                            
select 제조업체, count(*) 제품수, max(단가) 최고가 from 제품
                                                group by 제조업체
                                                having count(*) >=3;
                                                                                                       
-- 제품 테이블에서 [제품을 2개이하 제조한]제조업체 별로 제조한 제품의 개수와 제품중 가장비싼단가중 [4000이상인것들} 검색하시오
select 제조업체, count(*) 제품수, max(단가) 최고가 from 제품
                                                group by 제조업체
                                                having max(단가) >=4000 and  count(*) <= 2;

--고객 테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객수와 적립금 평균을 검색하시오
-- 단, 고객수는 고객수로 적립금 평균은 평균 적립금으로 출력

select 등급, count(*) 고객수, round(avg(적립금), 2) "평균 적립금" from 고객
                                group by 등급
                                having avg(적립금) >= 1000;
                                               
                                               
select * from 주문;
-- 주문테이블에서 각 주문고객이 주문한 제품의 총 주문수량을 주문 제품별로 검색하시오
-- 단, 주문제품, 주문고객, 총주문수량을 컬럼으로 출력하고, 총 주문수량이 30개이상, 주문제품이 p01~p03까지의 제품만 출력

select 주문제품, 주문고객, sum(수량) 총주문수량 from 주문
                                            group by 주문제품, 주문고객
                                            having sum(수량) >=30 and 주문제품 in('p01', 'p02', 'p03')
                                            order by 주문제품;
                                            
                                            
--여러테이블 조인검색
--자연 조인 (natural join)
--주문 테이블과 제품테이블에서 주문번호, 주문고객, 제품명, 단가, 제조업체를 검색하시오
select 주문번호, 주문고객, 제품명, 단가, 제조업체 from 주문, 제품
                                    where 주문제품=제품번호;
                                    
                                    
--banana 고객이 주문한 제품의 이름을 검색하시오
select 제품명 from 주문, 제품
        where 주문고객 = 'banana' and 주문제품=제품번호;
        
--고객이름, 나이, 직업 ,제품명, 단가, 주문일자, 배송지 등을 apple 고객이 주문한 정보로 검색하시오.

select * from 고객;
select 고객이름, 나이 ,직업 ,제품명, 단가, 주문일자 ,배송지 from 고객, 제품, 주문
                                                        where 주문고객 = 'apple' and 주문고객 = 고객아이디 and 주문제품=제품번호;
                                                        
--나이가 30세이상인 고객이 주문한 제품의 번호, 제품명, 주문일자를 검색하시오

SELECT 제품번호, 제품명, 주문일자 FROM 제품, 주문, 고객
                        WHERE 나이 >= 30 AND 주문고객 = 고객아이디 AND 주문제품 = 제품번호;
        