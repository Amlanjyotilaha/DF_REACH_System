--
-- Dumping routines for database 'df_ticketing'
--
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_EMP_ROLE_MENU_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_API_GET_EMP_ROLE_MENU_DETAILS`(
    IN p_emp_id INT
)
BEGIN
    DECLARE v_status_id INT;
    DECLARE v_role_count INT;
    DECLARE v_has_admin_role INT DEFAULT 0;
    DECLARE v_is_timesheet INT DEFAULT 0;

    -- Check employee status + is_timesheet
    SELECT status_id, IFNULL(is_timesheet,0)
    INTO v_status_id, v_is_timesheet
    FROM employees 
    WHERE emp_id = p_emp_id;

    -- Count roles
    SELECT COUNT(*) INTO v_role_count
    FROM emp_roles er
    JOIN roles r ON er.role_id = r.role_id AND r.status_id = 1
    WHERE er.emp_id = p_emp_id AND er.status_id = 1;

    -- Check if role_id = 1 exists
    SELECT COUNT(*) INTO v_has_admin_role
    FROM emp_roles
    WHERE emp_id = p_emp_id 
      AND role_id = 1 
      AND status_id = 1;

    IF v_status_id IS NULL OR v_status_id <> 1 OR v_role_count = 0 THEN

        SELECT NULL AS role_id, NULL AS role_name, NULL AS action;
        SELECT NULL AS menu_id, NULL AS menu_name, NULL AS action, NULL AS description;

    ELSE

        -- =========================
        -- 1st Output: Roles + Actions
        -- =========================
        SELECT 
            er.role_id,
            r.role_name,
            GROUP_CONCAT(
                DISTINCT 
                CASE 
                    WHEN v_has_admin_role > 0 THEN ra.action
                    WHEN ra.action = 'timesheet' AND v_is_timesheet = 1 THEN ra.action
                    WHEN ra.action <> 'timesheet' THEN ra.action
                END
                ORDER BY ra.action SEPARATOR ','
            ) AS action
        FROM employees e
        INNER JOIN emp_roles er ON e.emp_id = er.emp_id AND er.status_id = 1
        INNER JOIN roles r ON er.role_id = r.role_id AND r.status_id = 1
        LEFT JOIN role_actions ra ON er.role_id = ra.role_id AND ra.status_id = 1
        WHERE e.emp_id = p_emp_id
        GROUP BY er.role_id, r.role_name;

        -- =========================
        -- 2nd Output: Menu Access
        -- =========================
        SELECT DISTINCT
            rm.menu_id AS menu_id,
            m.menu_name AS menu_name,
            m.action AS action,
            m.description AS description,
            m.sort
        FROM employees e
        INNER JOIN emp_roles er ON e.emp_id = er.emp_id AND er.status_id = 1
        INNER JOIN roles r ON er.role_id = r.role_id AND r.status_id = 1
        INNER JOIN role_menu rm ON r.role_id = rm.role_id AND rm.status_id = 1
        INNER JOIN menus m ON rm.menu_id = m.menu_id AND m.status_id =1
        WHERE e.emp_id = p_emp_id
        AND (
            v_has_admin_role > 0
            OR rm.menu_id <> 3
            OR (rm.menu_id = 3 AND v_is_timesheet = 1)
        )
        ORDER BY m.sort;

    END IF;

    -- =========================
    -- 3rd Output: Employee Details
    -- =========================
    SELECT 
        e.emp_id,
        e.emp_name,
        e.work_email,
        e.entity_id,
        en.entity_name,
        e.status_id,
        ms.status_name
    FROM employees e
    LEFT JOIN master_status ms ON e.status_id = ms.status_id
    LEFT JOIN entities en ON e.entity_id = en.entity_id
    WHERE e.emp_id = p_emp_id;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_EMP_PROFILE_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_API_GET_EMP_PROFILE_DETAILS`(
    IN p_emp_id INT
)
BEGIN

        -- Result 1: Fetch EMP profile details & login details
        SELECT 
            p_emp_id as employee_id, em.employee_number, em.emp_name, em.work_email, em.mobile, 
            em.entity_id,e.entity_name, e.entity_code,em.office_location_id,ol.office_location,ol.office_code, em.cost_center_id,
            cc.cost_center_name,em.job_title, em.manager_emp_id, rm.emp_name AS manager_name, em.pay_grade, em.work_location, 
            em.status_id, ms.status_name , 
            GROUP_CONCAT(ld.login_id) as login_ids ,
            DATE_FORMAT(em.updated_at, '%d-%m-%y %H:%i:%s')  as updated_at
        FROM employees em
            LEFT JOIN entities e ON em.entity_id = e.entity_id AND e.status_id = 1
            LEFT JOIN cost_centers cc ON em.cost_center_id = cc.cost_center_id AND cc.status_id = 1
            LEFT JOIN employees rm ON em.manager_emp_id = rm.emp_id AND rm.status_id = 1
            LEFT JOIN master_status ms ON em.status_id = ms.status_id
            LEFT JOIN login_details ld ON ld.emp_id = p_emp_id AND ld.status_id = 1
            LEFT JOIN office_location ol ON em.office_location_id = ol.office_location_id AND ol.status_id = 1
        WHERE em.emp_id = p_emp_id
        GROUP BY em.emp_id;

        -- Result 2: Fetch EMP role details 
        SELECT 
			er.role_id,
			CONCAT(
				r.role_name,
				IFNULL(CONCAT('(', GROUP_CONCAT(ol.office_code), ')'), '')
			) AS role_name,
			MAX(er.created_at) AS created_at
		FROM emp_roles er
			LEFT JOIN roles r ON r.role_id = er.role_id
			LEFT JOIN office_location ol ON er.office_location_id = ol.office_location_id AND ol.status_id = 1
		WHERE er.emp_id = p_emp_id
		  AND er.status_id = 1
		GROUP BY er.role_id, r.role_name
		ORDER BY created_at;


