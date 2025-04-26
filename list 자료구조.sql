-- list 자료구조 : redis의 list는 deque자료구조
-- lpush : 데이터를 왼쪽 끝에 삽입
-- rpush : 데이터를 오른쪽 끝에 삽입
-- lpop : 데이터를 왼쪽에서 꺼내기
-- rpop : 데이터를 오른쪽에서 꺼내기

lpush hongildongs hong1
lpush hongildongs hong2
rpush hongildongs hong3

lrange hongildongs 0 -1
-- pop을 실행하면 데이터가 삭제된다.
rpop hongildongs
lpop hongildongs

rpush hongildongs hong2
rpush hongildongs hong3

-- list 조회
-- -1은 리스트의 끝자리(마지막 index)를 의미, -2는 끝에서 두번째 index를 의미
-- 0 0 첫번째 값만 조회
lrange hongildongs 0 0
-- -1 -1 마지막 값만 조회
lrange hongildongs -1 -1
-- 0 -1 첫번째부터 마지막까지 조회
lrange hongildongs 0 -1
-- -2 -1 마지막 2번째부터 마지막자리까지
lrange hongildongs -2 -1
--처음부터 2번째 까지
lrange hongildongs 0 1

-- 데이터 개수 조회
llen hongildongs

-- ttl 만료시간 적용
expire hongildongs 20
-- ttl 만료시간 조회
ttl hongildongs

keys *

-- redis 활용 : 최근 방문한 펟이지, 최근 조회한 상품목록 -> 중복제거가 안됨 (zset 활용)
rpush mypages www.naver.com
rpush mypages google.com
rpush mypages www.daum.net
rpush mypages www.chatgpt.com
rpush mypages www.daum.net
-- 최근방문한 페이지 3개만 보여주는
lrange mypages -3 -1