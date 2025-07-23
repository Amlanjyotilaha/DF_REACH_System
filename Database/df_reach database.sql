CREATE TABLE `address` (
  `address_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT null,
  `district_id` int(11) DEFAULT null,
  `taluka_id` int(11) DEFAULT null,
  `village_id` int(11) DEFAULT null,
  `pincode` varchar(10) DEFAULT null
);

CREATE TABLE `beneficiary_programs` (
  `beneficiary_program_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int(11) DEFAULT null,
  `program_id` int(11) DEFAULT null,
  `sub_program_id` int(11) DEFAULT null,
  `df_associate` varchar(10) DEFAULT null,
  `df_associate_emp_id` varchar(10) DEFAULT null,
  `outreach_channel_id` int(11) DEFAULT null,
  `enrollement_date` datetime DEFAULT null,
  `enrollment_status` int(11) DEFAULT null,
  `created_by` int DEFAULT null,
  `created_at` datetime DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `master_outreach_channels` (
  `outreach_channel_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `outreach_channel` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `district` (
  `district_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT null,
  `district_name` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `emp_roles` (
  `emp_role_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT null,
  `role_id` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `created_by` varchar(50) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `employee_history` (
  `emp_hst_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT null,
  `employee_number` varchar(50) DEFAULT null,
  `emp_name` varchar(100) DEFAULT null,
  `work_email` varchar(100) DEFAULT null,
  `password` text DEFAULT null,
  `mobile` varchar(20) DEFAULT null,
  `gender_id` int(11) DEFAULT null,
  `entity` varchar(100) DEFAULT null,
  `department` varchar(100) DEFAULT null,
  `job_title` varchar(100) DEFAULT null,
  `manager_emp_id` int(11) DEFAULT null,
  `band` varchar(30) DEFAULT null,
  `pay_grade` varchar(100) DEFAULT null,
  `work_location` text DEFAULT null,
  `sended_email` int(11) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `created_by` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `updated_by` int(11) DEFAULT null,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `employees` (
  `emp_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `employee_number` varchar(50) DEFAULT null,
  `emp_name` varchar(100) DEFAULT null,
  `work_email` varchar(100) DEFAULT null,
  `password` text DEFAULT null,
  `mobile` varchar(20) DEFAULT null,
  `gender_id` int(11) DEFAULT null,
  `entity` varchar(100) DEFAULT null,
  `department` varchar(100) DEFAULT null,
  `job_title` varchar(100) DEFAULT null,
  `manager_emp_id` int(11) DEFAULT null,
  `band` varchar(30) DEFAULT null,
  `pay_grade` varchar(100) DEFAULT null,
  `work_location` text DEFAULT null,
  `sended_email` int(11) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `created_by` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `updated_by` int(11) DEFAULT null,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `gender` (
  `gender_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `gender` varchar(10) DEFAULT null
);

CREATE TABLE `income` (
  `income_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `beneficiary_annual_source_id` int(11) DEFAULT null,
  `earning_members` int(11) DEFAULT null,
  `family_annual_source_id` int(11) DEFAULT null,
  `earning_range_id` int(11) DEFAULT null,
  `income_description` text DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `created_by` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `updated_by` int(11) DEFAULT null,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `earning_range` (
  `earning_range_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `earning_range` varchar(100) DEFAULT null
);

CREATE TABLE `master_beneficiary` (
  `beneficiary_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `beneficiary_code` varchar(100) DEFAULT null,
  `name` varchar(225) DEFAULT null,
  `gender_id` int(11) DEFAULT null,
  `dob` date DEFAULT null,
  `mobile_no` varchar(15) DEFAULT null,
  `email_id` text DEFAULT null,
  `aadhaar_no` int DEFAULT null,
  `permanent_address` text DEFAULT null,
  `permanent_address_id` int(11) DEFAULT null,
  `total_family_members` int(11) DEFAULT null,
  `education_details_id` int(11) DEFAULT null,
  `income_id` int(11) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `created_by` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `updated_by` int(11) DEFAULT null,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `master_education_details` (
  `education_details_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `education_level_id` int(11) DEFAULT null,
  `institute` text DEFAULT null,
  `filed_of_study` text DEFAULT null,
  `education_status` text DEFAULT null,
  `passing_year` text DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `master_education_levels` (
  `education_level_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `education_levels` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `master_certification` (
  `certification_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int DEFAULT null,
  `is_certified` int DEFAULT null,
  `certification_name` text DEFAULT null,
  `certification_description` text DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `master_status` (
  `status_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) DEFAULT null,
  `description` text DEFAULT null
);

CREATE TABLE `menus` (
  `menu_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT null,
  `menu_name` varchar(50) DEFAULT null,
  `icon` varchar(255) DEFAULT null,
  `sort` varchar(50) DEFAULT null,
  `create_by` int(11) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `action` varchar(30) DEFAULT null,
  `description` text DEFAULT null
);

CREATE TABLE `master_occupation` (
  `occupation_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `occupation_name` varchar(100) DEFAULT null,
  `description` text DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `programs` (
  `program_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `program_code` varchar(100) DEFAULT null,
  `program_name` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `description` text DEFAULT null,
  `created_by` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `updated_by` int(11) DEFAULT null,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `role_actions` (
  `role_action_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT null,
  `action` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `role_menu` (
  `role_menu_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT null,
  `menu_id` int(11) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `roles` (
  `role_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `create_by` varchar(50) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `description` text DEFAULT null
);

CREATE TABLE `state` (
  `state_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `state_name` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `sub_programs` (
  `sub_program_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT null,
  `sub_program_name` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null,
  `description` text DEFAULT null,
  `created_by` int(11) DEFAULT null,
  `created_at` datetime DEFAULT null,
  `updated_by` int(11) DEFAULT null,
  `updated_at` datetime DEFAULT null
);

CREATE TABLE `taluka` (
  `taluka_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `district_id` int(11) DEFAULT null,
  `taluka_name` varchar(100) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE TABLE `village` (
  `village_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `taluka_id` int(11) DEFAULT null,
  `village_name` varchar(100) DEFAULT null,
  `pincode` int(11) DEFAULT null,
  `status_id` int(11) DEFAULT null
);

CREATE INDEX `idx_address_village_id` ON `address` (`village_id`);

CREATE INDEX `idx_address_taluka_id` ON `address` (`taluka_id`);

CREATE INDEX `idx_address_district_id` ON `address` (`district_id`);

CREATE INDEX `idx_address_state_id` ON `address` (`state_id`);

CREATE INDEX `idx_beneficiary_programs_beneficiary_id` ON `beneficiary_programs` (`beneficiary_id`);

CREATE INDEX `idx_beneficiary_programs_program_id` ON `beneficiary_programs` (`program_id`);

CREATE INDEX `idx_beneficiary_programs_sub_program_id` ON `beneficiary_programs` (`sub_program_id`);

CREATE INDEX `idx_beneficiary_programs_outreach_channel_id` ON `beneficiary_programs` (`outreach_channel_id`);

CREATE INDEX `idx_beneficiary_programs_enrollment_status` ON `beneficiary_programs` (`enrollment_status`);

CREATE INDEX `idx_beneficiary_programs_created_by` ON `beneficiary_programs` (`created_by`);

CREATE INDEX `idx_beneficiary_programs_status_id` ON `beneficiary_programs` (`status_id`);

CREATE INDEX `idx_master_outreach_channels_status_id` ON `master_outreach_channels` (`status_id`);

CREATE INDEX `idx_district_status_id` ON `district` (`status_id`);

CREATE INDEX `idx_district_state_id` ON `district` (`state_id`);

CREATE INDEX `idx_emp_roles_status_id` ON `emp_roles` (`status_id`);

CREATE INDEX `idx_emp_roles_role_id` ON `emp_roles` (`role_id`);

CREATE INDEX `idx_emp_roles_emp_id` ON `emp_roles` (`emp_id`);

CREATE INDEX `idx_employee_history_emp_id` ON `employee_history` (`emp_id`);

CREATE INDEX `idx_employee_history_status_id` ON `employee_history` (`status_id`);

CREATE INDEX `idx_employees_gender_id` ON `employees` (`gender_id`);

CREATE INDEX `idx_employees_status_id` ON `employees` (`status_id`);

CREATE INDEX `idx_income_beneficiary_annual_source_id` ON `income` (`beneficiary_annual_source_id`);

CREATE INDEX `idx_income_family_annual_source_id` ON `income` (`family_annual_source_id`);

CREATE INDEX `idx_income_earning_range_id` ON `income` (`earning_range_id`);

CREATE INDEX `idx_income_status_id` ON `income` (`status_id`);

CREATE INDEX `idx_income_created_by` ON `income` (`created_by`);

CREATE INDEX `idx_income_updated_by` ON `income` (`updated_by`);

CREATE INDEX `idx_master_beneficiary_gender_id` ON `master_beneficiary` (`gender_id`);

CREATE INDEX `idx_master_beneficiary_education_details_id` ON `master_beneficiary` (`education_details_id`);

CREATE INDEX `idx_master_beneficiary_income_id` ON `master_beneficiary` (`income_id`);

CREATE INDEX `idx_master_beneficiary_status_id` ON `master_beneficiary` (`status_id`);

CREATE INDEX `idx_master_beneficiary_permanent_address_id` ON `master_beneficiary` (`permanent_address_id`);

CREATE INDEX `idx_master_beneficiary_created_by` ON `master_beneficiary` (`created_by`);

CREATE INDEX `idx_master_beneficiary_updated_at` ON `master_beneficiary` (`updated_at`);

CREATE INDEX `idx_master_education_details_status_id` ON `master_education_details` (`status_id`);

CREATE INDEX `idx_master_education_details_education_level_id` ON `master_education_details` (`education_level_id`);

CREATE INDEX `idx_master_education_levels_status_id` ON `master_education_levels` (`status_id`);

CREATE INDEX `idx_master_certification_beneficiary_id` ON `master_certification` (`beneficiary_id`);

CREATE INDEX `idx_master_certification_status_id` ON `master_certification` (`status_id`);

CREATE INDEX `idx_menus_status_id` ON `menus` (`status_id`);

CREATE INDEX `idx_master_occupation_status_id` ON `master_occupation` (`status_id`);

CREATE INDEX `idx_programs_status_id` ON `programs` (`status_id`);

CREATE INDEX `idx_programs_created_by` ON `programs` (`created_by`);

CREATE INDEX `idx_programs_updated_by` ON `programs` (`updated_by`);

CREATE INDEX `idx_role_actions_role_id` ON `role_actions` (`role_id`);

CREATE INDEX `idx_role_actions_status_id` ON `role_actions` (`status_id`);

CREATE INDEX `idx_role_menu_status_id` ON `role_menu` (`status_id`);

CREATE INDEX `idx_role_menu_role_id` ON `role_menu` (`role_id`);

CREATE INDEX `idx_role_menu_menu_id` ON `role_menu` (`menu_id`);

CREATE INDEX `idx_roles_status_id` ON `roles` (`status_id`);

CREATE INDEX `idx_state_status_id` ON `state` (`status_id`);

CREATE INDEX `idx_sub_programs_program_id` ON `sub_programs` (`program_id`);

CREATE INDEX `idx_sub_programs_status_id` ON `sub_programs` (`status_id`);

CREATE INDEX `idx_sub_programs_created_by` ON `sub_programs` (`created_by`);

CREATE INDEX `idx_sub_programs_updated_by` ON `sub_programs` (`updated_by`);

CREATE INDEX `idx_taluka_status_id` ON `taluka` (`status_id`);

CREATE INDEX `idx_taluka_district_id` ON `taluka` (`district_id`);

CREATE INDEX `idx_village_status_id` ON `village` (`status_id`);

CREATE INDEX `idx_village_taluka_id` ON `village` (`taluka_id`);

ALTER TABLE `address` ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`village_id`) REFERENCES `village` (`village_id`);

ALTER TABLE `address` ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`taluka_id`) REFERENCES `taluka` (`taluka_id`);

ALTER TABLE `address` ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`);

ALTER TABLE `address` ADD CONSTRAINT `address_ibfk_4` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `beneficiary_programs_ibfk_1` FOREIGN KEY (`beneficiary_id`) REFERENCES `master_beneficiary` (`beneficiary_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `beneficiary_programs_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `beneficiary_programs_ibfk_3` FOREIGN KEY (`sub_program_id`) REFERENCES `sub_programs` (`sub_program_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `beneficiary_programs_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `beneficiary_programs_ibfk_5` FOREIGN KEY (`enrollment_status`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `beneficiary_programs_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `district` ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

ALTER TABLE `district` ADD CONSTRAINT `district_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `emp_roles` ADD CONSTRAINT `emp_roles_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `emp_roles` ADD CONSTRAINT `emp_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `emp_roles` ADD CONSTRAINT `emp_roles_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `employee_history` ADD CONSTRAINT `employee_hst_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `employee_history` ADD CONSTRAINT `employee_hst_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `employees` ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`);

ALTER TABLE `employees` ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `income` ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `income` ADD CONSTRAINT `income_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `income` ADD CONSTRAINT `income_ibf3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_2` FOREIGN KEY (`education_details_id`) REFERENCES `master_education_details` (`education_level_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_3` FOREIGN KEY (`income_id`) REFERENCES `income` (`income_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_5` FOREIGN KEY (`permanent_address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `master_beneficiary` ADD CONSTRAINT `master_beneficiary_ibfk_7` FOREIGN KEY (`updated_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `master_education_details` ADD CONSTRAINT `master_education_level_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `menus` ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `programs` ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `programs` ADD CONSTRAINT `programs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `programs` ADD CONSTRAINT `programs_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `role_actions` ADD CONSTRAINT `role_action_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `role_actions` ADD CONSTRAINT `role_action_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `role_menu` ADD CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `role_menu` ADD CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `role_menu` ADD CONSTRAINT `role_menu_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`);

ALTER TABLE `roles` ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `state` ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `sub_programs` ADD CONSTRAINT `sub_programs_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`);

ALTER TABLE `sub_programs` ADD CONSTRAINT `sub_programs_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `sub_programs` ADD CONSTRAINT `sub_programs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `sub_programs` ADD CONSTRAINT `sub_programs_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `employees` (`emp_id`);

ALTER TABLE `taluka` ADD CONSTRAINT `taluka_ibfk_1` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`);

ALTER TABLE `taluka` ADD CONSTRAINT `taluka_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `village` ADD CONSTRAINT `village_ibfk_1` FOREIGN KEY (`taluka_id`) REFERENCES `taluka` (`taluka_id`);

ALTER TABLE `village` ADD CONSTRAINT `village_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `master_certification` ADD CONSTRAINT `certification_ibf1` FOREIGN KEY (`beneficiary_id`) REFERENCES `master_beneficiary` (`beneficiary_id`);

ALTER TABLE `master_certification` ADD CONSTRAINT `certification_ibf2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `master_education_details` ADD CONSTRAINT `education_level_ibf1` FOREIGN KEY (`education_level_id`) REFERENCES `master_education_levels` (`education_level_id`);

ALTER TABLE `master_education_levels` ADD CONSTRAINT `education_level_ibf2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `income` ADD CONSTRAINT `earning_range_ibf1` FOREIGN KEY (`earning_range_id`) REFERENCES `earning_range` (`earning_range_id`);

ALTER TABLE `income` ADD CONSTRAINT `master_occupation_ibf1` FOREIGN KEY (`beneficiary_annual_source_id`) REFERENCES `master_occupation` (`occupation_id`);

ALTER TABLE `income` ADD CONSTRAINT `master_occupation_ibf2` FOREIGN KEY (`family_annual_source_id`) REFERENCES `master_occupation` (`occupation_id`);

ALTER TABLE `master_occupation` ADD CONSTRAINT `master_occupation_ibf3` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);

ALTER TABLE `beneficiary_programs` ADD CONSTRAINT `master_outreach_channels_ibf1` FOREIGN KEY (`outreach_channel_id`) REFERENCES `master_outreach_channels` (`outreach_channel_id`);

ALTER TABLE `master_outreach_channels` ADD CONSTRAINT `master_outreach_channels_ibf2` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`status_id`);
