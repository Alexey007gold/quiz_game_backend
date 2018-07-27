CREATE TEMP TABLE temp_topic_names (
  topic1 VARCHAR(255),
  topic2 VARCHAR(255),
  topic3 VARCHAR(255),
  topic4 VARCHAR(255),
  topic5 VARCHAR(255)
);
INSERT INTO temp_topic_names
VALUES('Ukraine history', 'General IT', 'EPAM in locations', 'EPAM Ukraine', 'EPAM Global');

INSERT INTO qgv.topics
VALUES(random_uuid(), (SELECT topic1 from temp_topic_names)),
      (random_uuid(), (SELECT topic2 from temp_topic_names)),
      (random_uuid(), (SELECT topic3 from temp_topic_names)),
      (random_uuid(), (SELECT topic4 from temp_topic_names)),
      (random_uuid(), (SELECT topic5 from temp_topic_names));

CREATE TEMP TABLE temp_session_variables (
  randId  VARCHAR(36),
  topicId VARCHAR(36)
);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the EPAM Vinnytsia office opened?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2001', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many people worked in Vinnytsya at the very beginning?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '15', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many times has the EPAM Vinnytsia office been relocated?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '0', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Head of the Vinnytsia Delivery Office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Serhiy Chernenko', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mykhaylo Lazor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Artem Nikutov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sergiy Shkurupiy', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many  employees work in the EPAM Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '250', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '160', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '120', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '70', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the EPAM Vinnysia office located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Administrative center', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Historical center', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Administrative and historical center', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Suburbs', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which project won the contest ''My EPAM project'' in 2014 in Vinnytsya?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Cycling parking', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Secret of Success', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Table tennis', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Billiards', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How can you get to the EPAM Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Through the roof', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'By lift', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'By stairs', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'By lift and stairs', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many units are there in the EPAM Vinnytsia  office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which technology is practically not present in the EPAM Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '.NET', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'PHP', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'C++', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What sport team is there in the EPAM Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Football team', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hockey team', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Table tennis team', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Swimming ream', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What tournament takes place annually in the EPAM Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ping Pong Tournament', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Strike ball tournament', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chess tournament', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Darts tournament', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the last renovation in the EPAM Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Bigger kitchen', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'New carpet', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shower room', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Car parking', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What anniversary did the EPAM Vinnytsia office celebrate in 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Tenth', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Eleventh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Seventh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Eighth', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who brings cookies every morning to the EPAM Vinnytsia canteen?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Plumber', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Head of office', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Receptionist', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'System Administrator', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who eats expired products from the refrigerator in the office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Office pets', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bins', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Not office animals', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Not office personnel', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the relationship between the EPAM Vinnytsia office and the Three Musketeers?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'We have our own Boyarsky', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'We all wear hats and swords', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'No idea', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'When we fail, we scream ‘Каналья’', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What technical community is existed in Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'All mentoined here', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mobile Community', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arduino Community', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Front end Community', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What historical mark can you see from the window of the Vinnytsia office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Local history museum', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Water tower', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Light show Fountain ‘Roshen’', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Forest', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which river is Vinnytsia based on?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dnipro', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Southern Bug', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnister', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Danube', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which place does Vinnytsia take among 55 cities of Ukraine to live in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Last', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Second', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Third', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'First', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which place does Vinnytsia take among 55 cities of Ukraine to do business?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'First', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sixth', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tenth', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Second', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of world famous boxer, intercontinental box champion (WBA) in middleweight who is from Vinnytsia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vyacheslav Uzelkov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Volodymyr Klychko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oleksandr Spyrko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Andrii Fedchuk', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How is  Vinnytsia water tower, built by Artynov architect, used now?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'As a water tower', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'As a shelter', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'As a memorial museum of Afganistan', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'As a souvenir shop', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The biggest in Europe and the only one in Ukraine located in Vinnytsia is:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Fountain', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Statue', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Square', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Factory', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is Vinnytsia famous for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Bike-friendly city', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Car-hater city', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Perfect trams city', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The city of skateboards', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which street was the first Dnipro office located in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Globynska', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tiitova', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moskovskaya', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karla Marks', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the X-box in the Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HR room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Meeting room B 9th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lounge room', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'English room', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which primary skill has only 1 employee in the Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Java', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oracle', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '.Net', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'iOS Objective-C', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What team is absent in  Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Football', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Basketball', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Table games', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Volleyball', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which project is the oldest one in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Trafigura', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CTC', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sportchek', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Scrips networks', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the curent address of Dnipro EPAM office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Globynska', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tiitova', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moskovskaya', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karla Marks', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many kitchens are there at the EPAM Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is Dnipro EPAM library situated?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3rd floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9th floor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '7th floor', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the table football room at Dnipro office located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HR room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Meeting room B 9th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Launge room', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'English room', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the surname of Dnipro EPAM director?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lazor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nikutov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shkurupiy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Scherbyna', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Administrative Manager in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Olga Kosilova', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Olha Myronova', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Julia Koroid', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iryna Iakovlieva', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the head of Java Solutions#1 in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Iurii Ivon', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Eduard Miminoshvili', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vladimir Tomurka', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Feliks Nesterov', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many recruiters are there in the Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which game is the most popular in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mafia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alias', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Game of Thrones', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poker', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many snails leave in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the table tennis  in Dnipro office situated?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3rd floor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7th floor', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many business analytics are there in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many technical communities are there in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where does the guitar live in Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3rd floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9th floor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '7th floor', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was Dnipropetrovsk office founded?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1 July, 2008', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 Oct, 2007', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 Nov, 2007', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 Apr, 2007', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was the first employee of the EPAM Dnipro office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Denis Zavadsky', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Artem Nikutov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Denys Rafael', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vladimir Tomurka', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many bridges cross the Dnipro river in Dnipropetrovsk?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Do you know which city has the shortest subway line in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsya', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Dnipropetrosk is located on :');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5 Hills', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7 Hills', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4 Hills', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '6 Hills', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'It is the biggest in Europe and the only one in Ukraine! It is located in Dnipropetrovsk. What is it?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Circus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Central embankment', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Skyscraper', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Central park', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What famous actress was born in Dnipropetrovsk?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kristina Asmus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Monica Bellucci', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Liya Ahedzhakova', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Scarlett Johansson', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is Dnipropetrovsk telephone code?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '43', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '57', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '31', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '56', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The approximate number of people living in Dnipropetrovsk is:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '800 thousand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '900 thousand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 million', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '990 thousand', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many spectators can the Dnipro circus hold?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1914', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1500', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '900', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first EPAM IT Lab opened at Lviv Polytechnical University?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2011', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2009', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many subjects are taught at EPAM Lviv IT lab?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the first group in the EPAM Lviv IT Lab?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '.NET', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Testing', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Delphi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM Lviv opened?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2006', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2009', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many employees worked at the onset of EPAM Lviv ?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '50', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '80', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '120', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '150', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the surname of the Lviv office Director?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Trofimov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lazor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lipskyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nikutov', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many EPAM office locations are  in Lviv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the address of Lviv EPAM office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Storozhenka, 34', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ol. Stepanivny, 45', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sharanevycha, 5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zaliznychna, 45', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many office areas are there at EPAM Lviv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many kitchens does Lviv office have?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '6', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What do the colors in Lviv office mean?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'the names of meeting rooms', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'the names of kitchens', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'the design of Recreation room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'office design', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the previous name of Lviv Company before it became EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Spline', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Spline Software', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Spline Systems', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Systems', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the peculiarity of Lviv office that makes it similar to Minsk one?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Help Desk department', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'soft skills trainer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'coaching department', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'corporate bus', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is painted on the wall in HR Department room?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'company values', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'company logo', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Drive, Own, Commit!', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'nothing', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the slogan of Lviv Management Community?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Go-M!', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'M-Come!', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MMoving!', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv M!', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is Lviv EPAM''s library located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Area A', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area B', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area C', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area D', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the boxing room located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Area A', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area В', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area D', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area E', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many managers are included to Org GDO UA Lviv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of meeting room with cartoon heroes painted on the walls in Lviv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Midnight Black', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivory', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Jasmine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Black', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many floors does Lviv EPAM occupy in the building?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What kind of recreation room is located on the 1st floor?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Massage Room', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yoga Room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Boxing Room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Coffee Room', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where can you get a pressure meter at the Lviv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HR Department', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Massage Room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Reception', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area G', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is a football room at the Lviv office located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Training Center', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Relax Room', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area A', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Area G', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where can you find the biggest EPAM logo with pictures of EPAMers?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Area D', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Relax Room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Training Center', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Reception', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Head of the Pre-production unit in Lviv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Volodymyr Verhun', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Taras Ozarkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Halyna Myronova', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oleksandr Samuilov', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Deputy Director in Lviv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Svitlana Sydorenko', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vitaliy Boyko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mykhaylo Lazor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Roman Hapachylo', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many sport teams and clubs are there in Lviv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '13', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '20', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many technical communities are there in Lviv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '11', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '15', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following communities was opened at  Lviv office in 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Juniors Club', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Testers Community', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '.NET Community', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'macramé community', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What metro station is the nearest to Kharkiv Office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '23 Serpnja', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Botanichnyi sard', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Botanichnyi sad', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Botanichnyi grustnyi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is ''EPAM8021x'' in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Wi-Fi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The registration number', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The identification number', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM Kharkiv office opened?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2006', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where are Kharkiv EPAM champions'' cups kept?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'lobby', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in HR room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'on the 5th floor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in the champion''s bedside-table', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first Kharkiv RD laboratary open?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2011', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the QR Booking service provided in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2015', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did the number of CTC project team reach to 100 people?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the street where first Kharkiv EPAMers worked?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mironosytska', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kolomenska', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivanova', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sumska', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which project is the oldest in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Oracle', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CCC', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IPREO', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CTC', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which Kharkiv university was the external training laboratory for DevOps opened?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HNEU', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'V.N. Karazina KNU', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'KHAI', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'NURE', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Kharkiv Resource Development Department specializes in teaching...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'QA, .Net, Java, Frontent, Devops, С++', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'QA, AQA, .Net, Java, Frontent, Devops', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java, Frontent, PHP, QA, AQA, .Net', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java, Frontent, С++, PHP, С#', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What can you  see on the ground floor in the lobby of Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Munich Marienplatz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brussel Grand-Place', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rome Piazza Navona', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv Freedom Square', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does the following sequence mean for Kharkiv office: A,B,C,D,E,F,J,H?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'location of Areas', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'alphabet', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'biuldings numbering', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'floors numbering', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the biggest meeting-room in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Karaganda', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Princeton', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Minsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Воston', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the snail who lives in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mi-mi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cha-Cha', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hybris', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kukusia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'There is a flower in Kharkiv office which is in bloom all year round. What color is it?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Pink', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'White', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Red', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Blue', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of Kharkiv EPAM music band?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Kings', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Rock', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Balls', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Bulls', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the team, who won UA Wide Hackathon in 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'BIG Commerce Guys', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'TBD', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hackateam', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Code Node', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the first project that won in MyEPAM Project for Kharkiv office in 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Electronic Piano', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Quiz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Barcode Room Booking', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Design of the office (soft chairs)', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What tournaments do take place in Kharkiv office each spring and autumn?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'table-tennis', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'poker', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'table games', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'table hockey', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which sports team are not present in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'football', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'table-tennis', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'carting', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'badminton', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where does yellow sofa "live" in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5 -th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Recruiters room', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Accounters room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'HR room', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'People of which department may be recognized by their palm prints?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Accounting', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'HR', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Travel', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Admin', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the snack-machine situated in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3rd floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1st floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9th floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '6th floor', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was the first customer of Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'ССС', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oracle', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'СТС', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Spotlight', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did the IT Shares start in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2009', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2011', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Belarusian city is absent in Kharkiv Office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Gomel', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Minsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brest', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vitebsk', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Continue the phrase: ''Keep the book in a book…''');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Keeping', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Crossing', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Putting', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hidding', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many kilograms of used batteries are gathered by Kharkiv office employees during a year?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '50 kg', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '12 kg', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10 Kg', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '30 kg', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is sitting in the "Nest" in Kharkiv Office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Birds', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'People', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'parrots', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'cuckoo', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many sharks were in Kharkiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '0', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which sea animals were popular among Kharkiv office visitors?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sharks', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'River perch', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moray eel', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Snail', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'You feel Healthy in Kharkiv Healthy ...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hotel', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Club', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chair', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What bird was saved by Kharkiv office employees in October''15?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sparrow', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Peacock', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Woodcock', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nightingale', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the X-box situated in Kharkiv Office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HR room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in lobby 1st floor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5th floor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10th floor', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was Kyiv office of EPAM found?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '28 of November 2005', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '12 of December 2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 of November 2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '30 of September 2005', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which technology was the first one in Kyiv EPAM office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '.Net', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'WordPress', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'JavaSkript', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of Kyiv office director?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Yury', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arkadii', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Angelika', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mikhail', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many chinchillas live in Kyiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '0', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are the names of chinchillas who live in Kyiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hybris, Musya and Konyachka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mimimi, Piston and Sasha', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hybris, Nyanyanya and Mimimi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hybris, Piston and Poltergeist', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the USA situated in the office on Kudryashova, 14 (on what floor)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '7', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did SEC (Software Engineering Conference) take place in Kyiv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'in 2013 and 2015 years', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in 2012 and 2014 years', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in 2013 and 2014 years', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in 2011 and 2015 years', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did Canadian Ambassador visit EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2015', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which EPAM Ukraininan office the E-kids program started the very first time?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnitsa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the street where the first Kyiv office was opened?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Petlyury', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sagaidachnogo', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fizkultury', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kudryashova', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of EPAM Kyiv dancing group?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Dance Group', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poyushchiie Trusy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'E-Dance Group', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Best Girls', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did the Hackaton in Kyiv start for first time?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2012', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the main topic for  IT Week in Summer 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Focus on the cuctomer', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Orientation - North', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act as a Team', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Strive for excellence', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is pressed out on the first floor of the office on Kudryashova?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'bedbugs', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'oranges', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'grapes', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'chickens', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where were the children of Kyiv office employees taken in winter 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'to the shop', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'to the theatre', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'to the circus', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'to the pool', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM Poker League started?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2011', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2009', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What did EPAM win on «Davey Awards»?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'silver', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'gold', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'bronze', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'nothing', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the team which took the 2nd place at UA Wide Hackathon 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'CodeCrafters', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CodeNode', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'BigCommerceGuys', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'BtoB', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the main topic of the first IT Week?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Engineering excellence', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Focus on the Customer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act as the Team', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Strive for excellence', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was the very first guest of Morning Coffee Talk in Kyiv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arkadiy Dobkin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karl Robb', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mykhaylo Lazor', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the current projects is the oldest one in Kyiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'IPREO', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UBS', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ORACAL', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Barclays', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic3 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which sports team we don''t have in Kyiv office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'rugby', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'football', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'valley-ball', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'dance', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What language was designed in 1959 by CODASYL?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'COBOL', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ALGOL', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'C++', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of "the (grand)mother of COBOL"?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Grace Hopper', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ada Lovelace', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Margaret Thatcher', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alick Glennie', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was computer mouse invented by Douglas Engelbart?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1975', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1968', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1988', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who invented first portable computer in 1973?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Apple', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IBM', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microsoft', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fujitsu', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is one of programming languages named  after in XIX century?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ada Lovelace', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Herman Hollerith', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Galileo Galilei', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Isaac Newton', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was Google''s original name?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'DeepThought', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'LovelyWeb', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'DarkWeb', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'BackRub', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of video gaming brand created in 2001 and owned by Microsoft?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'PS4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Xbox', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'SNES', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sega Genesis', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Motorola derived its name from…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Jet Enginees', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Train Locomotives', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Record Players', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pager Radios', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which film first featured a completely computer-generated character?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Superman', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Spiderman', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Young Sherlock Holmes', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tron', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was first electronic book (by Michael S. Hart) created?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1971', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1952', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1999', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In the 1980s 3D glasses were marketed as a solution for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Insomnia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Obesity', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Depression', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Epilepsy', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What wildly successful game was programmed by one individual using Assembly Language?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Oblivion', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lion King', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Doom', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rollercoaster Tycoon', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first web browser invented?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1900', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1990', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1950', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What web browser debuted in 2004 and became a real rival to Internet Explorer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mozilla Firefox', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Opera', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Safari', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Google Chrome', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who developed the popular game Tetris while working for the Dorodnitsyn Computing Centre of the Soviet Academy of Science?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Konstantin Habensky', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alexey Pajitnov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Steve Jobs', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vadim Gerasimov', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does Microsoft stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Microcomputer Software', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microphone Software', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microanalysis Software', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microbiology Software', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the co-founder of Microsoft (together with Paul Allen)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Jim Lane', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Andrea Lewis', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Steve Wood', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bill Gates', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of virus first detected on ARPANET, in the early 1970s? It was an experimental self-replicating program written by Bob Thomas.');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sweety', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Surprise', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Creeper', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Diasaster', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What''s the longest time fo running a program?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '550 hours', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '180 hours', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '90 hours', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '310 hours', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does SPAM stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'SPiced HAM', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Special Peripherally Assisted Microprocessor',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'South Pole Area Manager', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sending People Annoying Mail', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is credited for originating the first smiley  in 1982?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Scott Fahlman', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Orlando Bloom', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kevin MacKenzie', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Robert Williams', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of one of the earliest arcade video games and the very first sports arcade video game, released in 1972?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'FIFA 72', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Solitaire', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fruit Ninja', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pong', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many characters are there in the longest domain name?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '97', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '63', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '55', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '34', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the inventor of the World Wide Web?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Jet Li', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lee Joon', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Timothy John Berners-Lee', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Timati', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What room of the University of Cambridge was the inspiration for the world''s first webcam?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'The Sparta room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Training room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dining room', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Trojan Room coffee pot', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the first social network?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Classmates.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Odnoklassniki.ru', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Facebook', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Friend Reunited', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What folder name is impossible to create in Windows?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Exe', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Con', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bat', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Xls', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What territory the domain .aq belongs to?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Anguilla', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Australia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Argentina', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Antarctica (stands for Antarctique)', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What’s the most popular screen resolution among Internet browsers?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1024 x 768', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1440x900', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1366 x 768', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1280 x 800', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What software is a pun in reference to Roman Emperor, who was best known for his association in the Great Fire of Rome?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'August Burning ROM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nero Burning ROM', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Aurelian', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Julius Nepos', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What official mascot was designed to represent a "software agent" of Java Technology?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Luke', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pinguin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Duke', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rabbit', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was Java''s original name?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Oak', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rose', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Walnut', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Birch', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The speed of a computer mouse is measured in…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Traps', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tails', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pixelruns', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mickeys', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which computer was the first to ship with a mouse?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Commodore 64', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Apple Lisa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IBM PS/2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Xerox 8010', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'MP3, the ubiquitous file type, stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'MuscorPia III', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MPEG Audio Layer III', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Music Portability V.3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Music compression Pass-3', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The name of the predecessor of HTTP protocol, appeared in 1970s.');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'FTP', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IMAP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'BGP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'XMPP', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What programming language developed by Microsft was released in 2000?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Basic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '.Net', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'C#', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cobol', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What computer did Steve Jobs introduce in 1984?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mac Pro', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MacBook Air', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'McDonalds', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Macintosh', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What virtual pet simulation game for people of all ages was developed in Japan in 1996?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Onigokko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tamagotchi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hanetsuki', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sudoku', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What great mountain was conquered by Ncell after establishing equipment for wireless Internet?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Everest', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alps', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Elbrus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'McKinley', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was one of the very first robots presented?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1953', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1928', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1970', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'OS computer abbreviation usually means…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Order of Significance', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Open Software', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Optical Sensor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Operating System', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'MOV extension usually refers to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Animation/movie file', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MS Office document', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Audio file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Image file', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is largely responsible for breaking the German Enigma codes, created a test that provided a foundation for artificial intelligence?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Charles Babbage', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'George Boole', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Jeff Bezos', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alan Turing', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who developed Yahoo?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Steve Case & Jeff Bezos', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'David Filo & Jerry Yang', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Leonardo Dicaprio', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dennis Ritchie & Ken Thompson', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The most common format for a home video recorder is VHS. VHS stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Voltage house standard', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Very high speed', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Video Home System', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Video horizontal standard', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'DB computer abbreviation usually means…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Driver Boot', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Data Block', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Database', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Double Byte', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'INI extension usually refers to ….');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Image Color Matching Profile file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'System file', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Image file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hypertext related file', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The sampling rate, (how many samples per second are stored) for a CD is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '44.1 kHz', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '22,050 Hz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '90.5 kHz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '67 kHz', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What do we call a network which elements may be separated by some distance? It usually involves two or more small networks and dedicated to high-speed telephone lines.');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'WAN (Wide Area Network)', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'World Wide Web', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'LAN (Local Area Network)', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'URL (Universal Resource Locator)', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who co-founded Hotmail in 1996 and then sold the company to Microsoft?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ada Byron Lovelace', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sabeer Bhatia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Britney Spears', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Elton John', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'TMP extension usually refers to...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Compressed Archive file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Image file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Audio file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Temporary file', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What do we call a collection of two or more computers that are located within a limited distance of each other and that are connected to each other directly or indirectly?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Inernet', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Interanet', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Local Area Network', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Wide Area Network', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What does AM mean?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Angelo marconi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Anno median', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Amperes', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Amplitude modulation', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'JPG extension usually refers to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'System file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Image file', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Animation/movie file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MS Encarta document', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the "@" chosen for the use in e-mail addresses?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1976', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1972', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1980', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1984', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the first ARPANET message?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"lo"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"hello world"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"mary had a little lamb"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"cyberspace, the final frontier"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'TXT extension refers usually to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Image file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Audio file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Text File', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Adobe Acrobat file', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are three types of lasers?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Gas, metal vapor, rock', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Gas, solid state, diode', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Gas, pork, ham', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pointer, diode, CD', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is a UPS used for in a building?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'To provide power to essential equipment',
       true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'To monitor building electricity use', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'To carry messages between departments', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'To control lighting and power systems', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many minutes (according to the original CD specifications) can a CD hold?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '56 mins', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '0 mins', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '150 mins', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '74 mins', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What do AC and DC stand for in the electrical field?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Alternating Current and Direct Current', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A Rock Band from Australia', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Average Current and Discharged Capacitor',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Atlantic City and District of Columbia',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'CD computer abbreviation usually means…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Command Description', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Change Data', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Copy Density', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Compact Disc', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who co-created the UNIX operating system in 1969 with Dennis Ritchie?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Bjarne Stroustrup', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Eminem', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ken Thompson', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bob Dylan', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'BAK extension usually refers to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Backup file', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Audio file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Animation/movie file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MS Encarta document', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the term to ask the computer to put information in order numerically or alphabetically?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Crop', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sort', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Report', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Record', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'BAT extension usually refers to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Compressed Archive file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Audio file', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'System file', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Image file', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Changing computer language of 1''s and 0''s to characters that a person can understand is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Highlight', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Clip art', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Execute', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Decode', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many bits are in a byte?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '16', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '32', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In what mode does computers calculate numbers ?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Binary', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Decimal', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Octal', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None of the above', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The speed of your net access is defined in terms of…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'RAM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MHz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kgs', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kbps', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The "desktop" of a computer refers to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'The area around the monitor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The top of the mouse pad', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The visible screen', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The inside of a folder', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these is a search engine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Google', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'FTP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Archie', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ARPANET', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which device can be used to store power?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Transistor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Capacitor', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Diode', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USB flash drive', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'Modem stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'Monetary Devaluation Exchange Mechanism',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Memory Demagnetization', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Modulator Demodulater', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Monetary Demarkation', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the difference between the Internet and an intranet?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'One is public, the other is private', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'One is safer than the other', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'One can be monitored, the other can''t',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None of the above', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In a Digital circuit, what is 1 ''AND'' 1?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '0', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '13', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Your computer has gradually slowed down. What''s the most likely reason?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Overheating', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Adware/spyware is infecting your PC', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tiredness', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'You dropped a sandwich in your computer',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the transistor invented?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1940s', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1950s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1960s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1980s', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'A dual-layer DVD is valued because it is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Can hold more data', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Creates alternative sound tracks', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Uses a second layer to offer a speed increase',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Contains a backup of the data stored', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which was an early mainframe computer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'MANIAC', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'NUTRIA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'BRAINIA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ENIAC', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Experts say the healthiest way to view a computer monitor is by…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Viewing from a darkened room', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Placing it 18 to 30 inches away from your eyes',
       true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Adjusting the screen for maximum contrast',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Using special glasses that filter out UV rays',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What do you call a computer on a network that requests files from another computer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A host', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A router', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A client', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A web server', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'RAM stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Random Access Memory', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Really Annoying Machine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Read A Manual', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Real Absolute Memory', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Hardware devices that are not part of the main computer system and are often added later to the system are called…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Clip art', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Highlight', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Execute', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Peripheral', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'On which of the following sites can you set up your email account?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Www.linux.org', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Www.hotmail.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Www.gre.org', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Www.syvum.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The main computer where the files are stored and can be sent to computers networked together is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'File server', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Clip art', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mother board', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Peripheral', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How can you catch a computer virus?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sending e-mail messages', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Using a laptop during the winter', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Opening e-mail attachments', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shopping online', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'A coating of dust on a computer''s main circuit boards has this probable consequence');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Short circuits', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Overheating', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Slower hard disk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is not an internet protocol?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HTTP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'FTP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'STP', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are the three main search expressions, or operators, recognized by Boolean logic?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'AND, OR, NOT', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'SEARCH, KEYWORD, TEXT', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'YES, NO, MAYBE', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'FROM, WHO, WHEN', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Another name for a computer chip is …');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Execute', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Micro chip', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microprocessor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chipsy chips', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these is not a computer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Aptiva', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Macintosh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Paseo', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Acorn', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following is not a programming language?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Basic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Turing', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'C#', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following is not a method of accessing the web?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'ISDN', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Modem', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'DSL', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CPU', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The "home page" of a web site is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'The first page', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The most colorful page', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The largest page', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The funniest page', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'ROM stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Royal Ontario Museum', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Read on Monday', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Read Only Memory', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Real Obsolute Memory', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'HTML is used to…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Plot complicated graphs', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Author webpages', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Translate one language into another', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Solve equations', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which decade was the telegraph invented?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1810s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1840s', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1870s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1890s', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What would you use for immediate, real-time communication with a friend?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'E-Mail', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Usenet', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A mailing list', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Instant Messenging', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What kind of data can you send by e-mail?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Audio', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pictures', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Video', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'All of the above', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Main circuit board in a computer is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Decoder', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Highlight', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mother board', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Select', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where are the contents of your computer''s hard drive indexed?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Yahoo!', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MSN', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Google', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None of the above', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'ISP stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Internet Survey Period', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Integrated Service Provider', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Internet Security Protocol', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Internet Service Provider', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'You hear a clatter from your computer, especially when you load a program or call up information. What''s going on?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'It''s infested with reindeer', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Your hard disk may be headed for failure',
       true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A loose wire is hitting the cooling fan',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A loud metallic clatter is normal', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which company created the most used networking software in the 1980''s?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Microsoft', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sun', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IBM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Novell', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following operating systems is produced by IBM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'OS-2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Windows', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'DOS', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UNIX', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is a GPU?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Grouped Processing Unit', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Graphics Processing Unit', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Graphical Performance Utility', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Graphical Portable Unit', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is the best search tool for finding Web sites that have been handpicked and recommended by someone else?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Subject directories', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Search engines', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Meta-search engines', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Discussion groups', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'ARPANET, the precursor to the Internet, was developed by whom?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'FAA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Department of Defence', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'NATO', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UART', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is a spider?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A computer virus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A program that catalogs Web sites', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A hacker who breaks into computer systems',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An application for viewing Web sites', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The abbreviation URL stands for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'User Regulation Law', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Unknown RAM Load', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Uniform Resource Locator', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ultimate RAM Locator', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the clock speed of the original IBM PC?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Less than 5 MHz', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10 MHz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8 MHz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Just over 16 MHz', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the debut of the first IBM Personal Computer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'August 12, 1981', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'January 21, 1979', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'August 21, 1957', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'January 12, 1982', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The first web server was built in:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1990 in Geneva, Switzerland', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1985 in Berkeley, California', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1988 in Cambridge, Massachusetts', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1947 in Berningham, UK', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following word processors came first?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'WordPerfect', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lotus Notes', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MS Word', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'WordStar', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does PPTP stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Point to Point Transmission Protocol', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Point to Point Transfer Protocol', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Point to Point Tunneling Protocol', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Point to Point Traffic Protocol', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'According to CNN, how much did Internet traffic increase between 1994 and 1996?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Two times', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Five times', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ten times', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Twenty-five times', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 1983, which person was the first to offer a definition of the term ''computer virus''?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'McAfee', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Smith', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cohen', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Norton', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is a MAC?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A Computer made by Apple', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Memory Address Corruption', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mediocre Apple Computer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Media Access Control', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'A program that neither replicates or copies itself, but does damage or compromises the security of the computer. Which ''Computer Virus'' it is?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Joke Program', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Worm', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trojan', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hoax', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Intel chip was the first to support a 32-bit bus architecture?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '486SI', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pentium', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '286', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '386DX', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does ECP stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Extended Capabilities Port', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Extra Compatible Part', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Extended Connection Port', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'External Cordless Peripheral', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The first graphical browser for the WWW was named:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Netscape', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Veronica', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mosaic', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Explorer', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these is a documented hoax virus?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'McDonalds screensaver', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alien.worm', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Merry Xmas', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kitty', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is a URL?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A computer software program', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A type of UFO', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'The address of a document or "page" on the World Wide Web',
       true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'An acronym for Uniform Resources Learning',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The Central Processing Unit is an embeded chip that acts as the ''brains'' of a computer. What Intel chip was used in the Altair (the first real personal computer)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '6502', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8080', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '6400', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8286', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is a NIC?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Netware Intranet Controller', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'No Internet Connection', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Network Interface Card', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Network Interference Control', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Word processing, spreadsheet, and photo-editing are examples of:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Application software', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'System software', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Operating system software', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Platform software', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'All of the following are examples of input devices EXCEPT a:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Scanner', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mouse', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Printer', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Keyboard', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'All of the following are examples of real security and privacy risks EXCEPT:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Viruses', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Identity theft', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hackers', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'SPAM', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'To move forward through the tabs');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'CTRL+TAB', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CTRL+SHIFT+TAB', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'SHIFT+TAB', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None of these', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Choose the smallest memory size');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kilobyte', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Megabyte', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Gigabyte', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Terabyte', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How is the ability to recover and read deleted or damaged files from a criminals computer called and is an example of a law enforcement specialty?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Simulation', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Animation', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Robotics', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Computer forensics', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does the Operating System manage?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Processes', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Memory', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Disks and I/O devices', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'All of the above', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How is allocation of a resources in a time dependent manner to several program simultaneously called?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Multi user', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Multi tasking', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Time sharing', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None of these', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How are the data that are accumulated and processed in group called?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Group processing', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Batch Processing', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Time sharing', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None of these', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following are true about firewalls?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Follows a set of rules', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Can be either a hardware or software device',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Filters network traffic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'All the above', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which decade did the first transatlantic radio broadcast occur?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1850s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1860s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1870s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1900s', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is a type of Electrically-Erasable Programmable Read-Only Memory?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Flash', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Flange', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fury', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'FRAM', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The most common format for a home video recorder is VHS. VHS stands for...?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Video Home System', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Very high speed', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Video horizontal standard', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Voltage house standard', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which year was MIDI(Musical Instrument Digital Interface) introduced?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1987', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1983', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2004', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'DNS refers to');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Data Number Sequence', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Digital Network Service', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Domain Name System', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Disk Numbering System', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How was the first mechanical computer designed by Charles Babbage called?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Abacus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Analytical Engine', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Calculator', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Processor', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is C?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A third generation high level language', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A machine language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An assembly language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'All of the above', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following is NOT operating system?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dos', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Unix', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Window NT', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What allows Blue tooth technology?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Satellite communication', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Wireless communication between equipments',
       true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Signal transmission on mobile phones only',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Landline phone to mobile phone communication',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The word length of a computer is measured in');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kilograms', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bytes', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Centimeters', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bits', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are the errors that can be pointed out by the compiler?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Syntax errors', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Internal errors', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Semantic errors', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Logical errors', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is considered to be The Father of Artificial Intelligence?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Elton John', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'John McCarthy', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Garry Potter', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Allen Newell', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'To select text by shading as you drag the mouse arrow over the text is known as..');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Clip art', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'To highlight', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'To fetch', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'To decode', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What''s a web browser?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A kind of spider', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A computer that stores WWW files', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A person who likes to look at websites',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A software program that allows you to access sites on the World Wide Web',
       true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who invented the first electonic digital computer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Konrad Zuse', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'John Mauchly', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bill Gates', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Blaise Pascal', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is an inventor of the first successful semaphore network?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Claude Chappe', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samuel Thomas von Sömmering', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pavel Schilling', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Napoléon', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When and by whom was the Internet invented?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Steve Jobs in 1989', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tim Berners-Lee in 1995', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mark Zuckerberg in 1990', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tim Berners-Lee in 1989', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What company created the first cell phone?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Motorola', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samsung', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nokia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Apple', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the year of the first artificial Earth satellite "Sputnik 1"?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1961', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1960', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1958', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1957', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How Alexander Graham Bell named telephone, invented by him?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"harmonic telegraph"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"bell''s phone"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"telephone"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"bell''s telegraph"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What company was the first which included computer mouse to its computer set?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Apple', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Xerox', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dell', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hewlett-Packard', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The prototype of which modern device Ezra Gilliland was created in 1881?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Computer mouse', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Touchpad', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Headphones', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Keyboard', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What did the first webcam show?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Trojan Room coffee pot', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trojan Horse', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trojan virus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trojan Room water cooler', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How much did the first Earth''s artifificial satellite weigh?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '84 kg', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '96 kg', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '115 kg', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '65 kg', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When do we commemorate the Cosmonautics day?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'September, 9', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'October, 4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'April, 12', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'June, 25', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the first space shuttle orbiter that could be launched and landed in fully automatic mode?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Challenger', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Buran', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Discovery', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Endeavour', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which programming languages were used to develop Buran''s (Soviet space shuttle orbiter) operating system?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'C++ and Assembler/370', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'C and Pascal', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Prolog and C', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Prol2 and Assembler/370', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How much time did it take Lunohod 1 to transfer 1 frame from Moon to Earth?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1/25 second', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 to 3 seconds', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '0,25 seconds', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3 to 20 seconds', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which laptops are certified to be used at the International Space Station?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lenovo ThinkPad', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dell Alienware', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sony Vaio', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MacBook Air', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many times is Ultra HD 4k number of pixels greater than in HD (720p)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '16', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '32', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does DVD stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Digital Video Disc', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Driven by Video Disc', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Digital Versatile Disc', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Data with Video Disc', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many gigabytes does the exabyte contain (1 kB = 1000 B)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1 thousand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 billion', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10 thousand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1000 billions', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the maximum value for int32?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '65535', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '32767', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2147483647', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '3141592653', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the last digit of PI?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Undefined', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which company developed S60 (platform for smartphones using Symbian OS)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Nokia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Apple', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Panasonic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samsung', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the first cell phone that had GPS module?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Siemens S10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nokia 3210', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Benefon ESC', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samsung G1', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first cell phone with touch screen developed?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2001', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1998', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2003', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1996', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which company developed the first phone with integrated camera?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Nokia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samsung', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Siemens', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sharp', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does NFC stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Near field communication', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near fone communication', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'No field communication', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Negative field conduction', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is a hexadecimal code for black?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '111111', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ffffff', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '000000', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '123456', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is a hexadecimal code for white?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '000000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ffffff', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '111111', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '191817', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does HTML stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Highest Text Markup Language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'HyperText Manipulation Language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'HyperText Messaging Language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'HyperText Markup Language', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does SQL stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sql Quering Language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sequel Quering Language', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Structured Query Language', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Structured Qtp Language', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was SQL developed?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1974', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1981', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1991', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1984', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which symbol is used in SQL when we want to select all columns from the table?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '^', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '*', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '$', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '%', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first video uploaded to YouTube?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2001', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2003', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call a computer program that transforms source code written in programming language (the source language) into another computer language (the target language)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Runtime', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Interpreter', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Compiler', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Virtual Machine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call a computer program that directly executes instructions written in a programming or scripting language, without previously compiling them into a machine language program?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Interpreter', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Compiler', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Runtime', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Virtual Machine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How much time in Jesse Liberty''s opinion is it needed to teach oneself C++?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3 months', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '25 days', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 month', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '21 days', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the Scrum Poker Technique first published?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1998', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2002', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2004', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does DOS stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Digital Operating System', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Disk Operating Source', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Disk Operating System', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Delivered Operating Source', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first software bug found?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1946', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1939', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1955', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1961', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call the process of finding and resolving bugs or defects that prevent correct operation of computer software or a system?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Compiling', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Interpreting', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Embedding', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Debugging', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first Play Station released in Europe?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1997', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1993', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1999', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'which of these Intel processors is the oldest one?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '80188', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '80486', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4004', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '4040', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the Hex value for Decimal 65536?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'FFFF', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'FFFFF', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10000', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which company developed Java language?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sun Microsystems', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microsoft', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Apple Macintosh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samsung', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was Java language first officially released?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1993', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1997', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1999', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What coffee brand is in Java language "cup with coffee" emblem?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Nescafe', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Starbucks', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lavazza', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is Java language creator''s name?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dennis Ritchie', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kenneth Tompson', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'James Gosling', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bill Gates', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is C language creator''s name?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dennis Ritchie', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kenneth Tompson', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'James Gosling', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bill Gates', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first Mac PC released?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1990', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1985', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1980', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does CPU stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Chip for Processing User information', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Concrete Personal Unit', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Central Processing Unit', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Central Intelligence Agency', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic2 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does FIFO acronym stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'Federation of International F# Obsessed',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'First In Last Out', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Fédération internationale de football association',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'First In First Out', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM founded?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1990', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1993', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1999', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What level of CMMI Maturity do we have at EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2014 EPAM obtained Jointech and as a result we broaded our activity in..');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'China', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Malaysia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many employees do we have all over the world?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '14000+', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10000+', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '15000+', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5000+', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many countries is EPAM represented in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '20', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '25', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '15', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '17', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many continents does EPAM operate on?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '6', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where has EPAM got the biggest number of engineers?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Russia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Belarus', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukraine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is EPAM''s head office located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Minsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Newtown', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'New York', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the smallest location at EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Netherlands', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Austria', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mexico', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ireland', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did EPAM make initial public offering (IPO) at New York Stock Exchange?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2012', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did EPAM start operating at European market (acquisition of Fathom Technology)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2004', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Poland?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Russia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '9', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Belarus?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '6', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Hungary?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in the UK?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in China?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Kazakhstan?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Canada?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many city locations does EPAM have in Mexico?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM established in Mexico?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2015', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1998', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM established in Poland?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2011', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM established in China?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2013', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM established in Hungary?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2004', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1996', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did EPAM obtain Empathy Lab in the USA?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2012', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2011', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2012 EPAM obtained Empathy Lab with the specialization in solutions for…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Banks', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hospitals', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'E-Commerce &Digital Media', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mobile', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did EPAM acquire Thoughtcorp in Canada?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM was named #6 on Forbes'' List of America''s 25 Fastest-Growing Tech Companies in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2013', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM was named # 3 out of 100 companies on the Forbes’ list of America’s Best Small Companies in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2012', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM established in Bulgaria?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2015', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2011', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where did EPAM open its first development center in Eastern Europe?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hungary', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Canada', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Belarus', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukraine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM started with offices in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'USA and Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA and Belarus', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA and Russia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hungary and Ukraine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM established in Kazakhstan?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2008', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2012', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where doesn''t EPAM Training Centre operate?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Belarus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kazakhstan', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Netherlands', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did EPAM Training Centre (ex "Higher School of Programming") become an internal department of EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2006', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM was named as the Best Employer in 2010, 2011 and 2012 in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Belarus', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poland', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UK', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM was named as the Best Employer in 2014 in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Russia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukraine', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hungary', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sweden', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Number of EPAM employees in 2012 became:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '8000+', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '15000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Number of EPAM employees in 2011 became:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '7000+', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '4000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '15000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Number of EPAM employees in 2013 became:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '9000+', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '12000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '6000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in China:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Huaibei', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chizhou', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shenzhen', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tongling', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Mexico:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Puebla', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Guadalajara', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chihuahua', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zapopan', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Canada:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Toronto', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Montreal', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vancouver', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Edmonton', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Kazakhstan:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Almaty', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyzylorda', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Balqash', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karaganda', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Poland:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Katowice', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Warsawa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Krakow', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poznan', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in USA:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Newtown', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fresno', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Omaha', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Greensboro', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in UK:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'London', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Birmingham', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oxford', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Liverpool', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has office in Sweden:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Arvika', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Flen', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Boden', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Stockholm', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has office in Netherlands:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Assen', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Franeker', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kessel', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Amsterdan', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Germany:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hamburg', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Berlin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Frankfurt', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bonn', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Hungary:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Budapest', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sopron', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Miskolc', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nagykanizsa', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has office in Switzerland:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Zurich', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lausanne', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bern', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Winterthur', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Ukraine:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsya', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivano-Frankivsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zhytomyr', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Odessa', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Russia:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Omsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Novosibirsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chelyabinsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Saratov', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Belarus:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Salihorsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Barysaw', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Uzda', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brest', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the city where EPAM has one of the offices in Armenia:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Abovyan', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kapan', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vanadzor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yerevan', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which EPAM location has the most convenient connection to Caribbean islands?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mexico', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'China', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Australia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukraine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM Chief Executive Officer is:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Arkadiy Dobkin', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karl Robb', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Viktar Dvorkin', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM in Latin America is represented in:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Venezuela', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mexico', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brazil', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Panama', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM in Asia-Pacific Region is represented in:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'China', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Thailand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Japan', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'South Korea', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'EPAM in North America is represented in:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'USA', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Denmark', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alaska', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Panama', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In November 2015 EPAM acquired "Alliance Global Services" with offices in the USA and...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'India', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vietnam', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nepal', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Thailand', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest client of EPAM in banking sphere?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'UBS', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Сбербанк России', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Приват Банк', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ING', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest (#of employees) EPAM office in Ukraine?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest (#of employees) EPAM office in Belarus?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Brest', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Gomel', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Minsk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mogilev', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest (#of employees) EPAM office in Russia?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Saint-Petersburg', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moscow', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Samara', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Saratov', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which item is not one of EPAM values''?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Eat&Sleep', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act as a Team', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Strive for Excellence', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Focus on Customer', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest (#of employees) EPAM office in Kazakhstan?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Karaganda', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Astana', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Atyrau', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Almaty ', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where was the first SEC conducted?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Minsk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Washington', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'London', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first SEC conducted?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2013', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many times has EPAM SEC been already conducted?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '6', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which EPAM Value was targeted during the last SEC in Kyiv in Summer 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Focus on the Customer', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act with Integrity', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Value the Individual', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Strive for Excellence', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these cities did not host EPAM SEC yet?:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Minsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Budapest', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moscow', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the Head of North American Delivery Organization:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Anton Tomchenko', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sergey Yezhkov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav Tomilchik', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Anthony Conte', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the Chief Financial Officer of EPAM (CFO):');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Anthony Conte', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sergey Yezhkov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav Tomilchik', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arseny Gorokh', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the Chief Marketing Officer (CMO):');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Elaina Shekhter', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Neeladri Roy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav Tomilchik', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mariette Kouwenberg-Mooney', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The biggest global customer of EPAM (by number of employees involved) is:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'UBS', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Canadian Tire Corporation (CTC)', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Thomson Reuters', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Google', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the company which was acquired by EPAM in 2007 and EPAM Lviv was established on its'' basis');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Spline', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'B2Bits', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Empathy Lab', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Google', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2014 EPAM acquired US company "GGA Software Services" which specializes in solutions for:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Healthcare', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'E-Commerce &Digital Media', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Banks', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mobile', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2004 year EPAM acquired Fathom Technology and started operating in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Europe', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'North America', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'APAC', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Africa', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2004 EPAM acquired a company and started operating in Europe, name this company.');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Empathy Lab', false),
      (random_uuid(), (SELECT randId from temp_session_variables), ' Fathom Technology', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Great Fridays', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'VDI', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2004 year EPAM acquired Fathom Technology and started operating in...');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hungary', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poland', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Panama', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was EPAM Russia fonded by acquisition of VDI?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2006', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2001', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which are not EPAM''s personality characteristics?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Creative', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Driven', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Expert', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dull', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is EPAM''s value proposition?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Results. Relentlessly.', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Delivering Excellence in Software Engineering',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Being the Best IT Company', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Stay Calm as you are in EPAM', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did EPAM upgraded its logo?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2015', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM has not upgraded the logo', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where can you find EPAM brand guidelines?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'elements.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'grow.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'learn.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'info.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does ASMT stand for in EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'American Society for Testing and Materials',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'It means nothing', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Unified Assesment', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'American Standard  Test Methods', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does UPSA stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'Utilization and Project Staffing Analyzer',
       true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukrainian Police and Service Army', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'University of Pensilvanniya and South Africa',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UPS, I did it Again', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does PMC stand for in EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Pilot Management Center', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pre-mature consolidation', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Project Management Center', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pulse Code Modulation', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is not EPAM''s Pillar?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Developers'' Developer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fearless Problem Solvers', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Committed Partners', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Great Guys', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is EPAM''s brand personality?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Driven', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fun', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Independent', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Friendly', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is EPAM''s brand personality?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Healthy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Candid', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Thorough', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fast', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is EPAM''s brand personality?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kind', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Caring', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Intelligent', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Loving', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is EPAM''s brand personality?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Contemporary', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Stylish', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fashionable', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Original', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is EPAM''s brand personality?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Creative', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sophisticated', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Calm', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moderate', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is EPAM''s brand personality?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Amateur', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Expert', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Researcher', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Specialist', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is not EPAM''s core competency?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Digital Engagement', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Intelligent Enterprise', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Advanced Technology', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hollywood Filming', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is not EPAM''s core set of industries?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Financial Services', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Retail&Distribution', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Travel&Hospitality', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Home Appliances', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic5 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is not EPAM''s core set of industries?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Media&Entertainment', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Life Sciences&Healthcare', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Software&Hi-Tech', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sports Professional Appliances', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was the speaker of the first Morning Coffee Talk in Kyiv in Spring 2013?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sam Rehman', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karl Robb', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arkadiy Dobkin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who became the best business analyst of the year  from UA EPAMers (UKRAINIAN IT AWARDS, 2014)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Roman Sakharov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mariia Iermolenko', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which prize did the winner of UA WIde Referral Campaign in 2014 get?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Trip to October Fest in Germany', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trip to USA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trip to Ferrari Show in Dubai', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trip around UA offices', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which country ambassador visited EPAM Kyiv office in autumn 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Belarus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Canada', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'USA', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poland', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first UA Wide Hackathon  held?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'In 2012', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In 2013', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In 2014', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In 2010', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of UA project contest, aimed to make EPAM even better?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"Make EPAM better''', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"EPAM for EPAMers"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"MyEPAM Project"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Sweet EPAM"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call EPAM charity fair where EPAMers sell their baking and hand-made things?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"Sweet EPAM"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"EPAM Charity Fair"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Kind EPAM"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"EPAM Sweets"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many EPAMers work in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2000-3000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3000-4000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4000-5000', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '5000-6000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What place did EPAM take in the Best IT Employers rating in 2014 (according to dou.ua)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM wasn''t in this rating', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call the week of IT presentations, workshops and master classes, held in EPAM Ukraine since 2013?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '7 days of IT', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IT in 7 days', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IT Week', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Engineering Week', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In 2015 EPAM was as a title sponsor of the big UA Java conference three times. Which conference are they?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Devoxx', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'JavaDay', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'JavaOne', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'JavaWorld', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the project, where volunteers teach EPAMers kids to program?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'EPAM Kids', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IT Kids', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IT for Kids', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM E-kids', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What project won UA Wide Hackathon 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"Interviewer"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Jobolizer"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Depo"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"QR Booking"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the topic of SEC Summer 2015, which was held in Kyiv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Advanced Technology', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Focus on the customer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Digital Engagement', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'PDS 2.0', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these statements is NOT EPAM''s value?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Value the Individual', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act with Integrity', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act as a Team', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Act as an Individual', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How much money was donated within UA YAMMER CHARITY AUCTION in summer 2015 (choose the closest variant)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '15 000 UAH', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '65000 UAH', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '85000 UAH', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '30 000 UAH', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the topic of IT Week Summer 2015 which was held in all UA offices?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Core Engineering', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Digital Engagement', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Focus on the customer', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Value the Individual', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What place (based on EPAMers number) does Ukraine have among other EPAM locations?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many EPAMers worked for EPAM Ukraine in 2005?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '40-50', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '20-30', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '200-300', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '500-1000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the year of EPAM Ukraine foundation?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2004', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2010', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2005', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2006', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What training, leaded by Chris Englund''s and Brent N. Cann, English Teachers from Hungary, was held twice in Kyiv and once in Kharkiv and Lviv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Soft Skills Training', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Leadership Training', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Public Speaking Training', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'English Intensive Training', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many cities does EPAM Ukraine have offices in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '6', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these UA cities EPAM does NOT have office in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Odessa', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What Ukrainian magazine did rank EPAM as one of the TOP-200 biggest UA companies?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Forbes', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Correspondent', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ukrainian Week', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cosmopolitan', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the author of idea to open EPAM office in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karl Robb', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arkadiy Dobkin', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call the portal for EPAM Ukraine social communities?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Have fun with EPAM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fun. Drive. EPAM', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Feel the drive of EPAM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fun. Joy. EPAM', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the topic of IT Week 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Let''s Drive PDS 2.0', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Focus on the customer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Intelligent Enterprise', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'PDS 2.0', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'One of UA EPAMers is a leader of global EPAM Java Competency Center. Who is he/she?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Andrii Rodionov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Roman Shramkov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lyudmila Shatko', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'There is no leader of Java CC in Ukraine',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who of UA EPAMers leads external Java User Group community?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Roman Shramkov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Andrii Rodionov', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'There is no leader of JUG among UA EPAMers',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest EPAM UA location?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How do we call global EPAM conference, which takes place in the capital of Ukraine twice a year?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Core Engineering Conference', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Software Engineering Conference', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Engineering Conference', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Global EPAM Conference', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many summer IT Weeks were held in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '0', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Head of Ukraine Global Delivery Organization?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Roman Shramkov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Viktar Dvorkin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karl Robb', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many projects were created within UA Wide Hackathon 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '15', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '17', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What concept of event was created in EPAM Ukraine and spreaded on global level?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'SEC', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'IT Week', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sweet EPAM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Charity Spring Week', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these UA info.epam.com blogs do NOT exist?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'CDP Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Travel Department Ukraine', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'RD Ukraine', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did Yury Antaniuk join EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2005', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2007', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2009', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these departments do NOT exist in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Travel Department', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Resourse Development Department', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Language Training Department', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vacation Department', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How much money did EPAM Ukraine donate for charity in 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'UAH 100-200 grand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UAH 300-400 grand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'UAH 500-600 grand', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'More than UAH 750 grand', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who has been working for the EPAM UA  since its foundation?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Olesia Kyrylchuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these projects were NOT among winners of MyEPAM Project 2014?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Secure Bicycle Shelte', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Secret of Success', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bring Your Pet to the Office', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Design of the office', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How does SEC abbreviation decrypt?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Software Engineering Conference', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Super Engineering Conference', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Single Edge Contact', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Smart Engineering Conference', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which city was EPAM UA first office open?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which UA office is the newest (opened in 2008)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of these groups for students exist in EPAM UA Resourse Development Department?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'DevOps', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'BigData', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Design', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Agile', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the biggest financial project in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'UBS', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Barclays', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Citi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oschadbank', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the first .NET commercial project that EPAM Ukraine got in 2006?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'IPREO', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Microsoft', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'MSB', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'DHL', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the leader of Agile and BA communities in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Andrii Rodionov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Roman Shramkov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Roman Sakharov', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who prepares the computer equipment to EPAM employees in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Help Desk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'LocalIT', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Security', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'PE Department', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is Senior Director of EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Taras Radzylovskyy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Darth Vader', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Olga Chebotar', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who took part in the process of opening EPAM Ukraine office in 2005?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Oleksandr Chernyshov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alexander Vitishchenko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antaniuk', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which color isn''t corporate EPAM color?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Blue', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Green', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Braun', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Grafite', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Canadian Tire Corporation works in the following industry:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Banking', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Retail', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Media', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Automotive', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Time traking system in EPAM is:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'OSM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'CTC', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'VTS', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'PMC', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the middle name of Yury Antaniuk?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Petrovych', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Markovych', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Konstyantinovych', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oleksandrovych', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is Yury Antaniuk''s job position?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'HR Business Partner', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Senior Testing Automation Engineer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Senior Director', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Delivery Manager', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is printed on the back side of EPAM T-shirt that is given to newcomer?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Result. Relentlessly.', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Life is life', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'EPAM is cool', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Keep calm and love EPAM', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the present for the end of probation period in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Cup', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Glass', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pen', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'T-shirt', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the eligibility criteria to get EPAM branded rucksack?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5 years of work', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10 days of work', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '50 months of work', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3 years of work', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many additional vacation days will you get after after 5 years of work in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2 days', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '3 days', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 day', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which portal doesn''t exist in EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'asmt.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'support.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'pro.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'info.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is HR Director in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Olga Chebotar', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Olesia Kyrylchuk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Anton Filkevych', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is Olga Chebotar in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Finance Officer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Administrative Manager', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'General Director', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chief Personnel Officer', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is Manager of CDP Department in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Margaryta Ivanova', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iryna Marushkina', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Natalia Ostashko', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mariia Karanda', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is Language Training Team Lead in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Olena Durasova', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alejandro Jimenez-Quintero', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Liliia Boiko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Robert Mckenzie', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many floors are there in a headoffice of EPAM Ukraine at K14?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '9', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which zone is located on the 9th floor at K14 office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Working area', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'General Director Office', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cafeteria', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Relax Zone', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of chinchilla at K14 office?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hybris', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mafin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Scriptik', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tomato', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When employee can get enrolled to health insurance scheme in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'after probation period', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'after three years', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'after first day', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'what is health insurance?', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of life events is not financially supported by EPAM Ukraine ?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Relocation', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Wedding', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Child Birth', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pet birth', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What present does EPAM Ukraine give to the newcomer on his first working day?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Knife', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fork', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Plate', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cup', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the main idea of hero.epam.com portal?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'submit referral', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'find a flat', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'recognize colleague for achievement', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'find colleague''s phone number', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'On which portal can you recommend your friend to work in EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'hero.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'friend.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'work.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'invite.epam.com', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What application is the most common for business communication and sharing presentationsin EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Skype', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ICQ', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Skype for Business', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Viber', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many regular vacation days do you have per year in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '18', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '16', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'No days', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What types of benefits doesn''t exist in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Discounts', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Health Insurance', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Life Event bonuses', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Freepass to subway system', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which dresscode is more proper to wear at EPAM?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Business Casual', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'White tie', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Black tie', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cocktail', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many values are in EPAM''s brandbook?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'ten', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'five', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'zero', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'three', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are the working hours in EPAM Ukraine offices?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '24/7', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '9 AM - 6 PM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10 AM - 10 PM', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1 day per week', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which technology stack is the most occupied in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Python', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'PHP', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Java', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'C++', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which EPAM portal is not targetted for professional development?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'ctc.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'learn.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'grow.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'library.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How much does EPAM Ukraine usually compensate for succesful passing of professional certification?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '100%', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10%', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '30%', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '50%', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What holiday is celebrated in EPAM Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'New Year', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Columbus Day', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Holi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Fajas', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which portal is used for newcomers onboarding?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'grow.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'compensation.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'adaptation.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'ctc.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Head of EPAM Mexico?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Iaroslav German', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yury Antatiuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Martin Asencio', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dmytro Berezianskyi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where did EPAM open itsoffice in December 2015?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Amsterdam', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Prague', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'London', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many symbols does EPAM password should contain as minimum?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '8', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '9', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '5', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which portal is used for performance feedbacks provision?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'asmt.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'feedback.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'facebook.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'pmc.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which portal is used for employee''s assessment?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'asmt.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'feedback.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'facebook.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'pmc.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where can you get information who your HR Business Partner is?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'facebook', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Linkedin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'vkontakte', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'upsa.epam.com', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How to change your profile picture in UPSA?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'write a post in Yammer', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'write a post in twitter', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'change your photo in facebook', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'change your photo in e3s.epam.com', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is a single point of smart search in multiple EPAM''s systems?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'info.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'search.epam.com', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'pal.epam.com', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'google.epam.com', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does QMS stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Query Mouse System', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Quick Management Setup', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Quality Management System', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Quick Monitor Standard', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic4 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does CMMI stand for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Capability Maturity Model Integration', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Collaboration Management Mask Institute',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Cooperation Maturity Matters Institute',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cool Messy Management Integration', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What ''sweet'' district do we have in Vinnytsia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Cherry', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Honey', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Strawberry', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Raspberry', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What name of the area is not presented in Vinnytsia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Warsaw', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Paris', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'New York', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cherry', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How can you take an excursion around the town in Vinnytsia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'By horses', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'By parachute', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'By locomotive', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'By double-decker bus', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The main street in Vinnytsia where all administrative instutions situated is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Freedom Street', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'National Street', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Independence Street', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Soborna Street', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the name of the city before Independence of Ukraine (1991)?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsiagrad', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsiadar', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnyslav', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which  historic region does Vinnytsia belong to?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Podillia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Halychyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tavriia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Donbas', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'With what foreign country does Vinnytsia region  border on?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Poland', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Russia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Slovenia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moldova', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of airport placed near Vinnytsia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Heathrow', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Boryspil', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Havryshivka', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zhulyany', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of world famous boxer, intercontinental box champion (WBA) in middleweight who is from Vinnytsia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vyacheslav Uzelkov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Volodymyr Klychko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oleksandr Spyrko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Andrii Fedchuk', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How is  Vinnytsia water tower, built by Artynov architect, used now?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'As a water tower', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'As a shelter', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'As a memorial museum of Afganistan', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'As a souvenir shop', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When Ukraine became an independent state?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1992', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1991', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1990', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1989', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are the state symbols of Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'willow, poplar, viburnum', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'flag, emblem, anthem', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'territory of Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'salo, borshch, horilka', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Ukraine joined the Council of Europe in…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1992', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1993', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2001', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The Constitution of Ukraine was adopted in');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'May-95', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Jun-96', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mar-98', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Jul-98', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did Ukraine switch to the 12-point evaluation system in schools?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2001', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2002', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2003', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was a President of Ukraine in 2005?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'V. Yanukovych', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'O. Moroz', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'L. Kuchma', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'V. Yushchenko', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What currency notes served as of monetary means in Ukraine in 1992-1996?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'hryvnia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'coupon-karbovanets of multiple use', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'dollars', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'rubles', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the Constitutional Court created in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1990', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1991', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1996', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1998', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the most important sign of the power in the Cossack Army?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'mace', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'musket', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'saber', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'signet', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is used to decorate the head of Ukrainian girls?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Wreath', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kokoshnik', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Helmet', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Wig', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the Commander in Chief of Ukrainian Army?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'President of Ukraine ', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vice President of Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Prime Minister', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Supreme Judge', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which politician is depicted in 2 Ukrainian hryvnia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Mazepa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav Mudryy', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bohdan Khmelnytsky', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mykhailo Hrushevsky', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the highest peak of the Carpathians?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Roman-Kosh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Smotrych', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Goverla', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Petros', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The largest Holodomor in Ukraine occurred in…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1932 – 1933', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1933 – 1934', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1934 – 1935', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1935 – 1936', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The territory of Ukraine was completely liberated from German - fascist invaders in….');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Oct-43', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oct-44', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'May-45', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Jun-44', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The explosion at Chernobyl occurred…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '6-Apr-86', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '16-Apr-86', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '26-Apr-86', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '26-Jun-86', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'President of Ukraine is elected for….');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Four years', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Five years', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Seven years', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The whole life', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What kind of train was delivered to Ukraine in 2012?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'The Polar Express', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hogwarts Express', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Thomas The Train', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Inter City+', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many counrties does Ukraine border on?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '5', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is the founder of Ukraine theatre?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'K. Stanyslavskyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'B. Stupka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'I. Karpenko-Karyi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'L. Poderevianskyi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The first president of independent Ukraine is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kravchuk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Khrushchev', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brezhnev', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kuchma', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Halychyna became a part of Ukraine in…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1941', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1917', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1939', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1954', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of famous Ukrainian fighter of XIX century…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Usyk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Virastiuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Klychko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poddubnui', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is World All Around champion of 1995 and Olympic All Around champion 1996 in gymnastics?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Klychko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bubka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Podkopayeva', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bessonova', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The biggest Ukrainian diaspora is in …');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mexico', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Canada', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Germany', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Great Britain', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was the winner of Eurovision from Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ruslana', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Verka Serduchka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ani Lorak', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Svitlana Loboda', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the national Christmas dish for Ukrainians?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Banosh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Turkey', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kutia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Varenyky', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       ' What religion is obligatory in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Christianity', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'None', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Buddhism', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Islam', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What level of education, according to the Constitution of Ukraine, is mandatory?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Primary education', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nursery education', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Secondary education', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Higher education', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The main document of Ukrainian citizen is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Diploma', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'License', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Passport', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Birth certificate', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many regions (oblast) are there in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '32', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '21', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '18', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '24', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The main Law of Ukraine is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Constitution', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Law of the jungle', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Law of Thermodynamics', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Murphy''s Laws', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The minimum age of marriage for women in Ukraine is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '16', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '18', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '21', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '14', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When do we celebrate Constitution Day of Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4-May', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '24-Aug', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '28-Jun', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '14-Oct', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The minimum age of marriage for men in Ukraine is…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '17', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '16', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '21', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '18', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The deepest lake in Ukraine is …');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Svityaz', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Synevir', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yalpug', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shelekhivske lake', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first written book published in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'VII century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'XVI century', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'X century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'XI century', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Ukraine is extremely rich in…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Money', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Power', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Glory', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sulfur', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'One of the most visited McDonalds in the world is situated in…');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Odesa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zhytomyr', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which kind of transport was invented in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Bus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Electric tram', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Plane', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bike', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the first capital of Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Odesa', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of island situated on Zaporizhian Sich?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Festivalnyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kryt', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Khortytsia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ostriv Zmiinyi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The biggest cargo plane in the world designed by Ukrainian engineer is….');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'An - 2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An-225', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A - 124', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'KLM', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was the author of the first Constitution of Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Pylyp Orlyk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mykhailo Grushevskyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Leonid Kravchuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Leonid Kuchma', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the first Ukrainian Constitution written?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1710', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1700', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1991', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1801', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who baptized Kyiv Rus?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Prince Volodymyr', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brothers Kyi, Schek, Horyv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Princess Olga', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav the Wise', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which city has the highest amount of cafes per capita in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Odessa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chernivtsi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the University of St. Vladimir opened in Kyiv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1900', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1834', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1870', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2001', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the Ukrainian Central Rada established?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1917', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1920', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1890', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1900', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What does the word "Cossack" mean?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Happy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Free', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Warrior', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An armed man', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which famous Ukrainian dance was born in Zaporizhia in the  Cossack`s times?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Tango', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hopak', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Podolianochka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Hip Hop', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the name of the capital of the Cossacks'' lands?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trypillia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zaporizhia Sich', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zabuzzhia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the color of the Zaporizhia Sich`s flag? ');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Red', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Blue', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yellow', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Green', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where was Hetman B. Khmelnitsky`s  residence  located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'In Chyhyryn', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Zaporizzhia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What did the word "Seagull" mean to Cossacks?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Bird', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Boat', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Woman', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cossaks` game', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What kind of Ukrainian clothes were regarded as "wide as Black Sea"?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sharovary', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Svytky', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shirts', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Capes', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The first cossaсks'' fortress was built on the island of:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Zadniprovski porogy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Velyka Khortytsia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mala Khortytsia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zaporizhskyi riv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When were Ukrainian cossacks first mentioned?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), ' XIV century', true),
      (random_uuid(), (SELECT randId from temp_session_variables), ' XVII century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1800', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1200', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Name the hetman who got his nick name because of an amazing strength');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Pidkova', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pavlo Polubotok', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Sirko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Mazepa', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the name ''Ukraine'' first mentioned');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'in Ipatiivsky chronicle in 1187', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in chronicle of Nestor', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in ''The Lay of Igor''s Raid''', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in ''Lections of Volodymyr Monomah', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the least used letter in Ukrainian Alphabet?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"Ф"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"О"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Ц"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Ю"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are the names of the most ancient sculptures found in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kamianyi did', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kamiana baba', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Didukh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vertep', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the most used letter in Ukrainian Alphabet that majority of words start with?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"П"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"А"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Г"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Х"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is the oldest Greek bridge in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'in Feodosiia', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in Kamianets-Podilskyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in Vinnytsia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who of Yaroslav Mudryi''s daughters became the wife of the French king Henry I?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Anna', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ielizaveta', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Anastasia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Maria', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How are the largest male monasteries called?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lavra', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ostrog', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'School', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chapel', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the oldest higher educational establishment in Eastern Europe?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv-Mohyla Academy', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shevchenko University', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv Polytechnics', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav Mudriy Academy', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which city was the first gas lamp invented in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnytsia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kiyv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many cities worldwide have monuments to Taras Shevchenko?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1200', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '150', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '600', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '55', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which subway station, situated in Ukraine, is the deepest in the world?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"Arsenalna" in Kyiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Zoloti Vorota" in Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Studentska" in Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Akademika Pavlova" in Kharkiv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the longest wind musical instrument in the world?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sopilka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Trembita', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Domra', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tsimbali', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the shortest main street among all the capitals in the world?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Broadway', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Champs Elysees', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Khreshchatyk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pensylvannia Avenue', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where in Ukraine is the geographical centre of Europe located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'In Rakhiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Uzhhorod', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in Kiyv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the oldest tree in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'The Josephine oak in Rivne region', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Linden in Andriyivskyy Descent', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The pine in Holosiyivskyy Forest', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The willow in Chernihiv region', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Pablo Picasso was fond of the works of the Ukrainian female artist . Who was that artist?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Katerina Bilokur', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Viktorzhevska Zinayida', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Prymachenko Mariya', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yablonska Tetiana', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where in Ukraine is it possible  to hear the phenomenon which rarely occurs in the world - the singing sands');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Near Nikopol', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near Lviv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near Vinnytsia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near Kharkiv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'One of the biggest deserts in Europe is situated in Ukraine and called Oleshkivska. Where is it located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'In Tsuriupinsk area (Kherson region)', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near Uzhhorod', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Polissia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Near Vinnitsia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In what year did the monetary reform started in Ukraine: karbovanets was replaced with hryvnya');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1996', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1854', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1936', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How  was the legal code of Kyivan Rus called?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ruska Pravda', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Testament of Volodymyr Monomakh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Tale of Igor''s Campaign', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The Bible', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When and where did the first car appear on the territory of modern Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'in 1891 in Odesa', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in 1800 in Kherson', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in 1950 in Kiyv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'in 1930 in Kharkiv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who were the creators of the Ukrainian national anthem?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Pavlo Chubynsky and Mykhailo Verbytsky', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Hnat Khotkevych and Anatoliy Kos-Anatolskyy',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Panteleimon Kulish and Hryhoriy Veryovka',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Boris Lyatoshinsky and Ivan Karabyts', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Ukrainian city has both monuments to Leopold von Sacher-Masoch and Pablo Picasso?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vinnitsia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the name of a Volyn princess that commanded the army of 6 thousand warriors in XVII century?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sophia Ruzhinska', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Princess Olga', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Anna Yaroslavna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Oleksandra Branytska', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who signed as "Ukrainian" when staying at the German hotels?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ievgen Grebinka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Kotlyarevskiy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mykola Gogol', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Franko', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When independent Ukraine started to celebrate Christmas officially as national holiday?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1991', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1996', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the oldest street of Kyiv, which is over a thousand years?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Volodymyrska street', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Khreschatyk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Triohsvyatytelska street', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Desyatynna street', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the most beautiful metro station in Kyiv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Golden Gate', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arsenalna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Khreschatyk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Teatralna', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did the production of  Kyivsky cake start?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1980', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1956', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1900', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1850', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where do Hutsuls live?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'In Verkhovyna', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Alps', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Pirineus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'In Andes', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What''s  the name of the first book publisher in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Fedorov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nestor the Chronicler', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yaroslav  the Wise', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Grozny', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which fact is related to trypillia culture in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'embalming the dead', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'pottery manufacturing', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'cattle breeding was the basis of the economy',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'bellicose tribes', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who is considered to be the father of Ukrainian literature?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'I. Vyshnevsky', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'G. Skovoroda', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'I. Kotlyarevsky', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'F. Hryhorovych', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which city was the centre of Eastern Galicia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chernivtsi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zheshuv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kraków', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Ukrainian lands were part of the Austrian Empire?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'Eastern Galicia, Bukovyna, Transcarpathia',
       true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Galicia, Bukovyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bukovyna, Bessarabia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Galicia, Volyn, Podillia', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The most translated Ukrainian literary work is');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Testament, T.Shevchenko', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Eneida, I.Kotliarevskyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nymph, Lesia Ukrainka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bricklayers, I.Franko', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the most ancient city in Ukraine among the remaining?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Khotyn', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zolochiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chernihiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Uzhhorod', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where was the world''s only underwater river discovered ?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Baltic Sea', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Caspian Sea', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sea of Azov', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Black Sea', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Senior Chief among all the Cossacks is');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hetman', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Chieftain', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Koshoviy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Khorunzhiy', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The painter who helped to buy Shevchenko out of slavery');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Karl Briulov', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Illya Riepin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Shyshkin', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivan Aivazovskyi', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The author of the novel "Eneyida"');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kotliarevskyi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nechui-Levytskyi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shevchenko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kvitka-Osnovianenko', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The village where Taras Shevchenko was born');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Moryntsi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Subotiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Luka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Drohobych', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which city does so called "metrotram" operate?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Volnovakha', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kryvyi Rig', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mukachevo', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Ukraine is often referred to by which nickname?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'The golden vale of Europe', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The basket case of Europe', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The bread basket of Europe', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The cabbage patch of Europe', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which famous George Gerswhin composition is said to have been inspired by a Ukrainian lullaby?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '"Rhapsody in Blue"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Summertime"', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '"Someone to Watch over Me"', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '"I Got Rhythm"', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the isthmus that separates Crimea from mainland Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kra Isthmus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Auckland Isthmus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Isthmus of Perekop', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Karel Isthmus', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The biggest square in Europe is in?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dnipropetrovsk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lviv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where was the biggest Ukrainian flag painted?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'at Troeshchyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'at Obolon', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'at Pechersk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'at Maidan Nezalezhnosti', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The longest trolleybus route in Ukraine is in');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kyiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kharkiv', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Odessa', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Crimea', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When was the Ukrainian subway system launched?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1960', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1940', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1980', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1990', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What Ukrainian song has become the most famous in the world?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'In a cherry garden', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Moonlight night', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'anthem', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shchedryk', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the longest gypsum cave in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Optimistic', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Happy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Pessimistic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Boring', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What place in the world ranking does Ukraine hold regarding the amount of citizens with higher education?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What French writer married in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Onore de Bal''zak', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Guy De Maupassant', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Emile Zola', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Alexandre Dumas', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What place in the world does Ukrainian take in the category ''melodiousness''?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What place in the world ranking does Ukrainian take regarding number of native speakers?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '35', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '26', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What language has the most in common with Ukrainian?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Czech', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Polish', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bilorusian', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Russian', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was Ukraine''s president for the shortest period of time?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'M.Hryshevskyi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'L.Kuchma', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'L.Kravchuk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'V.Yushchenko', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Some of Ukrainian territories once belonged to historical predecessor of:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Poland', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Holland', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Narnia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lukomorye', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is ''salo''?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'An operatic aria usually sung in Ukrainian by a woman',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A type of beverage, made from honey and herbs and fermented slightly',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A loud call used by farmers to summon livestock in at the end of the work day',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A garlicky, fatty food item made typically made from pig fat',
       true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which trade route helped Kyiv Rus prosper?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'fromScandinavia to Constantinople', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'from Winterfell to House Lannister of Casterly Rock',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'from Moscow to Paris', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'from Europe to the Caspian sea', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'While visiting this city for a landmark conference at the end of World War II, British Prime Minister Winston Churchill called it the "Riviera of Hades." What city was it?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mallorca', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Yalta', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zheleznyi Port', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zatoka', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The yellow and blue colors of the Ukrainian national flag are meant to invoke which of the following?');

INSERT INTO qgv.answers
VALUES(random_uuid(),
       (SELECT randId from temp_session_variables),
       'The Black Sea and sandy Crimean beaches',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Silver and gold metals', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Clear sky and fields of grain', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Peace and prosperity', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following describes Borshch?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A soup of Ukrainian origin', true),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'A local dialect spoken by Ukraine''s minority population',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'The national song of Ukraine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Popular name for dogs', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following Hollywood actress was born in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Eva Longoria', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Brad Pitt', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mila Kunis', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Harry Potter', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which is the longest river in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Dnieper', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rhine', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nile', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ebro', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which decade was Football Club Dynamo Kyiv founded?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1920s', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1940s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1960s', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '10 B.C.', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of famous football trainer who coached the Dynamo Kyiv during three stints?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Valeriy Lobanovskyi', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Andriy Shevchenko', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Leo Messi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Serhiy Rebrov', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which country did co-host UEFA Euro 2012 together with Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Namibia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Narnia', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Poland', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Romania', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'Who are Hutsuls?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Famous Rock band', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An ethno-cultural group of Poles', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An ethno-cultural group of Ukrainians', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An ethno-cultural group of Moldovans', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Who was Kyi, the founder of Kyiv city?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Slavic prince', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Turkish merchant', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mongol warrior', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Russian monk', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Mongol leader completely destroyed Kyiv in 1240?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Jackie Chan', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Attila the Hun', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kublai Khan', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Batu Khan', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The Mongols were defeated in Kiev in 1362 by Algirdas of Lithuania in which colorfully named battle?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Batlle under Yellow Skies', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Battla of Green Pastures', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Battle of Red Castle', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Battle of Blue Watters', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Kyiv became part of the Poland in 1569 when Sigismund II died without an heir.  It remained part of Poland until 1667 when it was ceded to Russia.  Under Russian rule, Kiev lost most of its power until which Russian ruler officially abolished Kievan autonomy in 1775?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Tyrion Lannyster', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nikolay II', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Catherine the Great', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Daenerys Targaryen', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What''s the name of the first successful helicopter that used a single vertical tail rotor configuration for antitorque?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vought-Sikorsky VS-300', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Vought-Swarovski VS-300', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'R2-D2', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Helicopter Turbo 1', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following describes Kutya?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Is a sweet grain dish', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Is often the first dish in the traditional twelve-dish Christmas Eve supper',
       false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Kutia is served in Ukraine, Belarus, Russia and some parts of Poland',
       false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'All of the above', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What are Vechornytsi?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Disco parties with DJ', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Slavic traditional gatherings with music, songs, jokes and rituals',
       true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Events like Hackathons', false),
      (random_uuid(),
       (SELECT randId from temp_session_variables),
       'Slavic traditional gatherings with coding and testing',
       false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What holiday do Ukrainians dye eggs for?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'New Year', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Cosmonautics Day', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Easter', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '8 of March', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Where is Ukraine located?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Eastern Europe', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'West Coast', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Western Europe', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'North Coast', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Seelct the river that forms a small part of the Ukrainian-Moldovan border?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Donets', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dniester', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dunai', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Uzh', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which month does Unity Day is celebrated in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'January', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'October', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'August', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'February', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The Ukraine was and still is a major center of the following food production:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sushi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Popcorn', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Salt', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Sugar', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'In which years Bill Clinton, former US President,  visited Ukraine:');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1933 and 1997', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1995 and 2000', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '1996 and 2000', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1994 and 1998', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the traditional Ukrainian Christmas song?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Kolyadka', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Shedrivka', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zabava', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Malanka', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the name of the most popular pop singer of the 90s in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Vika Vradiy', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Viktor Pavlik', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Iryna Bilyk', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rosava', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which of the following regions is not a part of Western Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Boykivshyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bukovyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tavria', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Lada Kalina', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which river does not have its start in Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Prut', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Uzh', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnieper', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Dnister', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the national language of Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Ukrainian', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arabic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Surzhyk', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'French', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many subway lines are Kyiv?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '7', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '8', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '3', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '4', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How many kilometres of coastline does Ukraine have?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '789 km', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1,892 km', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2,782 km', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Endless', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'How big is Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A little bigger than Rhode Island', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Somewhat larger than Mississippi', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Slightly smaller than Texas', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bigger than Texas', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'When did the Mongols invade Ukraine?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '15th century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '13th century', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '12th century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '21th century', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What is the favourite public transport at peak-hour in Ukrainian cities?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Marshrutka', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Bus', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tram', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Motobyke', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'The 1,000 miles of flat grassy plains across Ukraine are called');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Prairies', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Flatlands', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Mesas', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Steppes', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables), (SELECT topicId from temp_session_variables), 'What is pysanka?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'A dress for woman', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ruslana''s Surname', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'An Easter egg', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'A colorful bag', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What year did Ukraine join the World Trade Organization?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '1993', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '1998', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '2008', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '2015', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What kind of climate does Ukraine have?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Sub-arctic', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Tropical', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Arid', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Temperate continental', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Ukrainian region is not a part of Galicia?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Lvivshyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ternopilshyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Ivano-Frankivshyna', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Zakarpattya', true);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Prince Danylo Galyckyj named Lviv after his :');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Mother', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Nephew', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Son', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Daughter', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What was the name of Ivano-Frankivsk city before 20th century?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Hust', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Kolomyja', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Stanislawow', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Rahiv', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'Which Empire Galychyna used to be an important part of?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), 'Swedish', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Russian', false),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Austro-Hungarian', true),
      (random_uuid(), (SELECT randId from temp_session_variables), 'Prusian', false);

DELETE
FROM temp_session_variables;
INSERT INTO temp_session_variables
VALUES(random_uuid(), (SELECT id from qgv.topics t WHERE t.name = (SELECT topic1 from temp_topic_names)));

INSERT INTO qgv.questions
VALUES((SELECT randId from temp_session_variables),
       (SELECT topicId from temp_session_variables),
       'What century the famous Gold Scythian pectoral was dated?');

INSERT INTO qgv.answers
VALUES(random_uuid(), (SELECT randId from temp_session_variables), '4th century BC', true),
      (random_uuid(), (SELECT randId from temp_session_variables), '12th century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '19th century', false),
      (random_uuid(), (SELECT randId from temp_session_variables), '7th century BC', false);

DROP TABLE temp_topic_names;