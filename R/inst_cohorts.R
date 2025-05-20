

cohort_generation <- function(connectionDetails,
                           cdmDatabaseSchema,
                           vocabularyDatabaseSchema = cdmDatabaseSchema,
                           cohortDatabaseSchema,
                           cohortTable,
                           packageName=' ',
                           oracleTempSchema = NULL,
                           tempEmulationSchema = getOption("sqlRenderTempEmulationSchema"),
                           outputFolder) 
{
    if (!file.exists(outputFolder)) 
    {
        dir.create(outputFolder, recursive = TRUE)
    }

    ParallelLogger::addDefaultFileLogger(file.path(outputFolder, "log.txt"))
    ParallelLogger::addDefaultErrorReportLogger(file.path(outputFolder, "errorReportR.txt"))
    on.exit(ParallelLogger::unregisterLogger("DEFAULT_FILE_LOGGER", silent = TRUE))
    on.exit(
        ParallelLogger::unregisterLogger("DEFAULT_ERRORREPORT_LOGGER", silent = TRUE),
        add = TRUE
    )
  
    connection <- DatabaseConnector::connect(connectionDetails)

    sql <- SqlRender::loadRenderTranslateSql(sqlFilename = "CreateCohortTable.sql",
                                           packageName = packageName,
                                           dbms = attr(connection, "dbms"),
                                           tempEmulationSchema = tempEmulationSchema,
                                           cohort_database_schema = cohortDatabaseSchema,
                                           cohort_table = cohortTable)
    ParallelLogger::logInfo("Creating cohort table")
    DatabaseConnector::executeSql(connection, sql, progressBar = TRUE, reportOverallTime = TRUE)
    ParallelLogger::logInfo("Cohort table created")
    # Instantiate cohorts:
    ParallelLogger::logInfo("Instantiating cohorts")
    pathToCsv <- system.file("settings", "CohortsToCreate.csv", package = packageName)
    cohortsToCreate <- readr::read_csv(pathToCsv, col_types = readr::cols())
  for (i in 1:nrow(cohortsToCreate)) {
     sql <- SqlRender::loadRenderTranslateSql(sqlFilename = paste0(cohortsToCreate$cohortId[i], ".sql"),
                                             packageName = packageName,
                                             dbms = attr(connection, "dbms"),
                                             tempEmulationSchema = tempEmulationSchema,
                                             cdm_database_schema = cdmDatabaseSchema,
                                             vocabulary_database_schema = vocabularyDatabaseSchema,
                                             target_database_schema = cohortDatabaseSchema,
                                             target_cohort_table = cohortTable,
                                             target_cohort_id = cohortsToCreate$cohortId[i])
    ParallelLogger::logInfo(paste("Creating cohort:", cohortsToCreate$cohort_name[i]))
    DatabaseConnector::executeSql(connection, sql)
  }               
}


