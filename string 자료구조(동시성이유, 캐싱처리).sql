-- database 변경 (10번으로 변경) 0~15개까지 총 16개 database로 구성
-- ex) 0: 인증 , 1: 캐싱, 2: 상품개요 ...등등
-- select db번호
select 10

-- 데이터 베이스 내 모든 키 조회
key *

-- 일반적인 String 구조
-- set을 통해  key:value 세팅
set user:email:1 aaa@aaa.com
-- nx : 이미 존재하면 pass, 없으면 set
set user:email:2 dd@ddd.com nx
-- ex(expiration) : 만료시간(초단위), ttl(time to live)
set user:email:3 cc@ccc.com ex 10

-- redis 활용 : 사용자 인증정보 저장 (ex-refresh token)
set user:1:refresh_token sdfsdfdsfdsds2wesrewr ex 10000

-- 특정 key 삭제
del user:email:1
-- 현재 DB내 모든 key 삭제
flushdb

set user:email:1 psjw@aaa.com
keys *
set user:email:2 pp@bbb.com
get user:email:1
-- 동일 키에 값을 넣으면 덮어쓰기됨
set user:email:2 cc@ccc.com
get user:email:2
-- 키가 존재하면 세팅하지 않음
set user:email:2 dd@ddd.com nx
get user:email:2
keys *
-- redis 저장은 일시적 -> 유효기간 TTL 설정
set user:email:3 ff@fff.com ex 10
keys *

-- 삭제
del user:email:1
keys *

-- 전체삭제
flushdb
keys *


-- redis 활용 : 좋아요 기능 구현 -> rdb 동시성 이슈
-- 사용자 마다 select 후 update -> 동시에 0을 조회하는 경우 업데이트시 1로 됨(멀티스레드 지원되어 동시실행)
-- redis는 단일(Single) 스레드이기 때문에 동시성 이슈 없음
-- 단점 : 어떤 사용자가 좋아요를 눌렀는지 알 수 없음(무한대로 누를 수 있음)
set likes:posting:1 0
--특정 key값의 value를 1만큼 증가
incr likes:posting:1
--특정 key값의 value를 1만큼 감소
decr likes:posting:1
get likes:posting:1

-- redis 활용 : 재고관리
-- 동시에 주문을 넣었을 때 동시에 주문을 넣었을때
set stocks:product:1 100
decr stocks:product:1
get stocks:product:1

-- redis 활용 : 캐싱(임시저장) 기능 구현
-- rdb 조회후 redis에 저장 그리고 동일 조회에 있어서는 redis에서 조회
-- json 데이터 형식으로 저장"
set posting:1 "{\"title\":\"hello java\",\"content\":\"hello java is\",\"author_email\":\"aa.com\"}" ex 10
get posting:1