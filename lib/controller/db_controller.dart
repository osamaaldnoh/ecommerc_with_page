import 'package:ecommerc_with_page/connection/db_data.dart';
import 'package:ecommerc_with_page/model/db_model.dart';

class Db_Controller
{
  DB_data app_db =DB_data();

  List<DbModel> dbModellist =[];


  Future<List<DbModel>>showTasks()async
  {
    List<Map<String,dynamic>> allTasks = await app_db.getRowData("productist");

    allTasks.forEach((element)
    {
      DbModel dbModel = DbModel.fetch(element);
      dbModellist.add(dbModel);
    });

    return dbModellist;
  }

  Future<int> addDB(String title,String description, String price)async
  {
    Map<String,dynamic> data = Map();
    data["title"] = title;
    data["description"] = description;
    data["price"] = price;

    return await app_db.insertToTable("productist", data);
  }
}