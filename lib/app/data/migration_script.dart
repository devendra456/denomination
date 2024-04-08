final List<List<String>> migrationScript = [_version1];
final List<String> _version1 = [
  """CREATE TABLE IF NOT EXISTS Denomination(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         type TEXT,
         remarks TEXT,
         amount INTEGER,
         dateTime TEXT
  )""",
];
