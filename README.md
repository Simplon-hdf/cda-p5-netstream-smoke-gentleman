# cda-p5-netstream-smoke-gentleman



## Requêtes avancées 

Fonction pour lister les films selon les réalisateurs : 

```sql
CREATE OR REPLACE FUNCTION listFilmsRealisateur(
    inputFirstName VARCHAR,
    inputLastName VARCHAR
)
RETURNS TABLE(title TEXT, release_date DATE)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT m.title, m.release_date
    FROM movies m
    INNER JOIN directors d ON m.director_id = d.id
    WHERE d.first_name = inputFirstName
       OR d.last_name = inputLastName;
END;
$$;
```

