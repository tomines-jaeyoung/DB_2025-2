alter table 고객
                add 가입날짜 date
                
alter table 고객
                drop column 가입날짜;
                
ALTER TABLE 고객
                ADD CONSTRAINT CHECK_AGE CHECK(나이 >= 20);
                
        
ALTER TABLE 고객
                DROP CONSTRAINT CHECK_AGE;
                
                
DROP TABLE 배송업체;

INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) VALUES('APPLE', '정소화', 20, 'GOLD',  '학생', 1000);
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) VALUES('DELIGHT', '김재영', 27, 'BRONZE',  '회사원', 12000);
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) VALUES('SUGAR', '홍종민', 25, 'SLIVER',  '주부', 13000);
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) VALUES('ORANGE', '김용욱', 22, 'GOLD',  '학생', 0);
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) VALUES('CARROT', '성원용', 35, 'GOLD',  '회사원', 5000);
INSERT INTO 고객(고객아이디, 고객이름, 등급, 직업, 적립금) VALUES('MELON', '오형준', 'SLIVER',  '교사', 4000);
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금) VALUES('PEACH', '고명석', 28, 'GOLD',  '학생', 3000);

SELECT * FROM 고객;