BEGIN;
UPDATE public.test_jsonb 
    SET data = jsonb_set(data, '{random_number}', to_jsonb((data->>'random_number')::int + 1)) 
    WHERE id = (SELECT trunc(random() * 1000000)::int + 1);
SELECT * FROM public.test_jsonb WHERE id = trunc(random() * 1000000)::int + 1;
COMMIT;