library(dplyr)
library(RPostgres)
library(usethis)

con1 <- dbConnect(
  Postgres(),
  user = Sys.getenv("dbedu_usr"),
  password = Sys.getenv("dbedu_pwd"),
  dbname = "intendo",
  host = "databases.pacha.dev"
)

con2 <- dbConnect(
  Postgres(),
  user = askpass::askpass("Username"),
  password = askpass::askpass("Password"),
  dbname = "intendo",
  host = "databases.pacha.dev"
)

dbDisconnect(con2)

canada_android_organic <- tbl(con1, "users") %>%
  filter(
    country == "Canada",
    platform == "android",
    acquired == "organic"
  ) %>%
  collect()

dbDisconnect(con1)
