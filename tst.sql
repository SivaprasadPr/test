SELECT
    oh_idnr,
    oh_name "JOB NAME"
FROM
    oh
WHERE
        oh_otype = 'JOBS'
    AND oh_client = 7
    AND oh_deleteflag = 0
    AND NOT EXISTS (
        SELECT
            oca_oh_idnr
        FROM
            oca
        WHERE
            oca_oh_idnr = oh_idnr
    );
