-- redis pub/sub 실습
-- pub/sub 기능은 멀티 서버 환경ㅇ에서 채팅, 알림 등의 서비스를 구현할때 많이 사용
-- 터미널 2,3 실행 (sub)
subscribe test_channel
-- 터미널 1실행(pub)
publish test_channel "hello, this is a test message"