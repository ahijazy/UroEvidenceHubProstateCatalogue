
# create temporary target tables with index year, and age

create_temp_target_tables <- function(connection, 
                cdmDatabaseSchema, 
                cohortDatabaseSchema,
                cohortTable,
                cohortId) 
{
  sql <-  'Select cohort_id, 
                  subject_id, 
                  cohort_start_date, 
                  cohort_end_date,
                  EXTRACT(YEAR from cohort_start_date) as index_year,
                  DATEDIFF(cohort_start_date, birth_date)/365.25 as age_at_index_year
                  age_at_index_year
          into @cohort_database_schema.@cohort_table
          from @cdm_database_schema.@cohort_table
          where cohort_id = @cohort_id' 
  DatabaseConnector::executeSql(connection, sql)
}


extract_commorbidity_data= function(connection, 
                            cdmDatabaseSchema, 
                            cohortDatabaseSchema,
                            cohortTable,
                            cohortId) 
{
  sql <- 'SELECT subject_id, 
                  cohort_start_date, 
                  cohort_end_date,
                  index_year,
                  age_at_index_year
          FROM @cohort_database_schema.@cohort_table
          WHERE cohort_id = @cohort_id'
  data <- DatabaseConnector::querySql(connection, sql)
  return(data)
}

extract_outcome_data= function(connection, 
                            cdmDatabaseSchema, 
                            cohortDatabaseSchema,
                            cohortTable,
                            cohortId) 
{
  sql <- 'SELECT subject_id, 
                  cohort_start_date, 
                  cohort_end_date,
                  index_year,
                  age_at_index_year
          FROM @cohort_database_schema.@cohort_table
          WHERE cohort_id = @cohort_id'
  data <- DatabaseConnector::querySql(connection, sql)
  return(data)
}

extract_treatment_data= function(connection, 
                            cdmDatabaseSchema, 
                            cohortDatabaseSchema,
                            cohortTable,
                            cohortId) 
{
  sql <- 'SELECT subject_id, 
                  cohort_start_date, 
                  cohort_end_date,
                  index_year,
                  age_at_index_year
          FROM @cohort_database_schema.@cohort_table
          WHERE cohort_id = @cohort_id'
  data <- DatabaseConnector::querySql(connection, sql)
  return(data)
}