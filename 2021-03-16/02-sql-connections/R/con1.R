con1 <- dbConnect(
  Postgres(),
  user = Sys.getenv("dbedu_usr"),
  password = Sys.getenv("dbedu_pwd"),
  dbname = "intendo",
  host = "databases.pacha.dev"
)
