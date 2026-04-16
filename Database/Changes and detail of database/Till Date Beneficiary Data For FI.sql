-- Beneficiary Details till Date for FI
SELECT 
    e1.emp_name AS Beneficiary_added_by_FF,
    e2.emp_name AS Program_added_by_FF,
    p.program_name,
    sp.sub_program_name,

    -- Beneficiary details
    mb.first_name,
    mb.last_name,
    g.gender,
    mb.dob,
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

    -- Beneficiary Programs
    bp.df_associate,
    bp.df_associate_emp_id,
    oc.outreach_channel,
    bp.enrollment_date,
    ms2.status_name AS enrollment_status,

    -- Mutual Fund Details (sub_program_id = 1)
    mf.mutual_fund_id,
    mf.investment_amount,
    mfp.mutual_fund_provider,
    mft.mutual_fund_type,
    mf.mutual_fund_duration,
    mf.reason_for_investment,

    -- Loan Details (sub_program_id = 4)
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
LEFT JOIN master_outreach_channels oc ON bp.outreach_channel_id = oc.outreach_channel_id

-- Mutual Fund joins
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

WHERE 
    bp.program_id = 1
    AND bp.status_id = 1

ORDER BY bp.beneficiary_id;
