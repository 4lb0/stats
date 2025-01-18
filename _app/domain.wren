class Stats {
  static increase(key) {
    `INSERT INTO stats (key, counter) VALUES (?, 1)
      ON CONFLICT (key) DO UPDATE SET counter = counter + 1`.query(key)
  }
  static all() { `SELECT * FROM stats ORDER BY counter DESC`.fetch() }
}
