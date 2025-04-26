-- set자료구조 : 중복없음. 순서 없음
-- set에 값 추가
sadd memberlist member1
sadd memberlist member1
sadd memberlist member2

-- set에 값 조회
smembers memberlist

-- set 요소의 개수 조회
scard memberlist

-- set에서 멤버 제거
srem memberlist member2

-- 특정 요소가 set안에 들어있는지 확인 (1: 존재, 0: 없음)
sismember memberlist member1
sismember memberlist member2


-- redis set 활용 : 좋아요 기능 구현 (string 자료구조에서 좋아요 개선)
sadd likes:posting:1 member1
sadd likes:posting:1 member2
sadd likes:posting:1 member1
-- 좋아요 개수
scard likes:posting:1
-- 좋아요 눌렀는지 안눌렀는지 확인
sismember likes:posting:1 member1