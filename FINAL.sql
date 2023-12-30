select json_build_object('name', 'Ivan','surname', 'Sergey','age':45);

select '{"name":"Ivan",
        "surname": "Sergey", "age":45}'::jsonb;

select json_agg(jsonb_build_object('name', name, 'age', age )) as people
from person;


CREATE TABLE your_table (
    id SERIAL PRIMARY KEY,
    data TEXT,
    last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE OR REPLACE FUNCTION update_last_modified_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER update_last_modified
BEFORE UPDATE ON your_table
FOR EACH ROW
EXECUTE FUNCTION update_last_modified_timestamp();

INSERT INTO your_table (data) VALUES ('Answer A'), ('Answer B'), ('Answer C'), ('Answer D');



UPDATE your_table SET data = 'Updated Answer' WHERE id = 1;

SELECT * FROM your_table;

