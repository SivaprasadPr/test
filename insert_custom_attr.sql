set escape on;
def qualifier = '%'
--Name of 
def app_name = 'UC4'
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
