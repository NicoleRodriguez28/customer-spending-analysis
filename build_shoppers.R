# Load required libraries
library(DBI)
library(RSQLite)
library(readr)

# Step 1: Read the CSV
customers <- read_csv("customers.csv")

# Step 2: Connect to SQLite and create the database
con <- dbConnect(SQLite(), "shopper_data.sqlite")

# Step 3: Write data frame to SQLite as table "customers"
dbWriteTable(con, "customers", customers, overwrite = TRUE)

# Step 4: Read full SQL script
sql_script <- readLines("shopper_analytics.sql")
sql_script <- paste(sql_script, collapse = "\n")

# Step5: Split by semicolon, assuming each statement ends with ;
queries <- unlist(strsplit(sql_script, ";", fixed = TRUE))

# Step 6: Remove empty lines and whitespace
queries <- trimws(queries)
queries <- queries[queries != ""]

# Step 7: Run each query
results <- lapply(queries, function(q) dbGetQuery(con, q))
print(results)

# Step 8: Disconnect from database
dbDisconnect(con)
