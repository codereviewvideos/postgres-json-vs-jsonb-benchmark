BEGIN;
UPDATE public.test_json
    SET data = jsonb_set(data::jsonb, '{random_number}', to_jsonb((data->>'random_number')::int + 1))::json
    WHERE id = (SELECT trunc(random() * 1000000)::int + 1);
SELECT * FROM public.test_json WHERE id = trunc(random() * 1000000)::int + 1;
COMMIT;