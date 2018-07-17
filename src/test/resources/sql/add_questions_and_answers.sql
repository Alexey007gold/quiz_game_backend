INSERT INTO qgv.questions
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), 'Question 1'),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'Ukraine history'), 'Question 2'),
      (random_uuid(), (SELECT id from qgv.topics t WHERE t.name = 'General IT'), 'Question 3');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 1'), 'Answer 1', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 1'), 'Answer 2', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 1'), 'Answer 3', true),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 1'), 'Answer 4', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 2'), 'Answer 1', true),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 2'), 'Answer 2', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 2'), 'Answer 3', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 2'), 'Answer 4', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 3'), 'Answer 1', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 3'), 'Answer 2', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 3'), 'Answer 3', false),
      (random_uuid(), (SELECT id from qgv.questions t WHERE t.value = 'Question 3'), 'Answer 4', true);