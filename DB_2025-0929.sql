select * from 고객;
--고객 테이블에 고객아이디는 strawbberry, 고객 이름 최유경, 나이 30세, 등급 vip 직업은공무원, 적립금 100원인 고객의 정보를 삽임(추가)하시오
insert into 고객 values('strawberry', '최유경', '30', 'vip', '공무원', 100);
insert into 고객(고객아이디, 고객이름, 직업, 나이, 등급, 적립금) values('kiwi', '김키위', '학생', 23, 'silver', 500);

insert into 고객(고객아이디, 고객이름, 직업, 나이, 등급, 적립금) values('grapes', '강포도', '의사', 30,  'vip', 1500);

create table 한빛제품(
    제품명 VARCHAR2(20) not null,
    재고량 NUMBER,
    단가 NUMBER,
    primary key(제품명)
    );
    
    
    
insert into 한빛제품(제품명, 재고량, 단가)
                select 제품명, 재고량, 단가 from 제품 where 제조업체 = '한빛제과';
                
                
select * from 한빛제품;



--데이터 업데이트(수정)
--제품 테이블에서 제품번호가 p05인 제품에 제품명을 신나라면, 가격 2000원으로 수정하시오
--update 테이블명 set 컬럼명= 값, 컬럼명=값

update 제품 set 제품명 ='신나라면', 단가=2000 where 제품번호 ='p05';

select *from 제품;
update 제품 set 단가 = 단가 *1.2;

--updat 조건절에 subQuery 사용
-- 정소화 고객이 주문한 제품의 주문수량을 5개로 수정하시오.
update 주문 set 수량 =5
                where 주문고객 in(
                                    select 고객아이디 from 고객
                                                        where 고객이름 ='정소화'
                                                        );
                                                        
                                                        
                                                        
select * from 주문;                                                

-- delete (행삭제)
--한빛 제품 테이블에서 단가가 1000원 이상 2500원 이하인 행들을 삭제하시오
--delete from 한빛제품 where 단가 >= 1000 and 단가 <=  2500 ;
delete from 한빛제품 where 단가 between 1000 and 2500;
-- 고객이름이 김키위인 고객의 정보를 삭제하시오
delete from 고객 where 고객이름  = '김키위' ;



select *from 한빛제품; 
select * from 고객;

-view 는 논리적인 가상테이블
--기존에 생성해서 사용한 테이블은 물리적 장치에 저장됨
--view 생성방법
--고객 테이블 등급이 vip 고객의 고객아이디, 고객이름 ,나이 ,등급으로 구성된 view 우수고객이라는 이름으로 생성하시오.

create view 우수고객( 고객아이디, 고객이름, 나이, 등급)
        as select 고객아이디, 고객이름, 나이, 등급 from 고객
                                    where 등급 ='vip'
                                    
                                    with check option;
                                    
select * from 우수고객;                                    
    
--제품테이블에서 제조업체별 제품수로 구성된 업체별제품수 라는 이름의 view를 생성해보자
create view 업체별제품수(제조업체,제품수)
    as select 제조업체, count(*) from 제품
                                group by 제조업체
                                with check option;
                                select * from 업체별제품수;
                                
                                
-- 나이가 30세 이상인 우수고객을 검색(조회) 하시오.
select    * from 우수고객
                where 나이 >= 30;    
                
--제품 1이라는 이름의 제품명, 재고량, 제조업체 속성을 갖는 뷰를 생성하시오


--제품 1 view에 제품번호 p08, 재고량 1000, 제조업체 신선식품인 제품의 정보를 삽입하시오.


-- 1. 제품번호가 필수 컬럼이므로, 뷰 정의에 제품번호를 추가합니다.
--    이제 뷰는 4개의 컬럼을 갖습니다.
CREATE OR REPLACE VIEW 제품1(제품번호, 제품명, 재고량, 제조업체)
AS SELECT 제품번호, 제품명, 재고량, 제조업체 FROM 제품
WITH CHECK OPTION;

-- 2. 뷰의 내용 확인
SELECT * FROM 제품1;

-- 3. 데이터 삽입 시, 제품번호에 해당하는 고유 값('P08' 또는 다른 미사용 값)을 맨 앞에 추가합니다.
INSERT INTO 제품1 VALUES ('P08', '신선라면', 1000, '신선식품');

-- 뷰 생성: 제품2(제품번호, 재고량, 제조업체)
-- 원본 테이블의 '제품번호' 컬럼을 SELECT합니다.

-- 기존 제품1 뷰가 존재한다면 삭제합니다.

CREATE VIEW 제품2(제품번호, 재고량, 제조업체)
AS SELECT 제품번호, 재고량, 제조업체 FROM 제품
WITH CHECK OPTION;

-- 제품2 뷰에 데이터 삽입 (잘못된 'SELECT INSERT' 구문 삭제 및 문법 수정)
-- 제품번호 'p08', 재고량 1000, 제조업체 '신선식품'을 삽입합니다.
INSERT INTO 제품2 VALUES('p08', 1000, '신선식품');







