-- zset : sorted set
-- add하는 score를 부여하고, score 기준으로 정렬
zadd  memberlist 3 member1
zadd  memberlist 4 member2
zadd  memberlist 1 member3
zadd  memberlist 2 member4

-- 조회방법 : 기본적으로 score기준 오름차순 정렬
zrange memberlist 0 -1
-- 내림 차순 정렬
zrevrange memberlist 0 -1

-- zset 요소 삭제
zrem memberlist member4

-- zrank : 특정 멤버가 몇번째 순서인지 출력 (오름차순 기준)
zrank memberlist member1
zrank memberlist member3
zrank memberlist member2

-- 최근 조회한 상품목록 -> 중복됨 -> set(정렬이 안됨) -> zset(정렬됨)
-- socer:시간정보 (시간을 초단위로 집어넣음 - 프로그램)
-- redis zset 활용 : 최근 본 상품목록
-- zset을 활용해서 취근시간순으로 score를 설정하여 정렬
zadd recent:products 151930 pineapple
zadd recent:products 152030 banana
zadd recent:products 152130 orange
zadd recent:products 152230 apple
-- zset도 set이므로 같은 상품을 add할 경우에 시간만  업데이트되고 중복이 제거
zadd recent:products 152330 apple

-- 최근 본 상품목록 3개 조회
zrevrange recent:products 0 2
-- socre까지 포함하여 전체 데이터 조회시
zrevrange recent:products 0 -1 withscores

-- 주식, 코인 실시간 시세 저장
--zadd stock:samsung 시간 53000
--zadd stock:samsung 시간 54000

