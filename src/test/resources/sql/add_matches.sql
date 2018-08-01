INSERT INTO qgv.matches
VALUES(random_uuid(), 1, '2016-06-22T19:10:20Z', '2016-06-22T19:10:25Z'),
      (random_uuid(), 0, '2016-06-22T19:10:21Z', '2016-06-22T19:10:26Z'),
      (random_uuid(), 1, '2016-06-22T19:10:22Z', '2016-06-22T19:10:24Z'),
      (random_uuid(), 2, '2016-06-22T19:10:23Z', '2016-06-22T19:10:27Z'),
      (random_uuid(), 0, '2016-06-22T19:10:24Z', '2016-06-22T19:10:28Z'),
      (random_uuid(), 1, '2016-06-22T19:10:25Z', '2016-06-22T19:10:29Z'),
      (random_uuid(), 0, '2016-06-22T19:10:26Z', '2016-06-22T19:10:30Z');

INSERT INTO qgv.players
VALUES(random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:20Z'), 1, 5),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:20Z'), 2, 0),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:21Z'), 1, 6),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:22Z'), 1, 0),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test4@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:22Z'), 2, 0),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:23Z'), 1, 5),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:23Z'), 2, 0),


      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:24Z'), 1, 0),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:25Z'), 1, 0),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:25Z'), 2, 0),

      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test1@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:26Z'), 1, 0),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test2@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:26Z'), 2, 0),
      (random_uuid(), (SELECT id from qgv.users u WHERE u.email = 'test3@gmail.com'), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:26Z'), 3, 0);