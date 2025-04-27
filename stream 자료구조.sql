-- redis stream 실습 : 데이터 실시간으로 read, 데이터가 저장
-- * : ID값 자동 생성
xadd test_stream * message "hello this is stream message"
-- $ : 현재 마지막 메시지 이후에 오는 새 메시지를 의미
xread block 20000 streams test_stream $
-- - + : 전체 메시지 조회
xrange test_stream - +