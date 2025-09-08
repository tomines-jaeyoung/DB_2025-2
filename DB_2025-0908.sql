select 고객이름, 나이, 등급 from 고객
    where 고객이름 like '김%'; 
    
select * from 고객;

select 고객이름, 직업, 등급 from 고객 
where 등급 like '%I%';



select 고객아이디, 고객이름, 등급, 직업 from 고객 
where 고객아이디 like '%a%'; 

select 고객아이디, 고객이름, 등급, 직업 from 고객
where (고객아이디 like '%A%') and (등급 like '%I%') and (고객이름 like '홍%');

select 고객아이디, 나이, 등급, 직업, 적립금 from 고객
where 고객아이디 like '_____';

select 고객아이디, 나이, 등급, 직업, 적립금 from 고객
where 고객아이디 like '_____' and 적립금  >= 3000;

select 고객이름, 직업, 등급 from 고객
where 직업 like '%_사' ;

select 고객이름, 나이 from 고객
where 나이 is null;

select 고객이름, 나이 from 고객
where 나이 is not null;

select 고객이름, 나이 from 고객
where 나이 < 25;

-- 입력된 값이 없는 컬럼(필드)는 비교 연산 결과가 false 라서 검색이 되지 않는다.

select 고객이름, 나이 from 고객
where 나이 >= 25;

--- *** order by절(정렬)
--- asc(오름차순: 작은 값 --> 큰 값), desc(내림차순: 큰 값 => 작은 값)
--- null : 오름차순 맨뒤, 내림차순 맨처음

select 고객이름, 나이 from 고객
order by 나이 asc;

select 고객이름, 나이 from 고객
order by 나이 desc;



select * from 고객;

select 고객이름, 나이 ,등급, 직업 from 고객
where 등급 = 'GOLD' or 등급 = 'VIP' 
order by 등급 asc;

select 고객이름, 나이 ,등급, 직업 from 고객
where 등급 in('GOLD', 'VIP') 
order by 등급 asc;


select * from 주문
where (주문제품 = 'p03' or 주문제품 = 'p06') and 배송지 = '%경기도'
order by 주문수량 desc;

select * from 주문
where 주문제품 in ('p03', 'p06') and 배송지 like '%경기도' order by 수량 desc;

select 주문고객, 주문제품, 수량, 주문일자 from 주문 where 수량 >= 10 order by 주문제품 asc, 수량 desc;

select 주문고객, 주문제품, 수량, 배송지 from 주문
where 주문고객 = 'a%' or 주문고객 = 'b%' or 수량 >= 10
order by 주문고객 desc , 주문제품 desc;




--- 집계함수
--- count(), max(), min(), sum(), avg()
--select절, having 절에서만 사용할수있다
-- null 값이 들어있는 컬럼의 값은 제외하고 계산한다.

--제품 테이블에서 단가의 평균을 검색하시오.
--소수점 둘쨰자리에서 반올림, round(avg(단가))

select * from 제품;
select avg(단가) as 단가평균 from 제품;
select round(avg(단가), 0) 단가평균 from 제품;
select round(avg(단가), 2) 단가평균 from 제품;

--올림함수
select ceil(avg(단가)) 단가평균 from 제품;
--내림함수
select floor (avg(단가)) 단가평균 from 제품;

--한빛제과에서 제조한 제품의 재고량 합계를 제품테이블에서 검색하시오.
select sum(재고량) "재고량 합계" from 제품 where 제조업체 = '한빛제과';

select sum(단가) "단가합계" from 제품 where 단가 >= 2500;

--고객 테이블에서 전체 고객수를 구하시오.
--1.고객아이디(PK)
select count(고객아이디) 고객수 from 고객;
--2. 나이( null 값이 있는 컬럼인 경우)
select count(나이) 고객수 from 고객;
--3. * 사용
select count(*) 고객수 from 고객;

