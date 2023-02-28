CREATE TABLE test_json (
   id serial primary key,
   data json
);

CREATE TABLE test_jsonb (
   id serial primary key,
   data jsonb
);


INSERT INTO test_json (data)
SELECT ('{ "name": "CRV Tester", "random_number": ' || (random() * 100)::int || ', "random_string": "abc' ||
        (random() * 100)::int ||
        'xyz" }')::json
FROM generate_series(1, 1000000);


INSERT INTO test_jsonb (data)
SELECT ('{ "name": "CRV Tester JSONB", "random_number": ' || (random() * 100)::int || ', "random_string": "qwe' ||
        (random() * 100)::int ||
        'rty" }')::jsonb
FROM generate_series(1, 1000000);
