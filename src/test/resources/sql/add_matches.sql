INSERT INTO qgv.matches
VALUES(random_uuid(), 0, '2016-06-22 19:10:20', '2016-06-22 19:10:25'),
      (random_uuid(), 0, '2016-06-22 19:10:21', '2016-06-22 19:10:26'),
      (random_uuid(), 0, '2016-06-22 19:10:22', '2016-06-22 19:10:24'),
      (random_uuid(), 0, '2016-06-22 19:10:23', '2016-06-22 19:10:27');

INSERT INTO qgv.players
VALUES(random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:20'), 1, 5),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:23'), 1, 5),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:20'), 1, 0),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:21'), 1, 6),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:22'), 1, 0),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:23'), 1, 0),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test4@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22 19:10:22'), 1, 0);