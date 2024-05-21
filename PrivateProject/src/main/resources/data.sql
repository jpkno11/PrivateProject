INSERT INTO Article(id,title,content) VALUES(default,'가가가가', '1111');
INSERT INTO Article(id,title,content) VALUES(default,'나나나나', '2222');
INSERT INTO Article(id,title,content) VALUES(default,'다다다다', '3333');



INSERT INTO article(title,content) VALUES('당신의 인생영화는?' ,'댓글 고');
INSERT INTO article(title,content) VALUES('당신의 소울푸드는?','댓글 고고');
INSERT INTO article(title,content) VALUES('당신의 취미는?','댓글 고고고');


INSERT INTO article(article_id, nickname,body) VALUES(4, 'Park' , '굿윌 헌팅');
INSERT INTO article(article_id, nickname,body) VALUES(4, 'kim'  , '아이 엠 샘');
INSERT INTO article(article_id, nickname,body) VALUES(4, 'choi'  ,'쇼생크탈출');

INSERT INTO comment(article_id, nickname,body) VALUES(5, 'Park', '치킨');
INSERT INTO comment(article_id, nickname,body) VALUES(5, 'kim', '샤브샤브');
INSERT INTO comment(article_id, nickname,body) VALUES(5, 'Choi', '초밥');


INSERT INTO article(article_id, nickname,body) VALUES(5, 'Park' ,'조깅');
INSERT INTO article(article_id, nickname,body) VALUES(5, 'kim'  ,'유튜브 시청');
INSERT INTO article(article_id, nickname,body) VALUES(5, 'Choi' ,'독서');