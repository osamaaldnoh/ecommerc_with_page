import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB_data
{

  Future<Database>initDB()
  async
  {
    String dbFolder =await getDatabasesPath();
    String dbFinalPath =join(dbFolder,"todo.db");

    return openDatabase(dbFinalPath,version: 2,onCreate: (db,version)
    {
      db.execute("""
          create table if not exists productist
          (
              id integer primary key autoincrement,
              title varchar not null,
              description varchar not null,
              price varchar not null,
              
          )
      """);
    }
    );
  }





  Future<int> insertToTable(String tablename,Map<String,dynamic> rowData)
  async
  {
    Database dbObject = await initDB();

    return dbObject.insert(tablename, rowData);
  }


  Future<List<Map<String,dynamic>>> getRowData(String tableName)
  async
  {
    Database dbObjects = await initDB();
    
    return dbObjects.query(tableName);
  }
}