INSERT INTO qgv.rounds
VALUES(random_uuid(), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:20Z'), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), 0,  '2016-06-22T19:10:22Z', '2016-06-22T19:10:25Z'),
      (random_uuid(), (SELECT id from qgv.matches m WHERE m.created_at = '2016-06-22T19:10:20Z'), (SELECT id from qgv.topics t WHERE t.name = 'EPAM in location'), 0,  '2016-06-22T19:10:20Z', '2016-06-22T19:10:25Z');
