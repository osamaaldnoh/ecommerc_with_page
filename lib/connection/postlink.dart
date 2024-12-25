
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerc_with_page/model/product.dart';

class Postlink
{
  String post = 'https://dummyjson.com/products';

  List<Movie> listpost =[];

  Future<List<Movie>> getdata()
  async
  {
    Response<String> response = await getUpcoming();
    Map<String,dynamic> allpost = jsonDecode(response.data!);

    List<dynamic> a = allpost["products"];
    a.forEach((element) {
      listpost.add(Movie.fromJso(element));
    });

    return listpost;
  }

  Future<Response<String>> getUpcoming() async {

    Dio dio = Dio();

    return await dio.get(post);
  }
}