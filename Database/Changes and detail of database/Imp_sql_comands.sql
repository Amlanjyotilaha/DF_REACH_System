/* **************************************************************** 
<-- USED TO RESET AUTO_INCREMENT.-->
-- Use after deleting all data from the table--
******************************************************************* */
/*----------------------------------------------------------------------------------------------
ALTER TABLE table_name AUTO_INCREMENT = 1;
------------------------------------------------------------------------------------------------- */

/* ****************************************************************
<-- THIS CAN BE USED to delete all the rows of a table and reset autoincrement to 1.-->
******************************************************************* */
/*----------------------------------------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Table_name;
SET FOREIGN_KEY_CHECKS = 1;
------------------------------------------------------------------------------------------------- */

/* ****************************************************************
<-- THIS CAN BE USED WHEN ADDING A COLUMN TO AN EXISTING TABLE.-->
******************************************************************* */
/*----------------------------------------------------------------------------------------------
ALTER TABLE Table_Name  
ADD COLUMN column_to_add column_datatype DEFAULT NULL AFTER after_which_column_you_want_to_place;
------------------------------------------------------------------------------------------------- */


/* *******************************************************************************
 <-- THIS CAN BE USED TO MOVE A COLUMN TO A CERTAIN POSITION IN AN EXISTING TABLE.-->
********************************************************************************** */
/*----------------------------------------------------------------------------------------------
ALTER TABLE table_name 
MODIFY COLUMN column_to_move_with_datatype AFTER after_which_column_you_want_to_place;
------------------------------------------------------------------------------------------------- */

/* *******************************************************************************
 <-- Used to find forign key constrains and remove that along with index-->
********************************************************************************** */
/*----------------------------------------------------------------------------------------------
SELECT 
    CONSTRAINT_NAME
FROM 
    information_schema.KEY_COLUMN_USAGE
WHERE 
    TABLE_NAME = 'table_name' <--- from where you want to remove foreign key 
    AND COLUMN_NAME = 'column_name'
    AND TABLE_SCHEMA = 'database_name';
  
ALTER TABLE table_name
DROP FOREIGN KEY constrain_name;  

SHOW INDEX FROM `table_name` WHERE Column_name = 'column_name';

ALTER TABLE `table_name` DROP INDEX `column_name`;

------------------------------------------------------------------------------------------------- */


/* ****************************************************************
<-- Check Event is allowed and if not then allow -->
******************************************************************* */
/*----------------------------------------------------------------------------------------------
SHOW VARIABLES LIKE 'event_scheduler';
SHOW EVENTS;
SHOW EVENTS FROM df_ticketing;

SET GLOBAL event_scheduler = ON;

------------------------------------------------------------------------------------------------- */

