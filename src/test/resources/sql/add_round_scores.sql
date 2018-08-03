INSERT INTO qgv.round_scores
VALUES(random_uuid(), (SELECT id from qgv.rounds m WHERE m.created_at = '2016-06-22T19:10:22Z'), 'testPlayer1', 3),
      (random_uuid(), (SELECT id from qgv.rounds m WHERE m.created_at = '2016-06-22T19:10:22Z'), 'testPlayer3', 9),

      (random_uuid(), (SELECT id from qgv.rounds m WHERE m.created_at = '2016-06-22T19:10:20Z'), 'testPlayer1', 6),
      (random_uuid(), (SELECT id from qgv.rounds m WHERE m.created_at = '2016-06-22T19:10:20Z'), 'testPlayer3', 6);