END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_TIMESHEET_RECORD_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_API_GET_TIMESHEET_RECORD_DETAILS`(
    IN p_emp_id INT,
    IN p_record_id INT
)
BEGIN
    DECLARE v_week_start DATE;
    DECLARE v_week_end DATE;
    DECLARE v_target_emp_id INT;

    /* =================================================
       STEP 0: Resolve target employee & week
       ================================================= */

    IF p_emp_id = 0 THEN
        /* Admin / system call → derive emp from record */
        SELECT emp_id, week_start, week_end
        INTO v_target_emp_id, v_week_start, v_week_end
        FROM timesheet_record
        WHERE record_id = p_record_id
        LIMIT 1;
    ELSE
        SET v_target_emp_id = p_emp_id;

        IF p_record_id = 0 THEN
            /* Latest record for employee */
            SELECT week_start, week_end
            INTO v_week_start, v_week_end
            FROM timesheet_record
            WHERE emp_id = p_emp_id
            ORDER BY week_start DESC
            LIMIT 1;
        END IF;
    END IF;

    /* =========================
       RESULT SET 1: RECORD INFO
       ========================= */

    SELECT
        tr.record_id,
        tr.emp_id,
        e.emp_name,
        e.work_email,
        e.mobile,
        e.manager_emp_id,
        mgr.emp_name AS manager_name,
        ce.cluster_id,
        c.cluster_name,
        tr.week_start,
        tr.week_end,
        tr.working_hours,
        tr.status_id AS record_status_id,
        ms.status_name AS record_status,
        tr.created_at,

        /* Previous record */
        (
            SELECT tr_prev.record_id
            FROM timesheet_record tr_prev
            WHERE tr_prev.emp_id = tr.emp_id
              AND tr_prev.week_start < tr.week_start
            ORDER BY tr_prev.week_start DESC
            LIMIT 1
        ) AS before_record_id,

        /* Next record */
        (
            SELECT tr_next.record_id
            FROM timesheet_record tr_next
            WHERE tr_next.emp_id = tr.emp_id
              AND tr_next.week_start > tr.week_start
            ORDER BY tr_next.week_start ASC
            LIMIT 1
        ) AS after_record_id

    FROM timesheet_record tr
    JOIN employees e
        ON e.emp_id = tr.emp_id
       AND e.status_id = 1
    LEFT JOIN employees mgr
        ON mgr.emp_id = e.manager_emp_id
    LEFT JOIN cluster_emp ce
        ON ce.emp_id = tr.emp_id
    LEFT JOIN cluster c
        ON c.cluster_id = ce.cluster_id
    JOIN master_status ms
        ON ms.status_id = tr.status_id
    WHERE
        (
            p_emp_id = 0
            AND p_record_id <> 0
            AND tr.record_id = p_record_id
        )
        OR
        (
            p_emp_id <> 0
            AND p_record_id <> 0
            AND tr.record_id = p_record_id
            AND tr.emp_id = p_emp_id
        )
        OR
        (
            p_emp_id <> 0
            AND p_record_id = 0
            AND tr.emp_id = v_target_emp_id
            AND DATE(tr.week_start) = DATE(v_week_start)
            AND DATE(tr.week_end)   = DATE(v_week_end)
        );

    /* =========================
       RESULT SET 2: STATUS LOG
       ========================= */

    SELECT
        tl.log_id,
        tl.record_id,
        tl.pre_status_id,
        pre_ms.status_name AS pre_status,
        tl.post_status_id,
        post_ms.status_name AS post_status,
        tl.remarks,

        tl.created_by,
        e.emp_name AS created_by_name,

        DATE_FORMAT(tl.created_at, '%d-%m-%Y') AS created_at

		FROM timesheet_log tl

		LEFT JOIN master_status pre_ms
			ON pre_ms.status_id = tl.pre_status_id

		LEFT JOIN master_status post_ms
			ON post_ms.status_id = tl.post_status_id

		LEFT JOIN employees e
			ON e.emp_id = tl.created_by

		WHERE
		(
			p_emp_id = 0
			AND p_record_id <> 0
			AND tl.record_id = p_record_id
		)
		OR
		(
			p_emp_id <> 0
			AND p_record_id <> 0
			AND tl.record_id = p_record_id
			AND EXISTS (
				SELECT 1
				FROM timesheet_record tr
				WHERE tr.record_id = tl.record_id
				  AND tr.emp_id = p_emp_id
			)
		)
		OR
		(
			p_emp_id <> 0
			AND p_record_id = 0
			AND tl.record_id IN (
				SELECT record_id
				FROM timesheet_record
				WHERE emp_id = v_target_emp_id
				  AND DATE(week_start) = DATE(v_week_start)
				  AND DATE(week_end)   = DATE(v_week_end)
		)
)
ORDER BY tl.created_at Asc;

    /* =========================
       RESULT SET 3: ENTRIES
       ========================= */

    SELECT
        te.entry_id,
        te.record_id,
        te.entry_type_id,
        mtet.entry_type_name,
        te.leave_type,
        te.program_id,
        p.program_name,
        te.sub_program_id,
        sp.sub_program_name,
        te.entry_date,
        te.start,
        te.end,
        te.working_hours,
        te.description,
        te.total_enrollemnt,

        COUNT(DISTINCT bp.beneficiary_program_id) AS beneficiary_enrolled,

        te.status_id AS entry_status_id,
        ms.status_name AS entry_status,
        te.created_at
    FROM timesheet_entries te
    LEFT JOIN master_timesheet_entry_types mtet
        ON mtet.entry_type_id = te.entry_type_id
    LEFT JOIN programs p
        ON p.program_id = te.program_id
    LEFT JOIN sub_programs sp
        ON sp.sub_program_id = te.sub_program_id
    JOIN master_status ms
        ON ms.status_id = te.status_id
    LEFT JOIN beneficiary_programs bp
        ON bp.created_by = v_target_emp_id
       AND bp.status_id = 1
       AND DATE(bp.created_at) = te.entry_date
       AND bp.program_id = te.program_id
       AND (
            te.sub_program_id IS NULL
            OR bp.sub_program_id = te.sub_program_id
           )
    WHERE te.status_id = 1
      AND te.record_id IN (
            SELECT record_id
            FROM timesheet_record
            WHERE
                (
                    p_emp_id = 0
                    AND p_record_id <> 0
                    AND record_id = p_record_id
                )
                OR
                (
                    p_emp_id <> 0
                    AND p_record_id <> 0
                    AND record_id = p_record_id
                    AND emp_id = p_emp_id
                )
                OR
                (
                    p_emp_id <> 0
                    AND p_record_id = 0
                    AND emp_id = v_target_emp_id
                    AND DATE(week_start) = DATE(v_week_start)
                    AND DATE(week_end)   = DATE(v_week_end)
                )
      )
    GROUP BY
        te.entry_id,
        te.record_id,
        te.entry_type_id,
        mtet.entry_type_name,
        te.leave_type,
        te.program_id,
        p.program_name,
        te.sub_program_id,
        sp.sub_program_name,
        te.entry_date,
        te.start,
        te.end,
        te.working_hours,
        te.description,
        te.total_enrollemnt,
        te.status_id,
        ms.status_name,
        te.created_at;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_TIMESHEET_HIERARCHY_VIEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_GET_TIMESHEET_HIERARCHY_VIEW`(
    IN p_emp_id INT,
    IN p_start_date VARCHAR(20),
    IN p_end_date VARCHAR(20),
    IN p_status VARCHAR(10),
    IN p_all_data BOOLEAN
)
BEGIN
    DECLARE v_start_date DATE;
    DECLARE v_end_date DATE;
    DECLARE v_include_self INT DEFAULT 0;
    DECLARE v_caller_manager INT;

    DECLARE v_admin_only INT DEFAULT 0;
    DECLARE v_admin_with_other INT DEFAULT 0;

    /* =====================================================
       STEP 1: Resolve date range
       ===================================================== */

    IF p_start_date = '0' AND p_end_date = '0' THEN
        SET v_start_date = DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY);
        SET v_end_date   = DATE_ADD(v_start_date, INTERVAL 6 DAY);
    ELSEIF p_start_date = '*' AND p_end_date = '*' THEN
        SET v_start_date = NULL;
        SET v_end_date   = NULL;
    ELSE
        SET v_start_date = DATE(p_start_date);
        SET v_end_date   = DATE(p_end_date);
    END IF;

    /* =====================================================
       STEP 2: Caller context
       ===================================================== */

    SELECT
        manager_emp_id,
        CASE
            WHEN manager_emp_id IS NULL
              OR manager_emp_id = emp_id
            THEN 1 ELSE 0
        END
    INTO v_caller_manager, v_include_self
    FROM employees
    WHERE emp_id = p_emp_id;

    /* =====================================================
       STEP 2A: Role resolution
       ===================================================== */

    SELECT
        CASE
            WHEN COUNT(*) = 1
             AND SUM(CASE WHEN role_id = 1 THEN 1 ELSE 0 END) = 1
            THEN 1 ELSE 0
        END,
        CASE
            WHEN COUNT(*) > 1
             AND SUM(CASE WHEN role_id = 1 THEN 1 ELSE 0 END) >= 1
            THEN 1 ELSE 0
        END
    INTO v_admin_only, v_admin_with_other
    FROM emp_roles
    WHERE emp_id = p_emp_id
      AND status_id = 1;

    /* =====================================================
       STEP 3: RESULT 1
       ===================================================== */

    DROP TEMPORARY TABLE IF EXISTS tmp_result_1;
    CREATE TEMPORARY TABLE tmp_result_1 (
        emp_id INT PRIMARY KEY
    );

    IF v_admin_only = 0 THEN

        /* Direct reports */
        INSERT IGNORE INTO tmp_result_1 (emp_id)
        SELECT emp_id
        FROM employees
        WHERE manager_emp_id = p_emp_id
          AND status_id = 1;

        /* ✅ FIXED: Full cluster visibility (no manager restriction) */
        INSERT IGNORE INTO tmp_result_1 (emp_id)
        SELECT ce2.emp_id
        FROM cluster_emp ce1
        JOIN cluster_emp ce2
            ON ce2.cluster_id = ce1.cluster_id
           AND ce2.status_id = 1
        WHERE ce1.emp_id = p_emp_id
          AND ce1.status_id = 1
          AND ce2.emp_id <> p_emp_id;

        /* Include self if top-level */
        IF v_include_self = 1 THEN
            INSERT IGNORE INTO tmp_result_1 VALUES (p_emp_id);
        END IF;

    END IF;

    /* ================= RESULT SET 1 ================= */

    SELECT
        tr.record_id,
        e.emp_id,
        e.emp_name,
        e.work_email,
        e.mobile,
        e.manager_emp_id,
        ce.cluster_id,
        c.cluster_name,
        DATE_FORMAT(tr.week_start, '%d-%m-%Y') AS week_start,
        DATE_FORMAT(tr.week_end, '%d-%m-%Y')   AS week_end,
        tr.working_hours,
        tr.status_id,
        ms.status_name AS status
    FROM tmp_result_1 r
    JOIN employees e ON e.emp_id = r.emp_id
    JOIN timesheet_record tr
        ON tr.emp_id = e.emp_id
       AND (
            v_start_date IS NULL
            OR (
                DATE(tr.week_start) <= v_end_date
                AND DATE(tr.week_end) >= v_start_date
            )
       )
       AND (
            p_status = '*'
            OR tr.status_id = p_status
       )
    LEFT JOIN cluster_emp ce
        ON ce.emp_id = e.emp_id
       AND ce.status_id = 1
    LEFT JOIN cluster c
        ON c.cluster_id = ce.cluster_id
    LEFT JOIN master_status ms
        ON ms.status_id = tr.status_id
    ORDER BY e.emp_name, tr.week_start;

    /* =====================================================
       STEP 4: RESULT 2
       ===================================================== */

    IF p_all_data = TRUE THEN

        DROP TEMPORARY TABLE IF EXISTS tmp_result_2;
        CREATE TEMPORARY TABLE tmp_result_2 (
            emp_id INT PRIMARY KEY
        );

        IF v_admin_only = 1 THEN

            INSERT IGNORE INTO tmp_result_2 (emp_id)
            SELECT emp_id
            FROM employees
            WHERE status_id = 1
              AND emp_id <> p_emp_id;

        ELSE

            INSERT IGNORE INTO tmp_result_2 (emp_id)
            SELECT e.emp_id
            FROM employees e
            JOIN tmp_result_1 r
                ON e.manager_emp_id = r.emp_id
            WHERE e.status_id = 1
              AND e.emp_id <> p_emp_id
              AND e.emp_id <> v_caller_manager
              AND e.manager_emp_id <> v_caller_manager;

        END IF;

        /* ================= RESULT SET 2 ================= */

        SELECT
            tr.record_id,
            e.emp_id,
            e.emp_name,
            e.work_email,
            e.mobile,
            e.manager_emp_id,
            ce.cluster_id,
            c.cluster_name,
            DATE_FORMAT(tr.week_start, '%d-%m-%Y') AS week_start,
            DATE_FORMAT(tr.week_end, '%d-%m-%Y')   AS week_end,
            tr.working_hours,
            tr.status_id,
            ms.status_name AS status
        FROM tmp_result_2 r
        JOIN employees e ON e.emp_id = r.emp_id
        JOIN timesheet_record tr
            ON tr.emp_id = e.emp_id
           AND (
                v_start_date IS NULL
                OR (
                    DATE(tr.week_start) <= v_end_date
                    AND DATE(tr.week_end) >= v_start_date
                )
           )
           AND (
                p_status = '*'
                OR tr.status_id = p_status
           )
        LEFT JOIN cluster_emp ce
            ON ce.emp_id = e.emp_id
           AND ce.status_id = 1
        LEFT JOIN cluster c
            ON c.cluster_id = ce.cluster_id
        LEFT JOIN master_status ms
            ON ms.status_id = tr.status_id
        ORDER BY e.emp_name, tr.week_start;

    END IF;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_BENEFICIARY_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_GET_BENEFICIARY_DETAILS`(
	IN p_beneficiary_id INT
)
BEGIN
    -- =========================
    -- Result 1: Beneficiary Profile
    -- =========================
    SELECT 
        mb.beneficiary_id,
        mb.beneficiary_code,
        mb.first_name,
        mb.last_name,
        mb.gender_id,
        g.gender,
        DATE_FORMAT(mb.dob, '%d-%m-%Y') AS dob,
        mb.mobile_no,
        mb.email_id,
        mb.aadhaar_no,
        mb.permanent_address,
        mb.pincode,
        mb.total_family_members,
        mb.institute,
        mb.field_of_study,
        mb.passing_year,
        mb.income_description,
        mb.is_certified,
        mb.certification_name,
        mb.certification_description,
        mb.created_at,
        mb.updated_at,

        mb.state_id,
        s.state_name,
        mb.district_id,
        d.district_name,
        mb.taluka_id,
        t.taluka_name,
        mb.village_id,
        v.village_name,

        mb.education_level_id,
        mel.education_levels,
        mb.education_status_id,
        ms1.status_name AS education_status,

        mb.beneficiary_annual_source_id,
        mo1.occupation_name AS beneficiary_annual_source,
        mb.family_annual_source_id,
        mo2.occupation_name AS family_annual_source,

        mb.earning_range_id,
        er.earning_range,
        mb.earning_members,

        mb.status_id,
        ms2.status_name AS status_name,

        mb.created_by,
        e1.employee_number AS creator_emp_number,
        e1.emp_name AS creator_emp_name,
        e1.work_email AS creator_work_email,
        e1.mobile AS creator_mobile,

        mb.updated_by,
        e2.employee_number AS updator_emp_number,
        e2.emp_name AS updator_emp_name,
        e2.work_email AS updator_work_email,
        e2.mobile AS updator_mobile

    FROM master_beneficiary mb
        LEFT JOIN gender g ON mb.gender_id = g.gender_id
        LEFT JOIN state s ON mb.state_id = s.state_id
        LEFT JOIN district d ON mb.district_id = d.district_id
        LEFT JOIN taluka t ON mb.taluka_id = t.taluka_id
        LEFT JOIN village v ON mb.village_id = v.village_id
        LEFT JOIN master_education_levels mel ON mb.education_level_id = mel.education_level_id
        LEFT JOIN master_status ms1 ON mb.education_status_id = ms1.status_id
        LEFT JOIN master_occupation mo1 ON mb.beneficiary_annual_source_id = mo1.occupation_id
        LEFT JOIN master_occupation mo2 ON mb.family_annual_source_id = mo2.occupation_id
        LEFT JOIN earning_range er ON mb.earning_range_id = er.earning_range_id
        LEFT JOIN master_status ms2 ON mb.status_id = ms2.status_id
        LEFT JOIN employees e1 ON mb.created_by = e1.emp_id
        LEFT JOIN employees e2 ON mb.updated_by = e2.emp_id
    WHERE mb.beneficiary_id = p_beneficiary_id ;

    -- =========================
    -- Result 2: Beneficiary Programs
    -- =========================
    SELECT 
    bp.beneficiary_program_id,
    bp.beneficiary_id,
    bp.program_id,
    p.program_name,
    bp.sub_program_id,
    sp.sub_program_name,
    bp.sub_program_details_id,

    -- Mutual fund details (sub_program_id = 1)
    CASE WHEN bp.sub_program_id = 1 THEN mf.investment_amount END AS mutual_fund_investment_amount,
    CASE WHEN bp.sub_program_id = 1 THEN mf.mutual_fund_duration END AS mutual_fund_duration,
    CASE WHEN bp.sub_program_id = 1 THEN mf.reason_for_investment END AS reason_for_investment,
    CASE WHEN bp.sub_program_id = 1 THEN mf.mutual_fund_provider_id END AS mutual_fund_provider_id,
    CASE WHEN bp.sub_program_id = 1 THEN mfp.mutual_fund_provider END AS mutual_fund_provider,
    CASE WHEN bp.sub_program_id = 1 THEN mf.mutual_fund_type_id END AS mutual_fund_type_id,
    CASE WHEN bp.sub_program_id = 1 THEN mft.mutual_fund_type END AS mutual_fund_type,

    -- Loan details (sub_program_id = 4)
    CASE WHEN bp.sub_program_id = 4 THEN l.loan_amount END AS loan_amount,
    CASE WHEN bp.sub_program_id = 4 THEN l.loan_scheme_id END AS loan_scheme_id,
    CASE WHEN bp.sub_program_id = 4 THEN ls.scheme_name END AS loan_scheme_name,
    CASE WHEN bp.sub_program_id = 4 THEN l.business_type END AS business_type,

    bp.enrolled_members,
    bp.df_associate,
    bp.df_associate_emp_id,
    bp.outreach_channel_id,
    moc.outreach_channel,
    DATE_FORMAT(bp.enrollment_date, '%d-%m-%Y') AS enrollment_date,
    bp.enrollment_status AS enrollment_status_id,
    ms_en.status_name AS enrollment_status,
    bp.status_id,
    ms2.status_name AS status_name,
    bp.description,

    -- Creator info
    bp.created_by,
    e1.employee_number AS creator_emp_number,
    e1.emp_name AS creator_emp_name,
    e1.work_email AS creator_work_email,
    e1.mobile AS creator_mobile,
    DATE_FORMAT(bp.created_at, '%d-%m-%Y') AS created_at

FROM beneficiary_programs bp
    LEFT JOIN programs p 
        ON bp.program_id = p.program_id
    LEFT JOIN sub_programs sp 
        ON bp.sub_program_id = sp.sub_program_id
    LEFT JOIN master_outreach_channels moc 
        ON bp.outreach_channel_id = moc.outreach_channel_id
    LEFT JOIN master_status ms_en 
        ON bp.enrollment_status = ms_en.status_id
    LEFT JOIN employees e1 
        ON bp.created_by = e1.emp_id
    LEFT JOIN master_status ms2 
        ON bp.status_id = ms2.status_id

    -- Mutual fund joins
    LEFT JOIN mutual_fund mf 
        ON bp.sub_program_id = 1 
       AND bp.sub_program_details_id = mf.mutual_fund_id
    LEFT JOIN mutual_fund_provider mfp 
        ON mf.mutual_fund_provider_id = mfp.mutual_fund_provider_id
    LEFT JOIN mutual_fund_type mft 
        ON mf.mutual_fund_type_id = mft.mutual_fund_type_id

    -- Loan joins
    LEFT JOIN loan l
        ON bp.sub_program_id = 4
       AND bp.sub_program_details_id = l.loan_id
    LEFT JOIN loan_scheme ls
        ON l.loan_scheme_id = ls.loan_scheme_id

WHERE bp.beneficiary_id = p_beneficiary_id
  AND bp.status_id = 1;


END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_MISSING_SUBPROGRAMS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_GET_MISSING_SUBPROGRAMS`(
     IN p_beneficiary_id VARCHAR(20)
)
BEGIN

    /* =================================================
       MODE 1: Wildcard → return ALL programs & subprograms
       ================================================= */
    IF p_beneficiary_id = '*' THEN

        /* Result 1: All active programs */
        SELECT
            p.program_id,
            p.program_name
        FROM programs p
        WHERE p.status_id = 1;

        /* Result 2: All active subprograms */
        SELECT
            sp.sub_program_id,
            sp.program_id,
            sp.sub_program_name
        FROM sub_programs sp
        WHERE sp.status_id = 1;

    ELSE

        /* =================================================
           MODE 2: Beneficiary-specific missing subprograms
           ================================================= */

        -- Clean up in case of re-run
        DROP TEMPORARY TABLE IF EXISTS tmp_beneficiary_subprograms;

        -- Collect beneficiary's active program–subprogram pairs
        CREATE TEMPORARY TABLE tmp_beneficiary_subprograms
        SELECT 
            bp.program_id,
            bp.sub_program_id
        FROM beneficiary_programs bp
        WHERE bp.beneficiary_id = p_beneficiary_id
          AND bp.status_id = 1;

        /* =========================
           Result 1: Programs with missing subprograms
           ========================= */
        SELECT DISTINCT
            p.program_id,
            p.program_name
        FROM programs p
        LEFT JOIN sub_programs sp
            ON sp.program_id = p.program_id
           AND sp.status_id = 1
        WHERE p.status_id = 1
          AND (
                sp.sub_program_id IS NULL
             OR NOT EXISTS (
                    SELECT 1
                    FROM tmp_beneficiary_subprograms t
                    WHERE t.program_id = p.program_id
                      AND t.sub_program_id = sp.sub_program_id
                )
          );

        /* =========================
           Result 2: Missing subprograms
           ========================= */
        SELECT
            sp.sub_program_id,
            sp.program_id,
            sp.sub_program_name
        FROM sub_programs sp
        WHERE sp.status_id = 1
          AND NOT EXISTS (
                SELECT 1
                FROM tmp_beneficiary_subprograms t
                WHERE t.program_id = sp.program_id
                  AND t.sub_program_id = sp.sub_program_id
          );

        -- Cleanup
        DROP TEMPORARY TABLE IF EXISTS tmp_beneficiary_subprograms;

    END IF;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_BENEFICIARY_REPORT_DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_GET_BENEFICIARY_REPORT_DETAILS`(
    IN p_start_date VARCHAR(20),
    IN p_end_date   VARCHAR(20),
    IN p_program_id VARCHAR(10)
)
BEGIN

DECLARE v_start_date DATE;
DECLARE v_end_date DATE;

/* =====================================================
   Resolve date filter
   ===================================================== */

IF p_start_date = '*' OR p_end_date = '*' THEN
    SET v_start_date = NULL;
    SET v_end_date = NULL;
ELSE
    SET v_start_date = DATE(p_start_date);
    SET v_end_date   = DATE(p_end_date);
END IF;


/* =====================================================
   MAIN QUERY
   ===================================================== */

SELECT 
    e1.emp_name AS Beneficiary_added_by_FF,
    e2.emp_name AS Program_added_by_FF,
    p.program_name,
    sp.sub_program_name,

    /* ---------- Beneficiary details ---------- */
    mb.first_name,
    mb.last_name,
    g.gender,
    DATE_FORMAT(mb.dob,'%d-%m-%Y') AS dob,
    mb.mobile_no,
    mb.email_id,
    mb.aadhaar_no,
    mb.permanent_address,
    s.state_name,
    d.district_name,
    t.taluka_name,
    v.village_name,
    mb.pincode,
    mb.total_family_members,
    me.education_levels,
    mb.institute,
    mb.field_of_study,
    ms.status_name AS education_status,
    mb.passing_year,
    mo1.occupation_name AS beneficiary_annual_source,
    mb.earning_members,
    mo2.occupation_name AS family_annual_source,
    er.earning_range,
    mb.income_description,

    CASE 
        WHEN mb.is_certified = 0 THEN 'No'
        WHEN mb.is_certified = 1 THEN 'Yes'
        ELSE NULL
    END AS is_certified,

    mb.certification_name,
    mb.certification_description,

    /* ---------- Program Details ---------- */
    bp.df_associate,
    bp.df_associate_emp_id,
    oc.outreach_channel,
    DATE_FORMAT(bp.enrollment_date,'%d-%m-%Y') AS enrollment_date,
    ms2.status_name AS enrollment_status,

    /* ---------- Mutual Fund ---------- */
    mf.mutual_fund_id,
    mf.investment_amount,
    mfp.mutual_fund_provider,
    mft.mutual_fund_type,
    mf.mutual_fund_duration,
    mf.reason_for_investment,

    /* ---------- Loan ---------- */
    l.loan_id,
    l.loan_amount,
    ls.scheme_name AS loan_scheme_name,
    l.business_type

FROM beneficiary_programs bp

LEFT JOIN master_beneficiary mb 
       ON bp.beneficiary_id = mb.beneficiary_id

LEFT JOIN gender g ON mb.gender_id = g.gender_id
LEFT JOIN state s ON mb.state_id = s.state_id
LEFT JOIN district d ON mb.district_id = d.district_id
LEFT JOIN taluka t ON mb.taluka_id = t.taluka_id
LEFT JOIN village v ON mb.village_id = v.village_id
LEFT JOIN master_education_levels me ON mb.education_level_id = me.education_level_id
LEFT JOIN master_status ms ON mb.education_status_id = ms.status_id
LEFT JOIN master_occupation mo1 ON mb.beneficiary_annual_source_id = mo1.occupation_id
LEFT JOIN master_occupation mo2 ON mb.family_annual_source_id = mo2.occupation_id
LEFT JOIN earning_range er ON mb.earning_range_id = er.earning_range_id

LEFT JOIN programs p ON bp.program_id = p.program_id
LEFT JOIN sub_programs sp ON bp.sub_program_id = sp.sub_program_id
LEFT JOIN master_status ms2 ON bp.enrollment_status = ms2.status_id

LEFT JOIN employees e1 ON mb.created_by = e1.emp_id
LEFT JOIN employees e2 ON bp.created_by = e2.emp_id

LEFT JOIN master_outreach_channels oc 
       ON bp.outreach_channel_id = oc.outreach_channel_id

/* ---------- Mutual Fund ---------- */
LEFT JOIN mutual_fund mf 
       ON bp.sub_program_id = 1 
      AND bp.sub_program_details_id = mf.mutual_fund_id
LEFT JOIN mutual_fund_provider mfp 
       ON mf.mutual_fund_provider_id = mfp.mutual_fund_provider_id
LEFT JOIN mutual_fund_type mft 
       ON mf.mutual_fund_type_id = mft.mutual_fund_type_id

/* ---------- Loan ---------- */
LEFT JOIN loan l
       ON bp.sub_program_id = 4
      AND bp.sub_program_details_id = l.loan_id
LEFT JOIN loan_scheme ls
       ON l.loan_scheme_id = ls.loan_scheme_id

WHERE 
    bp.status_id = 1

    /* Program filter */
    AND (
        p_program_id = '*'
        OR bp.program_id = p_program_id
    )

    /* Date filter */
    AND (
        v_start_date IS NULL
        OR DATE(bp.enrollment_date) BETWEEN v_start_date AND v_end_date
    )

ORDER BY bp.beneficiary_id;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_API_GET_TIMESHEET_ENTRIES_BY_DATES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_API_GET_TIMESHEET_ENTRIES_BY_DATES`(
    IN p_start_date VARCHAR(20),
    IN p_end_date   VARCHAR(20)
)
BEGIN

