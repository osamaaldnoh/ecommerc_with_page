
import 'package:ecommerc_with_page/connection/postlink.dart';
import 'package:flutter/cupertino.dart';

class Movie {
 late int id;
 late String title;
 late String description;
 late int price;
 late double discountPercentage;
 late String brand;
 late String thumbnail;
 late List images =[];

  Movie(
      {required this.id, required this.title, required this.description, required this.price,
        required this.discountPercentage, required this.brand,required this.thumbnail,required this.images});


  factory Movie.fromJso(Map<String, dynamic> parsedJson)
  {
   return Movie(id: parsedJson['id'],
      title: parsedJson['title'],
      description: parsedJson['description'],
      price: parsedJson['price'],
      discountPercentage: parsedJson['discountPercentage'],
      brand: parsedJson['brand'],
      thumbnail: parsedJson['thumbnail'],
      images: parsedJson['images'],
    );
  }

}

class Movies with ChangeNotifier
{
  final Map<String,Movie> _product = {};

  Map<String,Movie> get product => {..._product};

  int get produc => _product.length;


}

