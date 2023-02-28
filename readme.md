docker exec -it \
    crv_postgres_benchmark \
    pgbench \
        -U app_user \
        -c 8 \
        -j 8 \
        -T 60 \
        -f /test/test_jsonb.sql \
        app_db