DECLARE v_start_date DATE;
DECLARE v_end_date   DATE;

/* Resolve date range */

IF p_start_date = '0' AND p_end_date = '0' THEN
    SET v_start_date = DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY);
    SET v_end_date   = DATE_ADD(v_start_date, INTERVAL 6 DAY);

ELSEIF p_start_date = '*' AND p_end_date = '*' THEN
    SET v_start_date = NULL;
    SET v_end_date   = NULL;

ELSE
    SET v_start_date = DATE(p_start_date);
    SET v_end_date   = DATE(p_end_date);
END IF;


/* Result */

SELECT
    te.entry_id,
    te.record_id,
    tr.emp_id,
    e.emp_name,
    te.entry_type_id,
    mtet.entry_type_name,
    te.leave_type,
    te.program_id,
    p.program_name,
    te.sub_program_id,
    sp.sub_program_name,
    te.entry_date,
    te.start,
    te.end,
    te.working_hours,
    te.description,
    te.total_enrollemnt,

    COUNT(DISTINCT bp.beneficiary_program_id) AS beneficiary_enrolled,

    te.status_id AS entry_status_id,
    ms.status_name AS entry_status,
    tr.status_id AS record_status_id,
    ms_rec.status_name AS record_status,
    te.created_at

FROM timesheet_entries te

