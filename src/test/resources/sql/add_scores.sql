INSERT INTO qgv.scores
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), 34),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), 28),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test3@gmail.com'), 15),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), (SELECT id from qgv.users u WHERE u.email = 'test4@gmail.com'), 44),

  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), 23),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), 28),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test3@gmail.com'), 54),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test4@gmail.com'), 11),
  (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), (SELECT id from qgv.users u WHERE u.email = 'test5@gmail.com'), 11);