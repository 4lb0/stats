Db.migrate("Tabla stats", `
  CREATE TABLE stats (
    key TEXT PRIMARY KEY NOT NULL,
    counter INTEGER NOT NULL DEFAULT 0
  )
`)