JOIN timesheet_record tr
    ON tr.record_id = te.record_id

JOIN employees e
    ON e.emp_id = tr.emp_id

LEFT JOIN master_timesheet_entry_types mtet
    ON mtet.entry_type_id = te.entry_type_id

LEFT JOIN programs p
    ON p.program_id = te.program_id

LEFT JOIN sub_programs sp
    ON sp.sub_program_id = te.sub_program_id

JOIN master_status ms
    ON ms.status_id = te.status_id

JOIN master_status ms_rec
    ON ms_rec.status_id = tr.status_id

LEFT JOIN beneficiary_programs bp
    ON bp.created_by = tr.emp_id
   AND bp.status_id = 1
   AND DATE(bp.created_at) = te.entry_date
   AND bp.program_id = te.program_id
   AND (
        te.sub_program_id IS NULL
        OR bp.sub_program_id = te.sub_program_id
   )

WHERE te.status_id = 1

AND (
      v_start_date IS NULL
      OR te.entry_date BETWEEN v_start_date AND v_end_date
)

AND tr.record_id IN
(
    SELECT record_id
    FROM timesheet_record
    WHERE
        v_start_date IS NULL
        OR (
            DATE(week_start) <= v_end_date
            AND DATE(week_end) >= v_start_date
        )
)

