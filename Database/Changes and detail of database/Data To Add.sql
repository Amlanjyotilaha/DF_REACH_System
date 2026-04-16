-- Data Added in Main Data Set
/*
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Active', 'Active');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Inactive', 'Inactive');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Deleted', 'Deleted');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('In Progress', 'Process is currently ongoing');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Completed', 'Completed');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Pursuing', 'Education Pursuing');


INSERT INTO `df_reach`.`entities` (`entity_name`, `address`, `entity_code`, `status_id`, `description`) VALUES ('Deshpande Foundation', 'DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031', 'DF', '1', 'Deshpande Foundation');
INSERT INTO `df_reach`.`entities` (`entity_name`, `address`, `entity_code`, `status_id`, `description`) VALUES ('Deshpande Educational Trust', '9338+8JV, Hosur - Unkal Bypass Rd, Chetana Colony, Vidya Nagar, Hubballi, Karnataka 580021', 'DE', '1', 'Deshpande Skilling');
INSERT INTO `df_reach`.`entities` (`entity_name`, `address`, `entity_code`, `status_id`, `description`) VALUES ('Foundation for Sandboxstartup Initiatives', 'Foundation for Sandboxstartup Initiatives, Gokul Rd, next to International Airport, opposite Gokul, Gokul, Hubballi, Karnataka 580030', 'DS', '1', 'Deshpande Startup');
INSERT INTO `df_reach`.`entities` (`entity_name`, `address`, `entity_code`, `status_id`, `description`) VALUES ('USF', 'DCSE Building, B, V.B. Campus, Vidya Nagar, Hubballi, Karnataka 580031', 'DF', '1', 'Under Deshpande Foundation');

INSERT INTO `df_reach`.`office_location` (`office_location`, `office_code`, `status_id`) VALUES ('Deshpande Foundation Hubballi Office', 'DF', '1');
INSERT INTO `df_reach`.`office_location` (`office_location`, `office_code`, `status_id`) VALUES ('Deshpande Educational Trust Hubballi Office', 'DET', '1');
INSERT INTO `df_reach`.`office_location` (`office_location`, `office_code`, `status_id`) VALUES ('Foundation For Sandbox Startup Initiatives Hubballi Office', 'DS', '1');
INSERT INTO `df_reach`.`office_location` (`office_location`, `office_code`, `status_id`) VALUES ('Nizamabad Office', 'Nizamabad', '1');


INSERT INTO `df_reach`.`cost_centers` (`cost_center_name`, `status_id`) VALUES ('DF-Integrated Area Development', '1');
INSERT INTO `df_reach`.`cost_centers` (`cost_center_name`, `status_id`) VALUES ('DF-Financial Inclusion', '1');
INSERT INTO `df_reach`.`cost_centers` (`cost_center_name`, `status_id`) VALUES ('DF - GIS & Tech', '1');

INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `password`, `mobile`, `entity_id`, `office_location_id`,`cost_center_id`,`job_title`, `manager_emp_id`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010782', 'Deepu Kumar', 'deepu.kumar@dfmail.org', '$2b$10$bl3jDpDhofmheVpbzzK21eyPfqTlKgkx7V1VWGuAKuxJQ1TKR8lvy', '91-9065446115', '1', '1','3', 'Software Development Engineer 1', '1', 'L2', 'L2', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010065', 'Kotresha Sandera', 'kotresh.sandera@dfmail.org', '91-9482309065', '1', '1', '1', 'Senior Manager', 'L5', 'L5', 'Sindhanur', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010728', 'Ravi Ramudu', 'ravi.ramudu@dfmail.org', '91-9742178750', '1', '1', '1', 'Assistant Manager', 'L3', 'L3.1', 'Bagalkote', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON400021', 'Channabasava .', 'channabasava.yankoba@dfmail.org', '91-9986925320', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Siruguppa', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100122', 'Kiran Walikar', 'kiran.walikar@dfmail.org', '91-7483163432', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Bagalkote', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100042', 'Vitthal Shankar Metri', 'vitthal.metri@dfmail.org', '91-9620566146', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Bijapur', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100132', 'Vinod Gangadhar Meti', 'vinod.meti@dfmail.org', '91-9741303553', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Annigeri', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100075', 'Kallappa  Patted', 'kallappa.patte@dfmail.org', '91-9731069120', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Annigeri', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100006', 'Virappa Bhimappa Bijapur', 'virappa.bijapur@dfmail.org', '91-9535220110', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Navalgund', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100102', 'Ramajansab Allisab Nadaf', 'ramajanasab.nadaf@dfmail.org', '91-9743164393', '4', '1', '1', 'Field Facilitator', 'L0', 'L0', 'Navalgund', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010286', 'Srinivasa H', 'shrinivas.holagundi@dfmail.org', '91-8722589919', '1', '1', '1', 'Deputy  Manager', 'L3', 'L3.2', 'Sindhanur', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('DFINT2505', 'Chandrashekhar M Madivalar', 'chandrashekhar.madiwalar@dfmail.org', '91-6363820359', '1', '1', '1', 'Intern', 'L0', 'L0', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('DFINT2506', 'Prajval Chavari', 'prajval.chavari@dfmail.org', '9886202051', '1', '1', '1', 'Intern', 'L0', 'L0', 'Hubli', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010808', 'Arunkumar Manthale', 'arunkumar.manthale@dfmail.org', '91-8147232635', '1', '1', '1', 'Site Incharge', 'L3', 'L3.1', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010807', 'Nanjundappa Jugali', 'nanjundappa.jugali@dfmail.org', '91-9342150266', '1', '1', '1', 'Sites and Partnerships', 'L6', 'L6.2', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010624', 'Praveen Honnappa Ambiga', 'praveen.ambiga@dfmail.org', '91-9535680880', '1', '1', '2', 'Deputy  Manager', 'L3', 'L3.2', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('CON100220', 'Payal Ekbote', 'payal.ekbote@dfmail.org', '91-9606143719', '4', '1', '2', 'Executive', 'L1', 'L1', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');


INSERT INTO `df_reach`.`programs` (`program_name`, `status_id`, `created_by`, `created_at`) VALUES ('Financial Inclusion', '1', '1', Now());

INSERT INTO `df_reach`.`sub_programs` (`program_id`, `sub_program_name`, `status_id`, `created_by`, `created_at`) VALUES ('1', 'Mutual Fund', '1', '1', Now());
INSERT INTO `df_reach`.`sub_programs` (`program_id`, `sub_program_name`, `status_id`, `created_by`, `created_at`) VALUES ('1', 'PMSBY', '1', '1', Now());
INSERT INTO `df_reach`.`sub_programs` (`program_id`, `sub_program_name`, `status_id`, `created_by`, `created_at`) VALUES ('1', 'PMJJBY', '1', '1', Now());
INSERT INTO `df_reach`.`sub_programs` (`program_id`, `sub_program_name`, `status_id`, `created_by`, `created_at`) VALUES ('1', 'Credit / Loan', '1', '1', Now());
INSERT INTO `df_reach`.`sub_programs` (`program_id`, `sub_program_name`, `status_id`, `created_by`, `created_at`) VALUES ('1', 'Ayushman', '1', '1', Now());

INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('Illiterate', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('Primary School', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('High School', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('Pre-University/Diploma/Class 11-12', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('Graduate', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('Post Graduate', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('PhD', '1');
INSERT INTO `df_reach`.`master_education_levels` (`education_levels`, `status_id`) VALUES ('NA', '1');

INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Unemployed', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Primary Agriculture', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Secondary Agriculture', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Asset rental', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Enterprise', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Employment – Formal sector', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Employment – Informal sector', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Freelance', '1');
INSERT INTO `df_reach`.`master_occupation` (`occupation_name`, `status_id`) VALUES ('Others', '1');

INSERT INTO `df_reach`.`earning_range` (`earning_range`) VALUES ('0-200000');
INSERT INTO `df_reach`.`earning_range` (`earning_range`) VALUES ('200001-500000');
INSERT INTO `df_reach`.`earning_range` (`earning_range`) VALUES ('500001-1000000');
INSERT INTO `df_reach`.`earning_range` (`earning_range`) VALUES ('>1000000');

INSERT INTO `df_reach`.`master_outreach_channels` (`outreach_channel`, `status_id`) VALUES ('Field facilitator', '1');
INSERT INTO `df_reach`.`master_outreach_channels` (`outreach_channel`, `status_id`) VALUES ('Word of mouth', '1');
INSERT INTO `df_reach`.`master_outreach_channels` (`outreach_channel`, `status_id`) VALUES ('Media/Communication platform', '1');

INSERT INTO `df_reach`.`gender` (`gender`) VALUES ('Male');
INSERT INTO `df_reach`.`gender` (`gender`) VALUES ('Female');

INSERT INTO `df_reach`.`mutual_fund_type` (`mutual_fund_type`, `status_id`) VALUES ('SIP', '1');
INSERT INTO `df_reach`.`mutual_fund_type` (`mutual_fund_type`, `status_id`) VALUES ('LUMPSUM', '1');

INSERT INTO `df_reach`.`mutual_fund_provider` (`mutual_fund_provider`, `status_id`) VALUES ('Axis Mutual Fund', '1');




INSERT INTO `df_reach`.`roles` (`role_name`, `created_at`, `create_by`, `status_id`, `description`) VALUES ('Super Admin', Now(), '1', '1', 'Super Admin');
INSERT INTO `df_reach`.`roles` (`role_name`, `created_at`, `create_by`, `status_id`, `description`) VALUES ('Field Facilitator', NOW(), '1', '1', 'Field Facilitator');


INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('1', '*', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('2', 'beneficiary', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('2', 'beneficiary/beneficiaryId', '1');



INSERT INTO `df_reach`.`menus` (`menu_name`, `sort`, `create_by`, `status_id`, `action`, `description`) VALUES ('Dashboard', '01', '1', '2', 'dashboard', 'dashboad page');
INSERT INTO `df_reach`.`menus` (`menu_name`, `sort`, `create_by`, `status_id`, `action`, `description`) VALUES ('Beneficiary', '02', '1', '1', 'beneficiary', 'beneficiary page');

INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('1', '1', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('1', '2', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('2', '2', '1');



INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('1', '1', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('2', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('3', '2', '1',Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('4', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('5', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('6', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('7', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('8', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('9', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('10', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('11', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('12', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('13', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('14', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('15', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('16', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('17', '2', '1', Now(), 'System', '1');

INSERT INTO `df_reach`.`state` (`state_name`, `state_code`, `status_id`) VALUES ('Karnataka', 'KA', '1');

CREATE TABLE timesheet_record (
  record_id INT(11) NOT NULL AUTO_INCREMENT,
  emp_id INT(11) NOT NULL,
  week_start DATETIME NOT NULL,
  week_end DATETIME NOT NULL,
  working_hours DECIMAL(5,2) DEFAULT 0,
  status_id INT(11) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (record_id),

  UNIQUE KEY uk_timesheet_record_emp_week (emp_id, week_start, week_end),

  KEY idx_timesheet_record_emp_id (emp_id),
  KEY idx_timesheet_record_status_id (status_id),
  KEY idx_timesheet_record_week_start (week_start),
  KEY idx_timesheet_record_week_end (week_end),

  CONSTRAINT timesheet_record_emp_fk
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),

  CONSTRAINT timesheet_record_status_fk
    FOREIGN KEY (status_id) REFERENCES master_status(status_id)
);
CREATE TABLE master_timesheet_entry_types (
  entry_type_id INT(11) NOT NULL AUTO_INCREMENT,
  entry_type_name VARCHAR(100) DEFAULT NULL,
  description TEXT DEFAULT NULL,

  PRIMARY KEY (entry_type_id)
);
CREATE TABLE timesheet_entries (
  entry_id INT(11) NOT NULL AUTO_INCREMENT,
  record_id INT(11) DEFAULT NULL,
  entry_type_id INT(11) DEFAULT NULL,
  leave_type VARCHAR(20) DEFAULT NULL,
  program_id INT(11) DEFAULT NULL,
  sub_program_id INT(11) DEFAULT NULL,
  entry_date DATE DEFAULT NULL,
  start TIME DEFAULT NULL,
  end TIME DEFAULT NULL,
  working_hours DECIMAL(5,2) DEFAULT 0,
  description TEXT DEFAULT NULL,
  total_enrollemnt INT(11) DEFAULT NULL,
  status_id INT(11) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL,
  updated_by INT(11) DEFAULT NULL,

  PRIMARY KEY (entry_id),

  KEY idx_timesheet_entries_record_id (record_id),
  KEY idx_timesheet_entries_program_id (program_id),
  KEY idx_timesheet_entries_sub_program_id (sub_program_id),
  KEY idx_timesheet_entries_entry_type_id (entry_type_id),
  KEY idx_timesheet_entries_entry_date (entry_date),
  KEY idx_timesheet_entries_status_id (status_id),

  CONSTRAINT timesheet_entries_record_fk
    FOREIGN KEY (record_id) REFERENCES timesheet_record(record_id),

  CONSTRAINT timesheet_entries_entry_type_fk
    FOREIGN KEY (entry_type_id) REFERENCES master_timesheet_entry_types(entry_type_id),

  CONSTRAINT timesheet_entries_program_fk
    FOREIGN KEY (program_id) REFERENCES programs(program_id),

  CONSTRAINT timesheet_entries_sub_program_fk
    FOREIGN KEY (sub_program_id) REFERENCES sub_programs(sub_program_id),

  CONSTRAINT timesheet_entries_status_fk
    FOREIGN KEY (status_id) REFERENCES master_status(status_id),

  CONSTRAINT timesheet_entries_updated_by_fk
    FOREIGN KEY (updated_by) REFERENCES employees(emp_id)
);
CREATE TABLE timesheet_entries_history (
  entry_hist_id INT(11) NOT NULL AUTO_INCREMENT,
  entry_id INT(11) DEFAULT NULL,
  entry_type_id INT(11) DEFAULT NULL,
  leave_type VARCHAR(20) DEFAULT NULL,
  program_id INT(11) DEFAULT NULL,
  sub_program_id INT(11) DEFAULT NULL,
  entry_date DATE DEFAULT NULL,
  start TIME DEFAULT NULL,
  end TIME DEFAULT NULL,
  working_hours DECIMAL(5,2) DEFAULT 0,
  description TEXT DEFAULT NULL,
  total_enrollemnt INT(11) DEFAULT NULL,
  status_id INT(11) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT(11) DEFAULT NULL,
  remarks TEXT DEFAULT NULL,

  PRIMARY KEY (entry_hist_id),

  KEY idx_timesheet_entries_hist_program_id (program_id),
  KEY idx_timesheet_entries_hist_sub_program_id (sub_program_id),
  KEY idx_timesheet_entries_hist_entry_type_id (entry_type_id),
  KEY idx_timesheet_entries_hist_entry_date (entry_date),
  KEY idx_timesheet_entries_hist_status_id (status_id),

  CONSTRAINT timesheet_entries_hist_entry_fk
    FOREIGN KEY (entry_id) REFERENCES timesheet_entries(entry_id),

  CONSTRAINT timesheet_entries_hist_entry_type_fk
    FOREIGN KEY (entry_type_id) REFERENCES master_timesheet_entry_types(entry_type_id),

  CONSTRAINT timesheet_entries_hist_status_fk
    FOREIGN KEY (status_id) REFERENCES master_status(status_id),

  CONSTRAINT timesheet_entries_hist_created_by_fk
    FOREIGN KEY (created_by) REFERENCES employees(emp_id)
);
CREATE TABLE timesheet_log (
  log_id INT(11) NOT NULL AUTO_INCREMENT,
  record_id INT(11) DEFAULT NULL,
  pre_status_id INT(11) DEFAULT NULL,
  post_status_id INT(11) DEFAULT NULL,
  remarks TEXT DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by INT(11) DEFAULT NULL,

  PRIMARY KEY (log_id),

  KEY idx_timesheet_log_pre_status_id (pre_status_id),
  KEY idx_timesheet_log_post_status_id (post_status_id),

  CONSTRAINT timesheet_log_record_fk
    FOREIGN KEY (record_id) REFERENCES timesheet_record(record_id),

  CONSTRAINT timesheet_log_pre_status_fk
    FOREIGN KEY (pre_status_id) REFERENCES master_status(status_id),

  CONSTRAINT timesheet_log_post_status_fk
    FOREIGN KEY (post_status_id) REFERENCES master_status(status_id),

  CONSTRAINT timesheet_log_created_by_fk
    FOREIGN KEY (created_by) REFERENCES employees(emp_id)
);
CREATE TABLE cluster (
  cluster_id INT(11) NOT NULL AUTO_INCREMENT,
  state_id INT(11) DEFAULT NULL,
  cluster_name VARCHAR(50) DEFAULT NULL,
  status_id INT(11) NOT NULL,
  description TEXT DEFAULT NULL,

  PRIMARY KEY (cluster_id),

  CONSTRAINT fk_cluster_state
    FOREIGN KEY (state_id)
    REFERENCES state(state_id),

  CONSTRAINT cluster_status_fk
    FOREIGN KEY (status_id)
    REFERENCES master_status(status_id),

  INDEX idx_cluster_state_id (state_id)
);


CREATE TABLE cluster_emp (
  cluster_emp_id INT(11) NOT NULL AUTO_INCREMENT,
  cluster_id INT(11) NOT NULL,
  emp_id INT(11) NOT NULL,
  status_id INT(11) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL,
  created_by INT(11) DEFAULT NULL,
  updated_by INT(11) DEFAULT NULL,

  PRIMARY KEY (cluster_emp_id),

  KEY idx_cluster_emp_emp_id (emp_id),
  KEY idx_cluster_emp_cluster_id (cluster_id),
  KEY idx_cluster_emp_status_id (status_id),

  CONSTRAINT cluster_emp_cluster_fk
    FOREIGN KEY (cluster_id) REFERENCES cluster(cluster_id),

  CONSTRAINT cluster_emp_emp_fk
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),

  CONSTRAINT cluster_emp_status_fk
    FOREIGN KEY (status_id) REFERENCES master_status(status_id),

  CONSTRAINT cluster_emp_created_by_fk
    FOREIGN KEY (created_by) REFERENCES employees(emp_id),

  CONSTRAINT cluster_emp_updated_by_fk
    FOREIGN KEY (updated_by) REFERENCES employees(emp_id)
);



INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Draft', 'Timeshit in Draft');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Pending', 'Timeshit Pending Approval');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Approved', 'Timesheet Approved');
INSERT INTO `df_reach`.`master_status` (`status_name`, `description`) VALUES ('Rejected', 'Timesheet Rejected');
INSERT INTO `df_reach`.`master_timesheet_entry_types` (`entry_type_name`) VALUES ('Work');
INSERT INTO `df_reach`.`master_timesheet_entry_types` (`entry_type_name`) VALUES ('Leave');
INSERT INTO `df_reach`.`master_timesheet_entry_types` (`entry_type_name`) VALUES ('Remarks');

INSERT INTO `df_reach`.`menus` (`menu_name`, `sort`, `create_by`, `status_id`, `action`, `description`) VALUES ('Timesheet', '03', '1', '1', 'timesheet', 'timesheet page');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('1', '3', '1');

-- Cluster created
INSERT INTO `df_reach`.`cluster` (`state_id`, `cluster_name`, `status_id`) VALUES ('1', 'Bagalkot', '1');
INSERT INTO `df_reach`.`cluster` (`state_id`, `cluster_name`, `status_id`) VALUES ('1', 'Koppal', '1');
INSERT INTO `df_reach`.`cluster` (`state_id`, `cluster_name`, `status_id`) VALUES ('1', 'Raichur', '1');
INSERT INTO `df_reach`.`cluster` (`state_id`, `cluster_name`, `status_id`) VALUES ('3', 'Sindhudurg ', '1');

-- Role created
INSERT INTO `df_reach`.`roles` (`role_name`, `created_at`, `create_by`, `status_id`, `description`) VALUES ('Cluster Head', Now(), '1', '1', 'Cluster Head');
INSERT INTO `df_reach`.`roles` (`role_name`, `created_at`, `create_by`, `status_id`, `description`) VALUES ('Manager', Now(), '1', '1', 'Manager');

-- menu created
INSERT INTO `df_reach`.`menus` (`menu_name`, `sort`, `create_by`, `status_id`, `action`, `description`) VALUES ('My Team', '04', '1', '1', 'myteam', 'myteam page');




-- Role menu inserted
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('1', '4', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('2', '3', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('3', '2', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('3', '3', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('3', '4', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('4', '2', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('4', '3', '1');
INSERT INTO `df_reach`.`role_menu` (`role_id`, `menu_id`, `status_id`) VALUES ('4', '4', '1');

-- Role action inserted
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`,`status_id`) VALUES ('3', 'beneficiary','1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('3', 'beneficiary/beneficiaryId');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('3', 'userprofile');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('3', 'timesheet');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('3', 'myteam');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('4', 'beneficiary');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('4', 'beneficiary/beneficiaryId');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('4', 'userprofile');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('4', 'timesheet');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`) VALUES ('4', 'myteam');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('3', 'beneficiary', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('3', 'beneficiary/beneficiaryId', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('3', 'userprofile', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('3', 'timesheet', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('3', 'myteam', '1');

INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('4', 'beneficiary', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('4', 'beneficiary/beneficiaryId', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('4', 'userprofile', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('4', 'timesheet', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('4', 'myteam', '1');

INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('2', 'timesheet', '1');

INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('3', 'myteam/recordId', '1');
INSERT INTO `df_reach`.`role_actions` (`role_id`, `action`, `status_id`) VALUES ('4', 'myteam/recordId', '1');

-- Rahul Tejas Siddesh given access
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `manager_emp_id`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000011084', 'Siddhesh Babu Palav', 'siddhesh.palav@dfmail.org', '91-7558605130', '1', '1', '1', 'Associate', '15', 'L1', 'L1', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `manager_emp_id`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000011085', 'Tejas Tukaram Sawant', 'tejas.sawant@dfmail.org', '91-7620882245', '1', '1', '1', 'Associate', '15', 'L1', 'L1', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');
INSERT INTO `df_reach`.`employees` (`employee_number`, `emp_name`, `work_email`, `mobile`, `entity_id`, `office_location_id`, `cost_center_id`, `job_title`, `manager_emp_id`, `band`, `pay_grade`, `work_location`, `sended_email`, `status_id`) VALUES ('000010769', 'Rahul Ghope', 'rahul.ghope@dfmail.org', '91-8793042404', '1', '1', '1', 'Media and outreach - Innovation Associate', '15', 'L1', 'L1', 'DCSE Building, B, V.B. Campus, Vidya Nagar,', '0', '1');


INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('21', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('22', '2', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('23', '2', '1', Now(), 'System', '1');

-- New program added
INSERT INTO `df_reach`.`programs` (`program_name`, `status_id`, `created_by`, `created_at`) VALUES ('Meeting', '2', '1', Now());
INSERT INTO `df_reach`.`programs` (`program_name`, `status_id`, `created_by`, `created_at`) VALUES ('Training', '2', '1', Now());


-- Nanjun Given Manager access
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('15', '4', '1', Now(), 'System', '1');

-- CH given ch roles
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('2', '3', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('3', '3', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('11', '3', '1', Now(), 'System', '1');
INSERT INTO `df_reach`.`emp_roles` (`emp_id`, `role_id`, `office_location_id`, `created_at`, `created_by`, `status_id`) VALUES ('23', '3', '1', Now(), 'System', '1');

-- Emp assigned to cluster 
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('1', '3', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('1', '5', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('1', '6', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('2', '11', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('2', '13', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('3', '2', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('3', '7', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('3', '4', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('4', '21', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('4', '22', '1', Now(), '1');
INSERT INTO `df_reach`.`cluster_emp` (`cluster_id`, `emp_id`, `status_id`, `created_at`, `created_by`) VALUES ('4', '23', '1', Now(), '1');

*/

-- Need To Add


