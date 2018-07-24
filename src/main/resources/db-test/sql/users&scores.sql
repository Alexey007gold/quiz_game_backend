INSERT INTO qgv.users
VALUES(random_uuid(), 'test1@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user1'),
      (random_uuid(), 'test2@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user2'),
      (random_uuid(), 'test3@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user3'),
      (random_uuid(), 'test4@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user4'),
      (random_uuid(), 'test5@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user5'),
      (random_uuid(), 'test6@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user6'),
      (random_uuid(), 'test7@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user7'),
      (random_uuid(), 'test8@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user8'),
      (random_uuid(), 'test9@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user9'),
      (random_uuid(), 'test10@gmail.com', '$2a$04$CnIYUgjAJ0HWlaUvTAnlTOBR.Rb2K24p1OuyR4yhGCk3d7ZkewXHi', 'test_user10');



INSERT INTO qgv.scores
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), 34),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), 28),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test3@gmail.com'), 15),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test4@gmail.com'), 44),

      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), 23),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), 28),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test3@gmail.com'), 54),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test4@gmail.com'), 11),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test5@gmail.com'), 11),

      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'EPAM in locations'), (SELECT id from qgv.users u WHERE u.email = 'test6@gmail.com'), 13),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'EPAM in locations'), (SELECT id from qgv.users u WHERE u.email = 'test7@gmail.com'), 16),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'EPAM in locations'), (SELECT id from qgv.users u WHERE u.email = 'test8@gmail.com'), 11),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'EPAM in locations'), (SELECT id from qgv.users u WHERE u.email = 'test9@gmail.com'), 6),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'EPAM in locations'), (SELECT id from qgv.users u WHERE u.email = 'test5@gmail.com'), 3);