GROUP BY
    te.entry_id,
    te.record_id,
    tr.emp_id,
    e.emp_name,
    te.entry_type_id,
    mtet.entry_type_name,
    te.leave_type,
    te.program_id,
    p.program_name,
    te.sub_program_id,
    sp.sub_program_name,
    te.entry_date,
    te.start,
    te.end,
    te.working_hours,
    te.description,
    te.total_enrollemnt,
    te.status_id,
    ms.status_name,
    tr.status_id,
    ms_rec.status_name,
    te.created_at;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_GET_EMP_PROGRAM_PERCENTAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`DF-Reach`@`%` PROCEDURE `USP_GET_EMP_PROGRAM_PERCENTAGE`(
    IN p_start_date DATE,
    IN p_end_date DATE
)
BEGIN

    -- =========================
    -- Result 1 (Employee-wise)
    -- =========================
    SELECT 
        e.employee_number AS 'Employee ID',
        e.emp_name AS Name,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 1 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Financial Inclusion`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 9 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Forestry & Fodder`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 6 AND te.sub_program_id = 8 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Bio-inputs - Biofertilizer`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 6 AND te.sub_program_id = 9 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Bio-inputs - BioPest`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 8 AND te.sub_program_id = 6 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Community Infrastructure - Community Pond`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 8 AND te.sub_program_id = 7 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Community Infrastructure - Check Dam`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 5 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Biogas`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 10 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `Bee-keeping`,

        CONCAT(ROUND(100 * SUM(CASE WHEN te.program_id = 11 THEN te.working_hours ELSE 0 END) 
            / NULLIF(SUM(te.working_hours), 0)), '%') 
            AS `New Initiatives`

    FROM timesheet_entries te
    JOIN timesheet_record tr ON te.record_id = tr.record_id
    JOIN employees e ON tr.emp_id = e.emp_id

    WHERE 
        te.entry_date BETWEEN p_start_date AND p_end_date
        AND te.status_id = 1
        AND te.entry_type_id = 1
        AND te.program_id NOT IN (12,13)
        AND e.is_timesheet = 1  

    GROUP BY e.emp_id, e.emp_name, e.employee_number
    ORDER BY e.emp_name;


    -- =========================
    -- Result 2 (Program-wise overall %)
    -- =========================
    SELECT 
    p.program_name AS Programs,
    CONCAT(
        IFNULL(
            ROUND(100 * IFNULL(t.total_hours, 0) / NULLIF(gt.grand_total, 0)),
            0
        ),
        '%'
    ) AS Percentage
FROM (
    SELECT 'Financial Inclusion' AS program_name
    UNION ALL SELECT 'Forestry & Fodder'
    UNION ALL SELECT 'Bio-inputs - Biofertilizer'
    UNION ALL SELECT 'Bio-inputs - BioPest'
    UNION ALL SELECT 'Community Infrastructure - Community Pond'
    UNION ALL SELECT 'Community Infrastructure - Check Dam'
    UNION ALL SELECT 'Biogas'
    UNION ALL SELECT 'Bee-keeping'
    UNION ALL SELECT 'New Initiatives'
) p

LEFT JOIN (
    SELECT 
        CASE 
            WHEN te.program_id = 1 THEN 'Financial Inclusion'
            WHEN te.program_id = 9 THEN 'Forestry & Fodder'
            WHEN te.program_id = 6 AND te.sub_program_id = 8 THEN 'Bio-inputs - Biofertilizer'
            WHEN te.program_id = 6 AND te.sub_program_id = 9 THEN 'Bio-inputs - BioPest'
            WHEN te.program_id = 8 AND te.sub_program_id = 6 THEN 'Community Infrastructure - Community Pond'
            WHEN te.program_id = 8 AND te.sub_program_id = 7 THEN 'Community Infrastructure - Check Dam'
            WHEN te.program_id = 5 THEN 'Biogas'
            WHEN te.program_id = 10 THEN 'Bee-keeping'
            WHEN te.program_id = 11 THEN 'New Initiatives'
        END AS program_name,

        SUM(te.working_hours) AS total_hours

    FROM timesheet_entries te
    JOIN timesheet_record tr ON te.record_id = tr.record_id
    JOIN employees e ON tr.emp_id = e.emp_id

    WHERE 
        te.entry_date BETWEEN p_start_date AND p_end_date
        AND te.status_id = 1
        AND te.entry_type_id = 1
        AND te.program_id NOT IN (12,13)
        AND e.is_timesheet = 1  

    GROUP BY program_name
) t 
ON p.program_name = t.program_name

--  Grand total calculated separately
CROSS JOIN (
    SELECT 
        SUM(te.working_hours) AS grand_total
    FROM timesheet_entries te
    JOIN timesheet_record tr ON te.record_id = tr.record_id
    JOIN employees e ON tr.emp_id = e.emp_id
    WHERE 
        te.entry_date BETWEEN p_start_date AND p_end_date
        AND te.status_id = 1
        AND te.entry_type_id = 1
        AND te.program_id NOT IN (12,13)
        AND e.is_timesheet = 1  
) gt;

END;;
DELIMITER ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DELIMITER ;


