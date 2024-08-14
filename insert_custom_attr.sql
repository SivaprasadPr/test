set escape on;
-- Scope: Set a filter for selecting objects to be updated
def qualifier = '%'
--Name of the custom attribure
def app_name = 'UC4'
-- Variable reference of the custom attribute
def name = '\&DOM#'

insert into oca(oca_oh_idnr, oca_name, oca_value)
SELECT
    pool.oh_idnr, '&name', '&app_name'
FROM
    (
    SELECT
        oh_idnr
    FROM
        oh
    WHERE
        oh_name LIKE '&qualifier'
        AND oh_deleteflag = 0
        AND oh_client=7
) pool
WHERE
    NOT EXISTS (
        SELECT
            oca_oh_idnr
        FROM
            oca
            where oca_oh_idnr = pool.oh_idnr
    );
