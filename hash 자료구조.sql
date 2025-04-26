-- hash : map형태의 자료구조, value 값이  {key: value, key: value ...} 형태로 저장됨
hset member:info:1 name aa email aa@aaaa.com age 30
-- 특정 요소 조회
hget member:info:1 name
hget member:info:1 email
hget member:info:1 age
-- 모든 요소값 조회
hgetall member:info:1
-- 특정 요소값만 수정
hset member:info:1 name kim
-- 특정 요소값의 값을 증가/감소 시킬경우
hincrby member:info:1 age 3
hincrby member:info:1 age -3

-- redis hash 활용 예시 : 빈번하게 변경되는 객체값 캐싱
-- 1. json 형태로 저장 : 데이터가 빈번하게 변경되면 json 파싱해서 문자열을 잘라야함
-- set posting:1 "{\"title\":\"hello java\",\"content\":\"hello java is\",\"author_email\":\"aa.com\"}" ex 10
-- 2. hash 형태로 저장 : 빈번하게 변경되는 경우 key값을 통해서 수정 가능
-- json 형태의 문자열로 캐싱할 경우, 해당 문자값을 수정할 때에는 문자열을 파싱하여 통째로 변경해야함.
-- 재고 관리
hset stocks:product:1 name apple stock 100 price 1000



