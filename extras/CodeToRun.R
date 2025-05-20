 
# The folder where the study intermediate and result files will be written:
outputFolder <- "--outputFolder--"


# Optional: specify where the temporary files (used by the Andromeda package) will be created:
options(andromedaTempFolder = file.path(outputFolder, "andromedaTemp"))

# Details for connecting to the server:
connectionDetails <-
  DatabaseConnector::createConnectionDetails(
    dbms = "pdw",
    server = Sys.getenv("PDW_SERVER"),
    user = NULL,
    password = NULL,
    port = Sys.getenv("PDW_PORT")
  )


# Schema specifications:
# name of the database where the CDM data is stored:
cdmDatabaseSchema <- "CDM_IBM_MDCD_V1153.dbo"
# name of the database schema where the cohort table will be created (make sure you have read/write/delete access):
cohortDatabaseSchema <- "scratch.dbo"
# name of the table where the cohorts will be created:
cohortTable <- "UEH_ProstateCatalogue_Cohorts"
# Some meta-information that will be used by the export function:
databaseId <- "A short name for the database, e.g. 'mktscan'"
databaseName <-
# For some database platforms (e.g. Oracle): define a schema that can be used to emulate temp tables:
options(sqlRenderTempEmulationSchema = NULL)
 
# execute data_catalogue function
